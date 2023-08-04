package isolated_vm;

/**
	Most functions which compile or run code can produce and consume cached data. You can produce
	cached data and use the data in later invocations to drastically speed up parsing of the same
	script. You can even save this data to disk and use it in a different process. You can set both
	`cachedData` and `produceCachedData`, in which case new cached data will only be produced if
	the data supplied was invalid.
**/
typedef CachedDataOptions = {
	/**
		This will consume cached compilation data from a previous call to this function. Please don't
		use `produceCachedData` and `cachedData` options at the same time. `cachedDataRejected` will
		be set to `true` if the supplied data was rejected by V8.
	**/
	@:optional
	var cachedData : ExternalCopy<js.lib.ArrayBuffer>;
	/**
		Produce V8 cache data. Similar to the [VM.Script](https://nodejs.org/api/vm.html) option of
		the same name. If this is true then the returned object will have `cachedData` set to an
		ExternalCopy handle. Note that this differs from the VM.Script option slightly in that
		`cachedDataProduced` is never set.
	**/
	@:optional
	var produceCachedData : Bool;
};