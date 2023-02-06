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

/*

[debug]  ?- find_lists1([[1, [2, 2], 1, [2]], [1, [2, 2]],[1, [2, 2], 1, [2],1,[2,2,2]]], [],A).
A = [1, [2]].

[debug]  ?- find_lists1([[1, [2, 2], 1, [2]], [1, [2, 2]]], [],A). 
A = [1, [2]].

*/

find_lists1(T1T2,L1,L2) :-
 find_lists(T1T2,L1,L2,true).
 
find_lists(Ts,L,L,_) :- maplist(is_empty_list,Ts),!.
%find_lists(_,[],L,L,_) :- !.%,fail.%maplist(is_empty_list,Ts),!.
find_lists(TT,L1,L2,_Start) :-
 (maplist(number,TT)->true;
 (maplist(string,TT)->true;
 (maplist(atom,TT)))),
 %trace,
 TT=[T|_],
 append(L1,T,L2),!.
find_lists(T1T2,L1,L2,Start) :-
%trace,
 sort(T1T2,T1T22),
 T1T22=[T1|_],
 length(T1,TL1),
 %findall(T13,(member(T13,T1T22),length(T13,TL13)),TL11),
 %length(T1,TL1),
 %length(T2,TL2),
 cut_into_equals_segments(TL1,T1T22,[],TL12),
 sort(TL12,TL14),
 %TL1 is TL2*2,
 %length(A,TL2),
 %append(A,B,T1),
 %trace,
 TL14=[TL15|TL16],
 check_same2(TL15,TL16,L1,L2,Start),!.
 %check_same2(A,B,L1,L2,Start),*
 %trace,
 % * find 2 sides and directions that work *1 x above, cut into min length segments, sort, (check_same in a line xx *1 x)
 % do d2t after find lists
 %(check_same(A,T2,L1,L2,Start)->true;
 %check_same(T2,B,L1,L2,Start)
 %),!.

/*
find_lists(T1,T2,L1,L2,Start) :-
 length(T1,TL),
 length(T2,TL),
 check_same(T1,T2,L1,L2,Start),!.
*/
 
check_same([],[],L,L,_) :- !.
check_same(A,B,L1,L2,_Start) :-
 A=[T11|T12],
 B=[T21|T22],
 append([T11],[T21],T11T21),
 find_lists(T11T21,[],L3,true),
 %trace,
 (false%Start=true
 ->
 foldr(append,[['*'],L1,[L3]],L4);
 foldr(append,[L1,[L3]],L4)),
 append(T12,T22,T12T22),
 find_lists(T12T22,L4,L2,false).


cut_into_equals_segments(_,[],TL13,TL13) :- !.
cut_into_equals_segments(L,TL11,TL13,TL12) :-
 TL11=[TL14|TL15],
 cut_into_equals_segments2(L,TL14,[],TL16),
 append(TL13,TL16,TL17),
 cut_into_equals_segments(L,TL15,TL17,TL12).

cut_into_equals_segments2(_,[],T,T) :- !.
cut_into_equals_segments2(L,TL14,TL15,TL16) :-
 length(A,L),
 append(A,B,TL14),
 append(TL15,[A],TL17),
 cut_into_equals_segments2(L,B,TL17,TL16).

check_same2(A,[],L1,L2,_Start) :- %trace,
 append(L1,[A],L2),!.
check_same2(_A,[],L,L,_Start) :- !.%append(L1,[A],L2),!.
check_same2(TL14,TL17,L1,L2,Start) :-
 %trace,
 TL14=[TL141|TL142],
 TL17=[TL15|TL16],
 TL15=[TL151|TL152],
 check_same([TL141],[TL151],L1,L3,Start),
 append(TL142,TL152,TL142TL152),
 find_lists(TL142TL152,[],L4,Start),
 append(L3,L4,L5),
 %trace,
 %append(TL17,))
 (TL16=[]->L5=L2;
 (TL16=[TL171|TL18],
 check_same2(TL171,[L5],TL18,L2,Start))).


