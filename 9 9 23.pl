% 9 9 23

% 23*2-34=12 to do

% ["Fundamentals of Pedagogy and Pedagogy Indicators","FUNDAMENTALS OF PEDAGOGY by Lucian Green Time to Finish 2 of 2.txt",0,algorithms,"15. The train cleaner prepared to hose the train. He did this by hosing the top of his head. First, he moved the shower head so that its x co-ordinate was equal to its initial position, plus the x co-ordinate of the centre of the person's head minus the x co-ordinate of the initial position of the centre of the shower head. Second, he moved the shower head so that its y co-ordinate was equal to its initial position, plus the y co-ordinate of the centre of the person's head minus the y co-ordinate of the initial position of the centre of the shower head. Third, he adjusted the shower head so that it was perpendicular to the walls. In this way, the train cleaner prepared to hose the train by hosing the top of his head."]

:-include('../listprologinterpreter/la_maths.pl').

/*
perimeter(3, 3, _79014).
-1-----
1*1----
-1-----
-------
-------
-------
-------

P = 4.


perimeter(3, 3, _87624).
-------
-------
-----1-
----1*1
-------
----1*1
-----1-

P = 6.
*/

random_2d_shape(X_lim,Y_lim,Cs) :-
 X_lim1 is 2*X_lim+1,
 numbers(X_lim1,1,[],Xs),
 Y_lim1 is 2*Y_lim+1,
 numbers(Y_lim1,1,[],Ys),
 findall([X,Y,C],(member(X,Xs),member(Y,Ys),
 X1 is floor(X/2),X2 is X/2,
 Y1 is floor(Y/2),Y2 is Y/2,
 ((X1=X2,Y1=Y2
 )->
 (random(X3),X4 is floor(2*X3),
 random(Y3),Y4 is floor(2*Y3),
 ((%true%
 X4=1,Y4=1
 )->C=(*);C=(-)));
 C=(-))),Cs).

perimeter(X_lim,Y_lim,Perimeter) :-
 random_2d_shape(X_lim,Y_lim,Cs),
 % counts perimeter when exactly 1 block adjacent in spread out version
 X_lim1 is 2*X_lim+1,
 numbers(X_lim1,1,[],Xs),
 Y_lim1 is 2*Y_lim+1,
 numbers(Y_lim1,1,[],Ys),
 findall([X,Y,CC],(member(X,Xs),member(Y,Ys),
 X1 is floor((X+0)/2),X2 is (X+0)/2,
 Y1 is floor((Y+0)/2),Y2 is (Y+0)/2,
 (not((X1=X2,Y1=Y2))->
 (one_neighbour(Cs,X,Y,CC)->
 true;member([X,Y,CC],Cs));
 member([X,Y,CC],Cs)
 )),Cs1),
 findall(V,(member([_,_,V],Cs1),
 number(V)),Cs2),
 sum(Cs2,Perimeter),
 print_grid(X_lim1,Y_lim1,Cs1).

/*one_neighbour(Cs,X,Y) :-
 XM is X-2,
 XP is X+2,
 YM is Y-2,
 YP is Y+2,
*/
one_neighbour(Cs,X,Y,CC3) :-
%((X=2,Y=2)->trace;true),
 XM is X-1,
 XP is X+1,
 YM is Y-1,
 YP is Y+1,
 /*((member([X,Y,(*)],Cs),
 not(member([XM,Y,(*)],Cs)),
 not(member([XP,Y,(*)],Cs)),
 not(member([X,YM,(*)],Cs)),
 not(member([X,YP,(*)],Cs)))->(%trace,
 CC3 is 4);
 */
 (
 (member([XM,Y,(*)],Cs)->CC=1;CC=0),
 (member([XP,Y,(*)],Cs)->CC1 is CC+1;CC1 is CC),
 (member([X,YM,(*)],Cs)->CC2 is CC1+1;CC2 is CC1),
 (member([X,YP,(*)],Cs)->CC3 is CC2+1;CC3 is CC2)
 )
 ,CC3=1
 .
 
print_grid(X_lim,Y_lim,Cs) :-
 numbers(X_lim,1,[],Xs),
 numbers(Y_lim,1,[],Ys),
 findall(_,(member(Y,Ys),
 findall(_,(member(X,Xs),
 member([X,Y,C],Cs),write(C)),_),
 writeln("")),_).

% 12-7=5 left

% solve1(x^2,4*x,S1,S2).
% S1 = 0,
% S2 = 4.

solve1(L,R,S1,S2) :-
 move_to_lhs(L,R,L2,R2),
 R2=0,
 factorise(L2,F),
 F=A*B,
 solve(A,S1),
 solve(B,S2).
move_to_lhs(L1,R1,L2,R2) :-
 L2=L1-R1,R2=0.
factorise(0,0) :- !.
factorise(X^2-N*X,F) :-
 F=X*(X-N).
solve(_-N,N) :- !.
solve(X,0) :- atom(X),!.
 
% solve2(pi*r^2,2*pi*r,S1,S2).
% S1 = 0,
% S2 = 2.
 
solve2(L,R,S1,S2) :-
 simplify(L,R,L1,R1),
 move_to_lhs(L1,R1,L2,R2),
 R2=0,
 factorise(L2,F),
 F=A*B,
 solve(A,S1),
 solve(B,S2).

simplify(pi*X^2,2*pi*X,X^2,2*X) :- !.
