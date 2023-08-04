package isolated_vm;

/**
	Dummy type referencing a type dereferenced into a different Isolate.
**/
@:jsRequire("isolated-vm", "Dereference") extern class Dereference<T> {
	private function new();
	private var __ivm_deref : T;
	static var prototype : Dereference<Dynamic>;
}