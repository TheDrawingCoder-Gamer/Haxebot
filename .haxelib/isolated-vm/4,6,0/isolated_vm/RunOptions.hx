package isolated_vm;

typedef RunOptions = {
	/**
		Maximum amount of time in milliseconds this script is allowed to run before execution is
		canceled. Default is no timeout.
	**/
	@:optional
	var timeout : Float;
};