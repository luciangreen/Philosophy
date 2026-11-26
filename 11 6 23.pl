% 11 6 23.pl

% 55 algs

% ["Fundamentals of Pedagogy and Pedagogy Indicators","FUNDAMENTALS OF PEDAGOGY by Lucian Green Rebreathsonings 2 of 4.txt",0,algorithms,"17. The Asperger patient showed his mastery of sports statistics by remembering the match with the top score. He did this by driving someone up to the door in a tricycle. First, he started at the edge of the courtyard. Second, he drove through the courtyard. Third, he stopped at the door. In this way, the Asperger patient prepared to demonstrate his mastery of sports statistics by remembering the match with the top score by driving someone up to the door in a tricycle."]

% The Asperger patient showed his mastery of sports statistics by remembering the match with the top score.

% top([4,5,7,3,2],Max).

top(List,Max) :-
 sort(List,List2),
 append(_,[Max],List2),!.
 
% He did this by driving someone up to the door in a tricycle.

% Line Graph

:-include('../LuciansHandBitMap-Font/characterbr.pl').
:-include('../listprologinterpreter/listprolog.pl').

make_grid(X,Y,Grid) :-
 numbers(Y,1,[],Ys),
 numbers(X,1,[],Xs), 
 findall([X1,Y1,[]],(member(Y1,Ys),member(X1,Xs)),Grid).

% line_graph(2,2,[1,2],_).
%	*
%*	 	

/*
line_graph(4,4,[1,2],_).
			*	
 	 	*	 	
 	*	 	 	
 	 	 	 	

line_graph(5,5,[1,2],_).
				*	
 	 	 	*	 	
 	 	*	 	 	
 	*	 	 	 	
 	 	

line_graph(10,10,[10,1,10],_).
 	 	*	 	 	 	 	 	 	*	
 	 	*	 	 	 	 	 	 	*	
 	 	 	*	 	 	 	 	*	 	
 	 	 	*	 	 	 	 	*	 	
 	 	 	*	 	 	 	*	 	 	
 	 	 	 	*	 	 	*	 	 	
 	 	 	 	*	 	*	 	 	 	
 	 	 	 	*	 	*	 	 	 	
 	 	 	 	 	*	 	 	 	 	
 	 	 	 	 	*	 	 	 	 	
 	 	 	 	 	
*/
% line_graph(20,20,[10,1,5,4,3,8],_).

line_graph(X_win,Y_win,Ys,Grid) :-
 make_grid(X_win,Y_win,Grid1),
 length(Ys,Xs_L),
 sort(Ys,Ys2),
 append(_,[Y_max],Ys2),
 numbers(Xs_L,1,[],Xs),
 findall([X2,Y2],(member(X,Xs),get_item_n(Ys,X,Y),Y2 is floor(Y*(Y_win/Y_max)),X2 is floor(X*(X_win/Xs_L))),Ps),
 plot(Ps,Grid1,Grid),
 prettyprint1_lg(Grid,Y_win,X_win),!.

plot(Ps,Grid1,Grid2) :-
 Ps=[[X1,Y1],[X2,Y2]],
 %write([[X1,Y1],[X2,Y2]]),
 line1(X1,Y1,X2,Y2,Grid1,Grid2,1),!.
plot(Ps,Grid1,Grid2) :-
 Ps=[[X1,Y1],[X2,Y2]|Ps2],
 %write([X2,Y2]),
 line1(X1,Y1,X2,Y2,Grid1,Grid3,1),
 plot([[X2,Y2]|Ps2],Grid3,Grid2),!.
plot(_,G,G) :- !.

prettyprint1_lg(_C,0,_X) :- !.
prettyprint1_lg(C,N,X) :-
	prettyprint2_lg(C,N,1,X),
	writeln(''),
	N2 is N-1,
	prettyprint1_lg(C,N2,X).
prettyprint2_lg(_C,_N,X1,X) :- X1 is X+1, !.
prettyprint2_lg(C,N,M,X) :-
	member([M,N,M2],C),
	(M2=[]->write(' ');write('*')),write('\t'),
	M3 is M+1,
	prettyprint2_lg(C,N,M3,X).

