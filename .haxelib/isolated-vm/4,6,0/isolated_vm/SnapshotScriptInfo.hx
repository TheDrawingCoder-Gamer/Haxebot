package isolated_vm;

typedef SnapshotScriptInfo = ScriptOrigin & {
	/**
		Source code to set up this snapshot
	**/
	var code : String;
};