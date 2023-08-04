package isolated_vm;

/**
	This is the main reference to an isolate. Every handle to an isolate is transferable, which
	means you can give isolates references to each other. An isolate will remain valid as long as
	someone holds a handle to the isolate or anything created inside that isolate. Once an isolate
	is lost the garbage collector should eventually find it and clean up its memory. Since an
	isolate and all it contains can represent quite a large chunk of memory though you may want to
	explicitly call the `dispose()` method on isolates that you are finished with to get that memory
	back immediately.
**/
@:jsRequire("isolated-vm", "Isolate") extern class Isolate {
	function new(?options:IsolateOptions);
	private var __ivm_isolate : Null<Any>;
	/**
		The total CPU time spent in this isolate. CPU time is the amount of time the isolate has
		spent actively doing work on the CPU.
		
		Note that CPU time may vary drastically if there is contention for the CPU. This could occur
		if other processes are trying to do work, or if you have more than
		require('os').cpus().length isolates currently doing work in the same nodejs process.
	**/
	final cpuTime : { };
	/**
		Flag that indicates whether this isolate has been disposed.
	**/
	final isDisposed : Bool;
	/**
		The total wall time spent in this isolate. Wall time is the amount of time the isolate has
		been running, including passive time spent waiting (think "wall" like a clock on the wall).
		For instance, if an isolate makes a call into another isolate, wall time will continue
		increasing while CPU time will remain the same.
	**/
	final wallTime : { };
	/**
		Returns the total count of active `Reference` instances that belong to this isolate. Note
		that in certain cases many `Reference` instances in JavaScript will point to the same
		underlying reference handle, in which case this number will only reflect the underlying
		reference handle. This happens when you transfer a `Reference` instance via some method which
		accepts transferable values. This will also include underlying reference handles created by
		isolated-vm like `Script` or `Context` objects.
	**/
	final referenceCount : Float;
	function compileScript(code:String, ?scriptInfo:ScriptInfo):js.lib.Promise<Script>;
	function compileScriptSync(code:String, ?scriptInfo:ScriptInfo):Script;
	function compileModule(code:String, ?options:CompileModuleOptions):js.lib.Promise<Module>;
	function compileModuleSync(code:String, ?options:CompileModuleOptions):Module;
	function createContext(?options:ContextOptions):js.lib.Promise<Context>;
	function createContextSync(?options:ContextOptions):Context;
	function createInspectorSession():InspectorSession;
	/**
		Destroys this isolate and invalidates all references obtained from it.
	**/
	function dispose():Void;
	/**
		Returns heap statistics from v8.
		
		The return value is almost identical to the nodejs function v8.getHeapStatistics().
		
		See: https://nodejs.org/dist/latest-v8.x/docs/api/v8.html#v8_v8_getheapstatistics.
		
		This function returns one additional property: "externally_allocated_size" which is the total
		amount of currently allocated memory which is not included in the v8 heap but counts against
		this isolate's "memoryLimit".
		
		ArrayBuffer instances over a certain size are externally allocated and will be counted here.
	**/
	function getHeapStatistics():js.lib.Promise<HeapStatistics>;
	function getHeapStatisticsSync():HeapStatistics;
	/**
		Start profiling against the isolate with a specific title
	**/
	function startCpuProfiler(title:String):Void;
	/**
		Stop profiling against the isolate with a specific title
		that started via `startCpuProfiler`. It will return more
		than one cpu profiles because isolate can be run in different
		threads. The `ThreadCpuProfile` contains the `thread_id` that
		the isolate was running in.
	**/
	function stopCpuProfiler(title:String):js.lib.Promise<Array<ThreadCpuProfile>>;
	static var prototype : Isolate;
	/**
		Isolate snapshots are a very useful feature if you intend to create several isolates running
		common libraries between them. A snapshot serializes the entire v8 heap including parsed code,
		global variables, and compiled code. Check out the examples section for tips on using this.
		
		**Please note that versions of nodejs 10.4.0 - 10.9.0 may crash while using the snapshot
		feature.**
	**/
	static function createSnapshot(scripts:Array<SnapshotScriptInfo>, ?warmup_script:String):ExternalCopy<js.lib.ArrayBuffer>;
}