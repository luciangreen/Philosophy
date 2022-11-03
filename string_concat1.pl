string_concat1(A,B,C):-((var(A),var(C))->fail;(string_chars1(A,A1),string_chars1(B,B1),string_chars1(C,C1),append1(A1,B1,C1),string_chars1(A,A1),string_chars1(B,B1),string_chars1(C,C1))).
string_chars1(A,B):-var(A),var(B),!.
%string_chars1(A,B):-var(B),!.
string_chars1(A,B):-%not(var(A)),not(var(B)),
 string_chars(A,B).
%string_chars1(A,B):-not(var(B)),string_chars(A,B).
append1([],A,A).
append1([A|D],B,[A|C]) :- append1(D,B,C).
