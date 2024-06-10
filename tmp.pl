check_grammar(R) :-
    catch((findall(_,(member(S,["[[[[],g],[]],[],a]"]),term_to_atom(S2,S),flatten_keep_brackets(S2,S1),append([_],S4,S1),append(S3,[_],S4),once(phrase(a1,S3))),A),((length(["[[[[],g],[]],[],a]"],L),length(A,L))->R="success";R="fail")),Err, handle_error(Err)),
  !.
a1-->["["],
["["],
["["],
["]"],
[g],
["]"],
["["],
["]"],
["]"],
["["],
["]"],
[a].
