% ["Time Travel","Conserve time lines 3.txt",0,algorithms,"42. *I consulted the professor to conserve time lines."]

% X1 = AX1*T^2 + BX1*T + CX1
% Y1 = AY1*T^2 + BY1*T + CY1

% X2 = AX2*T^2 + BX2*T + CX2
% Y2 = AY2*T^2 + BY2*T + CY2

:-include('../../listprologinterpreter/la_maths.pl').

% collision(0,1,0,0,1,0,0,1,0,0,1,0,1,10).
% true.

% collision(0,2,0,0,1,0,0,1,0,0,1,0,1,10).
% false.

collision(AX1,BX1,CX1,AY1,BY1,CY1,AX2,BX2,CX2,AY2,BY2,CY2,T1,T2) :-
	numbers(T2,T1,[],Ts),
	findall([X1,Y1,X2,Y2],(member(T,Ts),
	X1 is AX1*T^2 + BX1*T + CX1,
	Y1 is AY1*T^2 + BY1*T + CY1,
	X2 is AX2*T^2 + BX2*T + CX2,
	Y2 is AY2*T^2 + BY2*T + CY2),
	Coords),
	member(Coord,Coords),collision(Coord),!.

collision([X,Y,X,Y]).