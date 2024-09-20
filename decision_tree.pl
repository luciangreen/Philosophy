/*
decision_tree([[a,a],[a,b],[b,b]],A).
A = [[a, 2, [[a, 1, []], [b, 1, []]]], [b, 1, [[b, 1, []]]]].
*/

decision_tree([],[]) :- !.
decision_tree(A,B) :-
    findall(C,(member([C|_D],A)),E),

    frequency_list2(E,L),

    decision_tree1(A,L,[],B).
    
    decision_tree1(_,[],B,B) :- !.
    decision_tree1(A,L,B1,B2) :-

	L=[[G,K1]|Ls],
    decision_tree2(A,G,[],B3),
	decision_tree(B3,P),
	append(B1,[[G,K1,P]],B4),
    decision_tree1(A,Ls,B4,B2),!.

    decision_tree2([],_,B,B) :- !.
    decision_tree2(A,G,B1,B2) :-
    
   	A=[[G1|D]|As],
   	(G1=G->append(B1,[D],B3);
   	B1=B3),
    decision_tree2(As,G,B3,B2).

    decision_tree2(A,G,B1,B2) :-
    
   	A=[[]|As],
    decision_tree2(As,G,B1,B2).

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