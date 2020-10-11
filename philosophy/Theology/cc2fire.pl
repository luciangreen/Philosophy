fire_lab(
 [
 [0,0,0,[*]],[0,1,0,[*]],[0,2,0,[*]],[0,3,0,[*]],[0,4,0,[*]],
 [0,0,1,[*]],[0,1,1,[*]],[0,2,1,[*]],[0,3,1,[*]],[0,4,1,[*]],
 [0,0,2,[*]],[0,1,2,[*]],[0,2,2,[*]],[0,3,2,[*]],[0,4,2,[*]],

 [1,0,0,[*]],[1,1,0,[*]],[1,2,0,[*]],[1,3,0,[*]],[1,4,0,[*]],
 [1,0,1,[*]],[1,1,1,[oh]],[1,2,1,[fm]],[1,3,1,[ofh]],[1,4,1,[*]],
 [1,0,2,[*]],[1,1,2,[*]],[1,2,2,[*]],[1,3,2,[*]],[1,4,2,[*]],
 
 [2,0,0,[*]],[2,1,0,[*]],[2,2,0,[*]],[2,3,0,[*]],[2,4,0,[*]],
 [2,0,1,[*]],[2,1,1,[*]],[2,2,1,[*]],[2,3,1,[*]],[2,4,1,[*]],
 [2,0,2,[*]],[2,1,2,[*]],[2,2,2,[*]],[2,3,2,[*]],[2,4,2,[*]]


 ]
).

%% 1,1,1 start

/**

[debug]  ?- traverse(1,1,1).
[1,1,1][oh]
[1,2,1][oh,fm,f]
[1,3,1][oh,fm,f,ofh,fcre]
Game Over
% Execution Aborted


**/

traverse(Z,X,Y) :-
	traverse(Z,X,Y,[],_,[],_).
traverse(Z,X,Y,Explored,Explored,Inventory,Inventory) :-
	fire_lab(Map),
	member([Z,X,Y,Cell],Map),
	Cell=[*],!.
traverse(Z,X,Y,Explored,Explored,Inventory,Inventory) :-
	member([Z,X,Y],Explored),!.
traverse(Z,X,Y,Explored1,Explored2,Inventory1,Inventory2) :-
	fire_lab(Map),
	member([Z,X,Y,Cell],Map),
	write([Z,X,Y]),
	(Cell=[]->Inventory4a=Inventory1;
		(Cell=[Item],append(Inventory1,[Item],Inventory3),
		apply_all_to_all(Inventory3,Inventory4),Inventory4a=Inventory4)),
	writeln(Inventory4a),
	(member(fcre,Inventory4a)->(writeln("Game Over"),abort);true),
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
	apply(Item1,Item2,Item3),
	not(member(Item3,Inventory1))),
	AddedItems),
	(AddedItems=[]->Inventory1=Inventory2;
	(append(Inventory1,AddedItems,Inventory3),
	apply_all_to_all(Inventory3,Inventory2))).

apply(oh,fm,f).
apply(ofh,f,fcre).

%% oh enough oxygen and exposure to a source of heat or temperature above the flash point to fm flammable material -> f fire
%% ofh sufficient oxygen, fuel and heat to f fire -> fcre - fire chain reaction and exit

%% See https://energyeducation.ca/encyclopedia/Chemical_chain_reaction#:~:text=A%20fire%20is%20an%20example,minimal%20or%20no%20outside%20influence.