% 37 left

% First, he started at the edge of the courtyard.

% Graphs, returns true if point is inside a triangle

/*

edge(3, 3, 1, 1, 1, 3, 3, 2, 2, 2).
Point is in triangle.
1	1	 	
1	2	1	
1	 	 	

edge(3, 3, 1, 1, 1, 3, 3, 2, 3, 1).
Point is not in triangle.
1	1	 	
1	1	1	
1	 	2	

edge(10, 10, 2, 2, 2, 9, 8, 5, 5, 5).
Point is in triangle.
 	 	 	 	 	 	 	 	 	 	
 	1	 	 	 	 	 	 	 	 	
 	1	1	1	 	 	 	 	 	 	
 	1	1	1	1	 	 	 	 	 	
 	1	1	1	1	1	1	 	 	 	
 	1	1	1	2	1	1	1	 	 	
 	1	1	1	1	1	 	 	 	 	
 	1	1	1	 	 	 	 	 	 	
 	1	 	 	 	 	 	 	 	 	
 	 	 	 	 	 	 	 	 	 	
edge(10, 10, 2, 2, 2, 9, 8, 5, 8, 1).
Point is not in triangle.
 	 	 	 	 	 	 	 	 	 	
 	1	 	 	 	 	 	 	 	 	
 	1	1	1	 	 	 	 	 	 	
 	1	1	1	1	 	 	 	 	 	
 	1	1	1	1	1	1	 	 	 	
 	1	1	1	1	1	1	1	 	 	
 	1	1	1	1	1	 	 	 	 	
 	1	1	1	 	 	 	 	 	 	
 	1	 	 	 	 	 	 	 	 	
 	 	 	 	 	 	 	2	 	 	

*/

edge(X_win,Y_win,X1,Y1,X2,Y2,X3,Y3,PX,PY) :-
 make_grid(X_win,Y_win,Grid1),
 draw_edges(X1,Y1,X2,Y2,X3,Y3,Grid1,Grid2),
 triangle_centre(X1,Y1,X2,Y2,X3,Y3,QX,QY),
 fill(QX,QY,Grid2,Grid3),
 ((member([PX,PY,M],Grid3),
 member(1,M))->
 writeln("Point is in triangle.");
 writeln("Point is not in triangle.")),
 line1(PX,PY,PX,PY,Grid3,Grid4,2),
 prettyprint1_e(Grid4,Y_win,X_win),!.

draw_edges(X1,Y1,X2,Y2,X3,Y3,Grid1,Grid4) :- 
 line1(X1,Y1,X2,Y2,Grid1,Grid2,1),
 line1(X2,Y2,X3,Y3,Grid2,Grid3,1),
 line1(X3,Y3,X1,Y1,Grid3,Grid4,1).

triangle_centre(X1,Y1,X2,Y2,X3,Y3,QX,QY) :-
 QX is floor((X1 + X2 + X3)/3),
 QY is floor((Y1 + Y2 + Y3)/3).

fill(X,Y,Grid1,Grid6) :-
 ((member([X,Y,M],Grid1),
 member(1,M))->
 Grid1=Grid6;
 (line1(X,Y,X,Y,Grid1,Grid2,1),
 XM is X-1,
 XP is X+1,
 YM is Y-1,
 YP is Y+1,
 fill(XM,Y,Grid2,Grid3),
 fill(XP,Y,Grid3,Grid4),
 fill(X,YM,Grid4,Grid5),
 fill(X,YP,Grid5,Grid6))),!.
 
prettyprint1_e(_C,0,_X) :- !.
prettyprint1_e(C,N,X) :-
	prettyprint2_e(C,N,1,X),
	writeln(''),
	N2 is N-1,
	prettyprint1_e(C,N2,X).
