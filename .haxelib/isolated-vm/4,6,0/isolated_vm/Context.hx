package isolated_vm;

/**
	A context is a sandboxed execution environment within an isolate. Each context contains its own
	built-in objects and global space.
**/
@:jsRequire("isolated-vm", "Context") extern class Context {
	private function new();
	private var __ivm_context : Null<Any>;
	/**
		`Reference` to this context's global object. Note that if you call `context.release()` the
		global reference will be released as well.
	**/
	final global : Reference<{ }>;
	/**
		Compiles and executes a script within a context. This will return the last value evaluated,
		as long as that value was transferable, otherwise `undefined` will be returned.
	**/
	function eval<Options>(code:String, ?options:Options):js.lib.Promise<CheckPromise<Options, ResultTypeBase<Options, Dynamic>>>;
	function evalIgnored(code:String, ?options:ContextEvalOptions):Void;
	function evalSync<Options>(code:String, ?options:Options):CheckPromise<Options, ResultTypeBase<Options, Dynamic>>;
	/**
		Compiles and runs code as if it were inside a function, similar to the seldom-used `new
		Function(code)` constructor. You can pass arguments to the function and they will be
		available as `$0`, `$1`, and so on. You can also use `return` from the code.
	**/
	function evalClosure<Options>(code:String, ?arguments:Array<ArgumentType<Dynamic, Dynamic>>, ?options:Options):js.lib.Promise<CheckPromise<Dynamic, ResultTypeBase<Dynamic, Dynamic>>>;
	function evalClosureIgnored<Options>(code:String, ?arguments:Array<ArgumentType<Dynamic, Dynamic>>, ?options:Options):Void;
	function evalClosureSync<Options>(code:String, ?arguments:Array<ArgumentType<Dynamic, Dynamic>>, ?options:Options):CheckPromise<Dynamic, ResultTypeBase<Dynamic, Dynamic>>;
	/**
		Releases this reference to the context. You can call this to free up v8 resources
		immediately, or you can let the garbage collector handle it when it feels like it. Note that
		if there are other references to this context it will not be disposed. This only affects this
		reference to the context.
	**/
	function release():Void;
	static var prototype : Context;
}