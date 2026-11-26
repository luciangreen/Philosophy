:-include('../listprologinterpreter/listprolog.pl').

%memorisation([a,b,c],2) :-
memorisation(_,0) :- !.
memorisation(List1,N1) :-
	repeat,
	writeln("Say out loud and type the following to help memorise it:"),
	writeln1(List1),
	read_string(user_input, "\n", "\r", _, List11),
	term_to_atom(List1,List11),
	reverse(List1,List2),
	repeat,
	writeln("Reverse, say out loud and type the following to help memorise it:"),
	writeln1(List1),
	read_string(user_input, "\n", "\r", _, List21),
	term_to_atom(List2,List21),
	N2 is N1-1,
	memorisation(List1,N2),!.