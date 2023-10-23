% clp(fd)

:-include('../listprologinterpreter/listprolog.pl').

/*
?- #=(A,1).
A = 1.

?- #=(1,B).
B = 1.

?- #=(1,1).
true.

?- #=(1,2).
false.
*/

#=(A,B) :-
 var(A),not(var(B)),A is B,!.
#=(A,B) :-
 not(var(A)),var(B),B is A,!.
#=(A,B) :-
 not(var(A)),not(var(B)),A is B,!.
 
/*
?- #=(2,A+B,[[A,0,2],[B,0,2]]).
A = 0,
B = 2 ;
A = B, B = 1 ;
A = 2,
B = 0 ;
false.

?- #=(2,A-B,[[A,0,2],[B,0,2]]).
A = 2,
B = 0 ;
false.

?- #=(2,A*B,[[A,0,2],[B,0,2]]).
A = 1,
B = 2 ;
A = 2,
B = 1 ;
false.

?- #=(2,A/B,[[A,1,2],[B,1,2]]).
A = 2,
B = 1 ;
false.

?- #<(2,A+B,[[A,0,2],[B,0,2]]).
A = 1,
B = 2 ;
A = 2,
B = 1 ;
A = B, B = 2 ;
false.

?- #<(2,A-B,[[A,0,2],[B,0,2]]).
false.

?- #<(2,A*B,[[A,0,2],[B,0,2]]).
A = B, B = 2 ;
false.

?- #<(2,A/B,[[A,1,2],[B,1,2]]).
false.

?- #>(2,A+B,[[A,0,2],[B,0,2]]).
A = B, B = 0 ;
A = 0,
B = 1 ;
A = 1,
B = 0 ;
false.

?- #>(2,A-B,[[A,0,2],[B,0,2]]).
A = B, B = 0 ;
A = 0,
B = 1 ;
A = 0,
B = 2 ;
A = 1,
B = 0 ;
A = B, B = 1 ;
A = 1,
B = 2 ;
A = 2,
B = 1 ;
A = B, B = 2 ;
false.

?- #>(2,A*B,[[A,0,2],[B,0,2]]).
A = B, B = 0 ;
A = 0,
B = 1 ;
A = 0,
B = 2 ;
A = 1,
B = 0 ;
A = B, B = 1 ;
A = 2,
B = 0 ;
false.

?- #>(2,A/B,[[A,1,2],[B,1,2]]).
A = B, B = 1 ;
A = 1,
B = 2 ;
A = B, B = 2.

?- #\=(2,A+B,[[A,0,2],[B,0,2]]).
A = B, B = 0 ;
A = 0,
B = 1 ;
A = 0,
B = 2 ;
A = 1,
B = 0 ;
A = B, B = 1 ;
A = 1,
B = 2 ;
A = 2,
B = 0 ;
A = 2,
B = 1 ;
A = B, B = 2 ;
false.

?- #\=(2,A-B,[[A,0,2],[B,0,2]]).
A = B, B = 0 ;
A = 0,
B = 1 ;
A = 0,
B = 2 ;
A = 1,
B = 0 ;
A = B, B = 1 ;
A = 1,
B = 2 ;
A = 2,
B = 0 ;
A = 2,
B = 1 ;
A = B, B = 2 ;
false.

?- #\=(2,A*B,[[A,0,2],[B,0,2]]).
A = B, B = 0 ;
A = 0,
B = 1 ;
A = 0,
B = 2 ;
A = 1,
B = 0 ;
A = B, B = 1 ;
A = 1,
B = 2 ;
A = 2,
B = 0 ;
A = 2,
B = 1 ;
A = B, B = 2 ;
false.

?- #\=(2,A/B,[[A,1,2],[B,1,2]]).
A = B, B = 1 ;
A = 1,
B = 2 ;
A = 2,
B = 1 ;
A = B, B = 2.

*/

#=(C,A+B,[[A,Am,Ax],[B,Bm,Bx]]) :-
 number(C),var(A),var(B),
 numbers(Ax,Am,[],ANs),
 numbers(Bx,Bm,[],BNs),
 member(A,ANs),
 member(B,BNs),
 C is A+B.

#=(C,A-B,[[A,Am,Ax],[B,Bm,Bx]]) :-
 number(C),var(A),var(B),
 numbers(Ax,Am,[],ANs),
 numbers(Bx,Bm,[],BNs),
 member(A,ANs),
 member(B,BNs),
 C is A-B.

