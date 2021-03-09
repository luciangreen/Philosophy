% ["Mind Reading","mind reading camera 5.txt",0,algorithms,"78. I mind filmed the positive functional way to prevent headaches, being happy and earning money."]

% I mind filmed the setting, saving notes.

%% vetusia user interface

:-include('Theology/theology3.7.1.3_vetusia3d.pl').
:-include('../../listprologinterpreter/la_strings.pl').
:-include('../../listprologinterpreter/la_strings_string.pl').

vetusia :-
	rainforest(Map),
	traverse(5,14,16,[],_,[],_,Map,_),!.
	

	
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
	
	(member("e",Inventory1)->(writeln("Game Over"),true);true),
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
	writeln(["Go",Directions6,"or take",Cell,"or drop",Inventory1,"write, edit or delete a note, or load or save a game."]),
	read_string(user_input, "\n", "\r", _End,Input1),downcase_atom(Input1,Input1a),atom_string(Input1a,Input1b),%%trace,
	split_string(Input1b, ", ", ", ", Input2),
	(((Input2=["go","n"]->true;Input2=["n"]),(member("n",Directions6)->traverse(Z,X,Yp1,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2);(writeln(["You can't go n"]),traverse(Z,X,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2))))->true;
	((Input2=["go","e"]->true;Input2=["e"]),(member("e",Directions6)->traverse(Z,Xp1,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2);(writeln(["You can't go e"]),traverse(Z,X,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2))))->true;
	((Input2=["go","s"]->true;Input2=["s"]),(member("s",Directions6)->traverse(Z,X,Ym1,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2);(writeln(["You can't go s"]),traverse(Z,X,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2))))->true;

((Input2=["go","w"]->true;Input2=["w"]),(member("w",Directions6)->traverse(Z,Xm1,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2);(writeln(["You can't go w"]),traverse(Z,X,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2))))->true;

((Input2=["go","u"]->true;Input2=["u"]),(member("u",Directions6)->traverse(Zp1,X,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2);(writeln(["You can't go u"]),traverse(Z,X,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2))))->true;

((Input2=["go","d"]->true;Input2=["d"]),(member("d",Directions6)->traverse(Zm1,X,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2);(writeln(["You can't go d"]),traverse(Z,X,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2))))->true;

(Input2=["take",Item_to_take],((atom_string(Item_to_take_a,Item_to_take),(member(Item_to_take_a,Cell)->delete(Cell,Item_to_take_a,Cell2);(member(Item_to_take,Cell),delete(Cell,Item_to_take,Cell2))),delete(Map1,[Z,X,Y,_],Map3),append(Map3,[[Z,X,Y,Cell2]],Map4),append(Inventory1,[Item_to_take],Inventory3))->(writeln(["You have taken",Item_to_take]),traverse(Z,X,Y,Explored3,Explored2,Inventory3,Inventory2,Map4,Map2));(writeln(["You can't take",Item_to_take]),traverse(Z,X,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2))))->true;

(Input2=["drop",Item_to_drop],((%%atom_string(Item_to_drop_a,Item_to_drop),
member(Item_to_drop,Inventory1),delete(Inventory1,Item_to_drop,Inventory3),append(Cell,[Item_to_drop],Cell2),delete(Map1,[Z,X,Y,_],Map3),append(Map3,[[Z,X,Y,Cell2]],Map4))->(writeln(["You have dropped",Item_to_drop]),traverse(Z,X,Y,Explored3,Explored2,Inventory3,Inventory2,Map4,Map2));(writeln(["You can't drop",Item_to_drop]),traverse(Z,X,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2))))->true;

%(Input2=["apply",First_item,"to",Second_item],((member(First_item,Inventory1),member(Second_item,Inventory1),atom_string(First_item_a,First_item),atom_string(Second_item_a,Second_item),apply(First_item_a,Second_item_a,Third_item_a),atom_string(Third_item_a,Third_item),append(Cell,[Third_item],Cell2),delete(Map1,[Z,X,Y,_],Map3),append(Map3,[[Z,X,Y,Cell2]],Map4))->(writeln(["You have applied",First_item,"to",Second_item,"producing",Third_item]),traverse(Z,X,Y,Explored3,Explored2,Inventory1,Inventory2,Map4,Map2));(writeln(["You can't apply",First_item,"to",Second_item]),traverse(Z,X,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2))))->true;

(Input2=["write",First_item],((%member(First_item,Inventory1),member(Second_item,Inventory1),
%atom_string(First_item_a,First_item),%atom_string(Second_item_a,Second_item),apply(First_item_a,Second_item_a,Third_item_a),atom_string(Third_item_a,Third_item),
%(writeln(["Please write the note",First_item]),
%read_string(user_input, "\n", "\r", _End2, Note),
append(Cell,[First_item],Cell2),delete(Map1,[Z,X,Y,_],Map3),append(Map3,[[Z,X,Y,Cell2]],Map4))->(writeln(["You have written",First_item]),traverse(Z,X,Y,Explored3,Explored2,Inventory1,Inventory2,Map4,Map2));(writeln(["Error 1."]),traverse(Z,X,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2))))->true;

(Input2=["edit",First_item],((%member(First_item,Inventory1),member(Second_item,Inventory1),
%atom_string(First_item_a,First_item),%atom_string(Second_item_a,Second_item),apply(First_item_a,Second_item_a,Third_item_a),atom_string(Third_item_a,Third_item),
member(First_item,Cell),
writeln(["Please edit the note",First_item]),
read_string(user_input, "\n", "\r", _End2, Note),
%trace,
delete(Cell,First_item,Cell2a),append(Cell2a,[Note],Cell2),delete(Map1,[Z,X,Y,_],Map3),append(Map3,[[Z,X,Y,Cell2]],Map4))->(writeln(["You have edited",First_item]),traverse(Z,X,Y,Explored3,Explored2,Inventory1,Inventory2,Map4,Map2));(writeln(["You can't edit",First_item]),traverse(Z,X,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2))))->true;

(Input2=["delete",First_item],((%member(First_item,Inventory1),member(Second_item,Inventory1),
%atom_string(First_item_a,First_item),%atom_string(Second_item_a,Second_item),apply(First_item_a,Second_item_a,Third_item_a),atom_string(Third_item_a,Third_item),
%(writeln(["Please edit the note",First_item]),
%read_string(user_input, "\n", "\r", _End2, Note),
%append(Cell,[Note],Cell2),
delete(Cell,First_item,Cell2),
delete(Map1,[Z,X,Y,_],Map3),append(Map3,[[Z,X,Y,Cell2]],Map4))->(writeln(["You have deleted",First_item]),traverse(Z,X,Y,Explored3,Explored2,Inventory1,Inventory2,Map4,Map2));(writeln(["Error 3."]),traverse(Z,X,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2))))->true;

(Input2=["load",First_item],((%member(First_item,Inventory1),member(Second_item,Inventory1),
%atom_string(First_item_a,First_item),%atom_string(Second_item_a,Second_item),apply(First_item_a,Second_item_a,Third_item_a),atom_string(Third_item_a,Third_item),
%(writeln(["Please edit the note",First_item]),
%read_string(user_input, "\n", "\r", _End2, Note),
%append(Cell,[Note],Cell2),

string_concat("saved_games/",First_item,Game_path),
phrase_from_file_s(string(String00a),Game_path),
		string_codes(String02b,String00a),
		atom_to_term(String02b,Map4,[])

%delete(Cell,First_item,Cell2),
%delete(Map1,[Z,X,Y,_],Map3),append(Map3,[[Z,X,Y,Cell2]],Map4)
)->(writeln(["You have loaded",First_item]),traverse(Z,X,Y,Explored3,Explored2,Inventory1,Inventory2,Map4,Map2));(writeln(["Error 4."]),traverse(Z,X,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2))))->true;

(Input2=["save",First_item],((%member(First_item,Inventory1),member(Second_item,Inventory1),
%atom_string(First_item_a,First_item),%atom_string(Second_item_a,Second_item),apply(First_item_a,Second_item_a,Third_item_a),atom_string(Third_item_a,Third_item),
%(writeln(["Please edit the note",First_item]),
%read_string(user_input, "\n", "\r", _End2, Note),
%append(Cell,[Note],Cell2),

string_concat("saved_games/",First_item,Game_path),

	term_to_atom(Map1,String02a_b),
	string_atom(String02a_c,String02a_b),

	(open_s(Game_path,write,Stream1),
	write(Stream1,String02a_c),
	close(Stream1)),!

%delete(Cell,First_item,Cell2),
%delete(Map1,[Z,X,Y,_],Map3),append(Map3,[[Z,X,Y,Cell2]],Map4)
)->(writeln(["You have saved",First_item]),traverse(Z,X,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2));(writeln(["Error 5."]),traverse(Z,X,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2))))->true;

(writeln(["I don't understand."]),traverse(Z,X,Y,Explored3,Explored2,Inventory1,Inventory2,Map1,Map2))).

check(Z,X,Y,Direction,Directions1,Directions2,Map) :-
	member([Z,X,Y,Cell],Map),
	(Cell=[*]->Directions2=Directions1;
	append(Directions1,[Direction],Directions2)),!.

%% specific locs
location(5,14,16,"Highway") :- !.
location(5,13,18,"Cave") :- !.
location(5,12,18,"Gate") :- !.
location(5,11,18,"Wall") :- !.
location(5,11,12,"Temple") :- !.
location(5,13,14,"Stream") :- !.
location(Z,_X,_Y,"Underground Pyramid") :-
	Z=<4,!.
location(Z,_X,Y,"Rainforest Floor") :-
	Z=5,Y>=11,!.
location(Z,_X,Y,"Underwater Maze") :-
	(Z=5->true;Z=6),Y<11,!.
location(Z,_X,Y,"Underwater Maze") :-
	(Z=5->true;Z=6),Y<11,!.
location(Z,X,Y,"Underwater Maze") :-
	(Z=7->true;Z=8),X=<13,Y=<9,!.
location(7,_X,_Y,"Rainforest Canopy") :- !.
location(8,_X,_Y,"Rainforest Canopy") :- !.
%%	(Z=7->true;Z=8),X>13,Y>9,!.
location(6,_X,_Y,"Rainforest Canopy") :- !.
location(9,_X,_Y,"Rainforest Canopy") :- !.
location(_,_,_,"Unknown") :- !.


