% decision_tree([[a,b,c],[a,d,e],[f,g,h]],A),writeln(A).

% [[a,2,[[b,1,[[c,1,[]]]],[d,1,[[e,1,[]]]]]],[f,1,[[g,1,[[h,1,[]]]]]]]

decision_tree([],[]) :- !.
decision_tree(A,B) :-
	findall(C,(member([C|_D],A)),E),
	sort(E,K),
	findall([G,J],(member(G,K),findall(G,member(G,E),H),length(H,J)),L),
	findall([G,K1,P],(member([G,K1],L),findall(D,member([G|D],A),D2),decision_tree(D2,P)),B).
