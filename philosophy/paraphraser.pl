% paraphraser.pl

:-include('../../listprologinterpreter/la_strings.pl').

% paraphraser("the company contained the person",B).
% B = " the firm contained the entity".

paraphraser(A,B) :- 
	split_string(A," "," ",C), % later: keep formatting
	replace2(C,[["company","firm","business"],
		["person","individual","entity"]],[],D),
		%trace,
		concat_list(D,B).

replace2([],_Lists,B,B) :- !.
replace2(A,Lists,H,B) :-
	A=[C|D],
	((member(E,Lists),
	member(C,E),
	delete(E,C,F),
	random_member(G,F))->true;C=G),
	%trace,
	maplist(append,[H],[[" ",G]],[J]),
	replace2(D,Lists,J,B).




