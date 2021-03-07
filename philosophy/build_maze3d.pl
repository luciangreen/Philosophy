/**

build_maze3d(5, 5, 5, _1442) ? skip



***********
***********
***********
***********
***********
***********
***********
***********
***********
***********
***********


***********
*         *
* *** *   *
*     *   *
*    ** ***
*       * *
*       * *
*         *
*         *
*         *
***********


***********
*     *** *
* *** *** *
*       * *
*** *** ***
*   * *   *
***** *** *
* *** *** *
* *** *** *
*   *     *
***********


***********
*       * *
* ***   * *
*         *
*** *   * *
*   *     *
*** *     *
*         *
*   * *** *
*   *     *
***********


***********
*     *****
* *********
*   ***   *
*** *** ***
*** * * ***
******* ***
*   ***   *
*** ***** *
*   *     *
***********


***********
*         *
* ***     *
*   *     *
*** * * ***
*     *   *
*  ** *   *
*         *
*** * *** *
*   *     *
***********


***********
*     *** *
* ******* *
*   ***   *
*** *** ***
* * * *   *
***** *** *
* *** *** *
***********
*   * * ***
***********


***********
*         *
* *   *   *
*     *   *
*** * * * *
* * * *   *
*** * *** *
*   *     *
*   ***   *
*     *   *
***********


***********
*     *** *
* *** *****
*   * *****
***** *****
* *** *   *
***** *****
***** *   *
******* * *
*   * * * *
***********


***********
*   *     *
* *** *   *
*     *   *
*     *   *
*         *
*       ***
*         *
*       * *
*       * *
***********


***********
***********
***********
***********
***********
***********
***********
***********
***********
***********
***********
**/

:-include('../../listprologinterpreter/la_strings.pl').
:-include('../../listprologinterpreter/la_maths.pl').
:-include('strings_to_grid.pl').

build_maze3d(X,Y,Z,Maze) :-
	X1 is (2*X)+1,
	Y1 is (2*Y)+1,
	Z2 is (2*Z)+1,
	Z21 is Z2-1,
	
	%grid(X1,Y1,1,Grid11), 
	%grid(X1,Y1,Z2,Grid12),
	
	plane(X1,Y1,1,Grid11%,Grid13
	),
	plane(X1,Y1,Z2,Grid12%,Grid14
	),


   	numbers(Z21,2,[],ZN),
   	
   %trace,
	findall(Grid2,(member(Z1,ZN),
	grid(X1,Y1,Z1,Grid1), 
	border(X1,Y1,Z1,Grid1,Grid2)),Grid15),
	
	%writeln([grid11,Grid11]),
	%writeln([grid15,Grid15]),
	%writeln([grid12,Grid12]),
	
	maplist(append,[Grid15],[Grid21]),

	%writeln([grid21,Grid21]),

	maplist(append,[[Grid11],[Grid21],[Grid12]],Grid211),	
	
	%writeln([grid211,Grid211]),
	%trace,

	maplist(append,[Grid211],[Grid2]),
   	
   %	writeln([grid2,Grid2]),

	% 1 (-4 x) walls from each connector point
	% 234->579->35
   %X2 is X-1,
   %Y2 is Y-1,
   %trace,
   	numbers(Y,2,[],YN),
	numbers(X,2,[],XN),
	numbers(Z,2,[],ZN2),
	maplist(connector_coords,YN,YN1),
	maplist(connector_coords,XN,XN1),
	maplist(connector_coords,ZN2,ZN1),
	
	connector_points(XN1,YN1,ZN1,Grid2,Grid3),	 
	%Grid2=Grid3,
	
	walls_from_connector_points(XN1,YN1,ZN1,Grid3,Maze),	
	%Grid3,Maze
	
	%trace,
	%writeln1([maze,Maze]),
	print_grid(Maze,X1,Y1,Z2).
	% make path x
	
grid(X,Y,Z,Grid) :-
	numbers(Y,1,[],YN),
	numbers(X,1,[],XN),
	findall([Z,X1,Y1,[]],(member(Y1,YN),
	member(X1,XN)),Grid),!.
	
plane(X,Y,Z,Grid%1,Grid2
) :-
	numbers(Y,1,[],YN),
	numbers(X,1,[],XN),
	findall([Z,X1,Y1,[*]],(member(Y1,YN),
	member(X1,XN)),Grid).
		
border(X1,Y1,Z1,Grid1,Grid2) :-
%trace,
	horizontal_line(1,X1,1,Z1,Grid1,Grid3),
		%print_grid(Grid3,9,11),

	horizontal_line(1,X1,Y1,Z1,Grid3,Grid4),
	vertical_line(1,Y1,1,Z1,Grid4,Grid5),
	vertical_line(1,Y1,X1,Z1,Grid5,Grid2),!.

horizontal_line(X1,X2,Y,Z1,Grid1,Grid2) :-
	numbers(X2,X1,[],XN),
	horizontal_line1(XN,Y,Z1,Grid1,Grid2).
