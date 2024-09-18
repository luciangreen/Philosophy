% ["Short Arguments","God Algorithm.txt",0,algorithms,"5. I prepared to ask why why was.  I did this by stating that I knew the result of the God algorithm was why.  First, I noticed the occurrence of the event.  Second, I read the result of the God algorithm.  Third, I worked out that the result explained the occurrence."]

% * I prepared to ask why why was.

% decision tree of algorithms (autocomplete)

% Based on spell_checker.pl

/*
[debug]  ?- algorithm_decision_tree0.                                           Please choose the correction to "[[\t[n,function", <return> for no correction or type a replacement word:
1 - (2) - [[n,word213],[[v,3],[v,3]],":-",[[[n,true]]]]
2 - (2) - [[n,word212_atom],[[v,1],[v,1],[v,3],[v,3]],":-",[[[n,true]]]]
3 - (2) - [[n,word212],[[v,3],[v,3]],":-",[[[n,true]]]]
4 - (2) - [[n,word212],[[v,1],[v,1],[v,3],[v,3]],":-",[[[n,true]]]]
5 - (2) - [[n,verb],[[v,1],[v,1]],":-",[[[n,true]]]]
6 - (2) - [[n,verb],":-",[[[n,true]]]]
7 - (2) - [[n,types],":-",[[[n,true]]]]
8 - (2) - [[n,traverse],[[v,1],[v,2]],":-",[[[n,traverse],[[v,1],[v,2],[v,6],[v,8]]],[[n,cut]]]]
9 - (2) - [[n,tra_las],[[v,1],[v,2]],":-",[[[n,las],[[v,1],[v,5]]],[[n,append],[[v,5],[v,2]]]]]
10 - (2) - [[n,test2],":-",[[[n,true]]]]
11 - (2) - [[n,test1],":-",[[[n,true]]]]
12 - (2) - [[n,sum],[[v,2],[v,2]],":-",[[[n,true]]]]
13 - (2) - [[n,substring],[[v,2]],":-",[[[n,not],[[[n,=],[[v,2]]]]],[[n,fail]]]]
14 - (2) - [[n,substring],":-",[[[n,true]]]]
15 - (2) - [[n,subject],[[v,1],[v,1]],":-",[[[n,true]]]]
16 - (2) - [[n,subject],":-",[[[n,true]]]]
17 - (2) - [[n,stop_at_top],[[v,1]],":-",[[[n,head],[[v,1]]]]]
18 - (2) - [[n,stop_at_top],":-",[[[n,true]]]]
19 - (2) - [[n,sort1],[[v,2],[v,2]],":-",[[[n,true]]]]
20 - (2) - [[n,sort0],[[v,1],[v,2]],":-",[[[n,sort1],[[v,1],[v,2]]]]]

*/
:-include('../listprologinterpreter/listprolog.pl').

:-include('../listprologinterpreter/la_strings.pl').
:-include('../listprologinterpreter/la_string_strings.pl').
:-include('../listprologinterpreter/la_maths.pl').
:-include('../mindreader/make_mind_reading_tree4 working1.pl').
:-include('../Text-to-Breasonings/texttobrall2_reading.pl').
:-include('../listprologinterpreter/lpiverify4.pl').
:-include('replace_vars.pl').

algorithm_decision_tree_dict_setup :- %% run this first
	%SepandPad="&#@~%`$?-+*^,()|.:;=_/[]<>{}\n\r\s\t\\\"!0123456789",	 % No '

	%phrase_from_file_s(string(Codes2), "brdict1.txt"),
	
findall([F1,F1],(test(_,_,F,_),member(F2,F),replace_vars1(F2,F3,1,_,[],_),term_to_atom(F3,F1),string_length(F1,L),L=<100),Dictionary_c),
	%phrase_from_file_s(string(Codes2), "../Text-to-Breasonings/brdict1.txt"),

	%string_codes(String2,Codes2),
	%atom_to_term(String2,Dictionary_c,_),

	%splitfurther(Codes2,Dictionary_c),

	findall(A,(member([A1,_],Dictionary_c),atom_string(A1,A)),String_dict),


%trace,
	split_into_sets(Dictionary_c,%2
	3%50% ***
	,Dictionary_a),

	length(Dictionary_a,L),
	numbers(L,1,[],NN),

	findall(Dictionary2,(member(NN1,NN),
	get_item_n(Dictionary_a,NN1,Dictionary_b),
	writeln([dictionary,NN1,of,L]),
	%member(Dictionary_b,Dictionary_a),
	dictionary_to_decision_tree(Dictionary_b,Dictionary2)),Dictionary_d),

