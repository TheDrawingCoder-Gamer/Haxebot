package isolated_vm;

/**
	Callbacks can be used to create cross-isolate references to simple functions. This can be
	easier and safer than dealing with the more flexible
	[`Reference`](#class-reference-transferable) class. Arguments passed to and returned from
	callbacks are always copied using the same method as
	[`ExternalCopy`](#class-externalcopy-transferable). When transferred to another isolate,
	instances of `Callback` will turn into a plain old function. Callbacks are created
	automatically when passing functions to most isolated-vm functions.
**/
@:jsRequire("isolated-vm", "Callback") extern class Callback<T> {
	function new(value:T, ?options:CallbackOptions);
	private dynamic function __ivm_callback(args:haxe.extern.Rest<Dynamic>):Dynamic;
	static var prototype : Callback<Dynamic>;
}