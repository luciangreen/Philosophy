% * turn off optional in output

% * copy var vals to out
% A1 is not always the same x

term_to_list(T,L) :-
	term_to_list(T,[],L).

term_to_list([],L1,L1) :-!.
term_to_list(T,L1,L2) :-

	T=[T1|T2],
	(T1=[r,[_V,T3]]->
	(foldr(append,T3,T31),
	append(L1,T31,L3));
	(term_to_list(T1,L1,L31)->L3=[L31];
	append(L1,[T1],L3))),
	
	term_to_list(T2,L3,L2).
