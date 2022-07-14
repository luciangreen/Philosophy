:-include('../listprologinterpreter/listprolog.pl').

pretty_print_list([],"[]") :- !.
pretty_print_list(A,B) :-
 pretty_print_list(A,1,"[\n",B1),
 delete_last_n(B1,2,B3),
 string_concat(B3,"\n]",B),!.
 
pretty_print_list([],_,C,C) :- !.

pretty_print_list([A|D],T,B,C) :-
 T1 is T+1,
 spaces(T,S),
 (is_list(A)->(pretty_print_list(A,T1,"",G),
  delete_last_n(B,1,B1),
  delete_last_n(G,2,G1),
foldr(string_concat,[B1,"\n",S,"[","\n",G1,"\n",S,"],\n"],F));
 (
 foldr(string_concat,[B,S,A,",\n"],F)
 )),
 pretty_print_list(D,T,F,C),!.

spaces(N,S) :-
 numbers(N,1,[],S1),
 findall("\t",member(_,S1),S2),
 foldr(string_concat,S2,S),!.
 
delete_last_n(B1,N,B3) :-
 string_concat(B3,B2,B1),string_length(B2,N),!.
