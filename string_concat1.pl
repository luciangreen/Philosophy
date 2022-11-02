string_concat1(A,B,C):-string_chars1(A,A1),string_chars1(B,B1),string_chars1(C,C1),string_concat2(A1,B1,C1),string_chars1(A,A1),string_chars1(B,B1),string_chars1(C,C1).
string_chars1(A,B):-var(A),var(B),!.
%string_chars1(A,B):-var(B),!.
string_chars1(A,B):-%not(var(A)),not(var(B)),
 string_chars(A,B).
%string_chars1(A,B):-not(var(B)),string_chars(A,B).
string_concat2([],A,A).
string_concat2([A|D],B,[A|C]) :- string_concat2(D,B,C).
