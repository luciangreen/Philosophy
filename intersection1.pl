intersection1(A,B,C):-
findall(D,(member(D,A),member(D,B)),C).

intersection2(A,B,C):-intersection2(A,B,[],C),!.
intersection2([],_,A,A):-!.
intersection2([A1|A2],B,C,D):-
member1(A1,B),
intersection2(A2,B,[A1|C],D).
intersection2([_|A2],B,C,D):-
intersection2(A2,B,C,D).

member1(A,[A|_]):-!.
member1(A,[_|B2]):-member1(A,B2).