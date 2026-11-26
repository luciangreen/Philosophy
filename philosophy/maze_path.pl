% ["Time Travel","Bots Join Paradoxical Disconnects 4.txt",0,algorithms,"46. *The bot followed the positive path between healthy (virus-free) people."]

/**
?- maze_path(1,1,_).
Enter X co-ordinate of exit:
|: 2
Enter Y co-ordinate of exit:
|: 2
Enter X co-ordinate of starting position:
|: 2
Enter Y co-ordinate of starting position:
|: 2

[2,2][e]
Game Over

[*]	[*]	[*]	
[*]	[e,+,-]	[*]	
[*]	[*]	[*]	

?- maze_path(10,10,_).
Enter X co-ordinate of exit:
|: 9
Enter Y co-ordinate of exit:
|: 9
Enter X co-ordinate of starting position:
|: 2
Enter Y co-ordinate of starting position:
|: 2

[2,2][]
[3,2][]
[3,3][]
[2,3][]
[2,4][]
[3,4][]
[4,4][]
[4,3][]
[5,3][]
[6,3][]
[7,3][]
[8,3][]
[8,2][]
[9,2][]
[9,3][]
[10,3][]
[11,3][]
[11,2][]
[11,4][]
[10,4][]
[9,4][]
[8,4][]
[7,4][]
[6,4][]
[5,4][]
[8,5][]
[9,5][]
[9,6][]
[8,6][]
[7,6][]
[6,6][]
[5,6][]
[4,6][]
[3,6][]
[2,6][]
[2,5][]
[3,5][]
[2,7][]
[3,7][]
[4,7][]
[5,7][]
[6,7][]
[7,7][]
[8,7][]
[9,7][]
[10,7][]
[10,6][]
[11,6][]
[11,5][]
[11,7][]
[11,8][]
[11,9][]
[11,10][]
[10,10][]
[9,10][]
[8,10][]
[7,10][]
[6,10][]
[5,10][]
[4,10][]
[3,10][]
[2,10][]
[2,9][]
[2,8][]
[3,8][]
[3,9][]
[2,11][]
[3,11][]
[4,11][]
[5,11][]
[6,11][]
[7,11][]
[8,11][]
[9,11][]
[10,11][]
[11,11][]
[8,9][]
[8,8][]
[9,8][]
[9,9][e]
Game Over

[*]	[*]	[*]	[*]	[*]	[*]	[*]	[*]	[*]	[*]	[*]	[*]	
[*]	[-]	[-]	[-]	[-]	[-]	[-]	[-]	[-]	[-]	[-]	[*]	
[*]	[-]	[-]	[-]	[-]	[-]	[-]	[-]	[-]	[-]	[-]	[*]	
[*]	[-]	[-]	[*]	[*]	[*]	[*]	[-]	[e,+,-]	[*]	[-]	[*]	
[*]	[-]	[-]	[*]	[*]	[*]	[*]	[-]	[-]	[*]	[-]	[*]	
[*]	[-]	[-]	[-]	[-]	[-]	[-]	[-]	[-]	[-]	[-]	[*]	
[*]	[-]	[-]	[-]	[-]	[-]	[-]	[-]	[-]	[-]	[-]	[*]	
[*]	[-]	[-]	[*]	[*]	[*]	[*]	[-]	[-]	[*]	[-]	[*]	
[*]	[-]	[-]	[-]	[-]	[-]	[-]	[-]	[-]	[-]	[-]	[*]	
[*]	[-]	[-]	[-]	[-]	[-]	[-]	[-]	[-]	[-]	[-]	[*]	
[*]	[-]	[-]	[*]	[*]	[*]	[*]	[-]	[-]	[*]	[-]	[*]	
[*]	[*]	[*]	[*]	[*]	[*]	[*]	[*]	[*]	[*]	[*]	[*]	

**/

:-include('build_maze2d.pl').
:-include('rpg_game_player_autorun2D.pl').

maze_path(X2,Y2,Maze) :-
	X1 is X2+2,
	Y1 is Y2+2,
	grid(X1,Y1,Grid1),
	border(X1,Y1,Grid1,Grid2),
	numbers(5,1,[],Pathogens),
	
	findall(PX1,(member(_,Pathogens),random(X),PX4 is X2*X,ceiling(PX4,PX3),PX1 is 1+PX3),PX2),
	findall(PY1,(member(_,Pathogens),random(Y),PY4 is Y2*Y,ceiling(PY4,PY3),PY1 is 1+PY3),PY2),
	connector_points(PX2,PY2,Grid2,Grid3),	

	writeln("Enter X co-ordinate of exit:"),
	read_string(user_input, "\n", "\r", _End3, X5),
	number_string(X6,X5),

	writeln("Enter Y co-ordinate of exit:"),
	read_string(user_input, "\n", "\r", _End4, Y5),
	number_string(Y6,Y5),

	delete(Grid3,[X6,Y6,_],Grid4),
	append(Grid4,[[X6,Y6,[e]]],Map4),
	
	retractall(map(_)),
	assertz(map(Map4)),

	get_map_dimensions2d(Map4),	

	writeln("Enter X co-ordinate of starting position:"),
	read_string(user_input, "\n", "\r", _End1, X3),
	number_string(X4,X3),

	writeln("Enter Y co-ordinate of starting position:"),
	read_string(user_input, "\n", "\r", _End2, Y3),
	number_string(Y4,Y3),

	retractall(apply1(_)),
	assertz(apply1([])),

	retractall(path(_)),
	%assertz(path([]))),_),

	traverse(X4,Y4),
	
	!.