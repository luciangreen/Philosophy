% ["Time Travel","Interesting histories to visit 3.txt",0,algorithms,"69. *The historian verified that the pedagogy graduate had a higher teacher rating."]

% Find item with higher average.

:-include('../../listprologinterpreter/la_maths.pl').

% higher_average([[1,[5,6,7]],[2,[4,7,8]]],Item).
% Item=2
higher_average(Items_and_ratings,Item) :-
	findall([Average,Item],(member(Item_and_ratings,Items_and_ratings),
	Item_and_ratings=[Item,Ratings],
	sum(Ratings,0,Sum),
	length(Ratings,Ratings_length),
	Average is Sum/Ratings_length),Averages_and_items1),
	sort(Averages_and_items1,Averages_and_items2),
	reverse(Averages_and_items2,[[_,Item]|_]).