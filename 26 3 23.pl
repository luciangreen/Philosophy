% 26 3 23.pl

% 42 algs

:-include('../listprologinterpreter/listprolog.pl').

% 31.   I prepared to trick a person into believing the robot was human-like.  I did this by creating a robot that approached human likeness.  First, I created the robot's mind.  Second, I created the robot's face.  Third, I created the robot's body.  In this way, I prepared to trick a person into believing the robot was human-like by creating a robot that approached human likeness.

method("book","hard-copy").
method("book","e-book").
method("interpreter","List Prolog Interpreter").
method("interpreter","State Saving Interpreter").
method("interpreter","Neurointerpreter").
method("induction","literary induction"). % through small ideas, works out problems
method("constraint satisfaction solver","constraint satisfaction neurosolver").
method("paraprogramming","metaprogramming"). % given a worked solution, write an algorithm using pattern matching
method("neuronetwork","decision tree"). % to find usually unpredictable values, verify and compute properties of data, with a decision tree that contains cycles based on weights - for example, bb,aa->Aa,Bb is found using an algorithm that finds combos of capitalise words and sort, followed by recognising this combo - it could also recognise first sort then capitalisation

% 1. Conglish allows thought processes to be analysed. It is an analytic perspective for expressing ideas, i.e. looks at the relationships between functional units.

ssi("run",n,v).
ssi("run in ssi",n1,v1). % To avoid data conflicts, n,v etc may need random strings following them

% 11.    I prepared to feed Inky.  I did this by scooping Inky's pellets.  First, I touched the pile of pellets with the scoop.  Second, I scooped the pellets.  Third, I lifted the scoop of pellets up.  In this way, I prepared to feed Inky by scooping Inky's pellets.

inkey :-
 tty_size(R,C),
 X is round(C/2),
 Y is round(R/2),
 move(R,1,C,1,R,X,Y).
 
move(R,X_min,X_max,Y_min,Y_max,X,Y) :-
 tty_goto(X, Y),
 tty_put('*', %R,
 %X,Y),
 1),
 %write('*'),%, 1),
 read_key(Atom),
 (Atom=other->true;
 (move1(X_min,X_max,Y_min,Y_max,Atom,X,Y,X1,Y1),
 move(R,X_min,X_max,Y_min,Y_max,X1,Y1))),!.

move1(_X_min,_X_max,Y_min,_Y_max,up,X,Y,X,Y2) :-
 Y1 is Y-1,
 (Y1 is Y_min-1->Y2=Y;Y2=Y1).
move1(_X_min,_X_max,_Y_min,Y_max,down,X,Y,X,Y2) :-
 Y1 is Y+1,
 (Y1 is Y_max->Y2=Y;Y2=Y1).
move1(X_min,_X_max,_Y_min,_Y_max,left,X,Y,X2,Y) :-
 X1 is X-1,
 (X1 is X_min-1->X2=X;X2=X1).
move1(_X_min,X_max,_Y_min,_Y_max,right,X,Y,X2,Y) :-
 X1 is X+1,
 (X1 is X_max->X2=X;X2=X1).
 
tty_put10(C, R,X,Y) :-
 numbers(R,1,[],Rs),
 findall(_,(member(_,Rs),nl),_),
 numbers(X,1,[],Xs),
 findall(_,(member(_,Xs),write(' ')),_),
 write(C),
 Y1 is R-Y,
 numbers(Y1,1,[],Y1s),
 findall(_,(member(_,Y1s),nl),_).
% From https://swi-prolog.discourse.group/t/how-does-one-read-keyboard-input-using-swi-prolog-without-local-echo-specifically-the-arrow-keys/998

read_key(Atom) :-
   read_key1(Codes),
   codes_key(Codes,Atom).
   
read_key1([Code|Codes]) :-
   get_single_char(Code),
   read_pending_codes(user,Codes,[]).

codes_key([27,91,65],up)    :- !.
codes_key([27,91,66],down)  :- !.
codes_key([27,91,67],right) :- !.
codes_key([27,91,68],left)  :- !.
codes_key(_,other)  :- !.

% 26

% 21.   I prepared to argue for a universal presence of logicism.  I did this by whittling the nuance out.  First, I reflected the subject to act in a bottom-up manner.  Second, I reflected the verb to act in a bottom-up manner.  Third, I reflected the object to act in a bottom-up manner.  In this way, I prepared to argue for a universal presence of logicism by whittling the nuance out.

% bottom_up(subject,A-B,B-C,A-C).
%A = i,
%B = have,
%C = subject.
bottom_up(S,A-B,B-C,A-C) :- bottom_up1(S,A,B,C).
bottom_up1(subject,i,have,subject).
bottom_up1(verb,i,have,verb).
bottom_up1(object,i,have,object).

% 31.    I prepared to make the present.  I did this by smelling the tissue paper.  First, I found the tissue paper, in the wood products section.  Second, I lifted it to my nose.  Third, I smelt it.  In this way, I prepared to I prepared to make the present by smelling the tissue paper.

% findall([A,B],link(A,B),L),findall(P,paths(1,L,[1],P),P2),findall([L2,P3],(member(P3,P2),length(P3,L2)),Z),sort(Z,Z3),append(_,[[_,P4]],Z3),writeln(P4),!.

paths(N,L,P,P) :- not(member([N,_],L)),!.
paths(N,L,P1,P2) :-
 link(N,N2),
 delete(L,[N,_],L2),
 append(P1,[N2],P3),
 paths(N2,L2,P3,P2).
/*
paths(N,L,L,P,P) :- not(member([N,_],L)),!.
paths(N,L,L3,P1,P4) :-
 %append(P1,[N],P3),
 %P1=P3,
 paths2(N,L,L2,L,P1,P2),
 paths3(P2,L2,L3,P2,P4),
 %foldr(append,[P3,P2,P5],P4).
 !.
paths2(_N,L_all,L_all,[],P1,P2) :- %append(P1,[N],P2),
 P1=P2,!.
paths2(N,L_all,L_all3,L,P1,P2) :-
 L=[L1|L2],
 L1=[N,N2],
 %not(member(N,P1)),
 not(member(N2,P1)),
 delete(L_all,L1,L_all2),
 append(P1,[N2],P3),
 paths2(N,L_all2,L_all3,L2,P3,P2).
paths2(N,L_all,L_all3,L,P1,P2) :-
 L=[L1|L2],
 L1=[N3,_N2],
 not(N=N3),
 %delete(L_all,L1,L_all2),
 %append(P1,[N],P3),
 paths2(N,L_all,L_all3,L2,P1,P2).
paths2(N,L_all,L_all3,L,P1,P2) :-
 L=[L1|L2],
 L1=[N3,N2],
 %not(N=N3),
 delete(L_all,[N3,_],L_all2),
 %append(P1,[N],P3),
 paths2(N2,L_all2,L_all3,L2,P1,P2).
paths3([],L,L,P,P) :- !.
paths3(P,L,L2,P1,P2) :-
 P=[P10|P2],
 paths(P10,L,L3,P1,P3),
 paths3(P2,L3,L2,P3,P2).
*/

link(1,2).
link(1,3).
link(1,4).
link(1,5).
link(2,5).
link(2,6).
link(2,3).
link(5,6).
link(3,6).
link(3,4).
link(4,6).
link(4,5).

