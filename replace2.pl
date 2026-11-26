:-include('../listprologinterpreter/listprolog.pl').
replace2(A,Find,Replace,B) :-
 sub_string(A,B1,C,_D,Find),string_concat(List,List2,A),string_length(List,B1),string_concat(List3,List4,List2),string_length(List3,C),
 replace2(List4,Find,Replace,List41),
 foldr(string_concat,[List,Replace,List41],B),!.
replace2(A,_Find,_Replace,A) :- !.
