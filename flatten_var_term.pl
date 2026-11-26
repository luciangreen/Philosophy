flatten_var_term([],Vars,Vars%,_
) :- !.
flatten_var_term(Term,Vars1,Vars2%,Start
) :-
	not(Term=[v,_]),
	Term=[Term1|Term2],
	flatten_var_term(Term1,[],Vars3%,true
	),
	append(Vars1,Vars3,Vars4),
	flatten_var_term(Term2,Vars4,Vars2%,false
	),!.
flatten_var_term(Term,Vars1,Vars2%,Start
) :-
	Term=[v,V],
	%(Start=true->
	%append(Vars1,V,Vars2);
	append(Vars1,[[v,V]],Vars2),!.
%flatten_var_term(Term,Vars,Vars) :-
%	not(Term=[v,_]),!.	

