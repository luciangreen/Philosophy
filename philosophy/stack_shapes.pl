% convert 3D asterisk shapes to lists of co-ordinates

% rotate, reflect and stack shapes within certain sized containers

:-include('philosophy/build_maze3d.pl').

angles([0,90,180,270]).

% number of extra shapes

numbers_of_shapes([0%1%,2,3,4,5,6,7,8,9,10
]).

% duplicate, rotate, reflect and stack shapes within certain sized containers

% get up to n shapes, modify them, stack them

stack_shapes(Box_X,Box_Y,Box_Z,Grid2) :-
 shapes(Shapes),
 convert_to_coords(Shapes,
 Shapes_coords1),

 numbers_of_shapes(Numbers),
 
 member(Number,Numbers),
 numbers(Number,0,[],Ns),
 
 %trace,
 
 findall(Shape_coords3,(member(Shape_coords1,Shapes_coords1),
 member(N,Ns),numbers(N,1,[],Ns1),findall(Shape_coords2,(member(_,Ns1),
 duplicate_shape(Shapes_coords1,Shape_coords1,Shape_coords2)),Shape_coords3)),Shape_coords4),
 %trace,
 foldr(append,Shape_coords4,Shapes_coords1,Shape_coords5),
 
 %trace,
 angles(Angles),

 % need combos of rots v

 findall(Shape_coords6,(member(Shape_coords1,Shape_coords5),
 member(Angle1,Angles),
 member(Angle2,Angles),
 member(Angle3,Angles),
 %trace,
 rotate_shape(Shape_coords1,Angle1,Angle2,Angle3,Shape_coords61),
 %trace,
 rotate_shape(Shape_coords61,Angle1,Angle2,Angle3,Shape_coords62),
 rotate_shape(Shape_coords62,Angle1,Angle2,Angle3,Shape_coords6)),
 Shape_coords71),
 
 sort(Shape_coords71,Shape_coords7),
 
 reflect_shape(Shape_coords7,x,Shape_coords8),
 reflect_shape(Shape_coords7,y,Shape_coords9),
 reflect_shape(Shape_coords7,z,Shape_coords10),
 
 foldr(append,[Shape_coords7,Shape_coords8,Shape_coords9,
 Shape_coords10],[],Shape_coords11),
 
 sort(Shape_coords11,Shape_coords12),
 
 % randomly xx chooses and closely stacks shapes until full
 % - could try single shape, combos of shapes ()
 % - x randomly stacks
 
 % start with shapes at each cell
 
 % It is generative art
 
 %grid(0,0,0,Box_X,Box_Y,Box_Z,Grid1),
 Grid1=[],

 place3(Box_X,Box_Y,Box_Z,Grid1,Grid2,Shape_coords12).

%grid([0,0,0])
/*
grid(Xm,Ym,Zm,X,Y,Z,Grid) :-
		numbers(Z,Zm,[],ZN),

numbers(Y,Ym,[],YN),
	numbers(X,Xm,[],XN),
	findall([Z1,X1,Y1,[]],(member(Z1,ZN),
	member(Y1,YN),
	member(X1,XN)),Grid),!.
	*/
	
shapes(
[
%[1,

[

[
[*,*]
]

/*
[
[-,-,-,-],
[-,*,-,-],
[-,-,-,-]
],

[
[-,*,-,-],
[*,*,*,-],
[-,*,-,-]
]

%*
[
[-,-,-],
[-,*,-],
[-,-,-]
]
*/

%]

]
]
).

convert_to_coords(Shapes,%Box_X,Box_Y,Box_Z,
Shapes_coords) :-
 
 % check shape is in a box
 findall(Coords,(member(Shape,Shapes),
 length(Shape,Z),
 member(Shape1,Shape),
 length(Shape1,Y),
 member(Shape2,Shape1),
 length(Shape2,X),
 %trace,
 findall(-,(member(Shape10,Shape),
 findall(-,(member(_Shape20,Shape10)),Y1),
 (length(Y1,Y)->true;
 (writeln([shape,%ID,
 'has an incorrect y length.']),abort))),Z1),
 (length(Z1,Z)->true;
 (writeln([shape,%ID,
 'has an incorrect z length.']),abort)),
 % convert 3D asterisk shapes to lists of co-ordinates
 numbers(Z,1,[],NZ),
 numbers(Y,1,[],NY),
 numbers(X,1,[],NX),
 findall([NX11,NY11,NZ11],(
 member(NZ1,NZ),get_item_n(Shape,NZ1,Shape11),
 member(NY1,NY),get_item_n(Shape11,NY1,Shape12),
 member(NX1,NX),get_item_n(Shape12,NX1,Shape13),
 Shape13='*',
 NX11 is NX1-1,
 NY11 is NY1-1,
 NZ11 is NZ1-1),Coords)
 ),Shapes_coords).
 
% duplicate shape

% duplicate shape Shape_coords1

duplicate_shape(Shapes_coords,Shape_coords1,Shape_coords2) :-
 findall(ID1,member([ID1,_],Shapes_coords),IDs1),
 sort(IDs1,IDs2),
 reverse(IDs2,[ID2|_]),
 ID3 is ID2+1,
 Shape_coords1=[_,S],
 Shape_coords2=[ID3,S].
 
