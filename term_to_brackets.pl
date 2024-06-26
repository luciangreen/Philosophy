term_to_brackets(A,B) :-
 term_to_brackets2(A,[],B),!.
 %sub_term_wa([],B,In),
 %findall(Add,member([Add,_],In),In2),
 %delete_sub_term_wa(In2,B,C).
 
term_to_brackets2(A,B,C) :-
 ((append(D,E,A),
 append([F],G,E),
 is_list(F))->
 (H=D,term_to_brackets2(F,[],G1),
 term_to_brackets2(G,[],G2),
 (G1=G12),
 (H=H2),
 %wrap_if_non_empty(G2,G21),
 foldr(append,[["["],G12,["]"]],L),
 foldr(append,[H2,L,G2],J));
 (H=A,
 wrap_if_non_empty(H,H2),
 append(H2,J))),
 append(B,J,C).