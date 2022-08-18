:-include('../listprologinterpreter/listprolog.pl').

/*
list_to_string([["a"],b],"",A).
A = "[[\"a\"],b]".

list_to_string([b,["a"]],"",A).
A = "[b,[\"a\"]]".

list_to_string([],"",A).
A = "[]".

list_to_string("","",A).
A = '""'.

list_to_string("a","",A).
A = "a".

list_to_string("'a'","",A).
A = "'a'".

list_to_string('a',"",A).
A = "a".

*/

list_to_string(A,B) :-
 list_to_string(A,"",B),!.
 
list_to_string("",B,C) :-
 %string(B1),
 %wrap_if_string(B1,B),
 %foldr(string_concat,["[",B,"]"],C),
 concat(B,"\"\"",C),!.
	
list_to_string([],B,C) :-
 %string(B1),
 %wrap_if_string(B1,B),
 %foldr(string_concat,["[",B,"]"],C),
 concat("[",B,"]",C),!.

list_to_string(A,"",C) :-
 (atom(A),atom_string(A,C))	,!.
 
list_to_string(A,B,C) :-
 %wrap_if_string(B1,B),
 ((not(is_list(A))%,wrap_if_string(A,A1)
 )->((B=""->G="";G=","),
 concat(B,G,A,C)
 %foldr(string_concat,[B,G,A],C)
 );
 (A=[D|E],wrap_if_string(D,D1),
 list_to_string(D1,"",F),
 (B=""->(G="",F=F2%wrap_if_string(F,F2)
 );
 (G=",",F=F2)),
 %foldr(string_concat,[B,G,F],F1),
 concat(B,G,F2,F1),
 list_to_string(E,F1,C))),!.

/*
list_to_string(A,"",C) :-
 wrap_if_string(A,C),
 %foldr(string_concat,["[",B,"]"],C),
 !.
*/

%/*
wrap_if_string(A,B) :-
 ((not(A=""),
 string(A))->
 foldr(string_concat,["\"",A,"\""],B);
 A=B),!.
%*/

concat(B,G,A,C) :-
 (string(A)->
 foldr(string_concat,[B,G,A],C);
 (atom(A),foldr(atom_concat,[B,G,A],C))),!.
 