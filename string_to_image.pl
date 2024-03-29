:-include('../LuciansHandBitMap-Font/characterbr.pl').
:-include('../listprologinterpreter/la_maths.pl').
:-include('../listprologinterpreter/la_strings.pl').
:-include('../listprologinterpreter/la_strings_string.pl').
%:-include('strings_to_grid.pl').
:-include('scaler.pl').

% string_to_pbm("ab\nac\nad",5,5,"a.pbm").
% string_to_pbm("a",5,5,"a.pbm").

string_to_image(["text","x_bounds",XB1,"y_bounds",YB1,"x",X1,"y",Y1,"size",S1,"colour",C1,T1],_X,_Y,File_contents1,File_contents2) :-
	%X=40,Y=24,
	%X=5,Y=5,
	%background(X,Y,File_contents1),
	scaler(S1,Cs),
	retractall(characterbr2(_)),
	assertz(characterbr2(Cs)),
		%trace,
		string_to_image1(XB1,YB1,1,1,X1,Y1,S1,C1,T1,File_contents1,File_contents2),
		%writeln([file_contents2,File_contents2]),
		
	render_pbm_file(File_contents2,XB1,YB1,File_contents3),
	random(X3),
	concat_list(["paint_x",X3,".ppm"],X4),
	write_pbm(File_contents3,XB1,YB1,X4),
	!.

/*
background(X1,Y1,File_contents1) :-
	X is X1*6,
	Y is Y1*10,
	numbers(X,1,[],XN),
	numbers(Y,1,[],YN),
	findall([X2,Y2,0],(member(X2,XN),
	member(Y2,YN)),File_contents1).
*/

ctobr_1(S1,C1_1,Grid2) :-
	%writeln(C1),
	characterbr2(Cs),
	string_atom(C1_1,C1),
	member([C1,_C1Name,C2],Cs),
	%writeln(C1Name),writeln(''),

	grid(S1,Grid1),
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

 	%y(Y),
 	%prettyprint1(Grid2,Y),writeln(''),
 	%prettyprint1A(Grid2,Y),
 	!. %% 2
 	
%%string_to_image1(_,_,40,24,_,File_contents,File_contents) :- !.
%string_to_image1(_,_,_,_,"",File_contents,File_contents) :- !.
string_to_image1(_X,_Y,_,_,_X1,_Y1,"",_C1,_T1,File_contents,File_contents) :- !.
string_to_image1(X_lim,Y_lim,_X,Y,XA1,YA1,S1,C1,String,File_contents1,File_contents2) :-
	string_concat(Char,String2,String),
	string_length(Char,1),
	(Char="\n"->true;Char="\r"),
	
	X1 is 1,Y1 is Y+1,
		string_to_image1(X_lim,Y_lim,X1,Y1,XA1,YA1,S1,C1,String2,File_contents1,File_contents2).
string_to_image1(X_lim,Y_lim,X,Y,XA1,YA1,S1,C1,String,File_contents1,File_contents2) :-
	string_concat(Char1,String2,String),
	string_length(Char1,1),

	characterbr2(Cs),
	string_atom(Char1,Char),
	%trace,
	(member([Char,_,_],Cs)->Char2=Char;
	Char2=' '),
	
	%trace,
	
	(Char2=' '->(File_contents1=File_contents3);
	(ctobr_1(S1,Char2,Grid2),
	%writeln1(Grid2),
	
	convert_to_pbm(Grid2,5,9,XA1,YA1,S1,C1,Grid3),
	%trace,
	%writeln1([c,Grid3]),
	
%(Char2="b"->print_grid_1(Grid3,13,10);true),

	render_to_screen(File_contents1,Grid3,5,9,X,Y,X_lim,Y_lim,XA1,YA1,S1,C1,File_contents3))),
	((X=X_lim,Y=Y_lim)->File_contents3=File_contents2;
	((X is X_lim->(X1 is 1,Y1 is Y+1);
	(X1 is X+1,Y1 is Y)),
	string_to_image1(X_lim,Y_lim,X1,Y1,XA1,YA1,S1,C1,String2,File_contents3,File_contents2))).
	
