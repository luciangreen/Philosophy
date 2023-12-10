family_test:-

grandparent(Result1),

writeln(Result1),

older(Result2),

writeln(Result2),

siblings(Result3),

writeln(Result3),
 
sibling_list(john,Result5),

writeln(Result5),

older_brother(Result6),

writeln(Result6),

descendant(albert,Result7),

writeln(Result7),
 
ancestor(john,Result8),

writeln(Result8),

children(albert, ChildList),

writeln(ChildList),

list_count([1,2,3], Count1),
 
writeln(Count1),

count_descendants(albert, Count2),

writeln(Count2).
