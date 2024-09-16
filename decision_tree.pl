% decision_tree([[a,b,c],[a,d,e],[f,g,h]],A),writeln(A).

% [[a,2,[[b,1,[[c,1,[]]]],[d,1,[[e,1,[]]]]]],[f,1,[[g,1,[[h,1,[]]]]]]]

decision_tree([],[]) :- !.
decision_tree(A,B) :-
	findall(C,(member([C|_D],A)),E),
	
	frequency_list2(E,L),
	
	findall([G,K1,P],(member([G,K1],L),findall(D,member([G|D],A),D2),decision_tree(D2,P)),B).

frequency_list(A,B) :-

frequency_list1(A,C),sort(C,D),reverse(D,B),!.

frequency_list1(E,L) :-

sort(E, Sorted),
clumped(Sorted, Freq1),	findall([A,B],member(B-A,Freq1),L),!.

/*
frequency_list1a(E,L) :-

	sort(E,K),
	findall([J,G],(member(G,K),findall(G,member(G,E),H),length(H,J)),L),!.
*/

frequency_list2(E,L) :-

sort(E, Sorted),
clumped(Sorted, Freq1),	findall([B,A],member(B-A,Freq1),L),!.

/*
frequency_list2a(E,L) :-

	sort(E,K),
	findall([G,J],(member(G,K),findall(G,member(G,E),H),length(H,J)),L),!.
*/