prettyprint2_e(_C,_N,X1,X) :- X1 is X+1, !.
prettyprint2_e(C,N,M,X) :-
	member([M,N,M2],C),
	(M2=[]->write(' ');
	(member(2,M2)->write(2);
	(write(1)))),write('\t'),
	M3 is M+1,
	prettyprint2_e1(C,N,M3,X).

% 25 left

% Second, he drove through the courtyard.

% 3D edge

% edge_3d(3,3,3,1,1,1,3,1,1,1,3,1,1,1,3,2,2,2).

% edge_3d(3,3,2,1,1,1,3,1,1,1,3,1,1,1,2,2,2,2).

edge_3d(X_win,Y_win,Z_win,X1,Y1,Z1,X2,Y2,Z2,X3,Y3,Z3,X4,Y4,Z4,PX,PY,PZ) :-
 make_grid_3d(X_win,Y_win,Z_win,Grid1),
 draw_edges_3d(X1,Y1,Z1,X2,Y2,Z2,X3,Y3,Z3,X4,Y4,Z4,Grid1,Grid21),
 draw_faces_3d(X1,Y1,Z1,X2,Y2,Z2,X3,Y3,Z3,X4,Y4,Z4,Grid21,Grid2),
 
%prettyprint_3d_1_e1(Grid2,Y_win,X_win,Z_win),
 
 tetrahedron_centre_3d(X1,Y1,Z1,X2,Y2,Z2,X3,Y3,Z3,X4,Y4,Z4,QX,QY,QZ),
 fill_3d(QX,QY,QZ,Grid2,Grid3),
 ((member([PX,PY,PZ,M],Grid3),
 member(1,M))->
 writeln("Point is in tetrahedron.");
 writeln("Point is not in tetrahedron.")),
 line1_3d(PX,PY,PZ,PX,PY,PZ,Grid3,Grid4,2),
 prettyprint_3d_1_e1(Grid4,Y_win,X_win,Z_win),!.

make_grid_3d(X,Y,Z,Grid) :-
 numbers(Y,1,[],Ys),
 numbers(X,1,[],Xs), 
 numbers(Z,1,[],Zs), 
 findall([X1,Y1,Z1,[]],(member(Y1,Ys),member(X1,Xs),member(Z1,Zs)),Grid).

draw_edges_3d(X1,Y1,Z1,X2,Y2,Z2,X3,Y3,Z3,X4,Y4,Z4,Grid1,Grid7) :- 
 line1_3d(X1,Y1,Z1,X2,Y2,Z2,Grid1,Grid2,1),
 line1_3d(X2,Y2,Z2,X3,Y3,Z3,Grid2,Grid3,1),
 line1_3d(X3,Y3,Z3,X1,Y1,Z1,Grid3,Grid4,1),
 line1_3d(X1,Y1,Z1,X4,Y4,Z4,Grid4,Grid5,1),
 line1_3d(X2,Y2,Z2,X4,Y4,Z4,Grid5,Grid6,1),
 line1_3d(X3,Y3,Z3,X4,Y4,Z4,Grid6,Grid7,1).

draw_faces_3d(X1,Y1,Z1,X2,Y2,Z2,X3,Y3,Z3,X4,Y4,Z4,Grid1,Grid5) :- 
 draw_face_3d(X1,Y1,Z1,X2,Y2,Z2,X3,Y3,Z3,Grid1,Grid2),
 draw_face_3d(X1,Y1,Z1,X2,Y2,Z2,X4,Y4,Z4,Grid2,Grid3),
 draw_face_3d(X1,Y1,Z1,X4,Y4,Z4,X3,Y3,Z3,Grid3,Grid4),
 draw_face_3d(X4,Y4,Z4,X2,Y2,Z2,X3,Y3,Z3,Grid4,Grid5).  

