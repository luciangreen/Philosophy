% paraphraser1.pl

% Tries to paraphrase each non-trivial word

% Uses formatting preserver x splits on space, return x needs formatting - use lpi 117

/*
% place text to be paraphrased in file.txt
cd Philosophy/
swipl
['paraphraser1.pl'].
paraphraser([file,"file.txt"],_,Auto_on_or_off,CS_on_or_off).
% Auto_on_or_off=if asks for synonyms or not
% CS_on_or_off=if items should have spaces in them
% Find paraphrased file in file2.txt
*/

:-dynamic auto/1.
:-dynamic cs/1.

:-include('../listprologinterpreter/listprolog').
:-include('trim_to_unique.pl').

paraphraser(Parameters,File_list_a,Auto) :-
	retractall(auto(_)),
	assertz(auto(Auto)),
	retractall(cs(_)),
	assertz(cs(off)),
	paraphraser(Parameters,File_list_a),!.

paraphraser(Parameters,File_list_a,Auto,CS) :-
	retractall(auto(_)),
	assertz(auto(Auto)),
	retractall(cs(_)),
	assertz(cs(CS)),
	paraphraser(Parameters,File_list_a),!.

paraphraser([string,String],File_list_a) :-
	(not(catch(auto(_),_,false))->
	(retractall(auto(_)),
	assertz(auto(off)));true),
	(not(catch(cs(_),_,false))->
	(retractall(cs(_)),
	assertz(cs(off)));true),
	%File1="test1.pl",
	string_codes(String,Codes),
	paraphraser1(Codes,File_list_a),!.
	
paraphraser([file,File1],File_list_a
) :-
	(not(catch(auto(_),_,false))->
	(retractall(auto(_)),
	assertz(auto(off)));true),
	(not(catch(cs(_),_,false))->
	(retractall(cs(_)),
	assertz(cs(off)));true),
	%File1="test1.pl",
	phrase_from_file_s(string(Codes), File1),
	paraphraser1(Codes,File_list_a),
	(open_s("file2.txt",write,Stream1),
	write(Stream1,File_list_a),
	close(Stream1)),!.

paraphraser1(Codes,File_list_a) :-
	SepandPad=%".",%

"—⁃&#@~%`$?-+*^,()|.:;=_/[]<>{}\n\r\s\t\\\"!0123456789", % doesn't have "'" xx
	%string_codes(String1,Codes),
	%string_to_list2(SepandPad,[],SepandPad1),
	string_codes(SepandPad,SepandPad1),
	%split_string2(String1,SepandPad1,File_list),
	split_on_substring117(Codes,SepandPad1,[],File_list),
	%split_string(String1,SepandPad,SepandPad,File_list),
	
	phrase_from_file_s(string(Codes2), "thesaurus.txt"),
	%trace,
	string_codes(String2,Codes2),
	atom_to_term(String2,Synonym_list,_),
	
paraphrase1(File_list,[],File_list2a,Synonym_list,Synonym_list2),
	
	concat_list(File_list2a,File_list_a),
	
trim_to_unique(Synonym_list2, Unique_list),
clean_synonym_list(Unique_list, Clean_list1),
trim_to_unique(Clean_list1, Clean_list),
term_to_atom(Clean_list, Synonym_list_a),
	
	(open_s("thesaurus.txt",write,Stream2),
	write(Stream2,Synonym_list_a),
	close(Stream2)),!.
		
string_to_list2(B,A1,A2) :- 
	string_concat(D,"",B),
	string_length(D,1),
	append(A1,[D],A2),!.
string_to_list2(A,B,C) :-
	string_concat(D,E,A),
	string_length(D,1),
	append(B,[D],F),
	string_to_list2(E,F,C).

find_synonym(File_list3,Synonym_list,Synonym) :-
	member([File_list3,Synonym],Synonym_list),
	synonym_entry_allowed(File_list3,Synonym),!.
find_synonym(File_list3,Synonym_list,Synonym) :-
	member([Synonym,File_list3],Synonym_list),
	synonym_entry_allowed(Synonym,File_list3),!.

synonym_entry_allowed(Word,Synonym) :-
	(cs(on)->
	(\+ contains_spaces(Word),
	\+ contains_spaces(Synonym));
	true).

contains_spaces(String) :-
	string_codes(String,Codes),
	member(Code,Codes),
	char_type(Code,white),
	!.

clean_synonym_list([],[]).
clean_synonym_list([[Word,Synonym]|Synonym_list],[[Word1,Synonym1]|Synonym_list1]) :-
	clean_synonym_text(Word,Word1),
	clean_synonym_text(Synonym,Synonym1),
	Word1\="",
	Synonym1\="",
	clean_synonym_list(Synonym_list,Synonym_list1),!.
clean_synonym_list([_|Synonym_list],Synonym_list1) :-
	clean_synonym_list(Synonym_list,Synonym_list1).

clean_synonym_text(Text,Text1) :-
	string_codes(Text,Codes),
	findall(Code1,
	(member(Code,Codes),
	((char_type(Code,alpha),Code1=Code);
	(char_type(Code,white),Code1=32))),
	Codes1),
	string_codes(Text2,Codes1),
	split_string(Text2," "," ",Text3),
	atomic_list_concat(Text3,' ',Text4),
	atom_string(Text4,Text1).
	
	paraphrase1([""],File_list,File_list,Synonym_list,Synonym_list) :- !.
	paraphrase1([],File_list,File_list,Synonym_list,Synonym_list) :- !.
paraphrase1(File_list,File_list1,File_list2,Synonym_list,Synonym_list2) :-
	File_list=[File_list3|File_list4],
	string_concat(File_list5,_E,File_list3),
	string_length(File_list5,1),
	string_codes(File_list5,File_list5_c),
	(not(phrase(word1(File_list5_c),_))->true;
	member(File_list3,["the","a","i","on","with","of","an","for","to","was","were","and","in","my","from","out","by"])),
	append(File_list1,[File_list3],File_list6),
	paraphrase1(File_list4,File_list6,File_list2,Synonym_list,Synonym_list2).

paraphrase1(File_list,File_list1,File_list2,Synonym_list,Synonym_list2) :-
	File_list=[File_list3|File_list4],
	string_concat(File_list5,_E,File_list3),
	string_length(File_list5,1),
	%letters(File_list5),
	string_codes(File_list5,File_list5_c),
	phrase(word1(File_list5_c),_),
	((find_synonym(File_list3,Synonym_list,Synonym)->
	(append(File_list1,[Synonym],File_list6),
	Synonym_list=Synonym_list1);
	((%true%trace,
	%trace,
	auto(off))
	->
	(concat_list(["What is a synonym for: ",File_list3,"\n","or <Return> to skip."],Notification),writeln(Notification),
	read_string(user_input, "\n", "\r", _End, Input),
	(Input=""->(Synonym2=File_list3);(Synonym2=Input)),append(Synonym_list,[[File_list3,Synonym2]],Synonym_list1));
	(%File_list1=File_list6,
	Synonym2=File_list3,
	Synonym_list=Synonym_list1)
	)),
	append(File_list1,[Synonym2],File_list6)),
	paraphrase1(File_list4,File_list6,File_list2,Synonym_list1,Synonym_list2).



	
	
