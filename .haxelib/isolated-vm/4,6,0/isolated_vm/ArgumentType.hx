package isolated_vm;

typedef ArgumentType<Options, Type> = ts.AnyOf3<Copy<Type>, Dereference<Type>, Dynamic>;