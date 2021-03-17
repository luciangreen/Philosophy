:-include('build_maze2d.pl').
% rectangles(5,5,[[[1,1],[2,2]],[[3,3],[4,4]]],Grid).
/**
?- rectangles(5,5,[[[1,1],[2,2]],[[3,3],[4,4]]],_).                                                   
     
  ** 
  ** 
**   
**   
true.
**/
rectangles(X,Y,Rectangles,Grid2):-
	grid(X,Y,Grid1),
	rectangles1(Rectangles,Grid1,Grid2),
	print_grid(Grid2,X,Y),!.
rectangles1([],Grid,Grid) :- !.
rectangles1(Rectangles,Grid1,Grid2) :-
	Rectangles=[R|Rs],
	rectangle2(R,Grid1,Grid3),
	rectangles1(Rs,Grid3,Grid2).

rectangle2([[X1,Y1],[X2,Y2]],Grid1,Grid2) :-
	numbers(Y2,Y1,[],YN),
	numbers(X2,X1,[],XN),
	rectangle(XN,YN,Grid1,Grid2).

	
rectangle(_XN1,[],Grid,Grid) :- !.
rectangle(XN1,YN1,Grid1,Grid2) :-
	YN1=[YN2|YN3],
	rectangle1(XN1,YN2,Grid1,Grid3),
	rectangle(XN1,YN3,Grid3,Grid2).

rectangle1([],_YN2,Grid,Grid) :- !.
rectangle1(XN1,YN2,Grid1,Grid2) :-
	XN1=[XN2|XN3],
	(member([XN2,YN2,[]],Grid1)->
	(delete(Grid1,[XN2,YN2,_],Grid4),
	append(Grid4,[[XN2,YN2,[*]]],Grid3));
	(writeln("Error: Overlapping rectangles."),abort)),
	rectangle1(XN3,YN2,Grid3,Grid2).
