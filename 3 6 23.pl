% 3 6 23.pl

% 80 algs

% % ["Fundamentals of Pedagogy and Pedagogy Indicators","FUNDAMENTALS OF PEDAGOGY by Lucian Green Part of Room 3 of 4.txt",0,algorithms,"25. The brainworks participant wrote breasonings  (thought of X, Y and Z dimensions for objects) for a 'seen-as' essay based directly on secondary literature, and handed in an essay of his design.  He did this by moving the arch from his toes.  First, he bent down.  Second, he put the arch over his toes.  Third, he removed the arch.  In this way, the brainworks participant wrote breasonings  (thought of X, Y and Z dimensions for objects) for a 'seen-as' essay based directly on secondary literature, and handed in an essay of his design by moving the arch from his toes."]

% He did this by moving the arch from his toes.

% apologies to 19 3 23.pl

/*

minimise_dfa([[a,b],[b,c],[a,d],[d,c],[a,e],[e,c]],B).
B = [[a, b], [b, c]] .

minimise_dfa([[a,b1],[b1,b2],[b2,c],[a,d1],[d1,d2],[d2,c],[a,e1],[e1,e2],[e2,c]],B).
B = [[a, b1], [b1, b2], [b2, c]] .

minimise_dfa([[a,b1],[b1,b2],[b2,b3],[b3,c],[a,d1],[d1,d2],[d2,c],[a,e1],[e1,e2],[e2,c]],B).
B = [[a, b1], [b1, b2], [b2, b3], [b3, c], [a, d1], [d1, d2], [d2, c]].

*/

%:-include('../listprologinterpreter/listprolog.pl').

minimise_dfa(A,B) :-
 minimise_dfa1(A,[],B).
 
 
minimise_dfa1([],DFA,DFA) :- !.
minimise_dfa1(Transitions,DFA1,DFA2) :-
 %Transitions=[T2|T3],
 %append(DFA1,[T2],DFA4),
 minimise_dfa(Transitions,%T2,T3,
 DFA1,DFA3),
 (Transitions=DFA3->DFA3=DFA2;
 minimise_dfa1(DFA3,[],DFA2)).

 
minimise_dfa([],B,B) :- !.
minimise_dfa(A,B,C) :-
 A=[[D1,D2]|E],
 findall(_,member([D1,_],A),D4),
 length(D4,1),
 append(B,[[D1,D2]],F),
 minimise_dfa(E,F,C).
minimise_dfa(A,B,C) :-
%writeln(minimise_dfa(A,B,C)),
 A=[[D1,D2]|E],
 findall(_,member([D1,_],A),D4),
 not(length(D4,1)),
 %trace,
 ((find_loops(D1,A,[],_C1%,1,N1
 ,[],L),
 findall(H3,(member([_F,_G,H],L),length(H,LeH),LeH>=2,H=[_H1|H3]),H2),
 foldr(append,H2,H4),
 foldr(append,H4,H5),
 %L=[L1|L2],
 %foldr(append,L2,L3),
 %find_loop(D2,E,[],C11,1,N2),
 %N1=N2
 subtract(E,H5,C2%B1
 ),
 append([[D1,D2]],C2,C3),
 
 (H5=[]->C=C3;
 minimise_dfa(C3,[],C)) %E=C).%,
%,
 %append(C2,L1,C)
 )->true;
 (%trace,%subtract(A,E,A1),
 %append(A,B,B1),
 minimise_dfa(E,B,C))). %E=C).%,
 %minimise_dfa(B1,B,C).
%find_loop(_,_,C,X,X,C,N,N).
%find_loop(D2,E1,B,X,X,C,N,N) :-
% member([D2,D3],E1),
% append(B,[[D2,D3]],C).
 
find_loop(D2,E1,B,_X1,X2,C,N1,N2) :-
 N3 is N1+1,
 member([D2,D3],E1),%subtract(E1,[[D2,D3]],E2),
 %findall(_,member([D2,_],E1),D4),
 %length(D4,1),
 append(B,[[D2,D3]],B1),
 X3=D3,
 find_loop1(D3,E1,B1,X3,X2,C,N3,N2).
