/*
?- magic_square([A,B,C,D,E,F,G,H,I]).

A = 2,
B = 7,
C = 6,
D = 9,
E = 5,
F = 1,
G = 4,
H = 3,
I = 8 ;

*/
magic_square([A,B,C,
															 D,E,F,
															 G,H,I]) :-
	permutation([1,2,3,
										4,5,6,
										7,8,9],[A,B,C,
															 D,E,F,
															 G,H,I]),
	J is A+B+C,
	J is D+E+F,
	J is G+H+I,
	J is A+D+G,
	J is B+E+H,
	J is C+F+I,
	
	J is A+E+I,
	J is G+E+C.
	
	