/**
["Fundamentals of Meditation and Meditation Indicators","FUNDAMENTALS OF MEDITATION by Lucian Green 50 Breasonings Per Utterance 2 of 4.txt",0,algorithms,"12.   *I prepared to ask what 50 breasonings per second.  I did this by writing Michel Onfray’s probable comments on the Meditation blog.  First, I loved the Kings.  Second, I adored French fries.  Third, I ate them.  In this way, I prepared to ask what 50 breasonings per second by writing Michel Onfray’s probable comments on the Meditation blog."]

Divide an image up into measured segments or factors.

[debug]  ?- factors(3,[],F).
F = [3].

[debug]  ?- factors(4,[],F).
F = [2, 2].

[debug]  ?- factors(5,[],F).
F = [5].

[debug]  ?- factors(8,[],F).
F = [2, 2, 2].

[debug]  ?- factors(12,[],F).
F = [2, 2, 3].
**/

:-include('../../../GitHub/listprologinterpreter/la_maths.pl').
factors(1,_,[1]) :- !.
factors(N1,F1,F2) :-
	numbers1(N1,N2),
	(lowest_factor(N1,N2,F3)->
	(N3 is N1/F3,
	append(F1,[F3],F4),
	factors(N3,F4,F2));
	append(F1,[N1],F2)).

numbers1(N1,N2) :-
	N3 is N1-1,
	numbers(N3,2,[],N2).
		
lowest_factor(_N1,[],_N3) :- fail.
lowest_factor(N1,N2,N5) :-
	N2=[N3|N4],
	(0 is mod(N1,N3)->N5=N3;
	lowest_factor(N1,N4,N5)).

