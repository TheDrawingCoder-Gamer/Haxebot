package isolated_vm;

typedef CompileModuleOptions = CachedDataOptions & ScriptOrigin & {
	/**
		Callback which will be invoked the first time this module accesses `import.meta`. The `meta`
		object will be passed as the first argument. This option may only be used when invoking
		`compileModule` from within the same isolate.
	**/
	@:optional
	dynamic function meta(meta:Dynamic):Void;
};