% pretty_print_table([[[["a","b"],["c","d"]],[["a","b"],["c","d"]]],[[["a","b"],["c","d"]],[["a","b"],["c","d"]]]],A),writeln(A).
/*
[
[
[["a","b"],["c","d"]],

[["a","b"],["c","d"]]
],[
[["a","b"],["c","d"]],

[["a","b"],["c","d"]]
]
]
*/
%:-include('../listprologinterpreter/listprolog.pl').

pretty_print_table(B3,S6) :-
 findall([S6,','],(member(A00,B3),
 pretty_print_table2(A00,S5),
 
 
  
 %),
 findall([A,C],(member(A,S5),(A=','->C='\n';C='')),S2),
 
 flatten([%S1,
 S2%,S3
 ],S4),
 foldr(string_concat,S4,S6)
 
),B4),
S1="[\n",
S3="\n]",
 foldr(append,B4,B1),append(B2,[_],B1),
 
  flatten([S1,B2,S3],B5),
 foldr(string_concat,B5,S6),!.

pretty_print_table2(B0,S4) :-
 findall([A,','],member(A,B0),B),
 foldr(append,B,B1),append(B2,[_],B1),
 S1=("[\n"),
 findall([A2,C],(member(A,B2),(A=','->A=A2;term_to_atom(A,A2)),(A=','->C='\n';C='')),S2),
 S3="\n]",
 flatten([S1,S2,S3],S4),
 !.