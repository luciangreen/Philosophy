/*

optimise_alg([[[n, 1], "->", [[[n, 21]], [1], [[n, 21]]]], [[n, 2], "->", [[]]], [[n, 2], "->", [[0], [[n, 2]]]], [[n, 21], "->", [[[n, 2]]]]],A)/
A= [[[n, 1], "->", [[[n, 2]], [1], [[n, 2]]]], [[n, 2], "->", [[]]], [[n, 2], "->", [[0], [[n, 2]]]]]

*/
optimise_alg(A,B) :-
%trace,
 (optimise_alg1(A,C)->
 ((A=C->C=B;
 (%trace,
 (optimise_alg(C,B)->true;C=B))));
 A=B),!.

optimise_alg1(A,G) :-
 find_first((member(B,A),
 ((B=[[n, D], Symbol, [[[n, E]|_Arg]]],
 (Symbol=":-"->true;Symbol="->"))->
 (%trace,
 delete(A,B,F),
 find_replace_t(F,[n, D],[n, E],G));
 ((B=[[n, D], _Arg1,Symbol, [[[n, E]|_Arg]]],
 (Symbol=":-"->true;Symbol="->"))->
 (delete(A,B,F),
 find_replace_t(F,[n, D],[n, E],G)))))),!.
 
