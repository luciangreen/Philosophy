% ["Mind Reading","Mind Reading Audio Input and Output 2.txt",0,algorithms,"22. *I mind said the frontier of knowledge.  I used simulated intelligence to connect to real life events as a mind short course, verifying databases for correctness of fundamental knowledge."]

/**
connect ideas
- explain connections from second philosophy descriptions to algorithms x
- explain connections from first philosophy descriptions to second philosophy descriptions

states ignored terms, transformed meanings pointing to new interesting algorithm
**/

explain_connection(Philosophy_description1,Philosophy_description2) :-
	%
	writeln(["What terms in",Philosophy_description1,"are ignored in",Philosophy_description2,"in item1,item2 form?"]),
	read_string(user_input,","\n", "\r", _,S1),
	split_string(S1, ",", ",", S12),

	writeln(["What term in",Philosophy_description1,"is transformed?"]),
	read_string(user_input,","\n", "\r", _,S2),
	
	writeln(["What is",S2,"transformed into in",Philosophy_description2,"?"]),
	read_string(user_input,","\n", "\r", _,S3),
	
	writeln(["In what ways could",S2,"transform into",S3," (separate with comma(s))?"]),
	read_string(user_input,","\n", "\r", _,S4),
	split_string(S4, ",", ",", S42),
	
	phrase_from_file_s(string(String00a), "phil_desc_connections.txt"),
	string_codes(String02b,String00a),
	atom_to_term(String02b,String02a,[]),
	
	append(String02a,[[Philosophy_description1,Philosophy_description2,S12,S2,S3,S42]],String02c),

	string_atom(String02d,String02c),

	(open_s("phil_desc_connections.txt",write,Stream1),
	write(Stream1,String02d),
	close(Stream1)),!.

print_report :-
	phrase_from_file_s(string(String00a), "phil_desc_connections.txt"),
	string_codes(String02b,String00a),
	atom_to_term(String02b,String02a,[]),

	findall(_,(member([Philosophy_description1,Philosophy_description2,S12,S2,S3,S42],String02a),
	nl,
	write("Philosophy description 1: "),writeln(Philosophy_description1),
	write("Philosophy description 2: "),writeln(Philosophy_description2),
	write("Ignored: "),writeln(S12),
	write("Term transformed in Philosophy description 1: "),writeln(S2),
	write("Term transformed to in Philosophy description 2: "),writeln(S3),
	write("Way(s) it is transformed: "),writeln(S42)),_).
	