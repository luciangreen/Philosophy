%% Spell Checker

/**

[debug]  ?- spell_checker0.                                                     Please choose the correction to "Abple":
1 - Apple

|: 1
Please choose the correction to "applef":
1 - apple

|: 1
true.

**/

%:- include('../listprologinterpreter/listprolog').
:- include('../listprologinterpreter/la_strings').
:- include('../listprologinterpreter/la_strings_string').
:- include('../listprologinterpreter/la_maths').
:- include('../mindreader/make_mind_reading_tree4 working1.pl').

spell_checker0 :-
	phrase_from_file_s(string(Codes), "file.txt"),
	SepandPad="&#@~%`$?-+*^,()|.:;=_/[]<>{}\n\r\s\t\\\"!0123456789",	 % No '
	string_codes(SepandPad,SepandPad1),

	split_on_substring117(Codes,SepandPad1,[],File_list),
	%phrase_from_file_s(string(Codes2), "../Text-to-Breasonings/brdict1.txt"),
	phrase_from_file_s(string(Codes2), "brdict1.txt"),
	string_codes(String2,Codes2),
	atom_to_term(String2,Dictionary,_),

	findall(A,(member([A1,_],Dictionary),atom_string(A1,A)),String_dict),

%trace,
	dictionary_to_decision_tree(Dictionary,Dictionary2),

%trace,	
	findall([A4,_],(member([B1,_],Dictionary),string_concat(B1,"01",B),
	string_to_list21(B,[],A2),
	reverse(A2,A3),maplist(append,[[A3]],[A]),
	concat_list(A,A4)),Dictionary3),

	dictionary_to_decision_tree(Dictionary3,Reversed_dictionary2),
%trace,
	spell_check(File_list,[],File_list2a,String_dict,Dictionary2,Reversed_dictionary2),
	%trace,
	%maplist(append,[File_list2a],File_list2a2),
	%[File_list_a]=File_list2a,
	concat_list(File_list2a,File_list2a1),
	
	(open_s("file2.txt",write,Stream1),
	write(Stream1,File_list2a1),
	close(Stream1)),!.

string_to_list21(B,A1,A2) :- 
	string_concat(D,"",B),
	string_length(D,1),
	append(A1,[D],A2),!.
string_to_list21(A,B,C) :-
	string_concat(D,E,A),
	string_length(D,1),
	append(B,[D],F),
	string_to_list21(E,F,C).


dictionary_to_decision_tree(Dictionary,Dictionary2) :-
%trace,
	findall(A,(member([A1,_],Dictionary),string_concat(A1,"01",A)),B),
	string_to_list1(B,1,_,[],Options2),
	maplist(append,[Options2],[Tree]),
	merge_lists_a([1],Tree,[],Dictionary2).

spell_check1(Dictionary2,Reversed_dictionary2,Word1,Suggestions) :-
	string_to_list21(Word1,[],A2),

%trace,
	A2=[Letter0|Rest],
	downcase_atom(Letter0,Letter01),atom_string(Letter01,Letter),
	((%trace,
	member([1,Letter,State2],Dictionary2),
	
	spell_check2(d,Dictionary2,State2,Rest,[Letter],_Word2,[],Suggestions1))->true;(Suggestions1=[])),
	
	%trace,
	
	reverse(A2,A3),
	A3=[Letter10|Rest1],
		downcase_atom(Letter10,Letter101),atom_string(Letter101,Letter1),

	((%trace,
	member([3,Letter1,State21],Reversed_dictionary2),
	%writeln1(spell_check2(r,Reversed_dictionary2,State21,Rest1,[Letter1],_Word21,[],Suggestions11)),
spell_check2(r,Reversed_dictionary2,State21,Rest1,[Letter1],_Word21,[],Suggestions11))->true;(Suggestions11=[])),
%trace,
	length(Suggestions1,L_Word2),
	length(Suggestions11,L_Word21),
	
	(L_Word2>L_Word21->Suggestions=Suggestions1;
	Suggestions=Suggestions11).
	

%spell_check2(_Dictionary2,State2,[],Word2,Word2,Suggestions1,Suggestions1) :- !.
spell_check2(Direction,Dictionary2,State2,A2,Word2,_Word3,Suggestions1,Suggestions2) :-
	((A2=[Letter|_Rest],
	not(member([State2,Letter,_State3],Dictionary2)))->true;
	A2=[]),
	%trace,
	%writeln1(	suggestions(Direction,Dictionary2,State2,Word2,_,Suggestions1,Suggestions3)),
	findall(Suggestions31,suggestions(Direction,Dictionary2,State2,Word2,_,Suggestions1,Suggestions31),Suggestions32),
	maplist(append,Suggestions32,Suggestions22),
	%trace,
	findall(Suggestions21,(member(A4,Suggestions22),append(Suggestions21,["0","1"],A4)),Suggestions2).
	%writeln1(Suggestions3),
	%notrace,
	%findall(C,(member(B,Suggestions3), B=[_|B2],% ****
	%maplist(append,[[Word2,
	%B2]],[C])),Suggestions2).
	
spell_check2(Direction,Dictionary2,State2,A2,Word2,Word3,Suggestions1,Suggestions2) :-
	A2=[Letter|Rest],
	member([State2,Letter,State3],Dictionary2),
	append(Word2,[Letter],Word4),
	spell_check2(Direction,Dictionary2,State3,Rest,Word4,Word3,Suggestions1,Suggestions2).

