% ["Computational English","COMPUTATIONAL ENGLISH by Lucian Green Computational English is like a Calculator 2 of 4.txt",0,algorithms,"12.   I prepared to find the first store-holder who could sell me produce.  *I did this by writing that 'or' in Ball Prolog is represented by up to n automata being used.  First, I tested whether the first automaton was successful.  Second, I prepared to test whether the next automaton was successful.  Third, I repeated this until an automaton was successful.  In this way, I prepared to find the first store-holder who could sell me produce by writing that 'or' in Ball Prolog is represented by up to n automata being used."]

% or([0,0,0,1]).
or([]):-fail.
or(List) :-
	List=[L|Ls],
	(L=0->or(Ls);true).