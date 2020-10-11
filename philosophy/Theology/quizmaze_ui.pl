%% chemical_cascade_fire user interface

:-include('quizmaze.pl').

/**

?- quizmaze.
[At,Maze]
["go",["e"],"take",["t"],"drop",[],"or apply an object to an object."]
[Type e.g. ["<command>","<object>"]]
|:  ["take","t"]
[You have taken,t]
[At,Maze]
["go",["e"],"take",[],"drop",["t"],"or apply an object to an object."]
[Type e.g. ["<command>","<object>"]]
|: ["go","e"]
[At,Maze]
["go",["w","e"],"take",["f"],"drop",["t"],"or apply an object to an object."]
[Type e.g. ["<command>","<object>"]]
|: ["take","f"]
[You have taken,f]
[At,Maze]
["go",["w","e"],"take",[],"drop",["t","f"],"or apply an object to an object."]
[Type e.g. ["<command>","<object>"]]
|: ["go","e"]
[At,Maze]
["go",["w"],"take",["Leaves absorb Carbon Dioxide."],"drop",["t","f"],"or apply an object to an object."]
[Type e.g. ["<command>","<object>"]]
|: ["take","Leaves absorb Carbon Dioxide."]
[You have taken,Leaves absorb Carbon Dioxide.]
[At,Maze]
["go",["w"],"take",[],"drop",["t","f","Leaves absorb Carbon Dioxide."],"or apply an object to an object."]
[Type e.g. ["<command>","<object>"]]
|: ["apply","t","to","Leaves absorb Carbon Dioxide."]
[You have applied,t,to,Leaves absorb Carbon Dioxide.,producing,e]
[At,Maze]
["go",["w"],"take",["e"],"drop",["t","f","Leaves absorb Carbon Dioxide."],"or apply an object to an object."]
[Type e.g. ["<command>","<object>"]]
|: ["take","e"]
[You have taken,e]
[At,Maze]
Game Over
% Execution Aborted

**/

quizmaze :-
	make_maze,
	maze2(Map),
	traverse(1,1,1,[],_,[],_,Map,_).

