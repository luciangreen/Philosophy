% 26 5 23.pl

% 23 algs needed

% ["Medicine","MEDICINE by Lucian Green Go to Bed at 9-30 PM 1 of 4.txt",0,algorithms,"8. I prepared to state that essent in Heidegger, from das Seiende, {n} meant that which has being.  I did this by maintaining motivation.  First, I wrote down the effervent's (sic) heading.  Second, I wrote down 'you'.  Third, I reduced essential enthusiasm to essent (sic).  In this way, I prepared to state that essent in Heidegger, from das Seiende, {n} meant that which has being by maintaining motivation."]

% I did this by maintaining motivation.

% List the moving items at a particular time - items move perpendicularly, bounce off walls and off each other - if there are a number in a row, only the one on the other side one moves

:-include('../listprologinterpreter/listprolog.pl').
%:-dynamic particle_n/1.

% moti(10,10,10,3,2,XD,L),writeln(XD),writeln(L).
moti(X,Y,Z,N_particles,N_frames,Grid2,Moving_particles) :-
 set_up_box(X,Y,Z,Grid1),
 set_up_particles([X,Y,Z],N_particles,[],Particles1),
 render_particles(X,Y,Z,N_frames,Grid1,[],Grid2,Particles1,[],Particles2),
 moving_particles(Particles2,Moving_particles),
 print_grids(Grid2),writeln(["moving particles",Moving_particles]).

print_grids(Grids) :-
%trace,
 findall(["---","\n",Zs],(member(Grid,Grids),
 %findall([Ys,"\n"],(member(Z,Grid),
 findall([Xs,"\n"],(member(Y,Grid),
 findall([XAs,"\n"],(member(X,Y),%writeln1(X),(X=[]->X1="-";X1=X)),Xs
 findall(A1,(member(A,X),%writeln1(X),
 (A=[]->A1=" ";A1=A)),XAs%)),Xs
 )),Xs)),Zs)),Grids1),
 flatten(Grids1,Grids2),
 foldr(string_concat,Grids2,Grids3),
 writeln(Grids3).

set_up_box(X,Y,Z,Grid) :-
 numbers(Z,1,[],ZNs), 
 numbers(Y,1,[],YNs), 
 numbers(X,1,[],XNs), 
 findall(XC,(member(ZN,ZNs),
 findall(XB,(member(YN,YNs),
 findall(XA,(member(XN,XNs),
 (((XN= 1->true;XN=X)->true;
 ((YN= 1->true;YN=Y)->true;
 ((ZN= 1->true;ZN=Z))))->XA=(*);
 XA=[])
 ),XB)),XC)),Grid).
 


set_up_particles([_X,_Y,_Z],0,Particles,Particles) :- !.
set_up_particles([X,Y,Z],N_particles,Particles1,Particles2) :-
 %numbers(N_particles,1,[],N_Ps),
 XB is X-1,
 YB is Y-1,
 ZB is Z-1,
 numbers(ZB,2,[],ZNs), 
 numbers(YB,2,[],YNs), 
 numbers(XB,2,[],XNs),
 %retractall(particle_n(_)),
 %assertz(particle_n(1)), 
 findall([N_particles,Speed,X1,Y1,Z1,X_Direction,Y_Direction,Z_Direction],
 (%particle_n(N),
 %member(N,[_]),
 %retractall(particle_n(_)),
 %N2 is N+1,
 %assertz(particle_n(N2)), 
 random_member(Speed,[0,1]),
 %repeat,
 get_xyz(X1,Y1,Z1,XNs,YNs,ZNs,Particles1),
 random_member(X_Direction,[-1,1]),
 random_member(Y_Direction,[-1,1]),
 random_member(Z_Direction,[-1,1])
 ),Particles3),
 append(Particles1,Particles3,Particles4),
 N_p2 is N_particles-1,
 set_up_particles([X,Y,Z],N_p2,Particles4,Particles2),!.
 
get_xyz(X1,Y1,Z1,XNs,YNs,ZNs,Particles) :-
 random_member(X1,XNs),
 random_member(Y1,YNs),
 random_member(Z1,ZNs),
 (not(member([_,_,X1,Y1,Z1,_,_,_],Particles))->true;
 get_xyz(X1,Y1,Z1,XNs,YNs,ZNs,Particles)).
 
render_particles(_X,_Y,_Z,0,_Grid1,Grid2,Grid2,_,Particles,Particles) :- !.
render_particles(X,Y,Z,N_frames,Grid1,Grid2,Grid3,Particles1,Particles2,Particles3) :-
 update_particles([],Grid1,Grid4,Particles1,Particles2,Particles4),
 N_frames2 is N_frames-1,
 append(Grid2,[Grid4],Grid5),
 render_particles(X,Y,Z,N_frames2,Grid1,Grid5,Grid3,Particles4,Particles4,Particles3),!.
 
 
