package isolated_vm;

typedef ReleaseOptions = {
	/**
		If true release() will automatically be called on this instance.
	**/
	@:optional
	var release : Bool;
};