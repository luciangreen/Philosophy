% lucian_mini_wp.pl

:-include('philosophy/multi_choice_character.pl').
:-include('spell_checker.pl').

lucian_mini_wp :-
	writeln("Please enter string to process."),
	read_string(user_input,"\n","\r",_,Input),	
	
	%term_to_atom(Input,Reversedionary21),
	(open_s("file.txt",write,Stream1),
	write(Stream1,Input),
	close(Stream1)),

	multi_choice_character([[1,[[-,"Spell Check"]]]],1,[],Choices),
	Choices=["Spell Check"],
	
	spell_check0,
	
	phrase_from_file_s(string(String2), "file2.txt"),
	string_codes(String1,String2),
	%atom_to_term(String1,String,_),
	writeln(String1).
