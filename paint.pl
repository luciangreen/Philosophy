:- use_module(library(date)).
:-include('string_to_image.pl').
:-include('colours_to_image.pl').
:-include('../listprologinterpreter/la_files.pl').
:-include('../LuciansHandBitMap-Font/characterbr1.pl').

%:-include('philosophy/string_to_pbm.pl').

paint :-
	open_file_s("file_paint.txt",Paint_term),
	Paint_term=["width",X,"height",Y,Elements1],
	colour_background(X,Y,File_contents1),
	
	%render_pbm_file(File_contents2,X,Y,File_contents3),
	
	get_time(TS),
	stamp_date_time(TS,date(Year,Month,Day,Hour1,
	Minute1,Seconda,_A,_TZ,_False),local),
	concat_list(["paint",Year,Month,Day,Hour1,Minute1,Seconda],File1),
	concat_list([File1,".ppm"],_File3),
		
	paint_elements(X,Y,Elements1,File_contents1,_Grid2),!.
	/*
	%maplist(append,[Grid2],[Grid32]),	
	%maplist(append,[Grid32],[Grid3]),	
	flatten(Grid2,Grid3),
%trace,
	maplist(append,[[["P3","\n",X," ",Y,"\n","255","\n"],Grid3,["\n"]]],[Grid31]),
	
	concat_list(Grid31,Grid4),

	%writeln("Enter file name, ending with \".ppm\"."),
	%read_string(user_input, "\n", "\r", _, File),
	%term_to_atom(Grid4,D85),
	string_atom(D85,Grid4),

	(open_s(File3,write,Stream2),
	write(Stream2,D85),
	close(Stream2)),!.	
*/

colour_background(X,Y,File_contents1) :-
	numbers(X,1,[],XN),
	numbers(Y,1,[],YN),
	findall([X2,Y2,255,255,255],(member(X2,XN),
	member(Y2,YN)),File_contents1).


% x,y to ppm

paint_elements(_X,_Y,[],File_contents,File_contents) :- !.
paint_elements(X,Y,Elements1,File_contents1,File_contents2) :-
	Elements1=[Element|Elements2],
	(Element=["text","x_bounds",XB1,"y_bounds",YB1,"x",X1,"y",Y1,"size",S1,"colour",C1,T1]->
	string_to_image(["text","x_bounds",XB1,"y_bounds",YB1,"x",X1,"y",Y1,"size",S1,"colour",C1,T1],_X,_Y,File_contents1,File_contents3)

	),
	
	paint_elements(X,Y,Elements2,File_contents3,File_contents2).

	
/*
	findall(Pixel_RGB2,(member(Line,Grid),findall([R," ",G," ",B,"\n"],(member(Pixel_colour,Line),colour(Pixel_colour,[R,G,B])),Pixel_RGB2)),Grid2),

[["width",300],["height",300],
[
[],
["box","x1",0,"y1",0,"x2",30,"y2",30,"title","Box","width",20,"height",20,"fill","#c00"],
["circle","x1",0,"y1",0,"x2",30,"y2",30,"title","Circle","cx",20,"cy",20,"radius",30,"fill","#00c"]
]]
*/