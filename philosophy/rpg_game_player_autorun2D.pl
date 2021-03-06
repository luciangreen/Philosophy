%% 1 start
%% key to chest->machete
%% machete to vine->exit

/**

?- rpg_game_player_autorun2D.
This algorithm automatically tests 2D maps.
Enter filename (to be loaded from saved_games2d/-):
|: e
Enter X co-ordinate of starting position:
|: 2
Enter Y co-ordinate of starting position:
|: 2
Enter apply a to b giving c, in the form [[a1,b1,c1],[a2,b2,c2]]:
|: [[a,b,e]]
[2,2][]
[3,2][]
[4,2][]
[5,2][]
[6,2][]
[6,3][]
[6,4][]
[4,3][]
[4,4][]
[3,4][]
[2,4][]
[4,5][]
[4,6][]
[3,6][]
[2,6][]
[5,6][b]
[6,6][b,a,e]
Game Over
% Execution Aborted

**/

:-include('../../listprologinterpreter/la_strings.pl').
:-include('../../listprologinterpreter/la_strings_string.pl').
:-include('strings_to_grid.pl').

rpg_game_player_autorun2D :-
	writeln("This algorithm automatically tests 2D maps."),

	writeln("Enter filename (to be loaded from saved_games2d/*):"),
	read_string(user_input, "\n", "\r", _End3, First_item),

	string_concat("saved_games2d/",First_item,Game_path),
	phrase_from_file_s(string(String00a),Game_path),
		string_codes(String02b,String00a),
		atom_to_term(String02b,Map4,[]),
	retractall(map(_)),
	assertz(map(Map4)),

	get_map_dimensions2d(Map4),	

	writeln("Enter X co-ordinate of starting position:"),
	read_string(user_input, "\n", "\r", _End1, X1),
	number_string(X,X1),

	writeln("Enter Y co-ordinate of starting position:"),
	read_string(user_input, "\n", "\r", _End2, Y1),
	number_string(Y,Y1),

	writeln("Enter apply a to b giving c, in the form [[a1,b1,c1],[a2,b2,c2]]:"),
	read_string(user_input, "\n", "\r", _End5, Applys),
	atom_to_term(Applys,Applys_atom,[]),
	retractall(apply1(_)),
	findall(_,(member(Apply_atom,Applys_atom),
	assertz(apply1(Apply_atom))),_),

	retractall(path(_)),
	%assertz(path([]))),_),

	traverse(X,Y),
	
	!.

traverse(X,Y) :-
	traverse(X,Y,[],_,[],_).
traverse(X,Y,Explored,Explored,Inventory,Inventory) :-
	map(Map),
	member([X,Y,Cell],Map),
	Cell=[*],!.
traverse(X,Y,Explored,Explored,Inventory,Inventory) :-
	member([X,Y],Explored),!.
traverse(X,Y,Explored1,Explored2,Inventory1,Inventory2) :-
	map(Map),
	member([X,Y,Cell],Map),
	write([X,Y]),
	assertz(path([X,Y])),
	(Cell=[]->Inventory4a=Inventory1;
		(Cell=[Item],append(Inventory1,[Item],Inventory3),
		apply_all_to_all(Inventory3,Inventory4),Inventory4a=Inventory4)),
	writeln(Inventory4a),
	(member(e,Inventory4a)->(writeln("Game Over"),map_dimensions([X2,Y2]),print_map_path(Map,X2,Y2,X,Y));true),
	append(Explored1,[[X,Y]],Explored3),
	Xm1 is X-1,
	Ym1 is Y-1,
	Xp1 is X+1,
	Yp1 is Y+1,
	traverse(Xm1,Y,Explored3,Explored4,Inventory4a,Inventory5),
	traverse(X,Ym1,Explored4,Explored5,Inventory5,Inventory6),
	traverse(Xp1,Y,Explored5,Explored6,Inventory6,Inventory7),
	traverse(X,Yp1,Explored6,Explored2,Inventory7,Inventory2).

apply_all_to_all(Inventory1,Inventory2) :-
	findall(Item3,(member(Item1,Inventory1),
	member(Item2,Inventory1),not(Item1=Item2),
	apply1([Item1,Item2,Item3]),
	not(member(Item3,Inventory1))),
	AddedItems),
	(AddedItems=[]->Inventory1=Inventory2;
	(append(Inventory1,AddedItems,Inventory3),
	apply_all_to_all(Inventory3,Inventory2))).

apply(k,c,m).
apply(m,v,e).