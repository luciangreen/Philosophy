% 2 4 23.pl

% 42 algs

:-include('26 3 23.pl').
%:-include('1 4 23.pl').

% 31.    I prepared to connect the students' thoughts together.  I did this by writing 50 breasonings per connection between sentences in philosophy.  First, I constructed the train track.  Second, I placed the train on it.  Third, I let the train drive on the track.  In this way, I prepared to connect the students' thoughts together by writing 50 breasonings per connection between sentences in philosophy.

% distribute thoughts, find jump lists

person1(anita).
person1(john).
person1(peter).
person1(susan).
person1(susie).
person1(aaron).
person1(hamilton).
person1(albert).
person1(bei-en).
person1(heshan).
person1(manaia).

% connect_thoughts(A),writeln(A).
% [[3,heshan],[12,albert],[21,albert],[30,aaron],[39,bei-en],[48,albert],[57,albert],[66,susan],[75,manaia],[84,susie],[93,anita]]

connect_thoughts(L2) :-
 distribute_thoughts(L),
 find_jump_lists(L,L2).

distribute_thoughts(L) :-
 findall(N,person1(N),N1),
 numbers(100,1,[],Ns),
 findall([N2,P],(member(N2,Ns),random_member(P,N1)),L).
 
find_jump_lists(L1,L2) :-
 random_member(Start,[1,2,3,4,5,6,7,8,9,10]),
 random_member(Jump,[2,3,4,5,6,7,8,9]),
 jump(Start,Jump,100,L1,[],L2).
  
jump(Start,_Jump,Limit,_L1,L2,L2) :- Start >= Limit,!.
jump(Start,Jump,Limit,L1,L21,L22) :-
 member([Start,Name],L1),
 append(L21,[[Start,Name]],L23),
 Start2 is Start+Jump,
 jump(Start2,Jump,Limit,L1,L23,L22),!.

% 17

% 1a.     I prepared to reassure Hamlet.  I did this by holding the skull.  First, the clown entertained me.  Second, I was at the deathbed of the clown.  Third, I held the skull of the clown when digging the grave for the girl.  In this way, I prepared to reassure Hamlet by holding the skull.


/*
closer(0,0,0,1,2,0).                                                         true.
closer(0,0,0,1,0.2,0).
false.
*/

closer(X1,Y1,X2,Y2,X3,Y3) :-
 D1 is sqrt((X2-X1)^2+(Y2-Y1)^2),
 D2 is sqrt((X3-X1)^2+(Y3-Y1)^2),
 D1 < D2. 

% 11.    I prepared to experience the art forms of God (the master).  I did this by trusting God (the master).  First, I trusted the art of the master.  Second, I trusted the music of the master.  Third, I trusted the architecture of the master.  In this way, I prepared to experience the art forms of God (the master) by trusting God (the master).

/*
?- house_cross_section([r1,r2,r3],[1,1.5],A).
A = [[r1, 1], [r2, 1], [r3, 1]].

?- house_cross_section([r1,r2,r3],[1,1.5],A).
A = [[r1, 1.5], [r2, 1], [r3, 1]].
*/
house_cross_section(Rs,Ls,A) :-
 findall([R,L],(member(R,Rs),random_member(L,Ls)),A).

% 23

% 21.   I prepared to scroll the text down and add a new conclusion at the vanishing point on the horizon.  I did this by concluding a new conclusion from two conclusions.  First, I read the first conclusion.  Second, I read the second conclusion.  Third, I wrote a third conclusion formed from the first clause in the first conclusion and the second clause in the second conclusion.  In this way, I prepared to scroll the text down and add a new conclusion at the vanishing point on the horizon by concluding a new conclusion from two conclusions.

setting1([
"(  )  ( )  () ( )  (  )  ()",
"^     ^      ^       ^    ^",
".  . ..  . . ...   . .. . .",
"(  )  ( )  () ( )  (  )  ()",
"^     ^      ^       ^    ^",
".  . ..  . . ...   . .. . .",
"(  )  ( )  () ( )  (  )  ()",
"^     ^      ^       ^    ^",
".  . ..  . . ...   . .. . ."]).

window_x(7).
window_y(7).

inkey_pic :-
 window_x(R),
 window_y(C),
 setting1(S),
 verify(S,X1,Y1),
 convert_to_matrix(S,X1,Y1,Matrix),

 tty_size(R1,_C),
 X is 1,%round(C/2),
 Y is R-2,%round(R/2),
 move(R1,C,R,1,X1,1,Y1,X,Y,Matrix).
 
verify(Plane,X1,Y1) :-
 %length(Grid,Z1),
 
 %member(Plane,Grid),
 length(Plane,Y1),
 %forall(member(Plane1,Grid),
 %length(Plane1,Y1)),
 
 member(Line,Plane),
 string_length(Line,X1),
 forall(member(Line1,Plane),
 string_length(Line1,X1)).

