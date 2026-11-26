% ["Time Travel","Conserve time lines 4.txt",0,algorithms,"69. *The self processed his Hegelian imagined idea about what the others would say and the self's imagined idea about what the others' imagined idea about what others would say, etc. to conserve time lines."]

% What is the shortest path in conversation to the solution?

% shortest_path(1,1,Length).
% Length = 3

grid([[1,3," "],[2,3,"e"],[3,3," "],
      [1,2," "],[2,2," "],[3,2," "],
      [1,1,"s"],[2,1," "],[3,1," "]]).
shortest_path(X,Y,Length) :-
	grid(Grid),
	findall(Length1,shortest_path1(X,Y,Grid,0,Length1),Lengths1),
	sort(Lengths1,Lengths2),
	Lengths2=[Length|_].

shortest_path1(X,Y,Grid,Length1,Length2) :-
	options(Grid,X,Y,Options),
	member([X1,Y1],Options),
	Length3 is Length1+1,
	(member([X1,Y1,"e"],Grid)->Length2=Length3;
	(delete(Grid,[X1,Y1,_],Grid2),
	shortest_path1(X1,Y1,Grid2,Length3,Length2))).

	
options(Grid,X,Y,Options0) :-
	XU is X+1,
	XD is X-1,
	YU is Y+1,
	YD is Y-1,
	Options1=[],
	(member([XU,Y,_],Grid)->
	append(Options1,[[XU,Y]],Options2);
	Options1=Options2),
	(member([XD,Y,_],Grid)->
	append(Options2,[[XD,Y]],Options3);
	Options2=Options3),
	(member([X,YU,_],Grid)->
	append(Options3,[[X,YU]],Options4);
	Options3=Options4),
	(member([X,YD,_],Grid)->
	append(Options4,[[X,YD]],Options0);
	Options4=Options0).
	