draw_face_3d(X1,Y1,Z1,X2,Y2,Z2,X3,Y3,Z3,Grid1,Grid2) :-
 DX is X3-X2,
 DY is Y3-Y2,
 DZ is Z3-Z2,
 Mod is sqrt(DX^2+DY^2+DZ^2),
 Segs is ceiling(Mod/0.5),
 Segs2 is Segs-1,
 numbers(Segs2,0,[],S),
 findall([SX,SY,SZ],(member(S1,S),
 SX is floor(X2+S1*DX),
 SY is floor(Y2+S1*DY),
 SZ is floor(Z2+S1*DZ)),Ps),
 draw_lines(X1,Y1,Z1,Ps,Grid1,Grid2).

draw_lines(_X1,_Y1,_Z1,[],Grid,Grid) :- !.
draw_lines(X1,Y1,Z1,Ps,Grid1,Grid2) :-
 Ps=[[X2,Y2,Z2]|Ps1],
 line1_3d(X1,Y1,Z1,X2,Y2,Z2,Grid1,Grid3,1),
 draw_lines(X1,Y1,Z1,Ps1,Grid3,Grid2).

tetrahedron_centre_3d(X1,Y1,Z1,X2,Y2,Z2,X3,Y3,Z3,X4,Y4,Z4,QX,QY,QZ) :-
 QX is floor((X1 + X2 + X3 + X4)/4),
 QY is floor((Y1 + Y2 + Y3 + Y4)/4),
 QZ is floor((Z1 + Z2 + Z3 + Z4)/4).

fill_3d(X,Y,Z,Grid1,Grid6) :-
 ((member([X,Y,Z,M],Grid1),
 member(1,M))->
 Grid1=Grid6;
 (line1_3d(X,Y,Z,X,Y,Z,Grid1,Grid2,1),
 XM is X-1,
 XP is X+1,
 YM is Y-1,
 YP is Y+1,
 ZM is Z-1,
 ZP is Z+1,
 fill_3d(X,Y,ZM,Grid2,Grid3),
 fill_3d(X,Y,ZP,Grid3,Grid41),
 fill_3d(XM,Y,Z,Grid41,Grid31),
 fill_3d(XP,Y,Z,Grid31,Grid4),
 fill_3d(X,YM,Z,Grid4,Grid5),
 fill_3d(X,YP,Z,Grid5,Grid6))),!.
 
prettyprint_3d_1_e1(Grid,X,Y,Z) :-
	numbers(Y,1,[],YN1),
	reverse(YN1,YN),
	numbers(X,1,[],XN),
	numbers(Z,1,[],ZN1),
	reverse(ZN1,ZN),


	findall(_,(member(Z1,ZN),
	nl,nl,
	member(Y1,YN),
	nl,
	member(X1,XN),
	member([Z1,X1,Y1,M2],Grid),

	(M2=[]->write(' ');
	(member(2,M2)->write(2);
	(write(1)))),write('\t')

	%(Pixel1=[*]->Pixel="*";Pixel=" "),
	%write(Pixel)
	),_).
	 
/* 
prettyprint_3d_1_e1(_C,_X,_Y,0) :- !.
prettyprint_3d_1_e1(C,X,Y,Z) :-
	prettyprint_3d_1_e(C,1,X,Z),
	writeln(''),
	Z2 is Z-1,
	prettyprint_3d_1_e1(C,X,Y,Z2).

prettyprint_3d_1_e(_C,0,_X,_Z) :- !.
prettyprint_3d_1_e(C,N,X,Z) :-
	prettyprint_3d_2_e(C,N,Z,1,X),
	writeln(''),
	N2 is N-1,
	prettyprint_3d_1_e(C,N2,X,Z).
prettyprint_3d_2_e(_C,_N,_Z,X1,X) :- X1 is X+1, !.
prettyprint_3d_2_e(C,N,Z,M,X) :-
	member([M,N,Z,M2],C),
	(M2=[]->write(' ');
	(member(2,M2)->write(2);
	(write(1)))),write('\t'),
	M3 is M+1,
	prettyprint_3d_2_e(C,N,Z,M3,X).
*/



