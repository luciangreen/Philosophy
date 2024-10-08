% paraphraser1.pl

% Tries to paraphrase each non-trivial word

% Uses formatting preserver x splits on space, return x needs formatting - use lpi 117

/*
% place text to be paraphrased in file.txt
cd Dropbox/GitHub-private2/Philosophy/
swipl
['paraphraser1.pl'].
paraphraser.
*/

:-dynamic auto/1.

:-include('../listprologinterpreter/listprolog').
%:-include('14 10 23.pl').

paraphraser2(Parameters,File_list_a,Auto) :-
	Auto=on,
	retractall(auto(_)),
	assertz(auto(Auto)),
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

%paraphraser1(Words, Counts) :-
    %maplist(downcase_atom, Words, LwrWords),
    %msort(LwrWords, Sorted),
    %clumped(Sorted, Counts).
    %maplist(Words,The,Words1).

p(The,Word,Word1) :-
 (member([Word,Word2],The)->random_member(Word1,[Word,Word2]);Word=Word1).
 
paraphraser1(Codes,File_list_a) :-
	SepandPad=%".",%
	"&#@~%`$?-+*^,()|.:;=_/[]<>{}\n\r\s\t\\\"!0123456789", % doesn't have "'" xx
	%string_codes(String1,Codes),
	%string_to_list2(SepandPad,[],SepandPad1),
	string_codes(String1,Codes),
	split_string(String1,SepandPad,SepandPad,File_list),
	%split_on_substring117(Codes,SepandPad1,[],File_list),
	%split_string(String1,SepandPad,SepandPad,File_list),
	
	phrase_from_file_s(string(Codes2), "thesaurus.txt"),
	%trace,
	string_codes(String2,Codes2),
	atom_to_term(String2,Synonym_list,_),
	%trace,
	
	    maplist(p(Synonym_list),File_list,File_list2a),

%paraphrase1(File_list,[],File_list2a,Synonym_list,Synonym_list2),
	findall([W," "],member(W,File_list2a),File_list_3a),	
	flatten(File_list_3a,File_list_4a),
	foldr(string_concat,File_list_4a,File_list_a),
	%concat_list(File_list2a,File_list_a),
	
	%term_to_atom(Synonym_list2,Synonym_list_a),
	
	%(open_s("thesaurus.txt",write,Stream2),
	%write(Stream2,Synonym_list_a),
	%close(Stream2)),
	!.
	
	/*	
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
*/


	
	