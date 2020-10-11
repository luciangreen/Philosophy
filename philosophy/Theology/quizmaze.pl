maze(
 [
 [0,0,0,[*]],[0,1,0,[*]],[0,2,0,[*]],[0,3,0,[*]],[0,4,0,[*]],
 [0,0,1,[*]],[0,1,1,[*]],[0,2,1,[*]],[0,3,1,[*]],[0,4,1,[*]],
 [0,0,2,[*]],[0,1,2,[*]],[0,2,2,[*]],[0,3,2,[*]],[0,4,2,[*]],

 [1,0,0,[*]],[1,1,0,[*]],[1,2,0,[*]],[1,3,0,[*]],[1,4,0,[*]],
 [1,0,1,[*]],[1,1,1,["t"]],[1,2,1,["f"]],            [1,4,1,[*]],
 [1,0,2,[*]],[1,1,2,[*]],[1,2,2,[*]],[1,3,2,[*]],[1,4,2,[*]],
 
 [2,0,0,[*]],[2,1,0,[*]],[2,2,0,[*]],[2,3,0,[*]],[2,4,0,[*]],
 [2,0,1,[*]],[2,1,1,[*]],[2,2,1,[*]],[2,3,1,[*]],[2,4,1,[*]],
 [2,0,2,[*]],[2,1,2,[*]],[2,2,2,[*]],[2,3,2,[*]],[2,4,2,[*]]


 ]
).

%% 1,1,1 start

/**

[debug]  ?- make_maze,traverse(1,1,1).
[1,1,1][oh]
[1,2,1][oh,fm,f]
[1,3,1][oh,fm,f,ofh,fcre]
Game Over
% Execution Aborted


**/

make_maze :-
	maze(Maze1),
	quiz(Quiz),
	random_member([A,Q],Quiz),
	append(Maze1,[[1,3,1,[Q]]],Maze2),
	retractall(maze2(_)),
	assertz(maze2(Maze2)),
	Apply=[[A,Q,"e"]],
	retractall(apply(_)),
	assertz(apply(Apply)).
	
traverse(Z,X,Y) :-
	traverse(Z,X,Y,[],_,[],_).
traverse(Z,X,Y,Explored,Explored,Inventory,Inventory) :-
	maze2(Map),
	member([Z,X,Y,Cell],Map),
	Cell=[*],!.
traverse(Z,X,Y,Explored,Explored,Inventory,Inventory) :-
	member([Z,X,Y],Explored),!.
traverse(Z,X,Y,Explored1,Explored2,Inventory1,Inventory2) :-
	maze2(Map),
	member([Z,X,Y,Cell],Map),
	write([Z,X,Y]),
	(Cell=[]->Inventory4a=Inventory1;
		(Cell=[Item],append(Inventory1,[Item],Inventory3),
		apply_all_to_all(Inventory3,Inventory4),Inventory4a=Inventory4)),
	writeln(Inventory4a),
	(member("e",Inventory4a)->(writeln("Game Over"),abort);true),
	append(Explored1,[[Z,X,Y]],Explored3),
	Xm1 is X-1,
	Ym1 is Y-1,
	Xp1 is X+1,
	Yp1 is Y+1,
	Zm1 is Z-1,
	Zp1 is Z+1,
	traverse(Z,Xm1,Y,Explored3,Explored4,Inventory4a,Inventory5),
	traverse(Z,X,Ym1,Explored4,Explored5,Inventory5,Inventory6),
	traverse(Z,Xp1,Y,Explored5,Explored6,Inventory6,Inventory7),
	traverse(Z,X,Yp1,Explored6,Explored7,Inventory7,Inventory8),
	traverse(Zm1,X,Y,Explored7,Explored8,Inventory8,Inventory9),
	traverse(Zp1,X,Y,Explored8,Explored2,Inventory9,Inventory2).

apply_all_to_all(Inventory1,Inventory2) :-
	findall(Item3,(member(Item1,Inventory1),
	member(Item2,Inventory1),not(Item1=Item2),
	apply(Apply),
	member([Item1,Item2,Item3],Apply),
	not(member(Item3,Inventory1))),
	AddedItems),
	(AddedItems=[]->Inventory1=Inventory2;
	(append(Inventory1,AddedItems,Inventory3),
	apply_all_to_all(Inventory3,Inventory2))).

%% oh enough oxygen and exposure to a source of heat or temperature above the flash point to fm flammable material -> f fire
%% ofh sufficient oxygen, fuel and heat to f fire -> fcre - fire chain reaction and exit

quiz(
[
["t","Leaves absorb Carbon Dioxide."],
["f","Plants absorb oxygen"],
["f","25% of the human body is water"],
["t","Not all fishes drink water."],
["f","The largest fish is 5 metres long."],
["t","Normal body temp. is 95.6 degrees F."],
["f","Normal body temp. is 36.7 degrees F."],
["f","Human blood has 90 000 red blood cells."],
["t","A human heart beats 100 000 times daily."]
]).