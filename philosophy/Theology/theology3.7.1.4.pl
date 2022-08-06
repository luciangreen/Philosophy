rainforest(
/*
[[1,9,["*"]],[2,9,["*"]],[3,9,["*"]],[4,9,["*"]],[5,9,["*"]],[6,9,["*"]],
[1,8,["*"]],[2,8,[]],[3,8,["m"]],[4,8,["vine"]],[5,8,[]],[6,8,["*"]],
[1,7,["*"]],[2,7,["*"]],[3,7,["*"]],[4,7,["*"]],[5,7,["*"]],[6,7,["*"]]]).
*/
 %/*
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

traverse(X,Y) :-
	traverse(X,Y,[],_,[],_),!.
traverse(X,Y,Explored,Explored,Inventory,Inventory) :-
	rainforest(Map),
	member([X,Y,Cell],Map),
	Cell=["*"],!.
traverse(X,Y,Explored,Explored,Inventory,Inventory) :-
	member([X,Y],Explored),!.
traverse(X,Y,Explored1,Explored2,Inventory1,Inventory2) :-
	rainforest(Map),
	member([X,Y,Cell],Map),
	write([X,Y]),
	(Cell=[]->Inventory4a=Inventory1;
		(Cell=[Item],append(Inventory1,[Item],Inventory3),
		apply_all_to_all(Inventory3,Inventory4),Inventory4a=Inventory4)),
	writeln(Inventory4a),
	(member("e",Inventory4a)->(writeln("Game Over")%,Inventory4a=Inventory2,Explored1=Explored2%
	,trace
	);(
	append(Explored1,[[X,Y]],Explored3),
	Xm1 is X-1,
	Ym1 is Y-1,
	Xp1 is X+1,
	Yp1 is Y+1,
	traverse(Xm1,Y,Explored3,Explored4,Inventory4a,Inventory5),
	traverse(X,Ym1,Explored4,Explored5,Inventory5,Inventory6),
	traverse(Xp1,Y,Explored5,Explored6,Inventory6,Inventory7),
	traverse(X,Yp1,Explored6,Explored2,Inventory7,Inventory2))).

apply_all_to_all(Inventory1,Inventory2) :-
	findall(Item3,(member(Item1,Inventory1),
	member(Item2,Inventory1),not(Item1=Item2),
	apply(Item1,Item2,Item3),
	not(member(Item3,Inventory1))),
	AddedItems),
	(AddedItems=[]->Inventory1=Inventory2;
	(append(Inventory1,AddedItems,Inventory3),
	apply_all_to_all(Inventory3,Inventory2))).

apply("k","c","m").
apply("m","vine","e").