%trace,	
	findall(Reversed_dictionary2_a,(member(NN1,NN),
	get_item_n(Dictionary_a,NN1,Dictionary_b),
	writeln([reversed,dictionary,NN1,of,L]),
	findall([A4,_],(member([B,_],Dictionary_b),%string_concat(B1,"01",B)
	string_to_list21(B,[],A2),
	reverse(A2,A3),maplist(append,[[A3]],[A]),
	concat_list(A,A4)),Dictionary3),

	dictionary_to_decision_tree(Dictionary3,Reversed_dictionary2_a)),
	Reversed_dictionary2),
%trace,

	term_to_atom(String_dict,String_dict1),
	(open_s("alg_string_dict.txt",write,Stream1),
	write(Stream1,String_dict1),
	close(Stream1)),

	term_to_atom(Dictionary_d,Dictionary_d1),
	(open_s("alg_dict2.txt",write,Stream2),
	write(Stream2,Dictionary_d1),
	close(Stream2)),

	term_to_atom(Reversed_dictionary2,Reversed_dictionary21),
	(open_s("reversed_alg_dict.txt",write,Stream3),
	write(Stream3,Reversed_dictionary21),
	close(Stream3)),!.

algorithm_decision_tree0 :- %% run this second

	phrase_from_file_s(string(Codes), "alg_file.txt"),
	SepandPad="&#@~%`$?-+*^,()|.:;=_/[]<>{}\n\r\s\t\\\"!0123456789",	 % No '
	string_codes(SepandPad,_SepandPad1),

	split_on_substring117(Codes,[]%SepandPad1
	,[],File_list),
	
		phrase_from_file_s(string(String_dict2), "alg_string_dict.txt"),
	string_codes(String_dict1,String_dict2),
	atom_to_term(String_dict1,String_dict,_),

	phrase_from_file_s(string(Dictionary_d2), "alg_dict2.txt"),
	string_codes(Dictionary_d1,Dictionary_d2),
	atom_to_term(Dictionary_d1,Dictionary_d,_),

	phrase_from_file_s(string(Reversed_dictionary22), "reversed_alg_dict.txt"),
	string_codes(Reversed_dictionary21,Reversed_dictionary22),
	atom_to_term(Reversed_dictionary21,Reversed_dictionary2,_),


