:-include('pf_types.pl').

% b1("abc",B).
% B = "abc".

b1(A,G) :-
string_codes(A,B),findall(C,(member(D,B),char_code(C,D)),E),a(F,[],E),foldr(string_concat,F,G),!.

% reverse2("abc",B).
% B = "cba".

reverse2(A,G) :-
string_codes(A,B),findall(C,(member(D,B),char_code(C,D)),E),reverse1(F,[],E),foldr(string_concat,F,G),!.