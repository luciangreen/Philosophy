a([],A,A).
a(A,B,C) :-
 A=[D|E],
 append(B,[D],F),
 a(E,F,C).

% ?- b([1,2,3],A).
% A = [1, 2, 3].

b([],[]).
b([D|E],[D|B]) :-
 b(E,B).

% ?- c([1,2,3],[],A).
% A = [2, 3, 4].

c([],A,A).
c(A,B,C) :-
 A=[D|E],
 F is D+1,
 append(B,[F],G),
 c(E,G,C).
