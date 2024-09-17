/*
decision_tree([[a,a],[a,b],[b,b]],A).
A = [[a, 2, [[a, 1, []], [b, 1, []]]], [b, 1, [[b, 1, []]]]].
*/

decision_tree([],[]) :- !.
decision_tree(A,B) :-
	foldl(decision_tree0,A,[],E),
	
	frequency_list2(E,L),
	
	maplist(decision_tree1(A),L,B),!.

decision_tree0(A,D1,C1) :-
	((A=[C|_D],append(D1,[C],C1))->true;D1=C1),!.
	
decision_tree1(A,L,P1) :-
	L=[G,K1],foldl(decision_tree2(G), A, [],D1),decision_tree(D1,P),P1=[G,K1,P],!.
	
decision_tree2(G,A,D1,D2) :-
	((A=[G|D],append(D1,[D],D2))->true;D1=D2),!.
	
frequency_list2(E,L) :-

msort(E, Sorted),
clumped(Sorted, Freq1),	findall([B,A],member(B-A,Freq1),L),!.

/*
frequency_list([a,a,b],A).
A = [[2, a], [1, b]].
*/

frequency_list(A,B) :-

frequency_list1(A,C),sort(C,D),reverse(D,B),!.

frequency_list1(E,L) :-

msort(E, Sorted),
clumped(Sorted, Freq1),	findall([A,B],member(B-A,Freq1),L),!.

/*
frequency_list1a(E,L) :-

	sort(E,K),
	findall([J,G],(member(G,K),findall(G,member(G,E),H),length(H,J)),L),!.
*/


/*
frequency_list2a(E,L) :-

	sort(E,K),
	findall([G,J],(member(G,K),findall(G,member(G,E),H),length(H,J)),L),!.
*/