/*

find([[a,b],[a,c]],[a,_],A).
A = [[a, b], [a, c]].

find([[a,b],[[a,c]]],[a,_],A).
A = [[a, b], [a, c]].

find([[a,b],[a,c]],[],A).
A = [].

find([[a,b],[a,[a,e]]],[a,_],A).
A = [[a, b], [a, [a, e]]].

*/
:-include('../listprologinterpreter/listprolog.pl').

find(A,Find,B) :-
 find2(A,Find,[],B),
 !.
 
find2([],_Find,B,B) :- !.
find2(A,Find,B,C) :-
 not(is_list(A)),
 find3(A,Find,B,C).
find2(A,Find,B,C) :-
 is_list(A),
 find4(A,Find,B,C).

find3(A,Find,B,C) :-
 A=Find,append(B,[A],C).
find3(A,Find,B,B) :- 
 not(A=Find),!.

find4(A,Find,B,C) :-
 A=Find,append(B,[A],C).
find4(A,Find,B,C) :-
 copy_term(Find,Find1), 
 A=[D|E],find2(D,Find1,B,F),
 find2(E,Find,F,C).
