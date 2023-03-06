collect_ga_parts([],Vars,Vars) :- !.
collect_ga_parts(Term,Vars1,Vars2) :-
	not(is_item4(Term)),
	Term=[Term1|Term2],
	collect_ga_parts(Term1,Vars1,Vars3),
	collect_ga_parts(Term2,Vars3,Vars2),!.
collect_ga_parts(Term,Vars1,Vars2) :-
	is_item4(Term),
	append(Vars1,[Term],Vars2),!.
collect_ga_parts(Term,Vars,Vars) :-
	not(is_item4(Term)),!.
