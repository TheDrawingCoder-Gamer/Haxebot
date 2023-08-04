package isolated_vm;

/**
	A script is a compiled chunk of JavaScript which can be executed in any context within a single
	isolate.
**/
@:jsRequire("isolated-vm", "Script") extern class Script {
	private function new();
	private var __ivm_script : Null<Any>;
	/**
		Releases the reference to this script, allowing the script data to be garbage collected.
		Functions and data created in the isolate by previous invocations to `script.run(...)` will
		still be alive in their respective contexts-- this only means that you can't invoke
		`script.run(...)` again with this reference.
	**/
	function release():Void;
	/**
		Runs a given script within a context. This will return the last value evaluated in a given
		script, as long as that value was transferable, otherwise `undefined` will be returned. For
		instance if your script was "let foo = 1; let bar = 2; bar = foo + bar" then the return value
		will be 3 because that is the last expression.
	**/
	function run<Options>(context:Context, ?options:Options):ResultTypeAsync<Options, Dynamic>;
	function runIgnored(context:Context, ?options:ScriptRunOptions):Void;
	function runSync<Options>(context:Context, ?options:Options):CheckPromise<Options, ResultTypeBase<Options, Dynamic>>;
	static var prototype : Script;
}