package isolated_vm;

typedef ExternalCopyOptions = {
	/**
		An array of `ArrayBuffer` instances to transfer ownership. This behaves in a similar way to
		[`postMessage`](https://developer.mozilla.org/en-US/docs/Web/API/Worker/postMessage).
	**/
	@:optional
	var transferList : Array<Dynamic>;
	/**
		If true this will release ownership of the given resource from this isolate. This operation
		completes in constant time since it doesn't have to copy an arbitrarily large object. This
		only applies to ArrayBuffer and TypedArray instances.
	**/
	@:optional
	var transferOut : Bool;
};