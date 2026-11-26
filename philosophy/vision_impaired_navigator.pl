% ["Fundamentals of Pedagogy and Pedagogy Indicators","FUNDAMENTALS OF PEDAGOGY by Lucian Green Two Uses 11 of 30.txt",0,algorithms,"108.	ALEXIS: *I prepared to address that a human would benefit from text-to-speech. I did this by writing Martha Nussbaum’s probable comments on Richard Rorty's probable comments on the line “I did this by writing the text-to-speech algorithm” for the algorithm idea “I did this by writing the text-to-speech algorithm' in the Computational English argument in Computational English. First, I liked speech (in text-to-speech). Second, I wanted text. Third, I asked, “What does the text refer to?”."]

% Help a vision-impaired user navigate a term.

/**
[
[ read this ,
 [ go down, read
 
**/

% vision_impaired_navigator([[[1],"a"],[[1,1],"a.1"],[[1,2],"a.2"],[[2],"b"]],[1]).
vision_impaired_navigator(Term,Curr) :-
	member([Curr,Text],Term),
	writeln([Curr,Text]),
	get_options(Term,Curr,Options),
	writeln(["Enter:\n",Options]),
	read_string(user_input, "\n", "\r", _End2, String),
	(String="q"->abort;
	(String="g"->
	(writeln("Enter node to go to (e.g. [1,2,1]):"),
	read_string(user_input, "\n", "\r", _End3, String2),
	%trace,
	%writeln([options,Options]),
	atom_to_term(String2,Curr3,[]),
	(member([Curr3,_],Term)->Curr2=Curr3;(
	writeln([Curr3,"not found."]),
	Curr2=Curr)));
	((member([String,_,[Curr2,_],_],Options)->true;Curr2=Curr)))),
	vision_impaired_navigator(Term,Curr2).
	
	
get_options(Term,Curr,Options7) :-
	% next, previous, down, up, go
	Options2=[],
	get_next(Curr,Next),
	(member([Next,N1],Term)->append(Options2,[["n","next",[Next,N1],"\n"]],Options3);
	Options3=Options2),
	get_prev(Curr,Prev),
	(member([Prev,P1],Term)->append(Options3,[["p","prev",[Prev,P1],"\n"]],Options4);
	Options4=Options3),
	get_up(Curr,Up),
	(member([Up,U1],Term)->append(Options4,[["u","up",[Up,U1],"\n"]],Options5);
	Options5=Options4),
	get_down(Curr,Down),
	(member([Down,D1],Term)->append(Options5,[["d","down",[Down,D1],"\n"]],Options6);
	Options6=Options5),
	append(Options6,[["g","go","\n"],["q","quit","\n"]],Options7).
	
get_next(Curr1,Next) :-
	reverse(Curr1,Curr2),
	Curr2=[N1|Rest],
	N2 is N1+1,
	Curr3=[N2|Rest],
	reverse(Curr3,Next).
	
get_prev(Curr1,Next) :-
	reverse(Curr1,Curr2),
	Curr2=[N1|Rest],
	N2 is N1-1,
	Curr3=[N2|Rest],
	reverse(Curr3,Next).

get_down(Curr1,Next) :-
	append(Curr1,[1],Next).

get_up(Curr1,Next) :-
	reverse(Curr1,Curr2),
	Curr2=[_N1|Rest],
	reverse(Rest,Next).
	
