% ["Time Travel","People 2.txt",0,algorithms,"16. *I observed the person by planning for and simplifying the geometry in the times where I had verified greater knowledge of the place of the mentally projected other."]

% What is the shortest path in conversation to the solution in 3D?

% shortest_path3d(1,1,1,Length).
% Length = 4

grid([[1,1,3," "],[1,2,3," "],[1,3,3," "],
      [1,1,2," "],[1,2,2," "],[1,3,2," "],
      [1,1,1,"s"],[1,2,1," "],[1,3,1," "],
      
      
      
      [2,1,3," "],[2,2,3,"e"],[2,3,3," "],
      [2,1,2," "],[2,2,2," "],[2,3,2," "],
      [2,1,1," "],[2,2,1," "],[2,3,1," "]]).

/**, takes too long
      [3,1,3," "],[3,2,3," "],[3,3,3," "],
      [3,1,2," "],[3,2,2," "],[3,3,2," "],
      [3,1,1," "],[3,2,1," "],[3,3,1," "]
      ]).
      **/
shortest_path3d(X,Y,Z,Length) :-
	grid(Grid),
	findall(Length1,shortest_path1(X,Y,Z,Grid,0,Length1),Lengths1),
	sort(Lengths1,Lengths2),
	Lengths2=[Length|_].

shortest_path1(X,Y,Z,Grid,Length1,Length2) :-
	options(Grid,X,Y,Z,Options),
	member([X1,Y1,Z1],Options),
	Length3 is Length1+1,
	(member([Z1,X1,Y1,"e"],Grid)->Length2=Length3;
	(delete(Grid,[Z1,X1,Y1,_],Grid2),
	shortest_path1(X1,Y1,Z1,Grid2,Length3,Length2))).

	
options(Grid,X,Y,Z,Options0) :-
	XU is X+1,
	XD is X-1,
	YU is Y+1,
	YD is Y-1,
	ZU is Z+1,
	ZD is Z-1,
	Options1=[],
	(member([Z,XU,Y,_],Grid)->
	append(Options1,[[XU,Y,Z]],Options2);
	Options1=Options2),
	(member([Z,XD,Y,_],Grid)->
	append(Options2,[[XD,Y,Z]],Options3);
	Options2=Options3),
	(member([Z,X,YU,_],Grid)->
	append(Options3,[[X,YU,Z]],Options4);
	Options3=Options4),
	(member([Z,X,YD,_],Grid)->
	append(Options4,[[X,YD,Z]],Options6);
	Options4=Options6),
	(member([ZU,X,Y,_],Grid)->
	append(Options6,[[X,Y,ZU]],Options7);
	Options6=Options7),
	(member([ZD,X,Y,_],Grid)->
	append(Options7,[[X,Y,ZD]],Options0);
	Options7=Options0).


