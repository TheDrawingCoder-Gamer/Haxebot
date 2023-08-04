package isolated_vm;

typedef TransferOptionsBidirectional = {
	/**
		`TransferOptions` for the values going *into* this isolate.
	**/
	@:optional
	var arguments : TransferOptions;
	/**
		`TransferOptions` for the values coming *out* of this isolate.
	**/
	@:optional
	var result : TransferOptions;
};