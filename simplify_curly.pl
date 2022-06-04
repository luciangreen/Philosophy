% simplify_curly0([[t,a],"|",{[t,b]}],4,A),writeln1(A).

% A = [[[[t,a]],[[t,a],[t,b]],[[t,a],[t,b],[t,b]],[[t,a],[t,b],[t,b],[t,b]]]]


% simplify_curly0({[t,b],"|",{[t,c]}},4,A),writeln1(A).

% A = [[[[t,b]],[[t,b],[t,c]],[[t,b],[t,c],[t,c]],[[t,b],[t,c],[t,c],[t,c]]]]

% simplify_curly0([[t, number], "|", [[], "v", [[t, string]]]], 1, A).

% A = [[[[t, number]], [[t, number], [t, string]]]].

repeat(_Item,0,Repeated_item,Repeated_item) :- !.
repeat(Item,N1,Repeated_item1,Repeated_item2) :-
 append(Repeated_item1,Item,Repeated_item3),
 N2 is N1-1,
 repeat(Item,N2,Repeated_item3,Repeated_item2),!.
 
simplify_curly(A,_,A)	:-
	(string(A)->true;(number(A)->true;(atom(A)->true;A=[]))),!.
%simplify_curly([A,"|",[B|B0]],[A1|[B1|B10]])	:-
%	simplify_curly(A,A1),
%	simplify_curly(B,B1),
%	simplify_curly(B0,B10),!.

/*

simplify_curly([A,"|",B],L,C)	:-
	simplify_curly(A,L,A1),
	simplify_curly(B,L,B1),
	((not(isvar(B1)),is_list(B1))->
	C=[A1|B1];
	C=[A1,"|",B1]),!.
	
*/

simplify_curly([[A, "v", B]], L, [[A11,B11]]) :-

	simplify_curly(A,L,A11),
	simplify_curly(B,L,B11),!.

	
simplify_curly([A,"|",[B1,"v",B2]],L,[[A11|B11],[A11|B21]])	:-
	simplify_curly(A,L,A11),
	simplify_curly(B1,L,B11),
	simplify_curly(B2,L,B21),!.


simplify_curly([A,"|",B],L,C)	:-
	simplify_curly(A,L,A11),
	simplify_curly(B,L,B11),
	
	
findall(C1,(%member(A1,A11),member(B1,B11),
A11=A1,B11=B1,	((not(isvar(B1)),%curly_head_tail(B1,B1A,B1B)%is_list(B1)
B1=["c",B1A|B1B]
	)->

% length A1+B1 shouldn't be > L
% A1+N*B1 =< L
% N*B1 =< L-A1
% N =< (L-A1)/B1
	(
	
	length([A1],A1L),length([B1A|B1B],B1L),%ABL is A1L+B1L,
	NL is ceiling(((L-A1L)/B1L)),numbers(NL,0,[],Ns),
	findall([A1|B1R],(member(N,Ns),simplify([B1A|B1B],D),repeat(D,N,[],B1R)),C1));
	%*(C=[A1|B1]);
	C1=[A1,"|",B1])),C),!.
simplify_curly([A|B],L,[A1|B1])	:-
	simplify_curly(A,L,A1),
	simplify_curly(B,L,B1),!.

simplify_curly(AB,L,["c",A1|B1])	:-

curly_head_tail(AB,A,B),
	simplify_curly(A,L,A1),
	simplify_curly(B,L,B1),!.



simplify_curly0(CAB,L,C)	:-

simplify_curly(CAB,L,E),
	%simplify_curly(A,L,A11),
	%simplify_curly(B,L,B11),

(E=["c",A11,"|",B11]->

(	
	
findall(C1,(%member(A1,A11),member(B1,B11),
A11=A1,B11=B1,	((not(isvar(B1)),%curly_head_tail(B1,B1A,B1B)%is_list(B1)
B1=[B1A|B1B]
	)->

% length A1+B1 shouldn't be > L
% A1+N*B1 =< L
% N*B1 =< L-A1
% N =< (L-A1)/B1
	(
	
	length([A1],A1L),length([B1A|B1B],B1L),%ABL is A1L+B1L,
	NL is ceiling(((L-A1L)/B1L)),numbers(NL,0,[],Ns),
	findall([A1|B1R],(member(N,Ns),simplify([B1A|B1B],D),repeat(D,N,[],B1R)),C1));
	%*(C=[A1|B1]);
	C1=[A1|B1])),C));


[E]=C).