/**

[debug]  ?- build_maze2d(4,5,Maze).

*********
* *     *
* *** * *
*     * *
* *** * *
*   * * *
* *** * *
*   *   *
* * *** *
* *   * *
*********

[debug]  ?- build_maze2d(4,5,Maze).

*********
* *     *
* * * * *
* * * * *
* * * ***
*     * *
* * * * *
* * * * *
* * *** *
*       *
*********

[debug]  ?- build_maze2d(4,5,Maze).

*********
* *     *
* *** ***
*       *
* ***** *
*       *
* ***** *
* *     *
* * *****
*       *
*********

[debug]  ?- build_maze2d(15,15,_).

*******************************
*     * *   *   *   *   * *   *
* * * * * *** *** ***** * * * *
* * *     * *               * *
* *** * * * * *** ***** ***** *
*     * * *   * *         * * *
***** * *** *** *** * * * * * *
*                 * * * *     *
* *** ***** ***** ***** *** ***
* * *     *   * *   *   *     *
* * * * ***** * * *** ***** * *
* * * *   *           *     * *
* *** ***** *** *** *** ***** *
*                   *   * * * *
* ***** ******* * * *** * *** *
* * *   *   *   * * *         *
* * *** * * ***** *** ******* *
*   *     * *           * * * *
* * * *** *** ***** ******* * *
* *   * *           *   *     *
*** *** * * * *** * *** ***** *
* *     * * * *   *   *       *
* * *** ***** *** *** * * * * *
* * *   * *   * * *     * * * *
* * *** ***** * * * *** * * * *
*   * *       *               *
* * * *** * *** * * ******* ***
* *       *     * *   * * *   *
***** * * * ********* * * * ***
*     * *                 *   *
*******************************

?- build_maze2d(15,15,_).

*******************************
*     *       *     *         *
* * * *** * * * *** * * ***** *
* * * * * * *     *   *   *   *
* *** * *** *** ***** *** * ***
*   *         *   *     *     *
* *** *** * * * * *** * * * * *
* *     * * *   *     * * * * *
* ***** *** ***** * ***** *** *
*   *         * * * *   * *   *
* *** * ******* *** * * * *****
* *   *   *           *   *   *
* * ***** *** *** ***** ***** *
* *   *       * *   * *       *
* *** *** *** * * ******* *****
*   * *     * *   * *     *   *
*** * ******* * *** *** * * ***
*   *         *   *     * * * *
* * * ***** * * *** *** * * * *
* *     * * * *     *         *
* * *** * *** * ***** * ***** *
*   *       * *       *     * *
*** *** *** * * ***** *** * * *
*         * *   *       * * * *
* *** * *** * *** *** ***** * *
* * * * *   *       *   * *   *
* * * *** * * *** * * * *** ***
*   * * * *       * * *       *
* *** *** * *** *** *** ***** *
*   *     *       *       *   *
*******************************

**/

:-include('../../listprologinterpreter/la_strings.pl').
:-include('../../listprologinterpreter/la_maths.pl').
:-include('strings_to_grid.pl').

build_maze2d(X,Y,Maze) :-
	X1 is (2*X)+1,
	Y1 is (2*Y)+1,
	grid(X1,Y1,Grid1),
	border(X1,Y1,Grid1,Grid2),
	% 1 (-4 x) walls from each connector point
	% 234->579->35
   %X2 is X-1,
   %Y2 is Y-1,
   	numbers(Y,2,[],YN),
	numbers(X,2,[],XN),
	maplist(connector_coords,YN,YN1),
	maplist(connector_coords,XN,XN1),
	connector_points(XN1,YN1,Grid2,Grid3),	
	walls_from_connector_points(XN1,YN1,Grid3,Maze),	
	%trace,
	print_grid(Maze,X1,Y1),!.
	% make path x
	
grid(X,Y,Grid) :-
	numbers(Y,1,[],YN),
	numbers(X,1,[],XN),
	findall([X1,Y1,[]],(member(Y1,YN),
	member(X1,XN)),Grid).
	
border(X1,Y1,Grid1,Grid2) :-
%trace,
	horizontal_line(1,X1,1,Grid1,Grid3),
		%print_grid(Grid3,9,11),

	horizontal_line(1,X1,Y1,Grid3,Grid4),
	vertical_line(1,Y1,1,Grid4,Grid5),
	vertical_line(1,Y1,X1,Grid5,Grid2).

horizontal_line(X1,X2,Y,Grid1,Grid2) :-
	numbers(X2,X1,[],XN),
	horizontal_line1(XN,Y,Grid1,Grid2).
horizontal_line1([],_Y,Grid,Grid) :- !.
horizontal_line1(XN,Y,Grid1,Grid2) :-
	XN=[XN1|XN2],
	delete(Grid1,[XN1,Y,_],Grid3),
	append(Grid3,[[XN1,Y,[*]]],Grid4),
	horizontal_line1(XN2,Y,Grid4,Grid2).

vertical_line(Y1,Y2,X,Grid1,Grid2) :-
	numbers(Y2,Y1,[],YN),
	vertical_line1(YN,X,Grid1,Grid2).
vertical_line1([],_X,Grid,Grid) :- !.
vertical_line1(YN,X,Grid1,Grid2) :-
	YN=[YN1|YN2],
	delete(Grid1,[X,YN1,_],Grid3),
	append(Grid3,[[X,YN1,[*]]],Grid4),
	vertical_line1(YN2,X,Grid4,Grid2).

connector_coords(N,N1) :-
	N1 is (N*2)-1.



connector_points(_XN1,[],Grid,Grid) :- !.
connector_points(XN1,YN1,Grid1,Grid2) :-
	YN1=[YN2|YN3],
	connector_points1(XN1,YN2,Grid1,Grid3),
	connector_points(XN1,YN3,Grid3,Grid2).

connector_points1([],_YN2,Grid,Grid) :- !.
connector_points1(XN1,YN2,Grid1,Grid2) :-
	XN1=[XN2|XN3],
	delete(Grid1,[XN2,YN2,_],Grid3),
	append(Grid3,[[XN2,YN2,[*]]],Grid4),
	connector_points1(XN3,YN2,Grid4,Grid2).




	
walls_from_connector_points(_XN1,[],Grid,Grid) :- !.
walls_from_connector_points(XN1,YN1,Grid1,Grid2) :-
	YN1=[YN2|YN3],
	walls_from_connector_points1(XN1,YN2,Grid1,Grid3),
	walls_from_connector_points(XN1,YN3,Grid3,Grid2).

walls_from_connector_points1([],_YN2,Grid,Grid) :- !.
walls_from_connector_points1(XN1,YN2,Grid1,Grid2) :-
	XN1=[XN2|XN3],
	random_wall(XN2,YN2,Grid1,Grid3),
	walls_from_connector_points1(XN3,YN2,Grid3,Grid2).

random_wall(XN2,YN2,Grid1,Grid2) :-
	random(X),X1 is ceiling(4*X),
	(X1=1->(XN3 is XN2-1,YN3 is YN2);
	(X1=2->(XN3 is XN2+1,YN3 is YN2);
	(X1=3->(XN3 is XN2,YN3 is YN2-1);
	(X1=4->(XN3 is XN2,YN3 is YN2+1))))),
	delete(Grid1,[XN3,YN3,_],Grid3),
	append(Grid3,[[XN3,YN3,[*]]],Grid2).
	

	