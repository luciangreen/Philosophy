random_phrase(Noun1,Verb,Noun2) :-
	choose(noun(Noun1)),choose(verb(Verb)),choose(noun(Noun2)).
random_phrase(Noun1,Verb,Noun2,Ablative,Noun3) :-
	choose(noun(Noun1)),choose(verb(Verb)),choose(noun(Noun2)),choose(ablative(Ablative),noun(Noun3)).
	
choose(C) :-
 findall(C,C,D),random_member(C,D).
	%C.
/*
	C..=[A,B],
	C
	functor(C,A,1),D=C,arg(1,D,_),
	retractall(D),
	arg(1,C,B),
	%((A=curr_cp,B=24)->writeln(set(curr_cp,24));true),
	assertz(C),!	.	
	*/
noun(peter).
noun(sue).
noun(a_book).
noun(a_song).
verb(reading).
verb(walking).
verb(composing).
verb(walked_with).
verb(talked_with).
ablative(by).
ablative(with).
ablative(from).
ablative(in).
ablative(on).
ablative(out_of).


