package isolated_vm;

/**
	Dummy type referencing a type copied into a different Isolate.
**/
@:jsRequire("isolated-vm", "Copy") extern class Copy<T> {
	private function new();
	private var __ivm_copy : T;
	static var prototype : Copy<Dynamic>;
}