horizontal_line1([],_Y,_Z1,Grid,Grid) :- !.
horizontal_line1(XN,Y,Z1,Grid1,Grid2) :-
	XN=[XN1|XN2],
	delete(Grid1,[Z1,XN1,Y,_],Grid3),
	append(Grid3,[[Z1,XN1,Y,[*]]],Grid4),
	horizontal_line1(XN2,Y,Z1,Grid4,Grid2).

vertical_line(Y1,Y2,X,Z1,Grid1,Grid2) :-
	numbers(Y2,Y1,[],YN),
	vertical_line1(YN,X,Z1,Grid1,Grid2).
vertical_line1([],_X,_Z1,Grid,Grid) :- !.
vertical_line1(YN,X,Z1,Grid1,Grid2) :-
	YN=[YN1|YN2],
	delete(Grid1,[Z1,X,YN1,_],Grid3),
	append(Grid3,[[Z1,X,YN1,[*]]],Grid4),
	vertical_line1(YN2,X,Z1,Grid4,Grid2).

connector_coords(N,N1) :-
	N1 is (N*2)-1.


connector_points(_XN1,_YN1,[],Grid,Grid) :- !.
connector_points(XN1,YN1,ZN1,Grid1,Grid2) :-
	ZN1=[ZN2|ZN3],
	connector_points1(XN1,YN1,ZN2,Grid1,Grid3),
	connector_points(XN1,YN1,ZN3,Grid3,Grid2),!.

connector_points1(_XN1,[],_ZN1,Grid,Grid) :- !.
connector_points1(XN1,YN1,ZN1,Grid1,Grid2) :-
	YN1=[YN2|YN3],
	connector_points2(XN1,YN2,ZN1,Grid1,Grid3),
	connector_points1(XN1,YN3,ZN1,Grid3,Grid2).

connector_points2([],_YN2,_ZN2,Grid,Grid) :- !.
connector_points2(XN1,YN2,ZN1,Grid1,Grid2) :-
	XN1=[XN2|XN3],
	delete(Grid1,[ZN1,XN2,YN2,_],Grid3),
	append(Grid3,[[ZN1,XN2,YN2,[*]]],Grid4),
	connector_points2(XN3,YN2,ZN1,Grid4,Grid2).




	
walls_from_connector_points(_XN1,_YN1,[],Grid,Grid) :- !.
walls_from_connector_points(XN1,YN1,ZN1,Grid1,Grid2) :-
	ZN1=[ZN2|ZN3],
	walls_from_connector_points1(XN1,YN1,ZN2,Grid1,Grid3),
	walls_from_connector_points(XN1,YN1,ZN3,Grid3,Grid2),!.

walls_from_connector_points1(_XN1,[],_ZN1,Grid,Grid) :- !.
walls_from_connector_points1(XN1,YN1,ZN1,Grid1,Grid2) :-
	YN1=[YN2|YN3],
	walls_from_connector_points2(XN1,YN2,ZN1,Grid1,Grid3),
	walls_from_connector_points1(XN1,YN3,ZN1,Grid3,Grid2).

walls_from_connector_points2([],_YN2,_ZN2,Grid,Grid) :- !.
walls_from_connector_points2(XN1,YN2,ZN1,Grid1,Grid2) :-
	XN1=[XN2|XN3],
	random_wall(XN2,YN2,ZN1,Grid1,Grid3),
	walls_from_connector_points2(XN3,YN2,ZN1,Grid3,Grid2).