algorithm_decision_tree(File_list,[],File_list2a,String_dict,Dictionary_d,Reversed_dictionary2),
	%trace,
	%maplist(append,[File_list2a],File_list2a2),
	%[File_list_a]=File_list2a,
	concat_list(File_list2a,File_list2a1),
	
	(open_s("alg_file2.txt",write,Stream1),
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
	merge_lists_a([1],Tree,[],Dictionary2),!.

algorithm_decision_tree1(Dictionary2,Reversed_dictionary2,Word1,Suggestions) :-
	string_to_list21(Word1,[],A2),

%trace,
	A2=[Letter0|Rest],
	((Letter0=Letter)->
	true;(downcase_atom(Letter0,Letter01),atom_string(Letter01,Letter))),
	(%trace,
	(findall(Suggestions1A,
	((	member(Dictionary2_a,Dictionary2),

	member([1,Letter_a,State2],Dictionary2_a),
		((Letter_a=Letter)->
	true;(downcase_atom(Letter_a,Letter01),atom_string(Letter01,Letter))),

algorithm_decision_tree2(d,Dictionary2_a,State2,Rest,[Letter_a],_Word2,[],Suggestions1A))),Suggestions1B),
	maplist(append,[Suggestions1B],[Suggestions1])
	%maplist(append,[Suggestions1_a],[Suggestions1])
	)->true;
	(Suggestions1=[])),
	
	%trace,
	
	reverse(A2,A3),
	A3=[Letter10|Rest1],
		((Letter10=Letter1)->	true;(downcase_atom(Letter10,Letter101),atom_string(Letter101,Letter1))),

%trace,
	(
	(findall(Suggestions2A,
		(member(Reversed_dictionary2_a,Reversed_dictionary2),

	(member([1,Letter_a1,State21],Reversed_dictionary2_a),
			((Letter_a1=Letter1)->
	true;(downcase_atom(Letter_a1,Lettera01),atom_string(Lettera01,Letter1))),

%writeln1(algorithm_decision_tree2(r,Reversed_dictionary2,State21,Rest1,[Letter1],_Word21,[],Suggestions11)),
algorithm_decision_tree2(r,Reversed_dictionary2_a,State21,Rest1,[Letter_a1],_Word21,[],Suggestions2A))),Suggestions2B),
	maplist(append,[Suggestions2B],[Suggestions11])
	%maplist(append,[Suggestions11_a],[Suggestions11])
	)
->true;(Suggestions11=[])),
%trace,
	%length(Suggestions1,L_Word2),
	%length(Suggestions11,L_Word21),
	
	%(L_Word2>L_Word21->Suggestions=Suggestions1;
	%Suggestions=Suggestions11).
	append(Suggestions1,Suggestions11,Suggestions_a),
	sort(Suggestions_a,Suggestions_b),
	reverse(Suggestions_b,Suggestions_c),
	length(Suggestions_c,Suggestions_c_l),
	(Suggestions_c_l<20->Sugg_l=Suggestions_c_l;Sugg_l=20),
	length(Suggestions,Sugg_l),
	append(Suggestions,_,Suggestions_c).

%algorithm_decision_tree2(_Dictionary2,State2,[],Word2,Word2,Suggestions1,Suggestions1) :- !.
algorithm_decision_tree2(Direction,Dictionary2,State2,A2,Word2,_Word3,Suggestions1,Suggestions2) :-
	((A2=[Letter100|_Rest],
	((Letter100=Letter)->	true;(downcase_atom(Letter100,Letter101),atom_string(Letter101,Letter))),
	not((member([State2,Letter_b,_State3],Dictionary2),
	
			((Letter_b=Letter)->
	true;(downcase_atom(Letter_b,Letter01),atom_string(Letter01,Letter)))

	)))->true;
	A2=[]),
	%trace,
	%writeln1(	suggestions(Direction,Dictionary2,State2,Word2,_,Suggestions1,Suggestions3)),
	length(Word2,Word2_l),
	
	findall(Suggestions31,suggestions(Direction,Dictionary2,State2,Word2,_,Suggestions1,Suggestions31),Suggestions32),
	maplist(append,Suggestions32,Suggestions22),
	%trace,
	findall(Suggestions21,(member(A4,Suggestions22),
	(Direction=d->(append(Suggestions211,["0","1"],A4),
	Suggestions21=[Word2_l,Suggestions211]);
	(append(["1","0"],Suggestions211,A4),
	Suggestions21=[Word2_l,Suggestions211]))
	),Suggestions2).
	
%writeln1(Suggestions3),
	%notrace,
	%findall(C,(member(B,Suggestions3), B=[_|B2],% ****
	%maplist(append,[[Word2,
	%B2]],[C])),Suggestions2).
	
algorithm_decision_tree2(Direction,Dictionary2,State2,A2,Word2,Word3,Suggestions1,Suggestions2) :-
	A2=[Letter100|Rest],
	((Letter100=Letter)->	true;(downcase_atom(Letter100,Letter101),atom_string(Letter101,Letter))),

	member([State2,Letter_c,State3],Dictionary2),
	
		(Letter_c=Letter->true;(downcase_atom(Letter_c,Letterc01),atom_string(Letterc01,Letter))),

	
	append(Word2,[Letter_c],Word4),
	algorithm_decision_tree2(Direction,Dictionary2,State3,Rest,Word4,Word3,Suggestions1,Suggestions2).

suggestions(Direction,Dictionary2,State2,Word2,_Word21,Suggestions1,Suggestions2) :-
%trace,
	reverse(Word2,Word22),
	Word22=[_Letter1|_Rest],
	%(
	(%Direction=d
	true
	->(S1=State2,S2=_);(S1=_,S2=State2)),
	not(member([S1,_Letter,S2],Dictionary2)),%->true;notrace),
	%not(member([S2,Letter,S1],Dictionary2))),%->true;notrace),
%trace,	string_concat(Letter,Word2,Word23),
%trace,
	(Direction=d->Word24=Word2;
	(%string_to_list21(Word2,[],Word23),
	reverse(Word2,Word24))),%concat_list(Word231,Word232),
	%append(["1","0"],Word24,Word232))),
	append(Suggestions1,[Word24],Suggestions2).%,notrace.
	 %notrace.
suggestions(Direction,Dictionary2,State2,Word2,Word21,Suggestions1,Suggestions2) :-
	reverse(Word2,Word22),
	Word22=[_Letter1|_Rest],
	(%Direction=d
	true
	->(S1=State2,S2=State3);(S1=State3,S2=State2)),
	member([S1,Letter2,S2],Dictionary2),
	append(Word2,[Letter2],Word4),
	suggestions(Direction,Dictionary2,State3,Word4,Word21,Suggestions1,Suggestions2).



algorithm_decision_tree([""],File_list,File_list,_String_dict,_Dictionary,_Reversed_dictionary2) :- !.
algorithm_decision_tree([],File_list,File_list,_String_dict,_Dictionary,_Reversed_dictionary2) :- !.
/*
algorithm_decision_tree(File_list,File_list1,File_list2,String_dict,Dictionary,Reversed_dictionary2) :-
	File_list=[File_list3|File_list4],
	string_concat(File_list5,_E,File_list3),
	string_length(File_list5,1),
	string_codes(File_list5,File_list5_c),
	not(phrase(word1(File_list5_c),_)),
	append(File_list1,[File_list3],File_list6),
	algorithm_decision_tree(File_list4,File_list6,File_list2,String_dict,Dictionary,Reversed_dictionary2).
	*/
