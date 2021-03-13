:-include('../../listprologinterpreter/la_maths.pl').
a:-
findall(Tally,todays_students(Tally),Tally2),
	sum(Tally2,Tally31),
	
	length([a,b],LCS).
	
todays_students(1).
todays_students(2).
todays_students(3).