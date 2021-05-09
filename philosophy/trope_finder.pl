% trope_finder.pl

:-include('../../listprologinterpreter/la_strings').

% ?- trope_finder(add,A),writeln1(A).
% A = [[add, ["hat", "hat"]], [add, ["hat", "cape"]], [add, ["cape", "hat"]], [add, ["cape", "cape"]]].

trope_finder(A,B) :- findall([A,C],trope(A,C),B).

trope(add,[A,B]) :- class(object,A),class(object,B).
class(object,A) :- br1(A,B), (not(B="minus"),not(B="right")).

br1("hat","").
br1("cape","").
br1("danger","minus").
br1("go","right").