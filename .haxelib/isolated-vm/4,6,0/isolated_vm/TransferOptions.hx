package isolated_vm;

/**
	Any function which moves data between isolates will accept these transfer options. By default
	only *[transferable]* values may pass between isolates. Without specifying one of these options
	the function may ignore the value, throw, or wrap it in a reference depending on the context.
	
	More advanced situations like transferring ownership of `ArrayBuffer` instances will require
	direct use of `ExternalCopy` or `Reference`.
**/
typedef TransferOptions = Dynamic;