% p2a.pl
% Prolog to Assembly

% eg long form Prolog, ancestor, sum

% recursion is a loop

% long form Prolog doesn't allow [A|B] in output vars in header, but appends before rec call

% a.pl
% assembly interpreter

% load, store in mem, move mem to r, +1 r+n=r, +2 r+r=r, jmp, end
% later: ^

/*
Memory size=5
registers=8

1: load 1 to R4
2: store R4 to M1
3: load 2 to R5
4: store R5 to M2
5: load 3 to R6
6: store R6 to M3
7: load 4 to R7
8: store R7 to M4
9: load 5 to R8
10: store R8 to M5
11: load 5 to R1
12: load 0 to R3
13: if R1=0, jump to 18
14: move (memory) R1 to R2
15: R3=R3+R2
16: R1=R1+-1
17: jump to 13
18: end

Result: R3=1+2+3+4+5=15

*/

:-include('../listprologinterpreter/listprolog.pl').

test_a :-
 test_a1(T),
 (findall([N,Res],(member([N,In,MN,RN,Res1],T),
 ((pp_a(1,In,MN,RN,M2,R2),forall(member([Type,Num,Res0],Res1),((Type=m->member([Num,Res0],M2);(Type=r,member([Num,Res0],R2))))))->Res=success;Res=fail),writeln([N,Res])),_Res2)).
 
test_a1(
[
 [1,[

[1,l,1,4],
[2,s,4,1],
[3,l,2,5],
[4,s,5,2],
[5,l,3,6],
[6,s,6,3],
[7,l,4,7],
[8,s,7,4],
[9,l,5,8],
[10,s,8,5],
[11,l,5,1],
[12,l,0,3],
[13,j,1,0,18],
[14,m,1,2],
[15,p2,2,3,3],
[16,p1,1,-1,1],
[17,j,13],
[18,e]

],5,8,[[r,3,15]]]

]).

pp_a(L,In,MN,RN,M2,R2) :-
 a(L,In,MN,RN,M2,R2),
 writeln('instructions:'),
 findall(_,(member(X,In),writeln(X)),_),
 nl,
 writeln('final memory:'),
 writeln(M2),
 nl,
 writeln('final registers:'),
 writeln(R2).

a(L1,In,MN,RN,M2,R2):-
 init(MN,M1),init(RN,R1),
 a2(L1,In,M1,M2,R1,R2).
init(N,List) :-
 numbers(N,1,[],Ns),
 findall([N1,0],member(N1,Ns),List).
 
a2(L,In,M1,M2,R1,R2) :-
 Trace=off,
 (Trace=on->writeln([call,L,In,M1,_,R1,_]);true),
 %read_string(user_input,"\n\r","\n\r",_,_),
 %get_single_char(_),
 (a1(L,In,M1,M2,R1,R2)->
 (Trace=on->writeln([exit,L,In,M1,M2,R1,R2]);true);
 ((Trace=on->writeln([fail,L,In,M1,_,R1,_]);true),fail)).
 
a1(L,In,M,M,R,R) :-
 member([L,e],In),!.
a1(L,In,M1,M2,R1,R2) :-
 member([L,l,N,R],In),
 delete(R1,[R,_],R3),
 append(R3,[[R,N]],R4),
 L1 is L+1,
 a2(L1,In,M1,M2,R4,R2).
a1(L,In,M1,M2,R1,R2) :-
 member([L,s,R,M],In),
 delete(M1,[M,_],M3),
 member([R,N],R1),
 append(M3,[[M,N]],M4),
 L1 is L+1,
 a2(L1,In,M4,M2,R1,R2).
a1(L,In,M1,M2,R1,R2) :-
 member([L,j,R,N,L2],In),
 L1 is L+1,
 (member([R,N],R1)->
 a2(L2,In,M1,M2,R1,R2);
 a2(L1,In,M1,M2,R1,R2)).
a1(L,In,M1,M2,R1,R2) :-
 member([L,m,RM,R],In),
 member([RM,Ma],R1),
 member([Ma,N],M1),
 delete(R1,[R,_],R3),
 append(R3,[[R,N]],R4),
 L1 is L+1,
 a2(L1,In,M1,M2,R4,R2).
a1(L,In,M1,M2,R1,R2) :-
 member([L,p1,R,N,Rb],In),
 L1 is L+1,
 member([R,N1],R1),
 N2 is N+N1,
 delete(R1,[Rb,_],R3),
 append(R3,[[Rb,N2]],R4),
 a2(L1,In,M1,M2,R4,R2).
a1(L,In,M1,M2,R1,R2) :-
 member([L,p2,R,Ra,Rb],In),
 L1 is L+1,
 member([R,N1],R1),
 member([Ra,N3],R1),
 N2 is N3+N1,
 delete(R1,[Rb,_],R3),
 append(R3,[[Rb,N2]],R4),
 a2(L1,In,M1,M2,R4,R2).
a1(L,In,M1,M2,R1,R2) :-
 member([L,j,L1],In),
 a2(L1,In,M1,M2,R1,R2).
 
% 33

% a3(A).                                                                 % A = 15.

a3(A):-M1=1,M2=2,M3=3,M4=4,M5=5,b([M1,M2,M3,M4,M5],5,0,A).
b(_,0,C,C) :- !.
b(M,A,B,C) :- get_item_n(M,A,N),
B1 is B+N,
A1 is A-1,
b(M,A1,B1,C).

a4(R):-foldr(sum,[1,2,3,4,5],0,R).
sum(A,B,C) :- C is A+B.

% 38

/*

same as alg above

1: load 1 to R4
2: store R4 to M1
3: load 2 to R5
4: store R5 to M2
5: load 3 to R6
6: store R6 to M3
7: load 4 to R7
8: store R7 to M4
9: load 5 to R8
10: store R8 to M5
11: load 5 to R1
12: load 0 to R3
13: if R1=0, jump to 18
14: move (memory) R1 to R2
15: R3=R3+R2
16: R1=R1+-1
17: jump to 13
18: end

*/

% recognise counter recursion


% append
% [1,2],[3] -> [1,2,3]

% m1 1,2,stop and m10 3,stop (2 loops)
% loops through each list, copying the items to a new memory loc
/*

Memory size=10
registers=12*

1: load 1 to R1
2: store R1 to M1
3: load 2 to R2
4: store R2 to M2
5: load 0 to R3 % end of list
6: store R3 to M3
7: load 3 to R5
8: store R5 to M5
9: load 0 to R6
10: store R6 to M6
11: load -1 to R7 % end of lists
12: store R7 to M7
% check whether the current item is -1 or 0, increase the list n, item n and output item n

13: if R10=0, jump to 18*

list n=1
item n=1
output item n=1

loop: through a list, copying to out
loop: through all lists

add 0 to end of output

correct output
[m,10,1],[m,11,2],[m,12,3],[m,13,0]

*/

% speed up addition, multiplication later
