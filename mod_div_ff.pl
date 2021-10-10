% mod_div_ff(mod,[[5,1],[6,0]],Mod).
% Mod=[2].

% mod_div_ff(mod,[[5,2],[6,0]],Mod).
% Mod=[3].

% mod_div_ff(div,[[5,2],[6,3]],Mod).
% Mod=[2].

% mod_div_ff(div,[[7,2],[6,2]],Mod).
% Mod=[3].

:-include('../listprologinterpreter/la_maths.pl').

mod_div_ff(Op,Spec,N11)	:-
	numbers(20,1,[],Ns),
	findall(N0,findall([A,B,N1],(member([A,B],Spec),findall(N,(member(N,Ns),
	(Op=mod->
	B is mod(A,N);B is div(A,N))
	),N1)),N0),N2),
	findall(N3,(member(N00,N2),member([_,_,N3],N00)),N4),sort(N4,N5),
	%N2=[[_,_,N3]|_],
	findall(N8,(member(N6,N5),member(N7,N2),findall(N6,member([_,_,N6],N7),N8)
	%,writeln(N8)
	%length(N7,L),length(N8,L),N8=[N9|_]
	),N101),
	maplist(append,[N101],[N10]),
	%writeln(N101),
	intersection_all(N10,N11).
	%sort(N10,N11)
%	maplist(equals(N3),N2).
	
%equals(N,N).

intersection_all(A,C) :-
	A=[B1|B2],
	intersection_all1(B2,B1,C).
intersection_all1([],C,C).
intersection_all1([A1|A3],A2,C) :-
	intersection(A2,A1,A4),
	intersection_all1(A3,A4,C).
