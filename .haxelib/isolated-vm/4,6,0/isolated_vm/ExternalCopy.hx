package isolated_vm;

/**
	Instances of this class represent some value that is stored outside of any v8
	isolate. This value can then be quickly copied into any isolate.
**/
@:jsRequire("isolated-vm", "ExternalCopy") extern class ExternalCopy<T> {
	/**
		Primitive values can be copied exactly as they are. Date objects will be copied as as Dates.
		ArrayBuffers, TypedArrays, and DataViews will be copied in an efficient format.
		SharedArrayBuffers will simply copy a reference to the existing memory and when copied into
		another isolate the new SharedArrayBuffer will point to the same underlying data. After
		passing a SharedArrayBuffer to ExternalCopy for the first time isolated-vm will take over
		management of the underlying memory block, so a "copied" SharedArrayBuffer can outlive the
		isolate that created the memory originally.
		
		All other objects will be copied in seralized form using the [structured clone
		algorithm](https://developer.mozilla.org/en-US/docs/Web/API/Web_Workers_API/Structured_clone_algorithm).
		
		`ExternalCopy` can copy objects with deeply nested *transferable* objects.
	**/
	function new(value:T, ?options:ExternalCopyOptions);
	private var __ivm_external_copy : T;
	/**
		Internalizes the ExternalCopy data into this isolate.
	**/
	function copy(?options:ExternalCopyCopyOptions):T;
	/**
		Returns an object, which when passed to another isolate will cause that isolate to
		internalize a copy of this value.
	**/
	function copyInto(?options:ExternalCopyCopyOptions):Copy<T>;
	/**
		Releases the reference to this copy. If there are other references to this copy elsewhere the
		copy will still remain in memory, but this handle will no longer be active. Disposing
		ExternalCopy instances isn't super important, v8 is a lot better at cleaning these up
		automatically because there's no inter-isolate dependencies.
	**/
	function release():Void;
	static var prototype : ExternalCopy<Dynamic>;
	/**
		Static property which will return the total number of bytes that isolated-vm has allocated
		outside of v8 due to instances of `ExternalCopy`.
	**/
	static final totalExternalSize : Float;
}