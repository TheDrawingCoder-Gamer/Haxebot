package isolated_vm;

typedef CachedDataResult = {
	@:optional
	var cachedData : ExternalCopy<js.lib.ArrayBuffer>;
	@:optional
	var producedCacheData : Bool;
};