:-include('../listprologinterpreter/la_strings.pl').
:-include('../listprologinterpreter/la_maths.pl').
%:-include('../LuciansHandBitMap-Font/characterbr.pl').

scaler(Scale,Cbr) :-
	%open_file_s()
	characterbr(Cs),
	(Scale=1->Cbr=Cs;
	(findall([A,B,C1],(member([A,B,C],Cs),
	scale([Scale,C],C1)),Cbr))).
	/*Cbr=[[_A2,_B2,C2]],

	X is Scale*5,
	Y is Scale*9,
	retractall(x1(_)),
	assertz(x1(X)),
	%trace,
 	prettyprint_scale1(C2,Y),writeln(''),
 	prettyprint_scale1A(C2,Y),!. %% 2
	*/

scale([Scale,C],C1) :-
	background(Scale,Background),
	%writeln1([b,Background]),
	%trace,
	findall([Scale,C1],member(C1,C),C2),
	foldr(scale2,C2,Background,C1).
%,writeln1(C1).

background(Scale,Background) :-
	X is 5*Scale,
	Y is 9*Scale,
	numbers(X,1,[],XN),
	numbers(Y,1,[],YN),
	findall([X1,Y1,[]],(member(Y1,YN),member(X1,XN)),Background).
	
scale2([Scale,C],Background,C1) :-
	C=[A,B,D],
	A1 is Scale*A,
	B1 is Scale*B,	
	%C2=[A1,B1,D],
	delete(Background,[A1,B1,_],Background2),
	append(Background2,[[A1,B1,D]],C1).


characterbr1([['A',uppera,
[[1,9,[     ]],[2,9,[     ]],[3,9,[1,3  ]],[4,9,[     ]],[5,9,[     ]],
 [1,8,[     ]],[2,8,[     ]],[3,8,[     ]],[4,8,[     ]],[5,8,[     ]],
 [1,7,[     ]],[2,7,[     ]],[3,7,[     ]],[4,7,[     ]],[5,7,[     ]],
 [1,6,[     ]],[2,6,[     ]],[3,6,[     ]],[4,6,[     ]],[5,6,[     ]],
 [1,5,[     ]],[2,5,[5    ]],[3,5,[     ]],[4,5,[6    ]],[5,5,[     ]],
 [1,4,[     ]],[2,4,[     ]],[3,4,[     ]],[4,4,[     ]],[5,4,[     ]],
 [1,3,[2,s  ]],[2,3,[     ]],[3,3,[     ]],[4,3,[     ]],[5,3,[4,s  ]],
 [1,2,[     ]],[2,2,[     ]],[3,2,[     ]],[4,2,[     ]],[5,2,[     ]],
 [1,1,[     ]],[2,1,[     ]],[3,1,[     ]],[4,1,[     ]],[5,1,[     ]]]]]).
 
 
prettyprint_scale1(_C,0) :- !.
prettyprint_scale1(C,N) :-
	prettyprint_scale2(C,N,1),
	writeln(''),
	N2 is N-1,
	prettyprint_scale1(C,N2).
prettyprint_scale2(_C,_N,X1) :- x1(X), X1 is X+1, !.
prettyprint_scale2(C,N,M) :-
	member([M,N,M2],C),
	write(M2),write('\t'),
	M3 is M+1,
	prettyprint_scale2(C,N,M3).

prettyprint_scale1A(_C,0) :- !.
prettyprint_scale1A(C,N) :-
	prettyprint_scale2A(C,N,1),
	writeln(''),
	N2 is N-1,
	prettyprint_scale1A(C,N2).
prettyprint_scale2A(_C,_N,X1) :- x1(X), X1 is X+1, !.
prettyprint_scale2A(C,N,M) :-
	member([M,N,M2],C),
	(not(M2=[])->write('*');write(' ')),
	M3 is M+1,
	prettyprint_scale2A(C,N,M3).



ctobr01(Scale) :- ctobr11(Scale,['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','?','-',' ',',','(',')','|','.',':','_','\\','[',']','<','>','0','1','2','3','4','5','6','7','8','9']).
ctobr11(_,[]) :- !.
ctobr11(Scale,[C|Cs]) :-
	ctobr_11(Scale,C),writeln(''),ctobr11(Scale,Cs).
	
grid(Scale,Grid) :- background(Scale,Grid).

ctobr_11(Scale,C1) :-
	C1=' ',
	writeln(C1),
	%characterbr(Cs1),
	scaler(Scale,Cs),
	member([C1,C1Name,C2],Cs),
	writeln(C1Name),writeln(''),
	Y is Scale*9,
 	%y(Y),
 	prettyprint_scale1(C2,Y),writeln(''),
 	prettyprint_scale1A(C2,Y),!. %% 2

ctobr_11(Scale,C1) :-
	writeln(C1),
	%characterbr(Cs),
	scaler(Scale,Cs),
	member([C1,C1Name,C2],Cs),
	writeln(C1Name),writeln(''),
	/**Grid1=[[1,1,[    ]],[2,1,[    ]]],
	**
	[[1,3,[    ]],[2,3,[    ]],[3,3,[    ]],
	[1,2,[    ]],[2,2,[    ]],[3,2,[    ]],
	[1,1,[    ]],[2,1,[    ]],[3,1,[    ]]],

**%%[[1,1,[     ]]],**/
	grid(Scale,Grid1),
 		member([X1,Y1,M1],C2),
 		N2=1,
 		Stroke1=0,
 		%% States:[[this,state],Line:[[any,state,to,this,state],[true,or,false]],State:[[this,state,to,a,state],states]]
 		States= [
 [[1,s],	false,	[[1,s],[1,-]]],
 [[1,-],	false,	[[3,s],[2,-]]],
 %%[[2,s],	false,	[[2,s],[3,-]]],
 [[2,-],	true,	[[3,s],[2,-]]],
 [[3,s],	true,	[[1,s],[1,-]]]
 %%[[3,-],	false,	[[3,s],[2,-]]]
 ],

M1=[N2|_Ms],
(changegrid2(_Prevstate,[1,s],Grid1,Grid2,X1,Y1,C2,_C4,N2,Stroke1,States);
changegrid2(_Prevstate,[1,-],Grid1,Grid2,X1,Y1,C2,_C4,N2,Stroke1,States)),

 %	y(Y),
	Y is Scale*9,
 	prettyprint_scale1(Grid2,Y),writeln(''),
 	prettyprint_scale1A(Grid2,Y),!. %% 2
