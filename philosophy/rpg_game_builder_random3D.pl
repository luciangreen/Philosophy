% rpg_game_builder_random3D.pl

:-include('build_maze3d.pl').
:-include('../../listprologinterpreter/la_strings.pl').

rpg_game_builder_random3D :-
	writeln("Enter X dimension of maze:"),
	read_string(user_input, "\n", "\r", _End1, X1),
	number_string(X,X1),
	
	writeln("Enter Y dimension of maze:"),
	read_string(user_input, "\n", "\r", _End2, Y1),
	number_string(Y,Y1),
	
	writeln("Enter Z dimension of maze:"),
	read_string(user_input, "\n", "\r", _End2, Z1),
	number_string(Z,Z1),
	
	build_maze3d(X,Y,Z,Grid),
	
	nl,
	writeln("Enter filename (to be saved in saved_games/):"),
	read_string(user_input, "\n", "\r", _End1, First_item),

	string_concat("saved_games/",First_item,Game_path),

	term_to_atom(Grid,String02a_b),
	string_atom(String02a_c,String02a_b),

	(open_s(Game_path,write,Stream1),
	write(Stream1,String02a_c),
	close(Stream1)),!.