line1_3d(X1,Y1,Z1,X2,Y2,Z2,C2,C4,N3) :-
	%%_3d(X1=<X2->_3d(XA1=X1,XA2=X2);_3d(XA1=X2,XA2=X1)),
	%%_3d(Y1=<Y2->_3d(YA1=Y1,YA2=Y2);_3d(YA1=Y2,YA2=Y1)),
	%%gridline1_3d(XA1,YA1,XA2,YA2,C2,C3,N3).
    gridline1_3d(X1,Y1,Z1,X2,Y2,Z2,C2,C3,1000),
    findall([X,Y,Z,M2],(member([X,Y,Z,M],C3),
    (member(1000,M)->(delete(M,1000,M1),append(M1,[N3],M2));
    M=M2)),C4).
	
%% Graphs _3d(X1,Y1) to _3d(X2,Y2)

gridline1_3d(X1,Y1,Z1,X2,Y2,Z2,C2,C3,N3) :-
	sortbyx_3d(X1,Y1,X2,Y2,XA1,YA1,XA2,YA2),
	equation_3d(XA1,YA1,XA2,YA2,M,C),
	gridline_orig_2_3d(XA1,YA1,XA2,YA2,M,C,C2,C4,N3),
	%C4=C3,
	%C2=C4,
	sortbyx_3d(X1,Z1,X2,Z2,XXA1,ZZA1,XXA2,ZZA2),
	equation_3d(XXA1,ZZA1,XXA2,ZZA2,M0,C0),
	gridline2_3d(XXA1,ZZA1,XXA2,ZZA2,M0,C0,C4,C3,N3),
	
	!.
	%%writeln_3d(Grid1),
    %%sort_3d(YA1,YA2,YB1,YB2),
	%%print_3d(XA1,YB1,XA2,YB2,Grid1,_Grid2),!.

%% Sorts _3d(X1,Y1) and _3d(X2,Y2) by X

sortbyx_3d(X1,Y1,X2,Y2,X1,Y1,X2,Y2) :-
	X2 >= X1.
sortbyx_3d(X1,Y1,X2,Y2,X2,Y2,X1,Y1) :-
    X2 < X1.

%% Finds the rise and run of _3d(X1,Y1) and _3d(X2,Y2)

equation_3d(X1,Y1,X2,Y2,M,C) :-
	DY is Y2-Y1,
	DX is X2-X1,
	%%writeln_3d([y2,Y2,y1,Y1,x2,X2,x1,X1,dy,DY,dx,DX]), %%
	equation2_3d(DY,DX,M,Y1,X1,C).

%% Finds the gradient m and y-intercept c of _3d(X1,Y1) and _3d(X2,Y2)

equation2_3d(_DY,0,999999999,_Y1,X1,X1) :-
        !.
equation2_3d(DY,DX,M,Y1,X1,C) :-
	M is DY/DX,
        C is Y1-M*X1
        %%,writeln_3d([m,M,c,C])
        .

%% Finds the graph of the line connecting the two points.  It does this by finding the graph flipped in the y=x line if the gradient m is greater than 1 or less than -1, so that the graph is not disjointed

gridline2_3d(X1,_Y1,X2,_Y2,M,C,C2,Grid,N3) :-
	M =< 1, M >= -1,
	%%x_3d(X),%%X1 is X+1,
	gridline3_3d(X1,X2,M,C,C2,Grid,N3,_X).
gridline2_3d(X1,Y1,_X2,Y2,M,_C,C22,Grid1,N3) :-
	(M > 1; M < -1),
        M2 is 1/M,
	sort_3d(Y1,Y2,YA1,YA2),
        C2 is X1-M2*Y1,
        	flipxy_3d(C22,[],Grid),
    %%y_3d(Y),
    %%Y1 is Y+1,  	
	gridline3_3d(YA1,YA2,M2,C2,Grid,Grid2,N3,_Y1),
	%%writeln_3d(['***',flipxygrid,Grid2]),
	        	flipxy_3d(Grid2,[],Grid1).

%% Sorts Y1 and Y2

sort_3d(Y1,Y2,Y1,Y2) :-
	Y1=<Y2, !.
sort_3d(Y1,Y2,Y2,Y1) :-
	Y1>Y2.

