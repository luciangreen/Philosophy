:-include('../listprologinterpreter/la_maths.pl').
% change([[1,2,3],"findall1(A,findall1(A,member(A,B),C)",B]).
% B = [1, 2, 3].

change([B1,"findall1(A,findall1(A,member(A,B),C)",B]) :-

length(B1,L),
numbers(L,1,[],N),
fa1(N,B1,[],B).

fa1([],_,A,A) :- !.
fa1(N,B1,A,B) :-
 N=[N1|Ns],
 get_item_n(B1,N1,C),
 append(A,[C],A1),
 fa1(Ns,B1,A1,B).

% Or B1=B.

