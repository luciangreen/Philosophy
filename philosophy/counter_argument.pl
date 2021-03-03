% ["Computational English","COMPUTATIONAL ENGLISH by Lucian Green Conglish Reflection 1 of 4.txt",0,algorithms,"1a. *English - themes, language, characterisation, contention, etc."]

% Write a counter-argument to write as a dialectic.

% counter_argument([[[1],"God exists."],[[1,1],"It facilitates meditation."]],Counter_argument).

/**

What is the counter-argument to [[1],God exists.]?
|: It could be a simulation.
What is the counter-argument to [[1,1],It facilitates meditation.]?
|: We could simulate meditation.
Counter_argument = [[[1], "God exists.", "It could be a simulation."], [[1, 1], "It facilitates meditation.", "We could simulate meditation."]].

**/

counter_argument(Argument,Counter_argument) :-
	findall([Number,Reason1,String],(member(Reason,Argument),
	Reason=[Number,Reason1],
	write("What is the counter-argument to "),write(Reason),writeln("?"),
	read_string(user_input, "\n", "\r", _End1, String)),Counter_argument).
	