package isolated_vm;

typedef CpuProfile = {
	var startTime : Float;
	var endTime : Float;
	var samples : Array<Float>;
	var timeDeltas : Array<Float>;
	var nodes : Array<{
		var id : Float;
		var hitCount : Float;
		var children : Array<Float>;
		var callFrame : {
			var functionName : String;
			var url : String;
			var scriptId : Float;
			var lineNubmer : Float;
			var columnNumber : Float;
			@:optional
			var bailoutReason : String;
		};
	}>;
};