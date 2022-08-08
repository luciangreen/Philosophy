/*
[[1,9,[     ]],[2,9,[     ]],[3,9,["*"  ]],[4,9,["*"  ]],[5,9,["*"  ]],
 [1,8,[     ]],[2,8,["*"  ]],[3,8,[     ]],[4,8,[     ]],[5,8,["*"  ]],
 [1,7,[     ]],[2,7,["*"  ]],[3,7,[     ]],[4,7,["*"  ]],[5,7,[     ]],
 [1,6,["*"  ]],[2,6,[     ]],[3,6,["k"  ]],[4,6,["*"  ]],[5,6,["*"  ]],
 [1,5,["*"  ]],[2,5,[     ]],[3,5,[     ]],[4,5,["c"  ]],[5,5,["*"  ]],
 [1,4,[     ]],[2,4,["*"  ]],[3,4,[     ]],[4,4,[     ]],[5,4,["*"  ]],
 [1,3,["*"  ]],[2,3,[     ]],[3,3,[     ]],[4,3,["*"  ]],[5,3,[     ]],
 [1,2,["*"  ]],[2,2,[     ]],[3,2,["vine"]],[4,2,["*"  ]],[5,2,[     ]],
 [1,1,[     ]],[2,1,["*"  ]],[3,1,["*"  ]],[4,1,["*"  ]],[5,1,[     ]]]).
%*/

%% 1 start
%% key to chest->machete
%% machete to vine->exit

/**

?- traverse(2,6).
[2,6][]
[2,5][]
[3,5][]
[3,4][]
[3,3][]
[2,3][]
[2,2][]
[3,2][v]
[4,4][v]
[4,5][v,c]
[3,6][v,c,k,m,e]
Game Over
% Execution Aborted


**/

rainforest([[1,9,["*"]],[2,9,["*"]],[3,9,["*"]],[4,9,["*"]],[5,9,["*"]],[6,9,["*"]],[7,9,["*"]],[1,8,["*"]],[2,8,["k"]],[3,8,["c"]],[4,8,["vine"]],[5,8,[]],[6,8,[]],[7,8,["*"]],[1,7,["*"]],[2,7,["*"]],[3,7,["*"]],[4,7,["*"]],[5,7,["*"]],[6,7,["*"]],[7,7,["*"]]]).
traverse(X,Y):-(traverse(X,Y,[],_,[],_,"n",_)->(true);(false)),!.
traverse(_X,_Y,Explored,Explored,Inventory,Inventory,E,E) :-
 (E="e"->!;fail),!.
traverse(X,Y,Explored1,Explored2,Inventory1,Inventory2,E1,E2):-rainforest(Map),member2(Map,[X,Y,Cell]),((equals4(Cell,["*"])->(true);(member2(Explored1,[X,Y])))->((equals4(Explored1,Explored2),equals4(Inventory1,Inventory2),E2=E1));((writeln([X,Y]),(equals4(Cell,[])->(equals4(Inventory4a,Inventory1));((equals4(Cell,[Item]),append(Inventory1,[Item],Inventory3),apply_all_to_all(Inventory3,Inventory4),equals4(Inventory4a,Inventory4)))),writeln(Inventory4a),(member2(Inventory4a,"e")->((writeln("Game Over"),equals4(Explored1,Explored2),equals4(Inventory2,Inventory4a),E2="e"));((append(Explored1,[[X,Y]],Explored3),-(X,1,Xm1),-(Y,1,Ym1),+(X,1,Xp1),+(Y,1,Yp1),traverse(Xm1,Y,Explored3,Explored4,Inventory4a,Inventory5,E1,E3),traverse(X,Ym1,Explored4,Explored5,Inventory5,Inventory6,E3,E4),traverse(Xp1,Y,Explored5,Explored6,Inventory6,Inventory7,E4,E5),traverse(X,Yp1,Explored6,Explored2,Inventory7,Inventory2,E5,E2))))))).
apply_all_to_all(Inventory1,Inventory2):-findall(Item3,(member2(Inventory1,Item1),member2(Inventory1,Item2),not((equals4(Item1,Item2))),apply(Item1,Item2,Item3),not((member2(Inventory1,Item3)))),Addeditems),(equals4(Addeditems,[])->(equals4(Inventory1,Inventory2));((append(Inventory1,Addeditems,Inventory3),apply_all_to_all(Inventory3,Inventory2)))).
apply("k","c","m").
apply("m","vine","e").

member2(A,B):-member(B,A).
equals4(A,B):-A=B.
+(A,B,C):-C is A+B.
-(A,B,C):-C is A-B.