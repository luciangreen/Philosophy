% autocomplete.pl

/*

traverse_tree(1,[[1,"a",2],[2,"b",3],[2,"c",4]]).

["a"]
|: a
["b","c"]
|: b
true.

*/

:-include('../../listprologinterpreter/listprolog.pl').

traverse_tree(N1,Tree) :-
	%member([N1,Item,_],Tree),
	%writeln(Item),
	%trace,
	findall([N1,Option,N2],member([N1,Option,N2],Tree),Options2),
	(Options2=[]->true;
	(findall(Option,member([N1,Option,N2],Options2),Options3),
	writeln1(Options3),
	read_string(user_input,"\n","\r",_,S),
	%length(Options3,L),
	%numbers(L,1,[],LN),
	%member(L1,LN),
	member([_,S,N2],Options2),
	traverse_tree(N2,Tree))),!.

