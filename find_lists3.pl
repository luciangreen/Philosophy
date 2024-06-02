/*
split
[1,[2],1,[2,2]]

into [[1,[2]],[1,[2,2]]]

try dividing the levels up
find if make a repeating unit

*
^
|

find_lists3

try dividing into lists of lists
incl adding []

*
^
|

s2g:

s2l

find all repeating units of selections in each string
 with fl3
 
- go through term bottom up, creating var nums, insert brackets,  finding gs, keeping brackets intact
- dec tree for other terms from s2l

* fl3a with non repeating parts
- not r but optional in fl3

- takes a long time unless short data so do a part of the grammar at a time

dec tree
on s2l levels x at all (bottom up (x dfs po)) xx
- checks whether to make a cp same or different x sort the levels of repeating structs, see if they match
- goes around s2l brackets etc
- dec tree merges branches with same structure


**

only close ] if finished pattern
no []
rec'ively proc term

test that parts repeat, signal bracket or repeating list with smallest unit

*/

% find_lists3a([1,2,2,1,2],A).
% A = [[1, [r, [2]]]].

% find_lists3a([1,2,3,2,3,1,2,3,2,3],L).
% L = [[r, [1, [r, [2, 3]]]]]

% includes [] and recurse. structs when inserted

% find_lists3a([1,2,1,3,2],A).
% A = [[1, [r, [3]], 2]].

% find_lists3a([1,2,3,1,3],A).
% A = [[1, [r, [2]], 3]].

find_lists3a(L1,L3) :-

	find_lists3(L1,[],L4),
	(L4=[]->L4=L3;
	(L4=[_L2]->L4=L3;
	(L4=[L2|L31],
	check14(L31,L2,[],L3)))),!.

% find_lists3([1,2,2,1,2],[],L2).
% L2 = [[1, [r, [2]]], [1, 2]]

% find_lists3([1,2,3,2,3,1,2,3,2,3],[],L).
% L = [[r, [1, [r, [2, 3]]]]]

find_lists3([],L,L) :- !.
find_lists3(L1,L2,L3) :-
	repeating_unit(L1,U),
	(U=[r,U1]->
	find_lists3(U1,[],U2);
	U2=U),
	append(L2,[[r,U2]],L3),!.

find_lists3(L1,L2,L3) :-
	L1=[L4|L5],
	((member(L4,L5),
	sub_list(L5,Before_list,[L4],After_list))->
	(Before_list1=[L4|Before_list],After_list1=[L4|After_list],
	%Before_list1=[L4],After_list1=[])),
	find_lists32(Before_list1,[],L6),
	%(After_list=[]->L7=[];
	%(%find_lists31([L4|After_list],[],L7)->true;
	%split13(L6,After_list,L3),!.
	find_lists3(After_list1,[],L7),
	foldr(append,[L2,[L6,L7]],L3));
	(append(L2,[L4],L6),
	find_lists3(L5,L6,L3))),!.
%find_lists3(L1,L2,L3) :-
%	append(L1,L2,L3).

/*find_lists3(L1,L2,L3) :-
	L1=[L4|L5],
	append(L2,[L4],L6),
	find_lists3(L5,L6,L3),!.
*/

/*
find_lists32(L1,L2,L3) :-
	repeating_unit(L1,U),
	append(L2,[U],L3),!.
*/
find_lists32(L1,L2,L3) :-
	find_lists3(L1,L2,L3),!.


% repeating_unit([2,2],U).
% U = [r,[2]]). or [2]
repeating_unit(L1,U) :-
	(number(L1)->fail;
	(length(L1,L),
	L2 is (floor(L/2)),
	numbers(L2,1,[],Ns),
	find_first((member(N,Ns),
	split12(L1,N,[],A),
	maplist(=(_),A))),
	(N=L->U=L1;
	(length(L21,N),
	append(L21,_,L1),
	U=[r,L21])))),!.
	
split12([],_,A,A):-!.	
split12(L%
%List
,L16,%N,N,
 A1,A2) :- length(L,LL),LL<L16,append(A1,L,A2),
 %L2 is L16*2,length(List,L3),L3=<L2,
 !.
split12(Q2,L16,%N1,N2,
 L20,L17) :-
	%get_items_summing_to_l(Q2,L16,N1,N3,[],L2),
	length(L18,L16),
	append(L18,L19,Q2),
	append(L20,[L18],L21),
	split12(L19,L16,L21,L17),!.
split12(_A,_B,C,C) :-!.
	
	
check14([],_,A,A):-!.
check14(A0,B,C,D1) :-
	A0=[A01|A02],
	check141(A01,B,[],D),
	append(C,[D],C1),
	check14(A02,B,C1,D1),!.
check141([],[],A,A):-!.
check141(A,B,C,D1) :-

append(A31,B3,A),append([A1],A2,B3),append(A41,B4,B),append([B1],B2,B4),

((A31=[],A41=[])->A51=[];
(A31=[],not(A41=[]))->A51=A41;
(not(A31=[]),A41=[])->A51=A31),
	%A=[A1|A2],
	%B=[B1|B2],
	(A1=B1->A3=A1;
	((not(A1=[r,_]),not(B1=[r,_]))->fail;
	(
	((A1=[r,A11]->true;A1=A11),
	(B1=[r,B11]->true;B1=B11),
	(not(is_list(A11))->A12=[A11];A12=A11),
	(not(is_list(B11))->B12=[B11];B12=B11),
	check141(A12,B12,[],D),A3=[r,D])))),
	%((A1=[r,A11],B1=->(check141(A1,B1,[],D),A3=[r,D]);
	%(B1=[r,A1]->(check141(A1,B1,[],D),A3=[r,D]);
	%(A1=[r,[B1]]->(check141(A1,[B1],[],D),A3=[r,D]);
	%(B1=[r,[A1]]->(check141([A1],B1,[],D),A3=[r,D])))))),
	(A51=[]->A52=[];A52=[[o,A51]]),
	foldr(append,[C,A52,[A3]],C1),
	check141(A2,B2,C1,D1),!.
%check14(A,B,C,D) :-
%	A=[A1|A2],
%	B=[B1|B2],
	
%	append(C,[A1],C1),
%	check14(A2,B2,C1,D),!.

	
/*
split13([],_,A,A):-!.	
split13(L%
%List
,L16,%N,N,
 A1,A2) :- length(L,LL),LL<L16,append(A1,L,A2),
 %L2 is L16*2,length(List,L3),L3=<L2,
 !.
split13(Q2,L16,%N1,N2,
 L20,L17) :-
	%get_items_summing_to_l(Q2,L16,N1,N3,[],L2),
	length(L18,L16),
	append(L18,L19,Q2),
	append(L20,[L18],L21),
	split13(L19,L16,L21,L17),!.
split13(_A,_B,C,C) :-!.
*/
	
%find_lists3()