traverse(Z,X,Y,Explored1,Explored2,Inventory1,Inventory2,Map1,Map2) :-
	member([Z,X,Y,Cell],Map1),
	append(Explored1,[[Z,X,Y]],Explored3a),sort(Explored3a,Explored3),
	location(Z,X,Y,Location),
	writeln(["At",Location]),
	%%trace,
	%% can take, drop objects, recorded in maze
	%%(Cell=[]->Inventory4a=Inventory1;
	%%	(Cell=Items,append(Inventory1,[Item],Inventory3),
	%%	apply_all_to_all(Inventory3,Inventory4),Inventory4a=Inventory4)),
	%%writeln(Inventory4a),
	
	%% Find, accept only available directions
	
	(member("e",Inventory1)->(writeln("Game Over"),abort);true),
	%%append(Explored1,[[Z,X,Y]],Explored3),
	Xm1 is X-1,
	Ym1 is Y-1,
	Xp1 is X+1,
	Yp1 is Y+1,
	Zm1 is Z-1,
	Zp1 is Z+1,
	check(Z,Xm1,Y,"w",[],Directions1,Map1),
	check(Z,X,Ym1,"s",Directions1,Directions2,Map1),
	check(Z,Xp1,Y,"e",Directions2,Directions3,Map1),
	check(Z,X,Yp1,"n",Directions3,Directions4,Map1),
	check(Zm1,X,Y,"d",Directions4,Directions5,Map1),
	check(Zp1,X,Y,"u",Directions5,Directions6,Map1),
	writeln1(["go",Directions6,"take",Cell,"drop",Inventory1,"or apply an object to an object."]),
	writeln(["Type e.g. [\"<command>\",\"<object>\"]"]),
	read_string(user_input, "\n", "\r", _End,Input1),
	term_to_atom(Input2,Input1),
	%%downcase_atom(Input1,Input1a),atom_string(Input1a,Input1b),%%trace,
	%%split_string(Input1b, ", ", ", ", Input2),
	(((Input2=["go","n"]->true;Input2=["n"]),(member("n",Directions6)->traverse(Z,X,Yp1,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2);(writeln(["You can't go n"]),traverse(Z,X,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2))))->true;
	((Input2=["go","e"]->true;Input2=["e"]),(member("e",Directions6)->traverse(Z,Xp1,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2);(writeln(["You can't go e"]),traverse(Z,X,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2))))->true;
	((Input2=["go","s"]->true;Input2=["s"]),(member("s",Directions6)->traverse(Z,X,Ym1,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2);(writeln(["You can't go s"]),traverse(Z,X,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2))))->true;

((Input2=["go","w"]->true;Input2=["w"]),(member("w",Directions6)->traverse(Z,Xm1,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2);(writeln(["You can't go w"]),traverse(Z,X,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2))))->true;

((Input2=["go","u"]->true;Input2=["u"]),(member("u",Directions6)->traverse(Zp1,X,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2);(writeln(["You can't go u"]),traverse(Z,X,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2))))->true;

((Input2=["go","d"]->true;Input2=["d"]),(member("d",Directions6)->traverse(Zm1,X,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2);(writeln(["You can't go d"]),traverse(Z,X,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2))))->true;

(Input2=["take",Item_to_take],((atom_string(Item_to_take_a,Item_to_take),(member(Item_to_take_a,Cell)->delete(Cell,Item_to_take_a,Cell2);(member(Item_to_take,Cell),delete(Cell,Item_to_take,Cell2))),delete(Map1,[Z,X,Y,_],Map3),append(Map3,[[Z,X,Y,Cell2]],Map4),append(Inventory1,[Item_to_take],Inventory3))->(writeln(["You have taken",Item_to_take]),traverse(Z,X,Y,Explored3,Explored2,Inventory3,Inventory2,Map4,Map2));(writeln(["You can't take",Item_to_take]),traverse(Z,X,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2))))->true;

(Input2=["drop",Item_to_drop],((%%atom_string(Item_to_drop_a,Item_to_drop),
member(Item_to_drop,Inventory1),delete(Inventory1,Item_to_drop,Inventory3),append(Cell,[Item_to_drop],Cell2),delete(Map1,[Z,X,Y,_],Map3),append(Map3,[[Z,X,Y,Cell2]],Map4))->(writeln(["You have dropped",Item_to_drop]),traverse(Z,X,Y,Explored3,Explored2,Inventory3,Inventory2,Map4,Map2));(writeln(["You can't drop",Item_to_drop]),traverse(Z,X,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2))))->true;

(Input2=["apply",First_item,"to",Second_item],
%%trace,
((member(First_item,Inventory1),member(Second_item,Inventory1),%%atom_string(First_item_a,First_item),atom_string(Second_item_a,Second_item),

	apply(Apply),
	member([First_item,Second_item,Third_item_a],Apply),

atom_string(Third_item_a,Third_item),append(Cell,[Third_item],Cell2),delete(Map1,[Z,X,Y,_],Map3),append(Map3,[[Z,X,Y,Cell2]],Map4))->(writeln(["You have applied",First_item,"to",Second_item,"producing",Third_item]),traverse(Z,X,Y,Explored3,Explored2,Inventory1,Inventory2,Map4,Map2));(writeln(["You can't apply",First_item,"to",Second_item]),traverse(Z,X,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2))))->true;

(writeln(["I don't understand."]),traverse(Z,X,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2))).

check(Z,X,Y,Direction,Directions1,Directions2,Map) :-
	member([Z,X,Y,Cell],Map),
	(Cell=[*]->Directions2=Directions1;
	append(Directions1,[Direction],Directions2)),!.

%% specific locs
location(_,_,_,"Maze") :- !.

writeln1(Term) :-
	term_to_atom(Term,Atom),
	writeln(Atom),!.

