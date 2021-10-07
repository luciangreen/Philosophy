% lfl2html.pl

:-include('../listprologinterpreter/la_strings.pl').

% [[b],"Hello"] -> <b>Hello</b>

lfl2html(HTML) :-
	read_string(user_input,'\n','\r',_,Input),
	term_to_atom(Term,Input),
	(Term=[[b],String]->
	concat_list(["<b>",String,"</b>"],HTML)).