% rotate shape

rotate_shape(Shape_coords1,X_theta,Y_theta,Z_theta,Shape_coords2) :-

 Shape_coords1=%[ID,
 Coords,%],
 findall(%[X1,Y1,
 Z1,(member([X,Y,Z],Coords),
 cos_theta(X_theta,X_cos_theta),
 minus_sin_theta(X_theta,X_minus_sin_theta),
 sin_theta(X_theta,X_sin_theta),
 %trace,
 multiply_matrices([[1,0,0],[0,X_cos_theta,X_minus_sin_theta],[0,X_sin_theta,X_cos_theta]],[[X],[Y],[Z]],X1),

 cos_theta(Y_theta,Y_cos_theta),
 minus_sin_theta(Y_theta,Y_minus_sin_theta),
 sin_theta(Y_theta,Y_sin_theta),
 
 X1=[X11,Y11,Z11],
 
multiply_matrices([[Y_cos_theta,0,Y_sin_theta],[0,1,0],[Y_minus_sin_theta,0,Y_cos_theta]],%X1%
[[X11],[Y11],[Z11]]
,Y1),

 cos_theta(Z_theta,Z_cos_theta),
 minus_sin_theta(Z_theta,Z_minus_sin_theta),
 sin_theta(Z_theta,Z_sin_theta),

 Y1=[X21,Y21,Z21],
%trace,
multiply_matrices([[Z_cos_theta,Z_minus_sin_theta,0],[Z_sin_theta,Z_cos_theta,0],[0,0,1]],%Y1%
[[X21],[Y21],[Z21]]
,Z1)),
Shape_coords4),
%trace,
%writeln(1),
%findall(Shape_coords6,(member(Shape_coords5,Shape_coords3),
%reset_min(0,0,0,Shape_coords5,Shape_coords6,_Max_X,_Max_Y,_Max_Z)),
%Shape_coords4),

Shape_coords2=%[ID,
Shape_coords4%]

.%1,1,1.

% https://www.rapidtables.com/convert/number/degrees-to-radians.html

minus_sin_theta(Theta,Minus_sin_theta) :-
 sin_theta(Theta,Sin_theta),
 Minus_sin_theta is -1*Sin_theta.

minus_cos_theta(Theta,Minus_cos_theta) :-
 cos_theta(Theta,Cos_theta),
 Minus_cos_theta is -1*Cos_theta.

sin_theta(Theta,Sin_theta) :-
 degrees_to_radians(Theta,R),
 sin(R,A),round(A,Sin_theta).

cos_theta(Theta,Cos_theta) :-
 degrees_to_radians(Theta,R),
 cos(R,A),round(A,Cos_theta).

degrees_to_radians(Theta,R) :-
 R is Theta*((22/7)/180).
 
multiply_matrices([[A,B,C],[D,E,F],[G,H,J]],[[X],[Y],[Z]],[X1,Y1,Z1]) :-
%trace,
 X1 is A*X+B*Y+C*Z,
 Y1 is D*X+E*Y+F*Z,
 Z1 is G*X+H*Y+J*Z.
 %notrace.
 
%  
min_max(Coords1,Min_X,Min_Y,Min_Z,Max_X1,Max_Y1,Max_Z1) :-
 findall(X1,member([X1,_,_],Coords1),X2),
 findall(Y1,member([_,Y1,_],Coords1),Y2),
 findall(Z1,member([_,_,Z1],Coords1),Z2),
 sort(X2,X3),
 sort(Y2,Y3),
 sort(Z2,Z3),%reverse(X4)
 append([Min_X],_,X3),append(_,[Max_X1],X3),
 append([Min_Y],_,Y3),append(_,[Max_Y1],Y3),
 append([Min_Z],_,Z3),append(_,[Max_Z1],Z3).

/*
reset_min(X,Y,Z,Coords1,Coords2,Max_X,Max_Y,Max_Z) :-
 min_max(Coords1,Min_X,Min_Y,Min_Z,Max_X1,Max_Y1,Max_Z1),
 Max_X is Max_X1-Min_X+1,
 Max_Y is Max_Y1-Min_Y+1,
 Max_Z is Max_Z1-Min_Z+1,
 DX is Min_X-1,
 DY is Min_Y-1,
 DZ is Min_Z-1,
 %trace,
 findall([X5,Y5,Z5],(member([X4,Y4,Z4],Coords1),
 X5 is X4-DX+X-1,
 Y5 is Y4-DY+Y-1,
 Z5 is Z4-DZ+Z-1),Coords2).
 */
% reflect shape

reflect_shape(Shape_coords1,D,Shape_coords2) :-
%trace,
 findall(Shape_coords3,(member(List,Shape_coords1),
 reflect_shape1(List,D,Shape_coords3)),
 Shape_coords2).

reflect_shape1(Shape_coords1,x,Shape_coords2) :-
 Shape_coords1=Coords1,
 findall([X1,Y,Z],(member([X,Y,Z],Coords1),X1 is -X),Coords2),
 %writeln(2),
 %reset_min(0,0,0,Coords2,Coords3,_Max_X,_Max_Y,_Max_Z),
 Shape_coords2=Coords2.
reflect_shape1(Shape_coords1,y,Shape_coords2) :-
 Shape_coords1=Coords1,
 findall([X,Y1,Z],(member([X,Y,Z],Coords1),Y1 is -Y),Coords2),
 %reset_min(0,0,0,Coords2,Coords3,_Max_X,_Max_Y,_Max_Z),
 Shape_coords2=Coords2.
reflect_shape1(Shape_coords1,z,Shape_coords2) :-
 Shape_coords1=Coords1,
 findall([X,Y,Z1],(member([X,Y,Z],Coords1),Z1 is -Z),Coords2),
 %reset_min(0,0,0,Coords2,Coords3,_Max_X,_Max_Y,_Max_Z),
 Shape_coords2=Coords2.

%place(Box_X,Box_Y,Box_Z,Grid1,Grid2,Coords2) :-
%trace,
 %findall(Coords3,(member(Coords1,Coords2),
 %reset_min(0,0,0,Coords1,Coords3,_Max_X,_Max_Y,_Max_Z)
 %Coords1=Coords3),
 %Coords4),
 %place3(Box_X,Box_Y,Box_Z,Grid1,Grid2,Coords2).

place3(Box_X,Box_Y,Box_Z,Grid1,Grid2,Shape_coords12) :-
 (place1(Box_X,Box_Y,Box_Z,Grid1,Grid3,Shape_coords12)->
 place3(Box_X,Box_Y,Box_Z,Grid3,Grid2,Shape_coords12);
 Grid1=Grid2).
 
place1(_Box_X,_Box_Y,_Box_Z,Grid1,Grid2,Shape_coords) :-
 random_member(Shape_coord,Shape_coords),
 (Grid1=[]->
 (Grid_Min_X=0,Grid_Min_Y=0,Grid_Min_Z=0,
 Grid_Max_X=0,Grid_Max_Y=0,Grid_Max_Z=0);
 min_max(%Box_X,Box_Y,Box_Z,
  Grid1,Grid_Min_X,Grid_Min_Y,Grid_Min_Z,
  Grid_Max_X,Grid_Max_Y,Grid_Max_Z)),
 min_max(%Box_X,Box_Y,Box_Z,
  Shape_coord,Min_X,Min_Y,Min_Z,Max_X,Max_Y,Max_Z),
 Min_X1 is Grid_Min_X-(Max_X-Min_X), % eg -5-(3-2)=-6
 Min_Y1 is Grid_Min_Y-(Max_Y-Min_Y),
 Min_Z1 is Grid_Min_Z-(Max_Z-Min_Z),
 Max_X1 is Grid_Max_X+(Max_X-Min_X), % eg 5+(3-2)=6
 Max_Y1 is Grid_Max_Y+(Max_Y-Min_Y), 
 Max_Z1 is Grid_Max_Z+(Max_Z-Min_Z),
 numbers(Max_X1,Min_X1,[],Range_X1),
 numbers(Max_Y1,Min_Y1,[],Range_Y1),
 numbers(Max_Z1,Min_Z1,[],Range_Z1),
 random_member(X,Range_X1),
 random_member(Y,Range_Y1),
 random_member(Z,Range_Z1),
 place2(X,Y,Z,Shape_coord,Grid1,Grid2).

% find dimension-max dim of shape
/*
find_possible_places(Box_X,Box_Y,Box_Z,Shape_coord,Range_X,Range_Y,Range_Z) :-
 min_max(Shape_coord,Min_X,_Min_Y,_Min_Z,Max_X1,Max_Y1,Max_Z1),
 Range_X is Box_X - Max_X1, % + Min_X, % eg 
 Range_Y is Box_Y - Max_Y1,
 Range_Z is Box_Z - Max_Z1.
*/

place2(X,Y,Z,Coords1,Grid1,Grid2) :-
 %reset_min(X,Y,Z,Coords1,Coords2,_Max_X,_Max_Y,_Max_Z),
 %trace,
 Coords1=Coords12,
 
 % add X Y Z to shape
 findall([XS1,YS1,ZS1],(member([XS,YS,ZS],Coords12),
 XS1 is XS+X,
 YS1 is YS+Y,
 ZS1 is ZS+Z),Coords2),
 
 % check that no shape points exist already
 
 intersection(Coords2,Grid1,[]),
 
 % append them
 %forall((member([C1,C2,C3,_],Grid1),member([D1,D2,D3],Coords2)),(not(C1=D1),not(C2=D2),not(C3=D3))),
 %findall([X1,Y1,Z1,Cell2],(member([X1,Y1,Z1,Cell1],Grid1),
 %(member([X1,Y1,Z1],Coords2)->
 %Cell1=[]->fail;true);Cell1=Cell2)),Grid3),
 append(Grid1,Coords2,Grid2).

% check for multiple shapes added to grid with *

% account for min