convert_to_pbm(Grid1,X,Y,_XA1,_YA1,_S1,C1,Grid2) :-	
	numbers(Y,0,[],YN1),
	reverse(YN1,YN),
	numbers(X,0,[],XN),
%trace,
	findall([X1,Y1|Pixel],(member(Y1,YN),
	member(X1,XN),
	member([X1,Y1|Pixel1],Grid1),
	((Pixel1=[[]]->true;Pixel1=[255,255,255])->Pixel=[255,255,255];(%trace,
	colour(C1,     [R, G,   B]),Pixel=[R, G,   B]))
	%write(Pixel),write("\t")
	),Grid2).
	%,writeln1([grid2,Grid2]).

render_to_screen(File_contents1,Grid3,X2,Y2,X,Y,_X_lim,Y_lim,XA1,YA1,S1,_C1,File_contents2) :-
%trace,
%writeln1([b,Grid3]),
	numbers(Y2,1,[],YN1),
	reverse(YN1,YN),
	numbers(X2,1,[],XN),

%trace,
	findall([X3,Y3,R,G,B],(member(Y1,YN),
	member(X1,XN),
	member([X1,Y1,R,G,B],Grid3),
	X3 is %X1,%
		S1*(6*(X-1)+X1)+XA1,
	Y3 is %Y1%
		S1*(10*(Y_lim-Y)+Y1)+YA1
	%(Pixel1=[]->Pixel=0;Pixel=1)
	%write(Pixel),write("\t")
	),Grid2),
	
	%trace,
	%X4 is 2*6,Y4 is 1*10,
	%*X4 is X_lim*6,Y4 is Y_lim*10,
	
	%print_grid_1(Grid2,5,9),
	%*print_grid_1(Grid2,X4,Y4),
	
	
	replace_1(File_contents1,Grid2,File_contents2).

replace_1(File_contents,[],File_contents) :- !.
replace_1(File_contents1,Grid2,File_contents2) :-
	Grid2=[[X,Y,R,G,B]|Grid4],
	delete(File_contents1,[X,Y,_,_,_],File_contents3),
	append(File_contents3,[[X,Y,R,G,B]],File_contents4),
	replace_1(File_contents4,Grid4,File_contents2).

render_pbm_file(Grid1,X2,Y2,Grid2) :-	
	X is X2*6,
	Y is Y2*10,
	numbers(Y,1,[],YN1),
	reverse(YN1,YN),
	numbers(X,1,[],XN),
	
	%trace,

	findall([A%,["\n"]
	],(member(Y1,YN),
	findall([R,"\t",G,"\t",B,"\n"],(member(Y1,YN),

	%nl,
	member(X1,XN),
	member([X1,Y1,R,G,B],Grid1)),A2),
	
	maplist(append,[A2],[A])

	),Grid3),
	
	%writeln1(Grid3),
	
	%trace,
	
	maplist(append,[Grid3],[Grid2a]),
		
	maplist(append,[Grid2a],[Grid2b]),
	
	concat_list(Grid2b,Grid2).
	%writeln1(Grid2).
	%(Pixel1=[*]->Pixel="*";Pixel=" "),
	%write(Pixel),write("\t")
	%),_),
	%nl.

write_pbm(File_contents3,X2,Y2,File) :-
	X is X2*6,
	Y is Y2*10,
	concat_list(["P3\n",X," ",Y,"\n","255","\n",File_contents3],File_contents4),
	open_s(File,write,Stream),
	write(Stream,File_contents4),close(Stream).



print_grid_1(Grid,X,Y) :-
	numbers(Y,1,[],YN1),
	reverse(YN1,YN),
	numbers(X,1,[],XN),

	findall(_,(member(Y1,YN),
	nl,
	member(X1,XN),
	member([X1,Y1,Pixel],Grid),
	%(Pixel1=1->Pixel="*";Pixel=" "),
	write(Pixel)),_).
	
