% 1 4 23.pl

% 42 algs

:-include('../listprologinterpreter/listprolog.pl').

% 1.     I prepared to visualise the dimensions of the object that a word represented.  I did this by writing the words on the pedagogy screen.  First, I set up the pedagogy screen.  Second, I wrote down the words on it.  Third, I drew the object on the screen.  In this way, I prepared to visualise the dimensions of the object that a word represented by writing the words on the pedagogy screen.

object(
[
[
"*   ",
"*   ",
"*   "],
[
"*   ",
"**  ",
"*   "],
[
"    ",
"    ",
"    "]
]).

/*
object(
[
 [
 [*,-,-],
 [*,-,-],
 [*,-,-]
 ],
 [
 [*,-,-],
 [*,*,-],
 [*,-,-]
 ],
 [
 [-,-,-],
 [-,-,-],
 [-,-,-]
 ]
]).
*/
% verify,convert to matrix, find min,max x,y,z, find diff (dimensions)

% dimensions(X,Y,Z).
% X = Z, Z = 2,
% Y = 3.

dimensions(X,Y,Z) :-
 object(Grid),
 %find_bounds(Grid,X1,Y1,Z1),
 verify(Grid,X1,Y1,Z1),
 convert_to_matrix(Grid,X1,Y1,Z1,Matrix),
 find_min_max_x_y_z(Matrix,Min_X,Max_X,Min_Y,Max_Y,Min_Z,Max_Z),
 find_dimensions(Min_X,Max_X,Min_Y,Max_Y,Min_Z,Max_Z,X,Y,Z),
 !.
 
verify(Grid,X1,Y1,Z1) :-
 length(Grid,Z1),
 
 member(Plane,Grid),
 length(Plane,Y1),
 forall(member(Plane1,Grid),
 length(Plane1,Y1)),
 
 member(Line,Plane),
 string_length(Line,X1),
 forall(member(Line1,Plane),
 string_length(Line1,X1)).