random_wall(XN2,YN2,ZN2,Grid1,Grid2) :-
	random(X),X1 is ceiling(12*X),
	(X1=1->(XN31 is XN2-1,YN31 is YN2,ZN31 is ZN2,
	XN32 is XN2,YN32 is YN2+1,ZN32 is ZN2,
	XN33 is XN2-1,YN33 is YN2+1,ZN33 is ZN2,
	XN34 is XN2-2,YN34 is YN2+1,ZN34 is ZN2,
	XN35 is XN2-1,YN35 is YN2+2,ZN35 is ZN2);
	(X1=2->(XN31 is XN2+1,YN31 is YN2,ZN31 is ZN2,
	XN32 is XN2,YN32 is YN2+1,ZN32 is ZN2,
	XN33 is XN2+1,YN33 is YN2+1,ZN33 is ZN2,
	XN34 is XN2+2,YN34 is YN2+1,ZN34 is ZN2,
	XN35 is XN2+1,YN35 is YN2+2,ZN35 is ZN2);
	(X1=3->(XN31 is XN2-1,YN31 is YN2,ZN31 is ZN2,
	XN32 is XN2,YN32 is YN2-1,ZN32 is ZN2,
	XN33 is XN2-1,YN33 is YN2-1,ZN33 is ZN2,
	XN34 is XN2-2,YN34 is YN2-1,ZN34 is ZN2,
	XN35 is XN2-1,YN35 is YN2-2,ZN35 is ZN2);
	(X1=4->(XN31 is XN2+1,YN31 is YN2,ZN31 is ZN2,
	XN32 is XN2,YN32 is YN2-1,ZN32 is ZN2,
	XN33 is XN2+1,YN33 is YN2-1,ZN33 is ZN2,
	XN34 is XN2+2,YN34 is YN2-1,ZN34 is ZN2,
	XN35 is XN2+1,YN35 is YN2-2,ZN35 is ZN2);

	(X1=5->(XN31 is XN2-1,ZN31 is ZN2,YN31 is YN2,
	XN32 is XN2,ZN32 is ZN2+1,YN32 is YN2,
	XN33 is XN2-1,ZN33 is ZN2+1,YN33 is YN2,
	XN34 is XN2-2,ZN34 is ZN2+1,YN34 is YN2,
	XN35 is XN2-1,ZN35 is ZN2+2,YN35 is YN2);
	(X1=6->(XN31 is XN2+1,ZN31 is ZN2,YN31 is YN2,
	XN32 is XN2,ZN32 is ZN2+1,YN32 is YN2,
	XN33 is XN2+1,ZN33 is ZN2+1,YN33 is YN2,
	XN34 is XN2+2,ZN34 is ZN2+1,YN34 is YN2,
	XN35 is XN2+1,ZN35 is ZN2+2,YN35 is YN2);
	(X1=7->(XN31 is XN2-1,ZN31 is ZN2,YN31 is YN2,
	XN32 is XN2,ZN32 is ZN2-1,YN32 is YN2,
	XN33 is XN2-1,ZN33 is ZN2-1,YN33 is YN2,
	XN34 is XN2-2,ZN34 is ZN2-1,YN34 is YN2,
	XN35 is XN2-1,ZN35 is ZN2-2,YN35 is YN2);
	(X1=8->(XN31 is XN2+1,ZN31 is ZN2,YN31 is YN2,
	XN32 is XN2,ZN32 is ZN2+1,YN32 is YN2,
	XN33 is XN2+1,ZN33 is ZN2-1,YN33 is YN2,
	XN34 is XN2+2,ZN34 is ZN2-1,YN34 is YN2,
	XN35 is XN2+1,ZN35 is ZN2-2,YN35 is YN2);

	(X1=9->(ZN31 is ZN2-1,YN31 is YN2,XN31 is XN2,
	ZN32 is ZN2,YN32 is YN2+1,XN32 is XN2,
	ZN33 is ZN2-1,YN33 is YN2+1,XN33 is XN2,
	ZN34 is ZN2-2,YN34 is YN2+1,XN34 is XN2,
	ZN35 is ZN2-1,YN35 is YN2+2,XN35 is XN2);
	(X1=10->(ZN31 is ZN2+1,YN31 is YN2,XN31 is XN2,
	ZN32 is ZN2,YN32 is YN2+1,XN32 is XN2,
	ZN33 is ZN2+1,YN33 is YN2+1,XN33 is XN2,
	ZN34 is ZN2+2,YN34 is YN2+1,XN34 is XN2,
	ZN35 is ZN2+1,YN35 is YN2+2,XN35 is XN2);
	(X1=11->(ZN31 is ZN2-1,YN31 is YN2,XN31 is XN2,
	ZN32 is ZN2,YN32 is YN2+1,XN32 is XN2,
	ZN33 is ZN2-1,YN33 is YN2-1,XN33 is XN2,
	ZN34 is ZN2-2,YN34 is YN2-1,XN34 is XN2,
	ZN35 is ZN2-1,YN35 is YN2-2,XN35 is XN2);
	(X1=12->(ZN31 is ZN2+1,YN31 is YN2,XN31 is XN2,
	ZN32 is ZN2,YN32 is YN2+1,XN32 is XN2,
	ZN33 is ZN2+1,YN33 is YN2-1,XN33 is XN2,
	ZN34 is ZN2+2,YN34 is YN2-1,XN34 is XN2,
	ZN35 is ZN2+1,YN35 is YN2-2,XN35 is XN2))))))))))))),

	delete(Grid1,[ZN31,XN31,YN31,_],Grid11),
	delete(Grid11,[ZN32,XN32,YN32,_],Grid12),
	delete(Grid12,[ZN33,XN33,YN33,_],Grid13),
	delete(Grid13,[ZN34,XN34,YN34,_],Grid14),
	delete(Grid14,[ZN35,XN35,YN35,_],Grid15),
	append(Grid15,[[ZN31,XN31,YN31,[*]]],Grid16),
	append(Grid16,[[ZN32,XN32,YN32,[*]]],Grid17),
	append(Grid17,[[ZN33,XN33,YN33,[*]]],Grid18),
	append(Grid18,[[ZN34,XN34,YN34,[*]]],Grid19),
	append(Grid19,[[ZN35,XN35,YN35,[*]]],Grid2).
	

	