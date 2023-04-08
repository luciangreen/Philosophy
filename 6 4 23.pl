% 6 4 23.pl

% 42

:-include('../listprologinterpreter/listprolog.pl').

% 1. How to use cut off infinite data.

% cut1(-aleph,aleph,X3,X4).
% X3 = -m,
% X4 = n.

% cut1(-2,3,X3,X4).
% X3 = -2,
% X4 = 3.

cut1(X1,X2,X3,X4) :-
 cut2(X1,X3),
 cut2(X2,X4).
cut2(-aleph,-m) :- !.
cut2(aleph,n) :- !.
cut2(X,X) :- !.

% 11.    I prepared to sum the two numbers.  I did this by observing an object travel along a finite path in the computer simulation to me.  First, I tied a knot in the first quipu string.  Second, I tied a knot in the second quipu string.  Third, I tied a knot in the third quipu string at the sum of the distances between the starts of the strings and the knots.  In this way, I prepared to sum the two numbers by observing an object travel along a finite path in the computer simulation to me.

% add1(1,2,C).
% C = 3.

add1(A,B,C) :-
 var(C),
 length(A1,A),
 length(B1,B),
 append(A1,B1,C1),
 length(C1,C).

/*
?- add1(A,B,3).                                                                 A = 0,
B = 3 ;
A = 1,
B = 2 ;
A = 2,
B = 1 ;
A = 3,
B = 0 ;
*/

add1(A,B,C) :-
 var(A),
 var(B),
 length(C1,C),
 append(A1,B1,C1),
 length(A1,A),
 length(B1,B).

% 21.    I prepared to verify the correctness of the political statement.  I did this by being a perfect political colleague.  First, I listened to the reason given by the politician.  Second, I verified the reason against peer-reviewed double blind legal research.  Third, I handed in the report to the politician.  In this way, I prepared to verify the correctness of the political statement by being a perfect political colleague.

% Person A enters data

/*
?- double_blind([0,1],C),writeln(C).
Person B, please enter the results.
1
|: a
0
|: b
Person A, here are the ordered results.
[[0,b],[1,a]]
*/

double_blind([A,B],C) :-
 random(X),X1 is floor(2*X),
 (X1=0->D=[A,B];D=[B,A]),
 writeln("Person B, please enter the results."),
 findall([E,S],(member(E,D),writeln(E),read_string(user_input,"\n\r","\n\r",_,S)),[F1,F2]),
 writeln("Person A, here are the ordered results."),
 (X1=0->C=[F1,F2];C=[F2,F1]).

% 31.    I prepared to write how God invents pathways.  I did this by writing an original argument about Lucianic Meditation in my essay about the intersection of Heidegger and Daoism.  First, I read the literature.  Second, I thought of the universal implication of the literature.  Third, I wrote how the structure of Lucianic Meditation was similar to the structure of Daoism as pointed out by Heidegger.  In this way, I prepared to write how God invents pathways by writing an original argument about Lucianic Meditation in my essay about the intersection of Heidegger and Daoism.

% create matrix, create blocks, create straight line through remaining space, find left or right hand rule ()until shortest path is found, ()count steps so far
 
