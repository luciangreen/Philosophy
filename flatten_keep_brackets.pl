flatten_keep_brackets(A,B) :-
 flatten_keep_brackets2(A,[],B,true),!.
 
flatten_keep_brackets2([],B1,B2,true) :- 
 append(B1,["[","]"],B2),!.
flatten_keep_brackets2([],B,B,false) :- !.
flatten_keep_brackets2(A,B,C,First) :-
 (not(is_list(A))->append(B,[A],C);
 (A=[D|E],flatten_keep_brackets2(D,B,F,true),
 flatten_keep_brackets2(E,F,C1,false),
 (First=true->foldr(append,[["["],C1,["]"]],C);
 C1=C))),!.
