mutually_exclusive(A,B) :-
	intersection(A,B,[]).
	
not(mutually_exclusive(A,B) :-
	intersection(A,B,C),not(C=[]).