convert_to_matrix(Grid,X1,Y1,Z1,Matrix) :-
 numbers(Z1,1,[],Zs),
 findall([X,Y,Z,Char],(member(Z,Zs),
 get_item_n(Grid,Z,Plane),
 numbers(Y1,1,[],Ys),
 %findall(*,(
 member(Y,Ys),
 get_item_n(Plane,Y,Line),
 string_chars(Line,Chars),
 numbers(X1,1,[],Xs),
 %findall(*,(
 member(X,Xs),
 get_item_n(Chars,X,Char)),Matrix).

find_min_max_x_y_z(Matrix,Min_X,Max_X,Min_Y,Max_Y,Min_Z,Max_Z) :-
 findall(X,(member([X,_Y,_Z,C],Matrix),C=(*)),Xs),
 sort(Xs,Xs2),
 append([Min_X],_,Xs2),
 append(_,[Max_X],Xs2),

 findall(Y,(member([_X,Y,_Z,C],Matrix),C=(*)),Ys),
 sort(Ys,Ys2),
 append([Min_Y],_,Ys2),
 append(_,[Max_Y],Ys2),

 findall(Z,(member([_X,_Y,Z,C],Matrix),C=(*)),Zs),
 sort(Zs,Zs2),
 append([Min_Z],_,Zs2),
 append(_,[Max_Z],Zs2).

 find_dimensions(Min_X,Max_X,Min_Y,Max_Y,Min_Z,Max_Z,X,Y,Z) :-
 X is Max_X-Min_X+1,
 Y is Max_Y-Min_Y+1,
 Z is Max_Z-Min_Z+1.

% 9

% 11.    I prepared to test that the giraffe had a long enough neck.  I did this by testing the assignment with students.  First, I tested the hypotenuse.  Second, I tested the giraffe.  Third, I tested the hiraffe (sic).  In this way, I prepared to test that the giraffe had a long enough neck by testing the assignment with students.

% length1(3,5,L).
% L = 4.0.

length1(A,C,Length) :- Length is sqrt(C^2-A^2).

% 21.   I prepared to report the crime.  I did this by identifying the murder (in fact, drinking tea).  First, I identified that no one knew when the murder would occur.  Second, I identified when it would happen.  Third, I identified that it happened.  In this way, I prepared to report the crime by identifying the murder (in fact, drinking tea).

% report1(Ts).
% Ts = [5].

time1(1,nothing).
time1(2,nothing).
time1(3,nothing).
time1(4,nothing).
time1(5,murder).
time1(6,nothing).
time1(7,nothing).

report1(Times) :- findall(Time1,time1(Time1,murder),Times).

% 31.    I prepared to transform vegetarians.  I did this by eating the vegan nuggets.  First, I served the vegetarian rice paper roll.  Second, I walked to the next table.  Third, I ate the vegan nuggets.  In this way, I prepared to transform vegetarians by eating the vegan nuggets.

% matrix_finder1([[[0,1],[-1,0]],[[1,0],[0,1]]],Matrix).

% Matrix = [[0, -1.0], [1.0, 0]].

matrix_finder1(Ms,Ma) :-
 Ms=[[M1,M2]|M3],
 matrix_finder(M1,M2,Ma),
 forall(member([M11,M12],M3),matrix_finder(M11,M12,Ma)),!.
 
matrix_finder([I1,I2],[O1,O2],[[Ma1,Ma2],[Ma3,Ma4]]) :-
 degree(D),
 multiplier(M1),
 cos_or_sin(CS1),
 (CS1=cos->cos1(D,CS11);sin1(D,CS11)),
 multiplier(M2),
 cos_or_sin(CS2),
 (CS2=cos->cos1(D,CS21);sin1(D,CS21)),
 multiplier(M3),
 cos_or_sin(CS3),
 (CS3=cos->cos1(D,CS31);sin1(D,CS31)),
 multiplier(M4),
 cos_or_sin(CS4),
 (CS4=cos->cos1(D,CS41);sin1(D,CS41)),
 epsilon(E),
 
 Ma1 is M1*CS11,
 Ma2 is M2*CS21,
 Ma3 is M3*CS31,
 Ma4 is M4*CS41,
 
 O11 is I1*Ma1+I2*Ma2,
 O21 is I1*Ma3+I2*Ma4,
 
 O11 < O1+E,
 O11 > O1-E,

 O21 < O2+E,
 O21 > O2-E.
 
 
degree(90).
degree(-90).
multiplier(1).
multiplier(-1).
cos_or_sin(cos).
cos_or_sin(sin).
epsilon(0.000001).

% 30

cos1(Deg,Cos_D) :- Cos_D1 is cos(Deg*pi/180), 
 epsilon(E), ((Cos_D1 < E, Cos_D1 > -E)-> Cos_D is 0; Cos_D = Cos_D1).
sin1(Deg,Sin_D) :- Sin_D1 is sin(Deg*pi/180), 
 epsilon(E), ((Sin_D1 < E, Sin_D1 > -E) -> Sin_D is 0; Sin_D = Sin_D1).

% 1. In a binary opposition, one will be stronger. This is because one starts at it (it is the origin). The contention is exploring the relationship/directionality/methodology between two fundamental objects which have a relation.

% and1([[a,b,c],[a,d,c],[e,f]],[a,c],Lines).
% Lines = [[a, b, c], [a, d, c]]

and1(Lines1,Conj,Lines2) :-
 findall(L,(member(L,Lines1),subtract(Conj,L,L3),L3=[]),Lines2).

% 11.    I prepared to enjoy a high quality of life.  I did this by employing a legal consultant to help legally protect educational institutions.  First, I wrote a contract to protect the organisation from donated land being revoked.  Second, I wrote a contract so that people who had been emoyed to provide services wouldn't break their contracts.  Third, I wrote a contract to protect the organisation from donated money being revoked.   In this way, I prepared to enjoy a high quality of life by employing a legal consultant to help legally protect educational institutions.

/*
?- revoke([land,contract,money],R).
R = true.

?- revoke([land],R).
R = true.

?- revoke([else],R).
R = false.

?- revoke([contract,money],R).                                             
R = true.

?- revoke([],R).
R = false.
*/

revoke(Items,R) :-
 ((member(land,Items)->true;
 (member(contract,Items)->true;
 (member(money,Items))))->R=true;R=false).
 
% 36

% COMPUTATIONAL ENGLISH by Lucian Green Drawing connections 3 of 4.txt

% 21.   I prepared to equate Plato's soul (including the mind and body) with the soul created by 50 As (16 250 breasoning As) in Lucianic Computational English.  I did this by writing 16 250 breasoning areas of study influenced by Plato's forms about Computational English.  First, I equated the Platonic body with Lucianic Computational English bodily developed things.  Second, I equated the Platonic mind with the Lucianic Computational English mental ontological states.  Third, I equated the Platonic soul with the Lucianic Computational English continual soulful aimingness (sic).  In this way, I prepared to equate Plato's soul (including the mind and body) with the soul created by 50 As (16 250 breasoning As) in Lucianic Computational English by writing 16 250 breasoning areas of study influenced by Plato's forms about Computational English.

% does each direction have 50 As?

dir(1,2,true).
dir(2,3,true).
dir(3,1,true).
dir(2,1,true).
dir(3,2,true).
dir(1,3,true).

dirs_true :- forall((member(A,[1,2,3]),member(B,[1,2,3]),not(A=B)),
dir(A,B,true)).

% 43
