:-include('s2a/spec_to_algorithm.pl').

simple_chatbot :-

	(catch(algs(Algs),_,false)->
	findall(_,(member(Alg,Algs),
	retractall(algs(Alg))),_);
	true),
	retractall(algs(_)),
	assertz(algs([])),
	
loop.
loop:-
	writeln("Enter an algorithm spec, e.g. [[[input,[['A',[\"A\",\"B\",[+,[\"A\",\"B\"]]]]]],[output,[['B',\"C is A+B\"]]]],[[input,[['A',[\"E\",\"F\",[+,[\"E\",\"F\"]]]]]],[output,[['B',\"C is E+F\"]]]]] or <return> to exit."
	),
read_string(user_input,'\n','\r',_,S1),
(S1=""->true;
(
term_to_atom(S,S1),
writeln("Is the character break down on or off?"),
read_string(user_input,'\n','\r',_,S2),
string_atom(S2,CBM),
	spec_to_algorithm(algorithm1,S,CBM,Alg1),
	writeln(Alg1),
	loop)).