find_loop1(_D3,_E1,C,X,X,C,N,N).
find_loop1(D3,E1,B1,X1,X2,C,N3,N2) :-
 find_loop(D3,E1,B1,X1,X2,C,N3,N2).


% find loops that are the same length
find_loops(A,B,_C,_D,_L1,L4) :-
%trace,
 findall([D1,N,X2],find_loop(A,B,[]%C
  ,[],X2,D1,1,N),L2),
 findall([N,X21],member([_,N,X21],L2),X22),
 sort(X22,X23),
 findall([N,X,LN],(member([N,X],X23),findall(L,member([L,N,X],L2),LN)),L4).%,
 %findall(N,member([_,N,_],L2),N1),
 %N1=[N2|N3],
 %forall(member(N4,N3),N4=N2),
 %findall(L3,member([L3,_,_],L2),L4).
% (member(D1,L1)->L1=L2;
% (append(L1,[D1],L3),
% find_loops(A,B,C,D,L3,L2))).
 
% 14

% First, he bent down.

% check_dependencies([["a",[]]],[["a","a.pl",[["b"]]]]).

% check_dependencies([["a",[]]],[["a","a.pl",[["include","b.pl"]]],["a","b.pl",[["c"]]]]).

% check_dependencies([["a",[]]],[["a","a.pl",[["a",":-","b"],["b"]]]]).           

% check_dependencies([["a",["b"]]],[["a","a.pl",[["include","c.pl"],["init",":-",["d","e"]]]],["a","c.pl",[["f"]]],["b","h.pl",[["e",":-","f"]]]]).

% check_dependencies([["a",["b"]],["a",["b"]]],[["a","a.pl",[["include","c.pl"],["init",":-",["d","e"]]]],["a","c.pl",[["f"]]],["b","h.pl",[["e",":-","f"]]]]).


% removed init (first predicate from registry)

check_dependencies(Registry,Files) :-
 % check package manager registry file
 findall(_,(member([R1%,P1
 ,Rs],Registry),append([R1],Rs,Rs2),
 
 % check included files
 member(R,Rs2),
 (findall(_,(member([R,_F,P],Files),
 findall(_,(member(["include",F1],P),
 check_file(F1,Files)),B),
 length(P,L1),%length(B,L1),
 findall(_,(member([P1],P),(string(P1)->P1=P2;P1=[P2,_,_]),
 check_predicate([P2],Files)),A),
 append(A,B,AB),
 length(AB,L1)
 ),_C)
 %length(Files,L2),length(C,L2)
 )),_D).
 %length(Registry,L3),length(D,L3).

 % check predicates

check_file(F1,Files) :-
 findall(_,(member([_R,F1,P],Files),
 findall(_,(member(Predicate,P),
 check_predicate(Predicate,Files)),A),
 length(P,L1),length(A,L1)),_B).
 %length(Files,L2),length(B,L2).

check_predicate(Predicate,Files) :-
 findall(_,(member([_R,_F1,P],Files),
 findall(_,(member(Predicate1,P),
 Predicate1=Predicate2,
 (Predicate2=Predicate->true;
 (Predicate=[Predicate2,":-",Ps],
 findall(_,(member(P1,Ps),
 check_predicate(P1,Files)),A),
 length(Ps,L1),length(A,L1)))),B),
 length(P,L2),length(B,L2)),_C).
 %length(Files,L3),length(C,L3).

% later: check unnecessary packages, files and predicates x check everything aligns above
 
% 22+41 from lc = 63

% Second, he put the arch over his toes.

% reach end

%reach_end(5).
%reach_end(1).
%reach_end(0).

reach_end(N) :-
 numbers(N,1,[],Ns),
 random_permutation(Ns,Ns1),
 sort1(Ns1,[],Ns2),
 reverse(Ns2,Ns3),
 numbers(N,1,[],Ns3),!.
 
