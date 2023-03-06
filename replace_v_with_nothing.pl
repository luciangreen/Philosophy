replace_v_with_nothing([],Vars,Vars%,_
) :- !.
replace_v_with_nothing(Term,Vars1,Vars2%,Start
) :-
	not(Term=[v,_]),
	Term=[Term1|Term2],
	replace_v_with_nothing(Term1,[],Vars3%,true
	),
	append(Vars1,[Vars3],Vars4),
	replace_v_with_nothing(Term2,Vars4,Vars2%,false
	),!.
replace_v_with_nothing(Term,Vars1,Vars2%,Start
) :-
	Term=[v,V],
	%(Start=true->
	%append(Vars1,V,Vars2);
	append(Vars1,V,Vars2),!.
%replace_v_with_nothing(Term,Vars,Vars) :-
%	not(Term=[v,_]),!.	


/*
replace_in_terms_in_term(_,[],Vars,Vars%,_
) :- !.
replace_in_terms_in_term(From_to,Term,Vars1,Vars2%,Start
) :-
	not(Term=[v,_]),
	Term=[Term1|Term2],
	replace_in_terms_in_term(From_to,Term1,[],Vars3%,true
	),
	append(Vars1,[Vars3],Vars4),
	replace_in_terms_in_term(From_to,Term2,Vars4,Vars2%,false
	),!.
replace_in_terms_in_term(From_to,Term,Vars1,Vars2%,Start
) :-
	Term=[v,V],
	%(Start=true->
	%append(Vars1,V,Vars2);
	member([V,W],From_to),
	append(Vars1,W,Vars2),!.
%replace_in_terms_in_term(Term,Vars,Vars) :-
%	not(Term=[v,_]),!.	
*/