/*
find_path(20,30,10,1,25).

^*------------------
-^----------*-------
--^-----------------
---^^---------------
-----^--------------
------^-------------
-------^-------*----
--------^^*-----*---
----------^---------
-----------^--------
------------^-------
-------------^^-----
---------------^----
---*------------^---
-----------------^--
------------------^^
--------------------
--------------------
--------------------
--------------------
--------------------
--------------------
--------------------
------------*-------
----*---------------
------*-------------
----*---------------
--------------------
--------------------
--------------------


find_path(5,5,3,1,5).                                                              

-----
^-*--
-^---
--^^^
--**-


find_path(20,30,100,1,25).

^---------**--*-----
-^^^^^*---*-*-----*-
--*--^*-*---*--*----
-----^**-^^^^^^^^^^^
-*---^^^^^*----*-*-^
--*------*-*--*----^
-----------***-----^
--------*-*----*---^
----*----*---*-*---^
-----*---*---------^
------*--*--*-----*^
---**--*-----*-----^
-------*-*---*-*---^
----------------*--^
-*-----------------^
-*--*-*-*---***-*-*^
----------*--*-----^
--*----*-----------^
------*--------*-*-^
-*------*------*--*^
-*-*---**-**-***---^
-**---*---*-*------^
----*----------*---^
----------*-------*^
----------**----*---
--*-----*---**------
-*------------------
-------*------------
------*--*--------*-
-*-*----------------
                                                            find_path(20,30,500,1,25).
false.

find_path(20,30,200,1,25).
^-*--****--*-*-*-*--
-^**-*------*---**--
--^*---*---*--*-----
-**^*-----***----*--
^^^^*----*-*--*-**--
^**-*--*--*-***-----
^^^*****-*-*-**-*---
^^^-***-*--*---**---
^**-**-*-------*----
^^*--*-**---*--**---
^^***------*-***----
^*-*--*-*-***---*---
^-*-***-*-----------
^*-*----*------***--
^^^^^^*--*----------
--**-^^^^***---*--*-
-------*^**--*--*---
---*----^^****------
----*-*--^-*-*---*--
--**-*---^*--*-****-
-********^^-*-***---
-*----**-^^*--**-*--
-----*--*^*--*-*----
-----*-*-^-**--*--*-
-*--*****^***----^^-
-***----*^^^-*^^^^*-
--**--*-*^^^*^^**-*-
-**------^**^^*--*--
-*----**-^^^^**---*-
---*-*---*--*---**--

*/
find_path(X,Y,Blocks,Y1,Y2) :-
 create_matrix(X,Y,Matrix1),
 create_blocks(Blocks,X,Y,Matrix1,Matrix2),
 create_straight_line_through_remaining_space(Y1,Y2,X,Matrix2,Matrix21,Blocked_coords),
 (Blocked_coords=[]->Matrix3=Matrix21;
 (%trace,
 Blocked_coords=[[X3,Y3]],
 %repeat,
 right_hand_rule(X3,Y3,X,Y,X,Y2,Matrix21,Matrix3))),
 print_matrix(X,Y,Matrix3),
 !.
 
create_matrix(X,Y,Matrix) :-
 %X is 20, Y is 20,
 numbers(X,1,[],Xs),
 numbers(Y,1,[],Ys),
 findall([X1,Y1,(-)],(member(Y1,Ys),member(X1,Xs)),Matrix).

create_blocks(Blocks,X,Y,Matrix1,Matrix2) :-
 %Blocks is 10,
 create_blocks1(Blocks,X,Y,Matrix1,Matrix2).

create_blocks1(0,_,_,Matrix,Matrix) :- !.
create_blocks1(Blocks,X,Y,Matrix2,Matrix3) :-
 repeat,
 random(X2),X1 is 1+ceiling((X-2)*X2),
 random(Y2),Y1 is ceiling(Y*Y2),
 not(member([X1,Y1,*],Matrix2)),
 delete(Matrix2,[X1,Y1,_],Matrix4),
 append(Matrix4,[[X1,Y1,*]],Matrix5),
 Blocks1 is Blocks-1,
 create_blocks1(Blocks1,X,Y,Matrix5,Matrix3),!.

create_straight_line_through_remaining_space(Y1,Y2,X_max,Matrix1,Matrix2,Blocked_coords) :-
  
 M is (X_max-1)/(Y2-Y1),
 C is Y1,
 Curr_X1 is 1,
 Curr_Y1 is floor(M*1)+C,
  create_straight_line_through_remaining_space_forwards(1,M,C,X_max,Curr_X1,Curr_Y1,Matrix1,Matrix2,[],Blocked_coords).
 
  create_straight_line_through_remaining_space_forwards(X_max1,_,_,X_max,_Curr_X1,_Curr_Y1,Matrix,Matrix,Blocked_coords,Blocked_coords) :-
  X_max1 is X_max+1,!. 
  create_straight_line_through_remaining_space_forwards(X,M,C,X_max,Curr_X1,Curr_Y1,Matrix1,Matrix2,Blocked_coords1,Blocked_coords2) :-
 Y is floor(M*X)+C,
 (member([X,Y,(-)],Matrix1)->
 (delete(Matrix1,[X,Y,_],Matrix4),
 append(Matrix4,[[X,Y,'^']],Matrix5),
 XN is X+1,
 create_straight_line_through_remaining_space_forwards(XN,M,C,X_max,X,Y,Matrix5,Matrix2,Blocked_coords1,Blocked_coords2));
 (%Matrix1=Matrix2,
 delete(Matrix1,[Curr_X1,Curr_Y1,_],Matrix4),
 append(Matrix4,[[Curr_X1,Curr_Y1,(-)]],Matrix2),
 append(Blocked_coords1,[[Curr_X1,Curr_Y1]],Blocked_coords2))),!.
 
