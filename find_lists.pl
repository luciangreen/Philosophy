/*

[
 [11]
]

and 

[
 [111]
]

make

[
 [1]
]

where this [1] represents a list of 1s

[
 [1,1,[2,2],1,1,[2]]
]

and 

[
 [1,1,[2,2]]
]

make

[
 [1,1,[2]]
]

*/

:-include('../listprologinterpreter/la_strings.pl').

is_empty_list([]).

% find_lists([1,1,1,[2,2],1,1,1,[2]],[1,1,1,[2,2]],[],L).
% L = [1, 1, 1, [2]] 

% find_lists([[1,1,1,[2,2],1,1,1,[2]]],[[1,1,1,[2,2]]],[],L).
% L = [[1, 1, 1, [2]]] 

% find_lists([[[1,1,1,[2,2],1,1,1,[2]]]],[[[1,1,1,[2,2]]]],[],L).
% L = [[[1, 1, 1, [2]]]] 
 
find_lists([],[],L,L) :- !.%maplist(is_empty_list,Ts),!.
find_lists(_,[],L,L) :- !.%,fail.%maplist(is_empty_list,Ts),!.
find_lists(T,T,L1,L2) :-
 number(T),
 %trace,
 append(L1,T,L2),!.
find_lists(T1,T2,L1,L2) :-
 length(T1,TL1),
 length(T2,TL2),
 TL1 is TL2*2,
 length(A,TL2),
 append(A,B,T1),
 %trace,
 check_same(A,B,L1,L2),
 %trace,
 % * find 2 sides and directions that work
 (check_same(A,T2,L1,L2)->true;
 check_same(T2,B,L1,L2)),!.
find_lists(T1,T2,L1,L2) :-
 length(T1,TL),
 length(T2,TL),
 check_same(T1,T2,L1,L2),!.

 
check_same([],[],L,L) :- !.
check_same(A,B,L1,L2) :-
 A=[T11|T12],
 B=[T21|T22],
 
 find_lists(T11,T21,[],L3),
 %trace,
 foldr(append,[L1,[L3]],L4),
 find_lists(T12,T22,L4,L2).