sort1([],B,B).
sort1(A,B,C) :-
 max(A,D),
 delete(A,D,F),
 append(B,[D],E),
 sort1(F,E,C).
max([A],A).
max(A,D) :-
 A=[B|C],
 max1(B,C,D).
max1(A,[],A).
max1(B,C,D) :-
 C=[E|F],
 (B>=E->max1(B,F,D);max1(E,F,D)).
 
% 72

% Third, he removed the arch.

/*
reverse_engineering1(5,A).
A = 1+4 ;
A = 2+3 ;
A = 3+2 ;
A = 4+1 ;
*/

reverse_engineering1(N,A) :-
 numbers(N,1,[],Ns),member(N1,Ns),member(N2,Ns),N is N1 + N2,A=N1+N2.
 
:-include('data_to_alg.pl').

%reverse_engineering2([[[a,b,c,d],[b,c]],[[e,b,f,d],[b,f]]],A).
reverse_engineering2(Ls,A) :-
 test1(off,1,_),
 findall([[DFN,L1],[D,H],DHN],(member([L,L1],Ls),
 
 Z=[b,d,f,g,h,j],
 append(B1,C1,Z),
 append([D1],E1,C1),
 append(F1,G1,E1),
 append([H1],J1,G1),
 
 append([D1],F1,DF1),
  
  %writeln([df1,DF1]),
  interpretpart(match4,[v,sys1],DF1,[[[v,b],B1],[[v,d],D1],[[v,f],F1],[[v,g],G1],[[v,h],H1],[[v,j],J1]],Vars,_),
 
 getvalue([v,sys1],L0,Vars),%),V),

%foldr(append,L0,L00),
L0=L00,
%writeln(L00),
%writeln(L00=L1),
 L00=[d,f],%L1,
 %trace,
 member([[v,d],D],Vars),
 member([[v,h],H],Vars),
 get_n_item(Z,D,DN),
 get_n_item(Z,H,HN),
 
 get_item_n(L,DN,DNN),
 get_item_n(L,HN,HNN),
 
 append(_B,C,L),
 append([DNN],E,C),
 append(F,G,E),
 %trace,
 append([HNN],_J,G),
 
 append([DNN],F,DFN),
 append([DNN],[HNN],DHN)
 
 %writeln([[b,d,f,g,j],[_B,DNN,_F,HNN,_J]])
 ),V),

findall(A,member([A,_,_],V),V0),
 %V=[[V31,V32]|V2],
 forall(member([V41,V42],V0),V41=V42),
 
 findall([B1,B2],member([_,[B1,B2],_],V),V01),

 findall(B3,member([B3,_],V01),V02),
 findall(B4,member([_,B4],V01),V03),

 V02=[V021|V022],
 forall(member(V023,V022),V023=V021),
 V03=[V031|V032],
 forall(member(V033,V032),V033=V031),
 
  findall(C,member([_,_,C],V),V04),
%trace,
 V04=[[D,H]|_],
 A=(append(b,c,l),
 append([D],e,c),
 append(f,g,e),
 append([H],j,g)).

/*

A = (append(b, c, l), append([b], e, c), append(f, g, e), append([d], j, g)).

append(_B,C,[a,b,c,d]), append([b],E,C), append(F,G,E), append([d],_J,G).       
_B = [a],
C = [b, c, d],
E = [c, d], *
F = [c],
G = [d],
_J = [] ;

reverse_engineering2([[[a,b,c,d],[b,c]],[[z,b,q,d],[b,q]],[[e,b,f,d],[b,f]]],A).
A = (append(b, c, l), append([b], e, c), append(f, g, e), append([d], j, g)).

reverse_engineering2([[[a,b,c,d],[b,c]]],A).
A = (append(b, c, l), append([b], e, c), append(f, g, e), append([d], j, g)).

reverse_engineering2([[[a,b,r,c,d],[b,r,c]]],A).
works if  Z=[b,d,f,g,h,j] changed to  Z=[b,d,r,f,g,h,j]
 L00=[d,f] changed to  L00=[d,r,f] above
 same answer

*/ 

% 81