%% port_fairy user interface

port_fairy(
[
[1,9,[*    ]],[2,9,[*    ]],[3,9,[*    ]],[4,9,[*    ]],[5,9,[*    ]],[6,9,[*    ]],[7,9,[*    ]],[8,9,[*    ]],[9,9,[*    ]],[10,9,[*    ]],[11,9,[*    ]],[12,9,[*    ]],[13,9,[*    ]],[14,9,[*    ]],[15,9,[*    ]],[16,9,[*    ]],[17,9,[*    ]], [1,8,[*    ]],[2,8,[     ]],[3,8,[     ]],[4,8,[     ]],[5,8,[     ]],[6,8,[     ]],[7,8,[     ]],[8,8,[     ]],[9,8,[     ]],[10,8,[     ]],[11,8,[     ]],[12,8,[     ]],[13,8,[     ]],[14,8,[     ]],[15,8,[     ]],[16,8,[beachball    ]],[17,8,[*    ]],  [1,7,[*    ]],[2,7,[     ]],[3,7,[*    ]],[4,7,[     ]],[5,7,[*    ]],[6,7,[     ]],[7,7,[*    ]],[8,7,[     ]],[9,7,[*    ]],[10,7,[     ]],[11,7,[*    ]],[12,7,[     ]],[13,7,[*    ]],[14,7,[     ]],[15,7,[*    ]],[16,7,[     ]],[17,7,[*    ]], [1,6,[*    ]],[2,6,[     ]],[3,6,[     ]],[4,6,[     ]],[5,6,[     ]],[6,6,[     ]],[7,6,[     ]],[8,6,[     ]],[9,6,[     ]],[10,6,[     ]],[11,6,[     ]],[12,6,[     ]],[13,6,[     ]],[14,6,[     ]],[15,6,[     ]],[16,6,[     ]],[17,6,[*    ]],  [1,5,[*    ]],[2,5,[     ]],[3,5,[*    ]],[4,5,[     ]],[5,5,[*    ]],[6,5,[     ]],[7,5,[*    ]],[8,5,[     ]],[9,5,[*    ]],[10,5,[icecream     ]],[11,5,[*    ]],[12,5,[     ]],[13,5,[*    ]],[14,5,[     ]],[15,5,[*    ]],[16,5,[     ]],[17,5,[*    ]], [1,4,[*    ]],[2,4,[     ]],[3,4,[     ]],[4,4,[     ]],[5,4,[     ]],[6,4,[     ]],[7,4,[     ]],[8,4,[     ]],[9,4,[     ]],[10,4,[     ]],[11,4,[     ]],[12,4,[     ]],[13,4,[     ]],[14,4,[     ]],[15,4,[     ]],[16,4,[     ]],[17,4,[*    ]], [1,3,[*    ]],[2,3,[     ]],[3,3,[*    ]],[4,3,[     ]],[5,3,[*    ]],[6,3,[     ]],[7,3,[*    ]],[8,3,[     ]],[9,3,[*    ]],[10,3,[     ]],[11,3,[*    ]],[12,3,[     ]],[13,3,[*    ]],[14,3,[     ]],[15,3,[*    ]],[16,3,[     ]],[17,3,[*    ]], [1,2,[*    ]],[2,2,[     ]],[3,2,[     ]],[4,2,[     ]],[5,2,[     ]],[6,2,[     ]],[7,2,[     ]],[8,2,[     ]],[9,2,[     ]],[10,2,[     ]],[11,2,[     ]],[12,2,[     ]],[13,2,[     ]],[14,2,[pinecone    ]],[15,2,[     ]],[16,2,[lighthouse     ]],[17,2,[*    ]], [1,1,[*    ]],[2,1,[*    ]],[3,1,[*    ]],[4,1,[*    ]],[5,1,[*    ]],[6,1,[*    ]],[7,1,[*    ]],[8,1,[*    ]],[9,1,[*    ]],[10,1,[*    ]],[11,1,[*    ]],[12,1,[*    ]],[13,1,[*    ]],[14,1,[*    ]],[15,1,[*    ]],[16,1,[*    ]],[17,1,[*    ]]]).

%:-include('theology3.7.1.3_vetusia3d.pl').
%:-include('../strings_to_grid.pl').

port_fairy :-
	port_fairy(Map),
	%get_map_dimensions(Map),
	traverse(8,3,[],_,[],_,Map,_),!.
	

	
