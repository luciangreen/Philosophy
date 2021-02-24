% ["Fundamentals of Pedagogy and Pedagogy Indicators","FUNDAMENTALS OF PEDAGOGY by Lucian Green Two Uses 4 of 4.txt",0,algorithms,"ALEXIS: The subject should state that he desires the warm space."]

% Sort the list.

sort1([],List,List) :- !.
sort1(List1,List2,List3) :-
	maximum1(List1,Item,List4),
	append(List2,[Item],List5),
	sort1(List4,List5,List3).
maximum1(List1,Item1,List2) :-
	List1=[Item2|List3],
	maximum2(Item2,List3,Item1,[],List2).
maximum2(Item,[],Item,List,List) :- !.
maximum2(Item1,List1,Item2,List2a,List2) :-
	List1=[Item3|List3],
	(Item1<Item3->
	(append(List2a,[Item3],List5),
	maximum2(Item1,List3,Item2,List5,List2));
	(append(List2a,[Item1],List5),
	maximum2(Item3,List3,Item2,List5,List2))).
