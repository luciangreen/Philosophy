% lfl2html.pl

:-include('../listprologinterpreter/la_strings.pl').

%:-include('../listprologinterpreter/la_strings.pl').

% [[b],"Hello"] -> <b>Hello</b>
% [[p],[[b],"Hello"]] -> <p><b>Hello</b></p>

/*

[[html],[[head],[[title],"Title"]],[[body],[[p],[[b],"Hello"]]]]

H = "<html><head><title>Title</title></head><body><p><b>Hello</b></p></body></html>".

*/

lfl2html(HTML) :-
	read_string(user_input,'\n','\r',_,Input),
	term_to_atom(Term,Input),
	lfl2html2(Term,HTML),!.
	
lfl2html2([],[]).

lfl2html2(String,String) :- string(String),!.
	
lfl2html2(Term,HTML) :-
	lfl2html_codes(Tag,Open_tag,Close_tag),
	(Term=[Tag|String]->
	(lfl2html2(String,HTML3),
	(is_list(HTML3)->concat_list(HTML3,HTML2);HTML2=HTML3),
	%trace,
	concat_list([Open_tag,HTML2,Close_tag],HTML))).


lfl2html2([Term|Term2],[HTML|HTML2]) :-
	lfl2html2(Term,HTML),
	lfl2html2(Term2,HTML2).
	
lfl2html_codes([html],"<html>","</html>").
lfl2html_codes([head],"<head>","</head>").
lfl2html_codes([body],"<body>","</body>").
lfl2html_codes([title],"<title>","</title>").
lfl2html_codes([p],"<p>","</p>").
lfl2html_codes([b],"<b>","</b>").
