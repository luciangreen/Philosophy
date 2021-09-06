% lucianpl

% converts from prolog to list prolog

% runs code


% () can run queries based on loaded alg

% put queries into predicate with collected arguments and call

/*
?- lucianpl.
Lucian Prolog
L:load("test.lp").
L:a(1,1,A).
A=2.

[debug]  ?- lucianpl.                                                                 Lucian Prolog
L:member([1,2],2).
true.
L:member([1,2],A).
A=1.
L:halt.

*/

:-include('../Prolog-to-List-Prolog/p2lpconverter.pl').
:-include('../listprologinterpreter/listprolog').
:-include('../List-Prolog-to-Prolog-Converter/lp2pconverter.pl').

:- dynamic lp_trace/1.
:- dynamic lp_lang/1.

lucianpl :-
	writeln("Lucian Prolog"),
	
	retractall(lp_trace(_)),
	assertz(lp_trace(off)),

	%retractall(lp_lang(_)),
	%assertz(lp_lang("en")),

	loop([],_).
	
loop(Algorithm1,Algorithm2) :-
	write("L:"),
	read_string(user_input, "\n", "\r", _, Input),
	%catch(
	(p2lpconverter([string,Input],Input1)->true;
	%_,
	%(catch(
	(%trace,
	string_concat("a:-",Input,Input2),
	p2lpconverter([string,Input2],Input3),
	Input3=[[[n,a],":-",Input1]])),
	%_,
	%(writeln("Error."),
	%loop(Algorithm1,Algorithm2),
	
	(Input1=[[[n, trace]]]->
	(retractall(lp_trace(_)),
	assertz(lp_trace(on)),
	loop(Algorithm1,Algorithm2));
	
	(%Input="notrace."->
	Input1=[[[n, notrace]]]->
	(retractall(lp_trace(_)),
	assertz(lp_trace(off)),
	loop(Algorithm1,Algorithm2));
	
	/*
	(Input1=[[n, lang], [Lang]]->
	%Input1=lang(Lang)->
	(retractall(lp_lang(_)),
	assertz(lp_lang(Lang)),
	loop(Algorithm1,Algorithm2));
	*/
	
	(Input1=[[[n, halt]]]->
	%Input1=lang(Lang)->
	(true);
	
	(%term_to_atom(Input1,Input),
	%p2lpconverter([string,Input],Input1)
	Input1=[[[n, load], [File]]]->
	%Input1=load(File)
	(p2lpconverter([file,File],Algorithm3),
	append(Algorithm1,Algorithm3,Algorithm4),
	loop(Algorithm4,Algorithm2));
	
	(%Input=run())
	lp_trace(Debug),%lp_lang(Lang),
	%p2lpconverter([string,Input],[Query]),
	international_interpret([lang,"en"],Debug,Input1,Algorithm1,Result2),
	(Result2=[[]]->writeln("true.");
	(Result2=[]->writeln("false.");
	(Result2=[Result1],
	%trace,
	findall([V,"=",R,",","\n"],(member([V1,R1],Result1),
	interpretstatementlp2p3(V1,V),term_to_atom(R1,R)
	%interpretstatementlp2p2(A,"",[V,R])
	),C),
	maplist(append,[C],[D]),append(E1,[",","\n"],D),
	append(E1,["."],E),
	concat_list(E,Result),
	writeln(Result)))),
	loop(Algorithm1,Algorithm2))	

	)))),!.

