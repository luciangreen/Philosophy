% 9 3 24.pl

% grammar checker

% test("Peter walked the apple.").

% test("Apple walked the apple.").

% test("A Peter ate an apple.").

test(S) :- downcase_atom(S,S1),string_codes(S1,C),phrase(s,C),!.

s --> noun1, space, verb, space, noun1, full_stop.
noun1 --> determiner, space, noun.
noun1 --> noun.

determiner --> "the".
determiner --> "an".
determiner --> "a".

space --> " ".
full_stop --> ".".

noun --> "apple".
noun --> "peter".

verb --> "ate".
verb --> "walked".

% term analyser (length, depth, average number of items per branching point)

:-include('../listprologinterpreter/listprolog.pl').

% term_analyser([[[1,2],[3,[4,[5]]]]],A).

% A=

term_analyser([],[n/a]) :-!.

term_analyser(T,[length=L,depth=Dep,average_items_per_branching_point=Ave]) :-
 length(T,L),
 deps(T,D),
 findall(DT,depth_tree(D,_,DT),DT1),
 sort(DT1,DT2),
 append(_,[DT3],DT2),
 length(DT3,Dep),
 %Dep is Dep1+1,
 findall(L2,(member([_D1,D2],D),findall(_,member([D2,_],D),B),length(B,L2)),BPI),
 length(BPI,L1),(L1=0->Ave=0;(sum(BPI,S),Ave is S/L1)),!.
 
 
depth_tree(D,L1,[_|L3]) :-
 member([L1,L2],D),depth_tree(D,L2,L3),!.
depth_tree(_,_,[]) :- !.
 
 
new_num(Curr2) :-curr(Curr1),retractall(curr(_)),Curr2 is Curr1+1,assertz(curr(Curr2)).


deps(A,B) :- retractall(curr(_)),Curr=0,assertz(curr(Curr)),(A=[]->B=[[0,-]];(A=[C]->B=[[0,C]];deps(A,B,Curr))).
deps([],[],_) :-!.
deps(N,[]%[[C,-]]
,_C) :-number(N),!.
%deps([[T]],[[C,C1]|A1],C) :- new_num(C1),
% deps([T],A,C1),
 %(A=[[_|_]|_]->foldr(append,A,A1);A=A1).%,(forall(member([_,_],A))->).
deps(T,As,C) :-
 %forall(member(N,T),(number(N))),
 deps1(T,As,C).
deps1([],[],_) :- !.
deps1(N,[]%[[C,-]]
,_C) :-number(N),!.
deps1([T1|T2],As2,C) :-
 %[[T1],[T2]]
 new_num(C1),
 deps(T1,As1,C1),
 %curr(C1),C2 is C1+1,
 (foldr(append,T2,T3)->true;[T3]=T2),
 deps1(T3,As,C1),
 foldr(append,[[[C,C1]],As1,As],As2).
  
test1 :-
findall(_,(member([T,L,D,A],
[
[[],0,1,0],
[[1],1,1,0],
[[1,1],2,1,0],
[[1,[1]],2,2,0.5],
[[1,[1,[1]]],2,3,0.6666666666666666]
]),(term_analyser(T,[length=L,depth=D,average_items_per_branching_point=A])->writeln([T,L,D,A,success]);writeln([T,L,D,A,failed]))),_).

% 31 algs

