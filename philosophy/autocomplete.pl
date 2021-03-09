% autocomplete.pl

:-include('../../listprologinterpreter/la_maths').

traverse_tree(N1,Tree) :-
	%member([N1,Item,_],Tree),
	%writeln(Item),
	%trace,
	findall([N1,Option,N2],member([N1,Option,N2],Tree),Options2),
	(Options2=[]->abort;
	(findall(Option,member([N1,Option,N2],Options2),Options3),
	writeln1(Options3),
	read_string(user_input,"\n","\r",_,S),
	length(Options2,L),
	numbers(L,1,[],LN),
	member(L1,LN),
	get_item_n(Options2,L1,[_,S,N2]),
	traverse_tree(N2,Tree))).

