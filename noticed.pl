% ["Short Arguments","God Algorithm.txt",0,algorithms,"5. I prepared to ask why why was.  I did this by stating that I knew the result of the God algorithm was why.  First, I noticed the occurrence of the event.  Second, I read the result of the God algorithm.  Third, I worked out that the result explained the occurrence."]

% * First, I noticed the occurrence of the event.

:-include('../listprologinterpreter/la_maths.pl').

% noticed(4,5,4,1,Seconds).
% Seconds = 9.

noticed(X,Y,Events,Object,Seconds) :-
 grid(X,Y,Grid1),
 random_events(X,Y,1,Events,Grid1,Grid2),
 noticed1(X,Y,1,Seconds,Object,Grid2).
 
grid(X,Y,Grid) :-
 numbers(X,1,[],XN),
 numbers(Y,1,[],YN),	findall([X1,Y1,[]],(member(X1,XN),member(Y1,YN)),Grid),!.
 
random_events(_,_,Events,Events,Grid,Grid) :- !.
random_events(X,Y,Events1,Events3,Grid1,Grid2) :-
 random(X2),X1 is ceiling(X*X2),
 random(Y2),Y1 is ceiling(Y*Y2),
 member([X1,Y1,Events2],Grid1),
 delete(Grid1,[X1,Y1,Events2],Grid3),
 append(Events2,[Events1],Events4),
 append(Grid3,[[X1,Y1,Events4]],Grid4),
 Events5 is Events1+1,
 random_events(X,Y,Events5,Events3,Grid4,Grid2),!.

noticed1(X,Y,Seconds,Seconds,Object,Grid) :-
 random(X2),X1 is ceiling(X*X2),
 random(Y2),Y1 is ceiling(Y*Y2),
 member([X1,Y1,Objects],Grid),
 member(Object,Objects),!.
noticed1(X,Y,Seconds1,Seconds2,Object,Grid) :-
 Seconds3 is Seconds1+1,
 noticed1(X,Y,Seconds3,Seconds2,Object,Grid),!.