traverse(X,Y,Explored1,Explored2,Inventory1,Inventory2,Map1,Map2) :-
	member([X,Y,Cell],Map1),
	append(Explored1,[[X,Y]],Explored3a),sort(Explored3a,Explored3),
	location(X,Y,Location),
	writeln(["At",Location]),
	%%trace,
	%% can take, drop objects, recorded in maze
	%%(Cell=[]->Inventory4a=Inventory1;
	%%	(Cell=Items,append(Inventory1,[Item],Inventory3),
	%%	apply_all_to_all(Inventory3,Inventory4),Inventory4a=Inventory4)),
	%%writeln(Inventory4a),
	
	%% Find, accept only available directions
	
	(member("e",Inventory1)->(writeln("Game Over"),true);true),
	%%append(Explored1,[[X,Y]],Explored3),
	Xm1 is X-1,
	Ym1 is Y-1,
	Xp1 is X+1,
	Yp1 is Y+1,
	%Zm1 is Z-1,
	%Zp1 is Z+1,
	check(Xm1,Y,"w",[],Directions1,Map1),
	check(X,Ym1,"s",Directions1,Directions2,Map1),
	check(Xp1,Y,"e",Directions2,Directions3,Map1),
	check(X,Yp1,"n",Directions3,Directions6,Map1),
	%check(Zm1,X,Y,"d",Directions4,Directions5,Map1),
	%check(Zp1,X,Y,"u",Directions5,Directions6,Map1),
	writeln(["Go",Directions6,"or take",Cell,"or drop",Inventory1,"map, or apply an object to an object"]),
	read_string(user_input, "\n", "\r", _End,Input1),downcase_atom(Input1,Input1a),atom_string(Input1a,Input1b),%%trace,
	split_string(Input1b, ", ", ", ", Input2),
	(((Input2=["go","n"]->true;Input2=["n"]),(member("n",Directions6)->traverse(X,Yp1,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2);(writeln(["You can't go n"]),traverse(X,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2))))->true;
		
		/**
		((Input2=["map"]->true;Input2=["m"]),((
	%trace,
	map_dimensions([X2,Y2,Z2]),print_map(Map1,X2,Y2,Z2,X,Y,Z))->true;
;(writeln(["You can't view the map."]))),traverse(X,Y,Explored1,Explored2,Inventory1,Inventory2,Map1,Map2))->true;
**/

((Input2=["go","e"]->true;Input2=["e"]),(member("e",Directions6)->traverse(Xp1,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2);(writeln(["You can't go e"]),traverse(X,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2))))->true;
	((Input2=["go","s"]->true;Input2=["s"]),(member("s",Directions6)->traverse(X,Ym1,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2);(writeln(["You can't go s"]),traverse(X,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2))))->true;

((Input2=["go","w"]->true;Input2=["w"]),(member("w",Directions6)->traverse(Xm1,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2);(writeln(["You can't go w"]),traverse(X,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2))))->true;

((Input2=["go","u"]->true;Input2=["u"]),(member("u",Directions6)->traverse(X,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2);(writeln(["You can't go u"]),traverse(X,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2))))->true;

((Input2=["go","d"]->true;Input2=["d"]),(member("d",Directions6)->traverse(X,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2);(writeln(["You can't go d"]),traverse(X,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2))))->true;

(Input2=["take",Item_to_take],((atom_string(Item_to_take_a,Item_to_take),(member(Item_to_take_a,Cell)->delete(Cell,Item_to_take_a,Cell2);(member(Item_to_take,Cell),delete(Cell,Item_to_take,Cell2))),delete(Map1,[X,Y,_],Map3),append(Map3,[[X,Y,Cell2]],Map4),append(Inventory1,[Item_to_take],Inventory3))->(writeln(["You have taken",Item_to_take]),traverse(X,Y,Explored3,Explored2,Inventory3,Inventory2,Map4,Map2));(writeln(["You can't take",Item_to_take]),traverse(X,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2))))->true;

(Input2=["drop",Item_to_drop],((%%atom_string(Item_to_drop_a,Item_to_drop),
member(Item_to_drop,Inventory1),delete(Inventory1,Item_to_drop,Inventory3),append(Cell,[Item_to_drop],Cell2),delete(Map1,[X,Y,_],Map3),append(Map3,[[X,Y,Cell2]],Map4))->(writeln(["You have dropped",Item_to_drop]),traverse(X,Y,Explored3,Explored2,Inventory3,Inventory2,Map4,Map2));(writeln(["You can't drop",Item_to_drop]),traverse(X,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2))))->true;

(Input2=["apply",First_item,"to",Second_item],((member(First_item,Inventory1),member(Second_item,Inventory1),atom_string(First_item_a,First_item),atom_string(Second_item_a,Second_item),apply(First_item_a,Second_item_a,Third_item_a),atom_string(Third_item_a,Third_item),append(Cell,[Third_item],Cell2),delete(Map1,[X,Y,_],Map3),append(Map3,[[X,Y,Cell2]],Map4))->(writeln(["You have applied",First_item,"to",Second_item,"producing",Third_item]),traverse(X,Y,Explored3,Explored2,Inventory1,Inventory2,Map4,Map2));(writeln(["You can't apply",First_item,"to",Second_item]),traverse(X,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2))))->true;

(writeln(["I don't understand."]),traverse(X,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2))).

check(X,Y,Direction,Directions1,Directions2,Map) :-
	member([X,Y,Cell],Map),
	(Cell=[*]->Directions2=Directions1;
	append(Directions1,[Direction],Directions2)),!.

%% specific locs

location(8,3,"Cottage") :- !.
location(10,5,"Ice Cream Shop") :- !.
location(16,2,"Lighthouse") :- !.
location(16,8,"Eastern Beach") :- !.
location(14,2,"Southern Beach") :- !.

/**
location(5,14,16,"Highway") :- !.
location(5,13,18,"Cave") :- !.
location(5,12,18,"Gate") :- !.
location(5,11,18,"Wall") :- !.
location(5,11,12,"Temple") :- !.
location(5,13,14,"Stream") :- !.
location(_X,_Y,"Underground Pyramid") :-
	Z=<4,!.
location(_X,Y,"Rainforest Floor") :-
	Z=5,Y>=11,!.
location(_X,Y,"Underwater Maze") :-
	(Z=5->true;Z=6),Y<11,!.
location(_X,Y,"Underwater Maze") :-
	(Z=5->true;Z=6),Y<11,!.
location(X,Y,"Underwater Maze") :-
	(Z=7->true;Z=8),X=<13,Y=<9,!.
location(7,_X,_Y,"Rainforest Canopy") :- !.
location(8,_X,_Y,"Rainforest Canopy") :- !.
%%	(Z=7->true;Z=8),X>13,Y>9,!.
location(6,_X,_Y,"Rainforest Canopy") :- !.
location(9,_X,_Y,"Rainforest Canopy") :- !.
**/
location(_,_,"Port Fairy") :- !.

apply(pinecone,beachball,box1).
apply(box1,lighthouse,box2).
apply(box2,icecream,e).