right_hand_rule(X,Y,_X_max,_Y_max,X,Y,Matrix,Matrix).
right_hand_rule(X,Y,X_max,Y_max,X_goal,Y_goal,Matrix1,Matrix2) :-
 X1 is X+1,Y1 is Y,
 not(X1 is X_max+1),
 member([X,Y,(-)],Matrix1),
 delete(Matrix1,[X,Y,_],Matrix3),
 append(Matrix3,[[X,Y,'^']],Matrix4),
 right_hand_rule(X1,Y1,X_max,Y_max,X_goal,Y_goal,Matrix4,Matrix2).
right_hand_rule(X,Y,X_max,Y_max,X_goal,Y_goal,Matrix1,Matrix2) :-
 X1 is X,Y1 is Y+1,
 not(Y1 is Y_max+1),
 member([X,Y,(-)],Matrix1),
 delete(Matrix1,[X,Y,_],Matrix3),
 append(Matrix3,[[X,Y,'^']],Matrix4),
 right_hand_rule(X1,Y1,X_max,Y_max,X_goal,Y_goal,Matrix4,Matrix2).
right_hand_rule(X,Y,X_max,Y_max,X_goal,Y_goal,Matrix1,Matrix2) :-
 X1 is X-1,Y1 is Y,
 not(X1 is 0-1),
 member([X,Y,(-)],Matrix1),
 delete(Matrix1,[X,Y,_],Matrix3),
 append(Matrix3,[[X,Y,'^']],Matrix4),
 right_hand_rule(X1,Y1,X_max,Y_max,X_goal,Y_goal,Matrix4,Matrix2).
right_hand_rule(X,Y,X_max,Y_max,X_goal,Y_goal,Matrix1,Matrix2) :-
 X1 is X,Y1 is Y-1,
 not(Y1 is 0-1),
 member([X,Y,(-)],Matrix1),
 delete(Matrix1,[X,Y,_],Matrix3),
 append(Matrix3,[[X,Y,'^']],Matrix4),
 right_hand_rule(X1,Y1,X_max,Y_max,X_goal,Y_goal,Matrix4,Matrix2).
 
print_matrix(X,Y,Matrix) :-
 numbers(X,1,[],Xs),
 numbers(Y,1,[],Ys),
 findall(_,(member(Y1,Ys),findall(_,(member(X1,Xs),member([X1,Y1,C],Matrix),write(C)),_),nl),_).

% 32 done

% Some features allow greater variation in Computational English, while the program is limited to rational principles. In theory it could detect contradictions and recognise abstract, metaphorical or other forms. Synonyms and synogrammars (grammars with the same meaning) substituted for words and phrases allow for a different form. Clauses in sentences can be substituted, allowing more variation. If two sentences are used where one would normally be used, the program can integrate them into a single sentence. There are rules for selecting sentences as evidence, like order and causality. I am writing a paper on variation in Computational English. I can let you know when it is available.

:-include('maths_formulas.pl').

true11(2*3,6).
true11(3/2,1.5).
true11(2+3,5).
true11(2-3,-1).
true11(6,6).
true11(round(1+0.1),1).
true11(ceiling(0.9),1).
true11(floor(0.5),0).

% true1.                                                     
% true

true1 :-
 forall(true11(A,B),not(contradiction(A,B))).
 
contradiction(A,B) :-
 formula(A,A1),
 formula(B,B1),
 not(A1=B1).
 