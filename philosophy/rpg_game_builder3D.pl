% rpg_game_builder3D.pl

:-include('strings_to_grid.pl').
:-include('../../listprologinterpreter/la_strings.pl').
:-include('../../listprologinterpreter/la_strings_string.pl').

rpg_game_builder3D :-
	/**
	writeln("Enter filename in rpg_strings folder to convert to map:"),
	read_string(user_input, "\n", "\r", _End1, File_name)
	phrase_from_file_s(string(String00a), File_name),
	string_codes(String02b,String00a),
	atom_to_term(String02b,String02a,[]),
	String02a=[[strings,Strings],
		[apply,Apply],
		[objects,Objects],
		[notes,Notes]]
		
	writeln("Will you enter a 2D or 3D map:"),
	read_string(user_input, "\n", "\r", _End1, Dimensions),
	
	(Dimensions="2D"->

	**/

	writeln("Enter 3D map e.g. [[\"***\",\"***\"],[\"***\",\"***\"]] top-down:"),
	read_string(user_input, "\n", "\r", _End1, Strings1),
	term_to_atom(Term,Strings1),
	
	strings_to_grid3d(Term,Grid),
	
	nl,
	writeln("Enter filename (to be saved in saved_games/):"),
	read_string(user_input, "\n", "\r", _End2, First_item),

	string_concat("saved_games/",First_item,Game_path),

	term_to_atom(Grid,String02a_b),
	string_atom(String02a_c,String02a_b),

	(open_s(Game_path,write,Stream1),
	write(Stream1,String02a_c),
	close(Stream1)),!.

