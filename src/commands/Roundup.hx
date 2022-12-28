package commands;

import haxe.Json;
import sys.io.File;
import discord_builder.BaseCommandInteraction;
import discord_js.MessageEmbed;
import discord_js.TextChannel;
import components.Command;
import systems.CommandBase;

class Roundup extends CommandBase {
	var last_checked:Float = -1;
	var active:Bool = true;
	var roundup(get, set):Int;
	var channel:TextChannel = null;
	var checking_channel:Bool = false;
	final super_mod_id:String = '198916468312637440';
	final news_role:String = '761714325227700225';
	final announcement_channel:String = '286485321925918721';

	function getHaxeIoPage() {
		var data = new haxe.Http('https://raw.githubusercontent.com/skial/haxe.io/master/src/roundups/${this.roundup}.md');
		var embed = new MessageEmbed();
		data.onError = (error) -> {
			trace(error);
		}
		data.onData = (body) -> {
			var regex = ~/### News and Articles(.*?)##### _In case you missed it_/gmis;
			if (regex.match(body)) {
				embed.setTitle('Haxe Roundup #$roundup');
				embed.setURL('https://haxe.io/roundups/$roundup/');

				var desc_split = regex.matched(1).trim().split('\n');
				var desc = '\n**News And Articles**';
				for (item in desc_split) {
					if (desc.length + item.trim().length + 3 + 22 >= 2048) {
						continue;
					}
					desc += '\n' + item.trim();
				}
				desc += '\n...';
				embed.setDescription(desc);
				this.channel.send({content: '<@&$news_role>', allowedMentions: {roles: [news_role]}, embeds: [embed]}).then((_) -> {
					this.roundup++;
				});
			}
		}
		data.request();
	}

	var set_permissions = false;

	override function update(_) {
		super.update(_);
		if (this.channel == null && this.checking_channel == false) {
			this.checking_channel = true;
			Main.client.channels.fetch(this.announcement_channel).then(function(channel) {
				this.channel = cast channel;
				this.checking_channel = false;
			}, err);
		}

		if (this.roundup == -1 || this.channel == null || Date.now().getTime() - last_checked <= 86400000) {
			return;
		}

		this.last_checked = Date.now().getTime();
		getHaxeIoPage();
	}

	function run(command:Command, interaction:BaseCommandInteraction) {
		if (!hasRole(this.super_mod_id, interaction)) {
			interaction.reply('Invalid permissions').then(null, null);
			return;
		}

		switch (command.content) {
			case Roundup(number):
				if (this.active) {
					this.active = false;
					this.last_checked = -1;
					interaction.reply("Disabled haxe roundup monitoring");
					return;
				}

				if (number <= 600) {
					interaction.reply("Please enter a more recent roundup issue.");
					return;
				}

				this.active = true;
				this.roundup = number.int();

				interaction.reply('Will start watching haxe roundups from **#$number**.');
				interaction.client.channels.fetch(this.announcement_channel).then(function(channel) {
					this.channel = cast channel;
				}, err);
			default:
		}
	}

	inline function get_roundup() {
		return Main.state.last_roundup_posted;
	}

	inline function set_roundup(value:Int) {
		Main.state.last_roundup_posted = value;
		File.saveContent('./config/state.json', Json.stringify(Main.state));

		return value;
	}

	function get_name():String {
		return 'roundup';
	}
}
