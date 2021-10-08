% lfl2html.pl

:-include('../listprologinterpreter/la_strings.pl').

% [[b],"Hello"] -> <b>Hello</b>
% [[p],[[b],"Hello"]] -> <p><b>Hello</b></p>

lfl2html(HTML) :-
	read_string(user_input,'\n','\r',_,Input),
	term_to_atom(Term,Input),
	lfl2html2(Term,HTML),!.
	
lfl2html2([],[]).
lfl2html2([Term|Term2],[HTML|HTML2]) :-
	lfl2html2(Term,HTML),
	lfl2html2(Term2,HTML2).
	
lfl2html2(Term,HTML) :-
	(Term=[[p],String]->
	(lfl2html2(String,HTML2),
	concat_list(["<p>",HTML2,"</p>"],HTML))).

lfl2html2(Term,HTML) :-
	(Term=[[b],String]->
	concat_list(["<b>",String,"</b>"],HTML)).
	
	