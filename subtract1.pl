subtract1(C,[],C):-!.
subtract1(A,[B1|B2],E):-delete1(A,B1,[],D),subtract1(D,B2,E).

delete1([],_,C,C):-!.
delete1([A1|A2],A1,C,D):-delete1(A2,A1,C,D),!.
delete1([A1|A2],B,C,D):-delete1(A2,B,[A1|C],D),!.