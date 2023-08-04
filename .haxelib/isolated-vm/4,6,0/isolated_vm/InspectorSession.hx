package isolated_vm;

typedef InspectorSession = {
	function dispatchProtocolMessage(message:String):Void;
	function dispose():Void;
	dynamic function onNotification(message:String):Void;
	dynamic function onResponse(callId:Float, message:String):Void;
};