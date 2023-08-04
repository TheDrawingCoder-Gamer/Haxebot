package isolated_vm;

typedef IsolateOptions = {
	/**
		Memory limit that this isolate may use, in MB. Note that this is more of a guideline
		instead of a strict limit. A determined attacker could use 2-3 times this limit before
		their script is terminated. Against non-hostile code this limit should be pretty close. The
		default is 128MB and the mimium is 8MB.
	**/
	@:optional
	var memoryLimit : Float;
	/**
		Enable v8 inspector support in this isolate. See `inspector-example.js` in this repository
		for an example of how to use this.
	**/
	@:optional
	var inspector : Bool;
	/**
		This is an optional snapshot created from `createSnapshot` which will be used to initialize
		the heap of this isolate.
	**/
	@:optional
	var snapshot : ExternalCopy<js.lib.ArrayBuffer>;
	/**
		Callback to be invoked when a *very bad* error occurs. If this is invoked it means that v8
		has lost all control over the isolate, and all resources in use are totally unrecoverable. If
		you receive this error you should log the error, stop serving requests, finish outstanding
		work, and end the process by calling `process.abort()`.
	**/
	@:optional
	dynamic function onCatastrophicError(message:String):Void;
};