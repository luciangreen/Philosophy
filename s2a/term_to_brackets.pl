term_to_brackets(A,B) :-
 (is_list(A)->
 ((A=[Word,_Args],type_s2a1(Word))->
 (term_to_brackets2([A],[],[B])
 %single_results(SR1),
 %append(SR1,[A],SR2),
 %retractall(single_results(_)),
 %assertz(single_results(SR2))
 );
 (term_to_brackets2(A,[],B)));
 A=B),!.
 %sub_term_wa([],B,In),
 %findall(Add,member([Add,_],In),In2),
 %delete_sub_term_wa(In2,B,C).
 
term_to_brackets2(A,B,C) :-
 ((append(D,E,A),
 append([F],G,E),
 is_list(F))->
 (H=D,
 ((F=[Word,_Args],type_s2a1(Word))->
 (F=G1,Wrap=true);
 (term_to_brackets2(F,[],G1),Wrap=false)),
 term_to_brackets2(G,[],G2),
 (G1=G12),
 (H=H2),
 %wrap_if_non_empty(G2,G21),
 %trace,
 (Wrap=true->L=[G12];
 foldr(append,[["["],G12,["]"]],L)),
 foldr(append,[H2,L,G2],J));
 (H=A,
 wrap_if_non_empty(H,H2),
 append(H2,J))),
 append(B,J,C).