#=(C,A*B,[[A,Am,Ax],[B,Bm,Bx]]) :-
 number(C),var(A),var(B),
 numbers(Ax,Am,[],ANs),
 numbers(Bx,Bm,[],BNs),
 member(A,ANs),
 member(B,BNs),
 C is A*B.

#=(C,A/B,[[A,Am,Ax],[B,Bm,Bx]]) :-
 number(C),var(A),var(B),
 numbers(Ax,Am,[],ANs),
 numbers(Bx,Bm,[],BNs),
 member(A,ANs),
 member(B,BNs),
 C is A/B.
 
 
#<(C,A+B,[[A,Am,Ax],[B,Bm,Bx]]) :-
 number(C),var(A),var(B),
 numbers(Ax,Am,[],ANs),
 numbers(Bx,Bm,[],BNs),
 member(A,ANs),
 member(B,BNs),
 C < A+B.

#<(C,A-B,[[A,Am,Ax],[B,Bm,Bx]]) :-
 number(C),var(A),var(B),
 numbers(Ax,Am,[],ANs),
 numbers(Bx,Bm,[],BNs),
 member(A,ANs),
 member(B,BNs),
 C < A-B.

#<(C,A*B,[[A,Am,Ax],[B,Bm,Bx]]) :-
 number(C),var(A),var(B),
 numbers(Ax,Am,[],ANs),
 numbers(Bx,Bm,[],BNs),
 member(A,ANs),
 member(B,BNs),
 C < A*B.

#<(C,A/B,[[A,Am,Ax],[B,Bm,Bx]]) :-
 number(C),var(A),var(B),
 numbers(Ax,Am,[],ANs),
 numbers(Bx,Bm,[],BNs),
 member(A,ANs),
 member(B,BNs),
 C < A/B.
  

#>(C,A+B,[[A,Am,Ax],[B,Bm,Bx]]) :-
 number(C),var(A),var(B),
 numbers(Ax,Am,[],ANs),
 numbers(Bx,Bm,[],BNs),
 member(A,ANs),
 member(B,BNs),
 C > A+B.

#>(C,A-B,[[A,Am,Ax],[B,Bm,Bx]]) :-
 number(C),var(A),var(B),
 numbers(Ax,Am,[],ANs),
 numbers(Bx,Bm,[],BNs),
 member(A,ANs),
 member(B,BNs),
 C > A-B.

#>(C,A*B,[[A,Am,Ax],[B,Bm,Bx]]) :-
 number(C),var(A),var(B),
 numbers(Ax,Am,[],ANs),
 numbers(Bx,Bm,[],BNs),
 member(A,ANs),
 member(B,BNs),
 C > A*B.

#>(C,A/B,[[A,Am,Ax],[B,Bm,Bx]]) :-
 number(C),var(A),var(B),
 numbers(Ax,Am,[],ANs),
 numbers(Bx,Bm,[],BNs),
 member(A,ANs),
 member(B,BNs),
 C > A/B.

#\=(C,A+B,[[A,Am,Ax],[B,Bm,Bx]]) :-
 number(C),var(A),var(B),
 numbers(Ax,Am,[],ANs),
 numbers(Bx,Bm,[],BNs),
 member(A,ANs),
 member(B,BNs),
 C \= A+B.

#\=(C,A-B,[[A,Am,Ax],[B,Bm,Bx]]) :-
 number(C),var(A),var(B),
 numbers(Ax,Am,[],ANs),
 numbers(Bx,Bm,[],BNs),
 member(A,ANs),
 member(B,BNs),
 C \= A-B.

#\=(C,A*B,[[A,Am,Ax],[B,Bm,Bx]]) :-
 number(C),var(A),var(B),
 numbers(Ax,Am,[],ANs),
 numbers(Bx,Bm,[],BNs),
 member(A,ANs),
 member(B,BNs),
 C \= A*B.

#\=(C,A/B,[[A,Am,Ax],[B,Bm,Bx]]) :-
 number(C),var(A),var(B),
 numbers(Ax,Am,[],ANs),
 numbers(Bx,Bm,[],BNs),
 member(A,ANs),
 member(B,BNs),
 C \= A/B.
