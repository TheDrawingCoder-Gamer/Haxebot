package isolated_vm;

/**
	C++ native module for v8 representation.
**/
@:jsRequire("isolated-vm", "NativeModule") extern class NativeModule {
	/**
		Instantiate a native module with the full path to the compiled library.
		For instance, filename would represent the path to a .node file
		compiled using node-gyp.
	**/
	function new(filename:String);
	private var __ivm_native_module : Null<Any>;
	/**
		Instantiates the module with a Context by running the `InitForContext`
		symbol, throws if that symbol is not present.
		
		Returned Reference<NativeModule> should be dereferenced into a context
	**/
	function create(context:Context):js.lib.Promise<Reference<Dynamic>>;
	/**
		Synchronous version of `create`
	**/
	function createSync(context:Context):Reference<Dynamic>;
	static var prototype : NativeModule;
}