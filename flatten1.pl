flatten1(A,B) :-
 flatten2(A,[],B),!.
 
flatten2([],B,B) :- !.
flatten2(A,B,C) :-
 (not(is_list(A))->append(B,[A],C);
 (A=[D|E],flatten2(D,B,F),
 flatten2(E,F,C))),!.
