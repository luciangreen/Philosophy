% ["Fundamentals of Pedagogy and Pedagogy Indicators","FUNDAMENTALS OF PEDAGOGY by Lucian Green Two Uses 2 of 30.txt",0,algorithms,"15.	ALEXIS: The subject should endorse positive-enough objects."]

% positive_enough_object(0.5,2,1). false
% positive_enough_object(0.5,2,2). true

positive_enough_object(X,Y,Z) :-
	V is X*Y*Z, V>=2.
	