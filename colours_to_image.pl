% realism, ironism

% creates an image from names of colours

% [[white,white,red,white,white],[white,red,yellow,red,white],[red,yellow,blue,yellow,red],[white,red,yellow,red,white],[white,white,red,white,white]]

% [[red,white],[white,red]]

:-include('../listprologinterpreter/la_strings.pl').

%:-include('../listprologinterpreter/la_strings.pl').

colours_to_image :-
	writeln("Enter pixel colours for image as e.g. \"[[red,yellow],[yellow,red]]\"."),
	read_string(user_input, "\n", "\r", _, Input),
	term_to_atom(Grid,Input),
	length(Grid,Y),
	Grid=[Row|_],
	length(Row,X),
	findall(Pixel_RGB2,(member(Line,Grid),findall([R," ",G," ",B,"\n"],(member(Pixel_colour,Line),colour(Pixel_colour,[R,G,B])),Pixel_RGB2)),Grid2),
	%trace,
	%writeln1(Grid31),
	maplist(append,[Grid2],[Grid32]),	
	maplist(append,[Grid32],[Grid3]),	
	%maplist(append,[[Grid33]],[Grid34]),	
	%maplist(append,[[Grid34]],[Grid3]),	

%trace,
	maplist(append,[[["P3","\n",X," ",Y,"\n","255","\n"],Grid3,["\n"]]],[Grid31]),
	
	concat_list(Grid31,Grid4),

	writeln("Enter file name, ending with \".ppm\"."),
	read_string(user_input, "\n", "\r", _, File),
	%term_to_atom(Grid4,D85),
	string_atom(D85,Grid4),

	(open_s(File,write,Stream2),
	write(Stream2,D85),
	close(Stream2)),!.

	
colour(red,     [255, 0,   0]).
colour(black,   [0,   0,   0]).
colour(white,   [255, 255, 255]).
colour(yellow,  [255, 255, 0]).
colour(green,   [0,   255, 0]).
colour(blue,    [0,   0,   255]).
colour(purple,  [128, 0,   128]).
colour(orange,  [255, 128, 0]).
colour(brown,   [128, 64,  0]).
