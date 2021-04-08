member1(_,[]) :- false.
member1(A,B) :- B=[B1|B2],
	(A=B1->true;member1(A,B2)).