suggestions(Direction,Dictionary2,State2,Word2,_Word21,Suggestions1,Suggestions2) :-
%trace,
	reverse(Word2,Word22),
	Word22=[_Letter1|_Rest],
	%(
	(Direction=d
	%true
	->(S1=State2,S2=_);(S1=_,S2=State2)),
	not(member([S1,_Letter,S2],Dictionary2)),%->true;notrace),
	%not(member([S2,Letter,S1],Dictionary2))),%->true;notrace),
%trace,	string_concat(Letter,Word2,Word23),
%trace,
	(Direction=d->Word24=Word2;
	(%string_to_list21(Word2,[],Word23),
	reverse(Word2,Word231),concat_list(Word231,Word232),string_concat(Word24,"01",Word232))),
	append(Suggestions1,[Word24],Suggestions2).%,notrace.
	 %notrace.
suggestions(Direction,Dictionary2,State2,Word2,Word21,Suggestions1,Suggestions2) :-
	reverse(Word2,Word22),
	Word22=[_Letter1|_Rest],
	(Direction=d
	%true
	->(S1=State2,S2=State3);(S1=State3,S2=State2)),
	member([S1,Letter2,S2],Dictionary2),
	append(Word2,[Letter2],Word4),
	suggestions(Direction,Dictionary2,State3,Word4,Word21,Suggestions1,Suggestions2).



spell_check([""],File_list,File_list,_String_dict,_Dictionary,_Reversed_dictionary2) :- !.
spell_check([],File_list,File_list,_String_dict,_Dictionary,_Reversed_dictionary2) :- !.
spell_check(File_list,File_list1,File_list2,String_dict,Dictionary,Reversed_dictionary2) :-
	File_list=[File_list3|File_list4],
	string_concat(File_list5,_E,File_list3),
	string_length(File_list5,1),
	string_codes(File_list5,File_list5_c),
	not(phrase(word1(File_list5_c),_)),
	append(File_list1,[File_list3],File_list6),
	spell_check(File_list4,File_list6,File_list2,String_dict,Dictionary,Reversed_dictionary2).
spell_check(File_list,File_list1,File_list2,String_dict,Dictionary,Reversed_dictionary2) :-
%trace,
%writeln1(spell_check(File_list,File_list1,File_list2,String_dict,Dictionary,Reversed_dictionary2)),
	File_list=[File_list302|File_list4],
	string_concat(File_list5,_E,File_list302),
	string_length(File_list5,1),
	string_codes(File_list5,File_list5_c),
	phrase(word1(File_list5_c),_),
	
	downcase_atom(File_list302,File_list301),atom_string(File_list301,File_list3),
	
	(%trace,
		

	member(File_list3,String_dict)->Choice=File_list3;
	(spell_check1(Dictionary,Reversed_dictionary2,File_list302,Suggestions),
	%repeat,
	number_menu(File_list302,Suggestions,Choice2),
	%string_concat(Choice2,"01",Choice3),
	(%trace,
	is_upper(File_list5_c)->(concat_list(Choice2,Choice211),string_concat(Choice4,E1,Choice211),
	string_length(Choice4,1),upcase_atom(Choice4,Choice5),string_concat(Choice5,E1,Choice)
	);Choice2=Choice
	))),
	%trace,
	%(Choice=[Choice_b]->true;Choice_b=Choice),
	(string(Choice)->Choice_a=Choice;
	concat_list(Choice,Choice_a)),
	append(File_list1,[Choice_a],File_list6),
		spell_check(File_list4,File_list6,File_list2,String_dict,Dictionary,Reversed_dictionary2).

	
number_menu(File_list3,Suggestions,Choice) :-
	length(Suggestions,LCritique3),
	numbers(LCritique3,1,[],List1),
%trace,
findall([N," - ",CString5a13,"\n"],(member(N,List1),get_item_n(Suggestions,N,CString5a11),
%append(CString5a11,["0","1"],CString5a1)***,%reverse(CString5a1,CString5a11),
concat_list(CString5a11,CString5a12),
capitalise_if_necessary(File_list3,CString5a12,CString5a13)),CStrings1),
%trace,
findall([N,CString5a11],(member(N,List1),get_item_n(Suggestions,N,CString5a11)%,reverse(CString5a1,CString5a11)
),CStrings2),
%trace, %% *****
maplist(append,[CStrings1],[CStrings111]),
concat_list(CStrings111,CStrings12),

concat_list(["Please choose the correction to \"",File_list3,"\":"],Note1),
writeln(Note1),
writeln(CStrings12),
try_reading_number(CStrings2,Choice).
%read_string(user_input, "\n", "\r", _, String2aa),
%number_string(Number,String2aa),
%trace,
	%member([Number,Choice],CStrings2).
	
try_reading_number(CStrings2,Choice) :-
read_string(user_input, "\n", "\r", _, String2aa),
((number_string(Number,String2aa),
	member([Number,Choice],CStrings2))->true;
	try_reading_number(CStrings2,Choice)).
	
	capitalise_if_necessary(File_list302,Word,Choice211) :-
	string_concat(File_list5,_E,File_list302),
	string_length(File_list5,1),
	string_concat(Word1,E1,Word),
	string_length(Word1,1),
	%string_codes(File_list5,File_list5_c),
	%phrase(word1(File_list5_c),_),
	(is_upper(File_list5)->(upcase_atom(Word1,Word11),string_concat(Word11,E1,Choice211));Choice211=Word).
