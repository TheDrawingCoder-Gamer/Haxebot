package isolated_vm;

typedef ExternalCopyCopyOptions = ReleaseOptions & {
	/**
		If true this will transfer the resource directly into this isolate, invalidating the
		ExternalCopy handle.
	**/
	@:optional
	var transferIn : Bool;
};