/*
decision_tree([[a,a],[a,b],[b,b]],A).
A = [[a, 2, [[a, 1, []], [b, 1, []]]], [b, 1, [[b, 1, []]]]].
*/

decision_tree([],[]) :- !.
decision_tree(A,B) :-
    findall(C,(member([C|_D],A)),E),

    frequency_list2(E,L),

    findall([G,K1,P],(member([G,K1],L),findall(D,member([G|D],A),D2),decision_tree(D2,P)),B).

frequency_list2(E,L) :-

msort(E, Sorted),
clumped(Sorted, Freq1), findall([B,A],member(B-A,Freq1),L),!.

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