algorithm_decision_tree(File_list,File_list1,File_list2,String_dict,Dictionary,Reversed_dictionary2) :-
%trace,
%writeln1(algorithm_decision_tree(File_list,File_list1,File_list2,String_dict,Dictionary,Reversed_dictionary2)),
	File_list=[File_list302|File_list4],
	string_concat(File_list5,_E,File_list302),
	string_length(File_list5,1),
	string_codes(File_list5,File_list5_c),
	%phrase(word1(File_list5_c),_),
	
	(false%File_list302=File_list3
	->true;(downcase_atom(File_list302,File_list301),atom_string(File_list301,File_list3))),
	
	(%trace,
		

	member(File_list3,String_dict)->Choice=File_list3;
	(%trace,
	algorithm_decision_tree1(Dictionary,Reversed_dictionary2,File_list302,Suggestions),
	%repeat,
	number_menu(File_list302,Suggestions,Choice2),
	%string_concat(Choice2,"01",Choice3),
	(%trace,
	is_upper(File_list5_c)->(
	(string(Choice2)->Choice2=Choice211;concat_list(Choice2,Choice211)),
	string_concat(Choice4,E1,Choice211),
	string_length(Choice4,1),upcase_atom(Choice4,Choice5),string_concat(Choice5,E1,Choice)
	);Choice2=Choice
	))),
	%trace,
	%(Choice=[Choice_b]->true;Choice_b=Choice),
	(string(Choice)->Choice_a=Choice;
	concat_list(Choice,Choice_a)),
	
	capitalise_if_necessary(File_list302,Choice_a,Choice_a1),

	append(File_list1,[Choice_a1],File_list6),
		algorithm_decision_tree(File_list4,File_list6,File_list2,String_dict,Dictionary,Reversed_dictionary2).

	
number_menu(File_list3,Suggestions,Choice) :-
	length(Suggestions,LCritique3),
	numbers(LCritique3,1,[],List1),
%trace,
findall([N," - ",CString5a12,"\n"],(member(N,List1),get_item_n(Suggestions,N,CString5a11),
%append(CString5a11,["0","1"],CString5a1)***,%reverse(CString5a1,CString5a11),
CString5a11=[Rank,CString5a111],
concat_list(CString5a111,CString5a112),
capitalise_if_necessary(File_list3,CString5a112,CString5a13),
concat_list(["(",Rank,") - ",CString5a13],CString5a12)
),CStrings1),
%trace,
findall([N,CString5a11],(member(N,List1),get_item_n(Suggestions,N,[_,CString5a11])%,reverse(CString5a1,CString5a11)
),CStrings2),
%trace, %% *****
maplist(append,[CStrings1],[CStrings111]),
concat_list(CStrings111,CStrings12),

concat_list(["Please choose the correction to \"",File_list3,"\", <return> for no correction or type a replacement word:"],Note1),
writeln(Note1),
writeln(CStrings12),
try_reading_number(CStrings2,Choice1),
%trace,
(Choice1=""->Choice=File_list3;Choice=Choice1).
%read_string(user_input, "\n", "\r", _, String2aa),
%number_string(Number,String2aa),
%trace,
	%member([Number,Choice],CStrings2).
	
try_reading_number(CStrings2,Choice) :-
read_string(user_input, "\n", "\r", _, String2aa),
((number_string(Number,String2aa),
	member([Number,Choice],CStrings2))->true;
	String2aa=Choice).
	%try_reading_number(CStrings2,Choice)).
	
capitalise_if_necessary(File_list302,Word,Choice211) :-
	string_concat(File_list5,_E,File_list302),
	string_length(File_list5,1),
	string_concat(Word1,E1,Word),
	string_length(Word1,1),
	%string_codes(File_list5,File_list5_c),
	%phrase(word1(File_list5_c),_),
	(is_upper(File_list5)->(upcase_atom(Word1,Word11),string_concat(Word11,E1,Choice211));Choice211=Word).

split_into_sets(Dictionary,L1,Dictionary_a) :-
	length(Dictionary,N1),
	Number is div(N1,L1),
	%L1 is div(N1,Number), % 2 is div(5,2)
	L2 is mod(N1,Number), % 1 is mod(5,2)
	L3 is L1*Number,	% 4 is 2*2
	length(A,L3),
	append(A,_,Dictionary),
	%split_into_sets1(A,Number,L1)
	numbers(Number,1,[],Nums),
	findall(C,(member(N2,Nums),B1 is (N2-1)*L1, length(B,B1),length(C,L1),append(B,D,Dictionary),append(C,_,D)),Dict2),
	length(E,L2),
	append(_,E,Dictionary),
	(E=[]->Dictionary_a=Dict2;append(Dict2,[E],Dictionary_a)),!.

	
