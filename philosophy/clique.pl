% ["Short Arguments","God Algorithm - Student.txt",0,algorithms,"6. *I prepared to find more intelligent connections (between consecutive items, or a maximum of five apart).  I did this by telling the other the name of the object.  First, I saw and recognised the object.  Second, I repeated its name silently in my head.  Third, I said its name to the other."]

% Find a clique of items in a list.

% clique([1,2,3,4,5],Links).

clique(Points,Links) :-
	findall([Item1,Item2],(member(Item1,Points),
	member(Item2,Points)),Links).
	