%% plagiarism_checker.pl

%% detects percentage of >=5 word sentences over 80% same


:-include('../../../../../listprologinterpreter/la_strings.pl').
:-include('../../../../../Essay-Helper/short_essay_helper3.1_chicago.pl').

string(String) --> list(String).

list([]) --> [].
list([L|Ls]) --> [L], list(Ls).

plagiarism_checker :-

	SepandPad="#@~%`$?-+*^,()|.:;=_/[]<>{}\n\r\s\t\\!'0123456789",

	%% file to check

	phrase_from_file_s(string(String00a1), "file.txt"),
	string_codes(String02b1,String00a1),

	split_string(String02b1, ".\n\r", ".\n\r", String02c1),
		
	findall(String02e1,(member(A,String02c1),	
	split_string(A, SepandPad, SepandPad, String02e1)),
	String02f1),

	%% files to check against
		
	directory_files("sources/",F),
	delete_invisibles_etc(F,G),

	findall(String02f,(member(Filex1,G),
	string_concat("sources/",Filex1,Filex),
		phrase_from_file_s(string(String00a), Filex),
		string_codes(String02b,String00a),
		
	split_string(String02b, ".\n\r", ".\n\r", String02c),
		
	findall(String02e,(member(B,String02c),	
	split_string(B, SepandPad, SepandPad, String02e)),
	String02f)),String02g),
	
	writeln("Plagiarism Report: >= 5 Word Sentences with 80% same words\n"),
	
	findall(C,(member(C,String02f1),member(D,String02g),
	member(E,D),length(C,CL),CL>=5,similarity_score(C,E,S),S>=80,
	write(S),write("%\t"),writeln(C)),F1),
	
	%%trace,
	length(F1,FL),length(String02f1,GL),H is round(FL*100/GL),
	
	writeln(""),
	write("Overall score: "),write(H),writeln("%.").
	
similarity_score(A,B,S) :-
	intersection(A,B,C),length(A,L1),length(C,L2),S is round(L2*100/L1).
	
