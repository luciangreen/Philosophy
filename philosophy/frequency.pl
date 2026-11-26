% frequency([1,1,1,2,2],[],F).

frequency([],F,F) :- !.
frequency(Data,F1,F2) :-
	Data=[D1|_D2],
	findall(D1,member(D1,Data),D3),
	length(D3,L),
	append(F1,[[D1,L]],F3),
	delete(Data,D1,D4),
	frequency(D4,F3,F2).

	
