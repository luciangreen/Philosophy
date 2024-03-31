% paraphraser1.pl

% Tries to paraphrase each non-trivial word

% Uses formatting preserver x splits on space, return x needs formatting - use lpi 117

/*
% place text to be paraphrased in file.txt
cd Dropbox/GitHub/private2/Philosophy/
swipl
['paraphraser1.pl'].
paraphraser.
*/

/*
   Mind reads whether to paraphrase a particular word.
   paraphraser([file, "file.txt"], A, on).
   A = "c c word word c ".
   
   paraphraser([string,"word word word"],A,on).
   A = "word word word".
   
   paraphraser([string,"word word word"],A,on).
   A = "word word c".

   paraphraser([string,"Diversity word word"],A,on).
   A = "Diversity word word".

   paraphraser([string,"Diversity Diversity Diversity"],A,on).
   A = "Diversity Diversity Diversity".

   paraphraser([string,"d d d"],A,on).
   A = "d d d".

   paraphraser([string,"d d d"],A,on).
   A = "d e e".
   
   Diversity
*/

:-dynamic auto/1.

:- include('../listprologinterpreter/listprolog').
:- include('../Music-Composer/mindreadtestmusiccomposer-unusual-mr-tree.pl').

paraphraser(Parameters,File_list_a,AutoMR) :-
	retractall(auto(_)),
	assertz(auto(AutoMR)),
	paraphraser(Parameters,File_list_a),!.

paraphraser([string,String],File_list_a) :-
	(not(catch(auto(_),_,false))->
	(retractall(auto(_)),
	assertz(auto(off)));true),
	%File1="test1.pl",
	string_codes(String,Codes),
	paraphraser1(Codes,File_list_a),!.
	
paraphraser([file,File1],File_list_a
) :-
	(not(catch(auto(_),_,false))->
	(retractall(auto(_)),
	assertz(auto(off)));true),
	%File1="test1.pl",
	phrase_from_file_s(string(Codes), File1),
	paraphraser1(Codes,File_list_a),
	(open_s("file2.txt",write,Stream1),
	write(Stream1,File_list_a),
	close(Stream1)),!.

paraphraser1(Codes,File_list_a) :-
	SepandPad=%".",%
	"&#@~%`$?-+*^,()|.:;=_/[]<>{}\n\r\s\t\\\"!0123456789", % doesn't have "'" xx
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
	
	term_to_atom(Synonym_list2,Synonym_list_a),
	
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
	(((member([File_list3,Synonym],Synonym_list)->true;
	member([Synonym,File_list3],Synonym_list))->
	(mind_read(Synonym_a,[Synonym,File_list3]),
	append(File_list1,[Synonym_a],File_list6),
	Synonym_list=Synonym_list1);
	((%true%trace,
	%trace,
	auto(off))
	->
	(concat_list(["What is a synonym for: ",File_list3,"\n","or <Return> to skip."],Notification),writeln(Notification),
	read_string(user_input, "\n", "\r", _End, Input),
	(Input=""->(Synonym2=File_list3);(Synonym2=Input)),append(Synonym_list,[[File_list3,Synonym2]],Synonym_list1));
	(%File_list1=File_list6,
	%mind_read(Synonym2,[File_list3,Synonym]),
	Synonym2=File_list3,
	Synonym_list=Synonym_list1)
	)),
	append(File_list1,[Synonym2],File_list6)),
	paraphrase1(File_list4,File_list6,File_list2,Synonym_list1,Synonym_list2).

% 15 algs