% Move to Text-to-Breasonings folder

% ["Lecturer","Lecturer - Lecturer Pedagogy.txt",0,algorithms,"5. I had something that was good about the writing.  I could help others with A.  I approximated the number of breasonings.  I approximated the number of algorithms.  I matched them."]

% Find the positive sentences.

/**
positive_sentences(Sentences),writeln1(Sentences).

brdict1.txt:
[[hello,],[world,],[negative,minus],[minus,],[b,minus]]

file.txt:
Hello World! negative
minus.
a b.

Sentences = ["Hello World!"].
**/

:-include('../listprologinterpreter/la_strings.pl').
:-include('../listprologinterpreter/la_strings_string.pl').

positive_sentences(Sentences) :-
	
	% get file
	phrase_from_file_s(string(String1),"file.txt"),
	
	% split into lines and sentences
	SepandPad1="\n\r",
		SepandPad2="&#@~%`$?-+*^,()|.:;=_/[]<>{}\n\r\s\t\\\"!'0123456789",
	split_string(String1,SepandPad1,SepandPad1,String2),

	% get negative terms
	phrase_from_file_s(string(BrDict0), "brdict1.txt"),
	splitfurther(BrDict0,Term),
	findall(Word1,(member([Word1,Word2],Term),
	Word2="minus"),Negative_terms2),
	append(Negative_terms2,["minus"],Negative_terms),
		
	% find positive sentences
	
	trace,
	findall(Sentence3,(member(Sentence1a,String2),
	string_atom(Sentence1,Sentence1a),
	split_string_onnonletter(Sentence1,".!?",Sentence2),
%trace,
	%findall(Sentence3,(
	member(Sentence3,Sentence2),
	downcase_atom(Sentence3,String3a),
	string_atom(String3,String3a),
	%trace,
	split_string(String3,SepandPad2,SepandPad2,String4),
	forall(member(Item,String4),not(member(Item,Negative_terms))
	%string_concat(Sentence1,".",Sentence2)
	%)),Sentence4)),
	)),
	Sentences1a),
	delete(Sentences1a,[],Sentences).
	
	% Append punctuation point to end if necessary.
	% find last character in file
	%	string_concat(_,".",String1),


split_string_onnonletter(String00,Chars,List1) :-
	string_codes(String00,String1),
	split_string_onnonletter(String1,[],Chars,List0),
	string_codes(List0,List2),
	split_string(List2,"@","@",List1),!.
split_string_onnonletter([],Input,_Chars,Input) :- !.
split_string_onnonletter(Input1,Input2,Chars,Input3) :-
	Input1=[Input4|Input5],
	%not(char_type(Input4,alpha)),
	string_codes(Chars,Codes),
	member(Code,Codes),
	Input4=Code,
	append(Input2,[Code],Input7),
	append(Input7,`@`,Input6),
	split_string_onnonletter(Input5,Input6,Chars,Input3), !.
split_string_onnonletter(Input1,Input2,Chars,Input3) :-
	Input1=[Input4|Input5],
	%char_type(Input4,alpha),
	append(Input2,[Input4],Input6),
	split_string_onnonletter(Input5,Input6,Chars,Input3), !.


splitfurther(BrDict01,N) :-
	   phrase(file0(N),BrDict01).
	
file0(N) --> "[", file(N), "]", !.
file0([]) --> [].

%%file([]) --> [].
file([L|Ls]) --> entry(L),",",
%%{writeln(L)}, %%***
file(Ls), !. %% file(Ls),{M=[Ls]})), !. %%, {writeln(["l",L])},",", file(Ls), {writeln(["ls",Ls])},!. %%, {append(L,Ls,M)}, !.	
file([L]) --> entry(L), 
%%{writeln(L)},
!. %%(entry(L),{M=L});{M=[],(writeln("Warning - Entry in incorrect format.")
%%,abort
%%)}, !.

entry([Word2,Word4]) -->
		"[", word(Word), {string_codes(Word2,Word),string(Word2)},
		",",
           word(Word3), {string_codes(Word4,Word3),string(Word4)},
           "]".
           
word([X|Xs]) --> [X], {char_type(X,csymf)->true;(X=27->true;X=8217)}, word(Xs), !.
%%word([X]) --> [X], {char_type(X,csymf);(X=27;X=8217)}, !.
word([]) --> [].
           