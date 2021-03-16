% ["Lecturer","Meditation.txt",0,algorithms,"7. *I substantiated my claims with logic.  I wrote a meditation breasoning per day on my discussion.  I discussed the work in terms of my previous work.  I made future plans.  I connected through my plans."]

n_level_argument :-
	writeln("What is your conclusion?"),
	read_string(user_input,"\n","\r",_,C1),
	
	n_level_argument1(6,[],Args),
	writeln(C1),
	writeln(Args).

n_level_argument1(0,Args,Args) :- !.
n_level_argument1(N1,Args1,Args2) :-
	writeln("What is evidence for this?"),
	read_string(user_input,"\n","\r",_,C1),
	append(Args1,[C1],Args3),
	N2 is N1-1,
	n_level_argument1(N2,Args3,Args2).


