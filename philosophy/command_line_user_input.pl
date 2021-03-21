% ["Medicine","MEDICINE by Lucian Green Brain 1 of 4.txt",0,algorithms,"8.    *I prepared to say how good I was. I did this by filling a model brain cell with my discoveries. First, I put my first discovery into the brain cell. Second, I put my second discovery into the brain cell. Third, I put my third discovery into the brain cell. I prepared to say how good I was by filling a model brain cell with my discoveries."]

% Command line user input

/**

?- init_input(["string","a\nb"]),read_string2(_,_,_,_,A),read_string2(_,_,_,_,B). A = "a",
B = "b".

**/

:-include('../../listprologinterpreter/la_strings.pl').
:-include('../../listprologinterpreter/la_strings_string.pl').
:-include('../../listprologinterpreter/la_maths.pl').

init_input([Type,File_or_string]) :-
	SepandPad="\n\r",
	(Type="file"->
	(phrase_from_file_s(string(Input_stream1), File_or_string));
	Input_stream1=File_or_string),
	split_string(Input_stream1,SepandPad,SepandPad,Input_stream2),

	length(Input_stream2,N),
	numbers(N,1,[],Ns),
	
	findall([N1,Item],(member(N1,Ns),get_item_n(Input_stream2,N1,Item)),Items),
	
	retractall(input_stream(_)),
	assertz(input_stream(Items)),

	retractall(input_stream_n(_)),
	assertz(input_stream_n(1)).

read_string2(_,_,_,_,String) :-
	input_stream_n(N),
	((input_stream(Items),member([N,String],Items))->true;
		(writeln("Error: Input stream is exhausted."),abort)),
	N1 is N+1,
	delete(Items,[N,String],Items1),
	retractall(input_stream_(_)),
	assertz(input_stream(Items1)),

	retractall(input_stream_n(_)),
	assertz(input_stream_n(N1)).

	
	