% 8 9 23

% 23 algs needed

% ["Medicine","MEDICINE by Lucian Green Panic attack prevented by deep breathing and sutra 1 of 4.txt",0,algorithms,"3. I prepared to taste the computational egg. I did this by writing the Egg song argument. First, I groped the egg. Second, I tasted the dark chocolate. Third, I revealed the prize. In this way, I prepared to taste the computational egg by writing the Egg song argument."]

%object(egg,white).
%object(sphere,(red,(yellow,(white,(purple,brown),black,(green,white))))).
object(sphere,(((null,4,null),2,(null,5,null)),1,(null,3,(null,6,null)))).

% taste(sphere,dfs_pre_order,L).
% L = [1, 2, 4, 5, 3, 6].

% taste(sphere,dfs_in_order,L).
% L = [4, 2, 5, 1, 3, 6].

% taste(sphere,dfs_post_order,L).
% L = [4, 5, 2, 6, 3, 1].

object(cube,(((null,"red",null),"yellow",(null,"blue",null)),"white",(null,"green",(null,"purple",null)))).

% taste(cube,dfs_pre_order,L).
% L = ["white", "yellow", "red", "blue", "green", "purple"].

% taste(cube,dfs_in_order,L).
% L = ["red", "yellow", "blue", "white", "green", "purple"].

% taste(cube,dfs_post_order,L).
% L = ["red", "blue", "yellow", "purple", "green", "white"].

%taste(egg,dfs_pre_order,Items).
taste(Object,Method,Items1) :-
 object(Object,Items2),
 traverse(Method,Items2,Items1).
 
traverse(dfs_pre_order,Items1,Items2) :-
 dfs_pre_order(Items1,[],Items2).

dfs_pre_order((Item7,Item4,Item8),Items2,Items3) :-
 append(Items2,[Item4],Items6),
 dfs_pre_order(Item7,Items6,Items8),
 dfs_pre_order(Item8,Items8,Items3),!.
dfs_pre_order(null,Items2,Items2) :- !.
% append(Items2,[Item1],Items3).

traverse(dfs_in_order,Items1,Items2) :-
 dfs_in_order(Items1,[],Items2).

dfs_in_order((Item7,Item4,Item8),Items2,Items3) :-
 dfs_in_order(Item7,Items2,Items8),
 append(Items8,[Item4],Items6),
 dfs_in_order(Item8,Items6,Items3),!.
dfs_in_order(null,Items2,Items2) :- !.
% append(Items2,[Item1],Items3).

traverse(dfs_post_order,Items1,Items2) :-
 dfs_post_order(Items1,[],Items2).

dfs_post_order((Item7,Item4,Item8),Items2,Items3) :-
 dfs_post_order(Item7,Items2,Items8),
 dfs_post_order(Item8,Items8,Items6),
 append(Items6,[Item4],Items3),!.
dfs_post_order(null,Items2,Items2) :- !.

% 18 done

:-include('../listprologinterpreter/la_maths.pl').

% pretty_print(sphere, dfs_pre_order).
/*
1
 2
  4
  5
 3
  6
  
pretty_print(sphere, dfs_in_order).
  4
 2
  5
1
 3
  6

pretty_print(sphere, dfs_post_order).
  4
  5
 2
  6
 3
1

pretty_print(cube, dfs_pre_order).

white
 yellow
  red
  blue
 green
  purple
  
pretty_print(cube, dfs_in_order).

  red
 yellow
  blue
white
 green
  purple

pretty_print(cube, dfs_post_order).

  red
  blue
 yellow
  purple
 green
white

*/

pretty_print(Object,Method) :-
 object(Object,Items2),
 pretty_print(Method,Items2).
 
pretty_print(dfs_pre_order,Items1) :-
 pretty_print_dfs_pre_order(Items1,0).

pretty_print_dfs_pre_order((Item7,Item4,Item8),N) :-
 numbers(N,1,[],Ns),
 findall(_,(member(_,Ns),write(" ")),_),
 writeln(Item4),
 N1 is N+1,
 pretty_print_dfs_pre_order(Item7,N1),
 pretty_print_dfs_pre_order(Item8,N1),!.
pretty_print_dfs_pre_order(null,_) :- !.


pretty_print(dfs_in_order,Items1) :-
 pretty_print_dfs_in_order(Items1,0).

pretty_print_dfs_in_order((Item7,Item4,Item8),N) :-
 N1 is N+1,
 pretty_print_dfs_in_order(Item7,N1),
 numbers(N,1,[],Ns),
 findall(_,(member(_,Ns),write(" ")),_),
 writeln(Item4),
 pretty_print_dfs_in_order(Item8,N1),!.
pretty_print_dfs_in_order(null,_) :- !.


pretty_print(dfs_post_order,Items1) :-
 pretty_print_dfs_post_order(Items1,0).

pretty_print_dfs_post_order((Item7,Item4,Item8),N) :-
 N1 is N+1,
 pretty_print_dfs_post_order(Item7,N1),
 pretty_print_dfs_post_order(Item8,N1),
 numbers(N,1,[],Ns),
 findall(_,(member(_,Ns),write(" ")),_),
 writeln(Item4),!.
pretty_print_dfs_post_order(null,_) :- !.

% 34