replace_nothing_with_v([],Vars,Vars%,_
) :- !.
replace_nothing_with_v(Term,Vars1,Vars2%,Start
) :-
	not(atom(Term)),
	Term=[Term1|Term2],
	replace_nothing_with_v(Term1,[],Vars3%,true
	),
	append(Vars1,[Vars3],Vars4),
	replace_nothing_with_v(Term2,Vars4,Vars2%,false
	),!.
replace_nothing_with_v(Term,Vars1,Vars2%,Start
) :-
	atom(Term),
	%(Start=true->
	%append(Vars1,V,Vars2);
	append(Vars1,[v,Term],Vars2),!.
%replace_nothing_with_v(Term,Vars,Vars) :-
%	not(Term=[v,_]),!.	

