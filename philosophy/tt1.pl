% ["Lecturer","Computer Science.txt",0,algorithms,"1. *It was logical to teleport the time machine, which used quantum power, to the house.  I wrote the new logic.  Quantum power is a big thing when the conclusion is arrived at.  Nature goes around, wait, the time machine stays in the future.  In fact, they have one (is it in the house?)."]

% And-implication was used to match the assignments to the desired results.

tt1(Result):-findall([[v1,V1],[v2,V2],C],(member(V1,[0,1]),member(V2,[0,1]),true1(implies(V1,(not(V2))),C)),Result).
true1(or(A,B),C):-true1(A,A1),true1(B,B1),or1(A1,B1,C).
true1(not(A),C):-true1(A,A1),not1(A1,C).
true1(implies(A,B),C):-true1(A,A1),true1(B,B1),implies1(A1,B1,C).
true1(and(A,B),C):-true1(A,A1),true1(B,B1),and1(A1,B1,C).
or1(1,1,1).
or1(1,0,1).
or1(0,1,1).
or1(0,0,0).
not1(0,1).
not1(1,0).
true1(1,1).
true1(0,0).
implies1(A,B,C):-
and1(A,B,C).
and1(1,1,1).
and1(1,0,0).
and1(0,1,0).
and1(0,0,0).