update_particles(_,Grid,Grid,[],Particles,Particles) :- !.
update_particles(_Grid1x,Grid2,Grid3,Particles1,Particles3,Particles4) :-
%trace,
 Grid1=Grid2,
 Particles1=[[N,Speed,X1,Y1,Z1,X_Direction,Y_Direction,Z_Direction]|Particles2],
 
 (Speed=0->(X1=X3,Y1=Y3,Z1=Z3,
 X_Direction=X_Direction1,Y_Direction=Y_Direction1,
 Z_Direction=Z_Direction1,
 
  replace_particle_image(%[X1,Y1,Z1,_],
  [X3,Y3,Z3,N],Grid1,Grid4)
/*
 get_item_n(Grid1,Z1,XP6),
 get_item_n(XP6,Y1,XP7),
 get_item_n(XP7,X1,_XP8),

 put_item_n(XP7,X3,N,XP72),
 put_item_n(XP6,Y3,XP72,XP73),
 put_item_n(Grid1,Z3,XP73,Grid4)
 */
 
 %Grid4=Grid1
 );
 (%trace,
 X2 is X1+Speed*X_Direction,Y2 is Y1+Speed*Y_Direction,
 Z2 is Z1+Speed*Z_Direction,
 collision(Grid1,N,X1,Y1,Z1,X2,Y2,Z2,X3,Y3,Z3,X_Direction,Y_Direction,Z_Direction,X_Direction1,Y_Direction1,Z_Direction1,Grid4)))
 ,
 %append(Grid2,[Grid4],Grid5),
 Grid4=Grid5,
 
 
 delete(Particles3,[N|_],Particles6),
 append(Particles6,[[N,Speed,X3,Y3,Z3,X_Direction1,Y_Direction1,Z_Direction1]],Particles5),
 update_particles(Grid1,Grid5,Grid3,Particles2,Particles5,Particles4).
 

collision(Grid11,N,X1,Y1,Z1,X2,Y2,Z2,X3,Y3,Z3,X_Direction,Y_Direction,Z_Direction,X_Direction1,Y_Direction1,Z_Direction1,Grid2) :-


 get_particle_image([X2,Y2,Z2,XP8],Grid11),

 %get_item_n(Grid11,Z2,XP6),
 %get_item_n(XP6,Y2,XP7),
 %get_item_n(XP7,X2,XP8),
 ((XP8=[]%->true;XP8=N
 )->(
 
 % delete old particle image
 replace_particle_image(%[X1,Y1,Z1,_],
 [X1,Y1,Z1,[]],Grid11,Grid1),

/*
 get_item_n(Grid11,Z1,XP631),
 get_item_n(XP631,Y1,XP731),
 get_item_n(XP731,X1,_XP831),
 put_item_n(XP731,X1,[],XP732),
 put_item_n(XP631,Y1,XP732,XP733),
 put_item_n(Grid11,Z1,XP733,Grid1),
 */
 X3=X2,Y3=Y2,Z3=Z2,

 replace_particle_image([X1,Y1,Z1,[]],%[X2,Y2,Z2,N],
 Grid1,Grid21),
 replace_particle_image(%[X1,Y1,Z1,[]],
 [X2,Y2,Z2,N],Grid21,Grid2),
 /*get_item_n(Grid11,Z1,XP6312),
 get_item_n(XP6312,Y1,XP7312),
 get_item_n(XP7312,X1,_XP8312),
 put_item_n(XP722,X2,N,XP7222),
 put_item_n(XP622,Y2,XP7222,XP7322),
 put_item_n(Grid1,Z2,XP7322,Grid2),
 */
 
 X_Direction1 is X_Direction,
 Y_Direction1 is Y_Direction,
 Z_Direction1 is Z_Direction);
 
 
 (%trace,
 X_Direction1 is -1*X_Direction,
 Y_Direction1 is -1*Y_Direction,
 Z_Direction1 is -1*Z_Direction,
 X3=X1,Y3=Y1,Z3=Z1,
 
 %/*
 replace_particle_image(%[X1,Y1,Z1,_],
 [X1,Y1,Z1,N],Grid11,Grid2)
 /*(get_item_n(Grid11,Z1,XP61),
 get_item_n(XP61,Y1,XP71),
 get_item_n(XP71,X1,_XP81),
 put_item_n(XP71,X1,N,XP72),
 put_item_n(XP61,Y1,XP72,XP73),
 put_item_n(Grid11,Z1,XP73,Grid2)
 */
 %*/
 %Grid11=Grid2
 )).
 
 % edges

% moving_particles(Ps,List1).
% 

moving_particles(Ps,List1) :-
 findall(N,(member([N,Speed,_X2,_Y2,_Z2,_X_Direction1,_Y_Direction1,_Z_Direction1],Ps),not(Speed=0)),List),sort(List,List1).

 replace_particle_image([X1,Y1,Z1,N1],%[X2,Y2,Z2,N],
 Grid11,Grid2) :-
 (replace_particle_image1([X1,Y1,Z1,N1],%[X2,Y2,Z2,N],
 Grid11,Grid2)->true;writeln(here)).
 replace_particle_image1([X1,Y1,Z1,N1],%[X2,Y2,Z2,N],
 Grid11,Grid2) :-

 get_item_n(Grid11,Z1,XP631),
 get_item_n(XP631,Y1,XP731),
 get_item_n(XP731,X1,_N1x),
 put_item_n(XP731,X1,N1,XP732),
 put_item_n(XP631,Y1,XP732,XP733),
 put_item_n(Grid11,Z1,XP733,Grid2),!.

get_particle_image([X2,Y2,Z2,N],Grid11) :- 
 get_item_n(Grid11,Z2,XP6),
 get_item_n(XP6,Y2,XP7),
 get_item_n(XP7,X2,N).
