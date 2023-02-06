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

% find_lists1([1,1,1,[2,2],1,1,1,[2]],[1,1,1,[2,2]],[],L).
% L = [1, 1, 1, [2]] 

% find_lists1([[1,1,1,[2,2],1,1,1,[2]]],[[1,1,1,[2,2]]],[],L).
% L = [[1, 1, 1, [2]]] 

% find_lists1([[[1,1,1,[2,2],1,1,1,[2]]]],[[[1,1,1,[2,2]]]],[],L).
% L = [[[1, 1, 1, [2]]]] 

find_lists1(T1,T2,L1,L2) :-
 find_lists(T1,T2,L1,L2,true).
 
find_lists([],[],L,L,_) :- !.%maplist(is_empty_list,Ts),!.
find_lists(_,[],L,L,_) :- !.%,fail.%maplist(is_empty_list,Ts),!.
find_lists(T,T,L1,L2,_Start) :-
 number(T),
 %trace,
 append(L1,T,L2),!.
find_lists(T1,T2,L1,L2,_Start) :-
 length(T1,TL1),
 length(T2,TL2),
 TL1 is TL2*2,
 length(A,TL2),
 append(A,B,T1),
 %trace,
 check_same(A,B,L1,L2,true),
 %trace,
 % * find 2 sides and directions that work
 (check_same(A,T2,L1,L2,true)->true;
 check_same(T2,B,L1,L2,true)),!.
 /*
find_lists(T1,T2,L1,L2,_Start) :-
 length(T1,TL1),
 length(T2,TL2),
 TL2 is TL1*2,
 length(A,TL1),
 append(A,B,T2),
 %trace,
 check_same(A,B,L1,L2,true),
 %trace,
 check_same(A,T1,L1,L2,true),!.
 */
find_lists(T1,T2,L1,L2,_Start) :-
 length(T1,TL),
 length(T2,TL),
 check_same(T1,T2,L1,L2,true),!.

 
check_same([],[],L,L,_) :- !.
check_same(A,B,L1,L2,Start) :-
 A=[T11|T12],
 B=[T21|T22],
 
 find_lists(T11,T21,[],L3,false),
 %trace,
 (Start=true->
 foldr(append,[L1,[L3]],L4);
 foldr(append,[L1,L3],L4)),
 find_lists(T12,T22,L4,L2,false).
