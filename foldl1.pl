/*

?- foldl1(string_concat1,["a","b"],"",C).
C = "ab".

?- foldl1(string_concat1,["a","b"],D,"ab").
D = "".

?- foldl1(string_concat1,A,"","ab").
fail
* should return an error

?- foldl1(append1,[["a"],["b","c"]],[],C).
C = ["a", "b", "c"].

?- foldl1(append1,[["a"],["b","c"]],D,["a", "b", "c"]).
D = [].

?- foldl1(append1,A,[],["a", "b", "c"]).
A = [["a", "b", "c"]]

*/

:-include('string_concat1.pl').

foldl1(_,[],A,A):-!.
foldl1(Function,[A1|D],B,C) :- 
functor(A,Function,3),arg(1,A,B),arg(2,A,A1),arg(3,A,A3),
A, foldl1(Function,D,A3,C),!.

% build this higher order function directly in lp

% test 244 with different modes

% without an initial value, use the first value

% foldr
