%% orienteering.pl

%% Popology > An object can be human like > 30

%% Finds the next closest point and recursively goes to each point

%% generates points, starting point, traverses points, draws map (with connections)

%% ?- orienteering(L),writeln(L).
%% L = [[_884,6,15,_902],[6.708203932499369,3,9,243.40942656449428],[12.041594578792296,12,1,-41.61678860264905]]
%% The point 6,15 goes on an angle 243 degrees for 6.7 units to 3,9, etc.

orienteering(List1) :-
	generate_points(10,Points1),
	choose_starting_point(Points1,Point1,Points2),
	find_first_point(Point1,Points2,Point2,Points3),
	%%trace,

	traverse_points2(Point2,Points3,[],List2),
	%%trace,
	maplist(append,[[Point1,Point2]],[List2],[List1]).
	
generate_points(Number_of_points,Points1) :-
	numbers(Number_of_points,1,[],Numbers),
	findall([_,X2,Y2,_],(member(_Number1,Numbers),
	random(X1),X2 is round(20*X1),
	random(Y1),Y2 is round(20*Y1)),Points1).

choose_starting_point(Points1,Point,Points2) :-
	random_member(Point,Points1),
	delete(Points1,Point,Points2).
	
find_first_point(Point1,Points1,Point2,Points3) :-
	traverse_points(Point1,Points1,Point2,Points3).
	
traverse_points(Point1,Points1,Point2,Points3) :-
	%% find distance from current point to all points
	find_distances(Point1,Points1,[],Distances),
	%% find closest point
	find_closest_point(Point1,Distances,Point2),
	%% () record angle, distance to point
	Point2=[Distance,X1,Y1,_Theta2],
	delete(Points1,[Distance,X1,Y1,_],Points3).
	
find_distances(_Point,[],Distances,Distances) :- !.
find_distances(Point1,Points1,Distances1,Distances2) :-
	Points1=[Point2|Points2],
	Point1=[_,X1,Y1,_],
	Point2=[_,X2,Y2,_],
	Distance is sqrt(((Y2-Y1)^2)+((X2-X1)^2)),
	append(Distances1,[[Distance,X2,Y2,_]],Distances3),
	find_distances(Point1,Points2,Distances3,Distances2).

find_closest_point(Point1,Distances1,Point2) :-
	sort(Distances1,Distances2),
	Distances2=[[Distance,X1,Y1,_]|_],%%->true;[Distance,X1,Y1]=[0,0,0]),
	Point1=[_,X11,Y11,_],
	DX is X1-X11,
	DY is Y1-Y11,
	abs(DX,X2),
	abs(DY,Y2),
	%% find angle to closest point
	Theta1 is (180/(22/7))*atan(Y2/(X2+0.00000000001)),
	theta_for_quadrant(DX,DY,Theta1,Theta2), %% 0 degrees is due east
	Point2=[Distance,X1,Y1,Theta2].
	
theta_for_quadrant(X,Y,Theta1,Theta2) :-
	((positive(X),positive(Y))->Theta2 is Theta1;
	((negative(X),positive(Y))->Theta2 is 180-Theta1;
	((negative(X),negative(Y))->Theta2 is 180+Theta1;
	((positive(X),negative(Y))->Theta2 is -Theta1)))).
	
traverse_points2(_Point,[],List,List) :- !.
traverse_points2(Point1,Points1,List1,List2) :-
	%%Points1=[Points4|Points5],
	(traverse_points(Point1,Points1,Point2,Points3)->(
	append(List1,[Point2],List3),
	traverse_points2(Point2,Points3,List3,List2));List1=List2).
	

negative(X) :-
	X < 0.
positive(X) :-
	X >= 0.

numbers(N2,N1,Numbers1,Numbers2):-
%%notrace,
numbers1(N2,N1,Numbers1,Numbers2).
%%trace.
numbers1(N2,N1,Numbers,Numbers) :-
	N2 is N1-1,!.
numbers1(N2,N1,Numbers1,Numbers2) :-
	N3 is N1+1,
	append(Numbers1,[N1],Numbers3),
	numbers1(N2,N3,Numbers3,Numbers2).

get_item_n(Exposition,Number1,Item) :-
	Number2 is Number1-1,
	length(List,Number2),
	append(List,[Item|_],Exposition).

