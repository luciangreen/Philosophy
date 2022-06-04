simplify2(A,A)	:-
	(string(A)->true;(number(A)->true;(atom(A)->true;A=[]))),!.


simplify2([A,"v",B],[A1,"v",B1])	:-
	simplify2(A,A1),
	simplify2(B,B1),!.

simplify2([A,"|",B],C)	:-
	simplify2(A,A1),
	simplify2(B,B1),
	((not(isvar(B1)),is_list(B1),not(B1=[_,"v",_]))->
	C=[A1|B1];
	C=[A1,"|",B1]),!.
simplify2([A|B],[A1|B1])	:-
	simplify2(A,A1),
	simplify2(B,B1),!.