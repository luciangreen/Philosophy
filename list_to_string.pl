:-include('../listprologinterpreter/listprolog.pl').

list_to_string(A,B) :-
 list_to_string(A,"",B),!.
 
list_to_string([],B,C) :-
 foldr(string_concat,["[",B,"]"],C),!.
	
list_to_string(A,B,C) :-
 (not(is_list(A))->((B=""->G="";G=","),
 foldr(string_concat,[B,G,A],C));
 (A=[D|E],list_to_string(D,"",F),
 (B=""->G="";G=","),
 foldr(string_concat,[B,G,F],F1),
 list_to_string(E,F1,C))),!.
