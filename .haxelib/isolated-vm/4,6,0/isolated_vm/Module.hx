package isolated_vm;

/**
	A JavaScript module. Note that a Module can only run in the isolate which created it.
**/
@:jsRequire("isolated-vm", "Module") extern class Module {
	private function new();
	private var __ivm_module : Null<Any>;
	/**
		A read-only array of all dependency specifiers the module has.
	**/
	final dependencySpecifiers : Array<String>;
	/**
		Returns a Reference containing all exported values.
	**/
	final namespace : Reference<Dynamic>;
	/**
		Instantiate the module together with all its dependencies. Calling this more than once on a
		single module will have no effect.
	**/
	function instantiate(context:Context, resolveCallback:(specifier:String, referrer:Module) -> ts.AnyOf2<Module, js.lib.Promise<Module>>):js.lib.Promise<ts.Undefined>;
	function instantiateSync(context:Context, resolveCallback:(specifier:String, referrer:Module) -> Module):Void;
	/**
		Evaluate the module and return the last expression (same as script.run). If evaluate is
		called more than once on the same module the return value from the first invocation will be
		returned (or thrown).
	**/
	function evaluate(?options:ScriptRunOptions):js.lib.Promise<Transferable>;
	function evaluateSync(?options:ScriptRunOptions):Transferable;
	/**
		Releases this module. This behaves the same as other `.release()` methods.
	**/
	function release():Void;
	static var prototype : Module;
}