%% Plots a point at each x-value of the graph

gridline3_3d(X1,X2,_M,_C,Grid,Grid,_N3,_N4) :-
	%%X1 is N4+1. %% swap, 
	X1 is X2+1.
gridline3_3d(X1,X2,M,C,Grid1,Grid2,N3,_N4) :-
	Z is floor(M*X1+C), % or round ***
	%%Coord = [X1,Y],
	findall(New,(
	member([X0,Y0,Z0,M0],Grid1),
	([X0,Y0,Z0,M0]=[X1,Y,Z,M2]->
	%member([X1,Y,Z,M2],Grid1),
	%delete(Grid1,[X1,Y,Z,M2],Grid11),
	(append(M2,[N3],M3),New=[X1,Y,Z,M3]);
	New=[X0,Y0,Z0,M0])
	),Grid3),
	
	%append(Grid11,[[X1,Y,M3]],Grid3),
	%%writeln_3d([X1,Y,M3]), %%
	X3 is X1+1,
	gridline3_3d(X3,X2,M,C,Grid3,Grid2,N3,_N42).

%% Flips the graph in the y=x line

flipxy_3d([],Grid,Grid) :- !.
flipxy_3d(Grid1,Grid2,Grid3) :-
	Grid1 = [Coord1 | Coords],
	Coord1 = [X, Y, Z, M],
	Coord2 = [Z, Y, X, M],
	append(Grid2,[Coord2],Grid4),
	flipxy_3d(Coords,Grid4,Grid3).

gridline_orig_2_3d(X1,_Y1,X2,_Y2,M,C,C2,Grid,N3) :-
	M =< 1, M >= -1,
	%%x_3d(X),%%X1 is X+1,
	gridline_orig_3_3d(X1,X2,M,C,C2,Grid,N3,_X).
gridline_orig_2_3d(X1,Y1,_X2,Y2,M,_C,C22,Grid1,N3) :-
	(M > 1; M < -1),
        M2 is 1/M,
	sort_3d(Y1,Y2,YA1,YA2),
        C2 is X1-M2*Y1,
        	flipxy_orig_3d(C22,[],Grid),
    %%y_3d(Y),
    %%Y1 is Y+1,  	
	gridline_orig_3_3d(YA1,YA2,M2,C2,Grid,Grid2,N3,_Y1),
	%%writeln_3d(['***',flipxygrid,Grid2]),
	        	flipxy_3d(Grid2,[],Grid1).

gridline_orig_3_3d(X1,X2,_M,_C,Grid,Grid,_N3,_N4) :-
	%%X1 is N4+1. %% swap, 
	X1 is X2+1.
gridline_orig_3_3d(X1,X2,M,C,Grid1,Grid2,N3,_N4) :-
	Z is floor(M*X1+C), % or round ***
	%%Coord = [X1,Y],
	%trace,
	findall(New,(
	member([X0,Y0,Z0,M0],Grid1),
	([X0,Y0,Z0,M0]=[X1,Y,Z,M2]->
	%member([X1,Y,Z,M2],Grid1),
	%delete(Grid1,[X1,Y,Z,M2],Grid11),
	(append(M2,[N3],M3),New=[X1,Y,Z,M3]);
	New=[X0,Y0,Z0,M0])
	),Grid3),
	
	%append(Grid11,[[X1,Y,M3]],Grid3),
	%%writeln_3d([X1,Y,M3]), %%
	X3 is X1+1,
	gridline_orig_3_3d(X3,X2,M,C,Grid3,Grid2,N3,_N42).

%% Flips the graph in the y=x line

flipxy_orig_3d([],Grid,Grid) :- !.
flipxy_orig_3d(Grid1,Grid2,Grid3) :-
	Grid1 = [Coord1 | Coords],
	Coord1 = [X, Y, Z, M],
	Coord2 = [Y, X, Z, M],
	append(Grid2,[Coord2],Grid4),
	flipxy_orig_3d(Coords,Grid4,Grid3).
	
% 16 algs over