check_grammar(R) :-
    catch((findall(_,(member(S,["[0,0,1,0,0]"]),term_to_atom(S2,S),flatten_keep_brackets(S2,S1),append([_],S4,S1),append(S3,[_],S4),once(phrase(a1,S3))),A),((length(["[0,0,1,0,0]"],L),length(A,L))->R="success";R="fail")),_, fail),
  !.
a1-->a2,[1],
a3.
a2-->[].
a2-->[0],
a2.
a3-->[].
a3-->[0],
a3.
