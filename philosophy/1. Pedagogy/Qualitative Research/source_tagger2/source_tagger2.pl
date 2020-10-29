source_tagger :-
	phrase_from_file_s(string(String00a),"tags.txt"),
	string_codes(String02b,String00a),
	atom_to_term(String02b,String02a,[]),
	
	ask_for_new_tag(String02a,String02c),
	
	term_to_atom(String02c,File_contents),
	open_s("tags.txt",write,Stream),
	write(Stream,File_contents),close(Stream).

ask_for_new_tag(A,B) :-
	prompt("New tag? (y/n)",New_tag),
	(New_tag="y"->(tag(Tag,Text,Source),
	append(A,[[Tag,Text,Source]],C),
	ask_for_new_tag(C,B));
	A=B).

tag(Tag,Text,Source) :-
	prompt("What are the tags? (e.g. \"headache,car\" for \"I have a headache from the car.\"",Tag),
	prompt("What is the problem-type? (e.g. \"Headache from the car.\")",Text),
	prompt("What is the solution? (e.g. \"See Lucian Green's Medicine's Honey Pot Prayer.\")",Source).

prompt(Prompt,String) :-
	writeln(Prompt),
	read_string(user_input, "\n", "\r", _End, String).
	
%%	- enter text, source and tags
	
%%	- tags used in x are chapter topics
	
print_tags :-
%%trace,
	phrase_from_file_s(string(String00a),"tags.txt"),
	string_codes(String02b,String00a),
	atom_to_term(String02b,String02a,[]),
	
	findall(T4,(member(A,String02a),A=[T1,_,_],
	downcase_atom(T1,T2),atom_string(T2,T3),
	split_string(T3,", ",", ",T4)),T5),
	
	maplist(append,[T5],[T6]),
	sort(T6,T7),
	
	findall(_,(member(T8,T7),writeln(T8)),_),
	
	prompt("Enter tags to show report of.",T902),
	split_string(T902,", ",", ",T90),
	%%atom_to_term(T901,T90,[]),

	findall(T100,(member(T91,T90),
	findall([TA,TB],(member(A,String02a),A=[T1,TA,TB],
	downcase_atom(T1,T2),atom_string(T2,T3),
	split_string(T3,", ",", ",T4),
	member(T91,T4)),T100)),[T101]),
	sort(T101,T10),
	findall(_,(member([T11,T12],T10),writeln(T11),writeln(T12),writeln("")),_).

	

