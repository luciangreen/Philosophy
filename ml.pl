
% call_1(A,B1,B2) :- call(B1,B2,A).
% call_1(A,B1,B2,B3) :- call(B1,B2,B3,A).

% call_2(B1,A,B2) :- call(B1,B2,A).
% call_2(B1,A,B2,B3) :- call(B1,B2,B3,A).

maplist1(Goal, List) :-
    maplist_(List, Goal).

maplist_([], _).
maplist_([Elem|Tail], Goal) :-
Tail is maplist_1(call_1(Elem)).
call_1(A,B) :- call(B,A).