convert_to_matrix(Grid,X1,Y1,Matrix) :-
 %numbers(Z1,1,[],Zs),
 findall([X,Y,Char],(%member(Z,Zs),
 %get_item_n(Grid,Z,Plane),
 numbers(Y1,1,[],Ys),
 %findall(*,(
 member(Y,Ys),
 get_item_n(Grid,Y,Line),
 string_chars(Line,Chars),
 numbers(X1,1,[],Xs),
 %findall(*,(
 member(X,Xs),
 get_item_n(Chars,X,Char)),Matrix).
 
move(R,Win_X,Win_Y,X_min,X_max,Y_min,Y_max,X,Y,Matrix) :-
 %tty_goto(X, Y),
 tty_put101(%'*',
 Win_X,Win_Y,
  R,
 X,Y,Matrix),
 %1
 %write('*'),%, 1),
 read_key(Atom),
 (Atom=other->true;
 (move1(Win_X,Win_Y,X_min,X_max,Y_min,Y_max,Atom,X,Y,X1,Y1),
 move(R,Win_X,Win_Y,X_min,X_max,Y_min,Y_max,X1,Y1,Matrix))),!.

move1(_Win_X,Win_Y,_X_min,_X_max,Y_min,_Y_max,up,X,Y,X,Y2) :-
 Y1 is Y-1,
 (Y1 is Y_min+3
 ->Y2=Y;Y2=Y1).
move1(_Win_X,_Win_Y,_X_min,_X_max,_Y_min,Y_max,down,X,Y,X,Y2) :-%trace,
 Y1 is Y+1,
 (Y1 is Y_max%+Win_Y%+1
 ->Y2=Y;Y2=Y1).
move1(_Win_X,_Win_Y,X_min,_X_max,_Y_min,_Y_max,left,X,Y,X2,Y) :-
 X1 is X-1,
 (X1 is X_min-1->X2=X;X2=X1).
move1(Win_X,_Win_Y,_X_min,X_max,_Y_min,_Y_max,right,X,Y,X2,Y) :-
 X1 is X+1,
 (X1 is X_max-Win_X+1
 ->X2=X;X2=X1).

tty_put101(%C,
 Win_X,Win_Y,
 R,X,Y,Matrix) :-
 numbers(R,1,[],Rs),
 findall(_,(member(_,Rs),nl),_),
 
 Y1 is Y+1,%+2*Win_Y,
 X1 is X+Win_X,
 numbers(Y1,1,[],Ys),
 numbers(X1,X,[],Xs),
 findall(_,(member(Y2,Ys),
 findall(_,(member(X2,Xs),member([X2,Y2,C],Matrix),
 write(C)),_),writeln("")),_),

 %findall(_,(member(_,Xs),write(' ')),_),
 %write(C),
 Y11 is R-Win_Y,%Y,%Y1+1,
 numbers(Y11,1,[],Y1s),
 findall(_,(member(_,Y1s),nl),_).

% 35

% ["Green, L 2021, <i>Exploring opposites in Hamlet 4 of 4</i>, Lucian Academy Press, Melbourne.","Green, L 2021",1,"COMPUTATIONAL ENGLISH

% 31.    I prepared to declare Hamlet a success.  I did this by agreeing with Hamlet.  First, I observed Hamlet avoid all the action.  Second, I observed Hamlet avoid suicide.  Third, I observed Hamlet avoid becoming a murderer.  In this way, I prepared to declare Hamlet a success by agreeing with Hamlet.

/*
?- evader(5,N1),writeln(N1).
N1 = [[6, 6], [1, 6], [5, 2], [4, 3], [2, 1]].

?- evader(6,N1),writeln(N1).
false.

?- evader(5,N1),writeln(N1).
N1 = [[3, 1], [3, 6], [3, 3], [5, 6], [3, 3]].

?- evader(6,N1),writeln(N1).
N1 = [[7, 3], [4, 7], [1, 1], [5, 1], [8, 5], [1, 6]].
*/

evader(N,N1) :-
 evader(N,[],N1).
evader(0,N1,N1) :- !.
evader(N,N0,N1) :-
 random_member(X,[1,2,3,4,5,6,7,8]),
 random_member(Y,[1,2,3,4,5,6,7,8]),
 XM is X-1,
 XP is X+1,
 YM is Y+1,
 YP is Y+1,
 not(member([XM,YM],N0)),
 not(member([XM,Y],N0)),
 not(member([XM,YP],N0)),
 not(member([X,YM],N0)),

 not(member([X,YP],N0)),
 not(member([XP,YM],N0)),
 not(member([XP,Y],N0)),
 not(member([XP,YP],N0)),
 append(N0,[[X,Y]],N01),
 NN is N-1,
 evader(NN,N01,N1).
 
