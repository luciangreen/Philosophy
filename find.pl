% find.pl

/*
find([[]], [], A).
A = [[]].

find([],[],A).
A = [[]].

find([[a,b],[a,c]],[],A).
A = [[]].
x

find([[a,b],[a,c]],[a,_],A).
A = [[a, b], [a, c]].

find([[a,b],[a,[a,e]]],[a,_],A).
A = [[a, b], [a, [a, e]], [a, e]].

*/
:-include('../listprologinterpreter/listprolog.pl').

find(A,Find,B) :-
 findall(B1,find2(A,Find,[],B1,false),B2),
 %delete(B2,[],B21),
 foldr(append,B2,B21),
 findall(B3,(member(B3,B21),B3=Find),B),
 %(Find=[]->B=B2;delete(B2,[],B)),
 !.
 
find2([],_Find,B,B,_) :- !.
find2(A,Find,B,C,First) :-
 not(is_list(A)),
 copy_term(Find,Find1),
 find3(A,Find1,B,C,First).
 %(A=Find->append(B,[A],C);
 %B=C);
find2(A,Find,B,C,First) :-
 is_list(A),
 copy_term(Find,Find1), 
 find4(A,Find1,B,C,First).

% (A=Find->append(B,[A],C);
% (
% (A=[D|E],find2(D,Find,B,F),
% find2(E,Find,F,C))))).

find3(A,Find,B,C,_) :-
 A=Find,append(B,[A],C).
%find3(A,Find,B,B,false) :- 
% (A=Find),!.
find3(A,Find,B,B,false) :- 
 not(A=Find),!.

find4(A,Find,B,C,_) :-
 A=Find,append(B,[A],C).
find4(A,Find,B,C,_) :-
 %not(A=Find),
 A=[D|E],find2(D,Find,B,F,true),
 %find5(E,Find,F,C,false).
 find2(E,Find,F,C,false).

/*
find5(E,_Find,F,C,_) :-
 E=[],F=C.
find5(E,Find,F,C) :-
 not(E=[]),
 find2(E,Find,F,C).
*/