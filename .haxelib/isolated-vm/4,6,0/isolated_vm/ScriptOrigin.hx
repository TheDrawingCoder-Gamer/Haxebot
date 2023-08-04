package isolated_vm;

/**
	You may optionally specify information on compiled code's filename. This is used in various
	debugging contexts within v8, including stack traces and the inspector. It is recommended to
	use a valid URI scheme, for example: `{ filename: 'file:///test.js' }`, otherwise some devtools
	may malfunction.
**/
typedef ScriptOrigin = {
	/**
		Filename of this source code
	**/
	@:optional
	var filename : String;
	/**
		Column offset of this source code
	**/
	@:optional
	var columnOffset : Float;
	/**
		Line offset of this source code
	**/
	@:optional
	var lineOffset : Float;
};