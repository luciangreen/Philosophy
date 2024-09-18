% Replace

:-include('../listprologinterpreter/listprolog').
:-include('replace2.pl').

% replace words within entire words, after breaking by white space

%/*
%replace1([case_sensitive],"AbCdBcD","bC","Bc",B).
%B = "ABcdBcD".

%replace1([entire_word],"A bC d Bc D","bC","Bd",B).
%B = "a Bd d Bd d".


%replace1([entire_word],"a-a","a-a","b-b",B).
%B = "b-b".

%replace1([entire_word],"a-a a-a","a","b",B).
%B = "b-b b-b".


%replace1([],"AbCdBcD","bC","Bc",B).
%B = "aBcdBcd".

%replace1([case_sensitive,entire_word],"A bC d Bc D","bC","Be",B).
%B = "A Be d Bc D".

replace1(_Options,A0,W,WR,B) :-
	replace2(A0,W,Wr,B).

/*
	SepandPad="&#@~%`$?-+*^,()|.:;=_/[]<>{}\n\r\s\t\\\"!0123456789'", % doesn't have "'" xxx
	string_codes(SepandPad,SepandPad1),

downcase_atom(A0,A22),

SepandPad2="\n\r\s\t",
	string_codes(SepandPad2,SepandPad22),

	string_codes(A0,A01),

%split_string(A0,"\n\r\s\t","\n\r\s\t",A),
split_on_substring117(A01,SepandPad22,[],A),

findall(A200,(member(AA,A),
 	 downcase_atom(AA,A2),

string_codes(A2,Codes),
	%phrase_from_file_s(string(Codes), "file.txt"),

	%split_string2(String1,SepandPad1,File_list),
	split_on_substring117(Codes,SepandPad1,[],A200)
	),_A20),
	
findall(A210,(member(AA,A),
string_codes(AA,Codes0),
	%phrase_from_file_s(string(Codes), "file.txt"),
	%split_string2(String1,SepandPad1,File_list),
	split_on_substring117(Codes0,SepandPad1,[],A210)
	),A21),
	
 %split_string(A2,SepandPad,SepandPad,A21),
 downcase_atom(W,W2),

 (member(entire_word,Options)->

 (
 (member(case_sensitive,Options)->

 (atom_string(W,WS),
 
 findall(B11,(member(A211,A21),
 
 findall([N,WR],get_n_item(A211,WS,N),N1),
 
 put_item_ns(A211,N1,B11)
 ),B12),foldr(append,B12,B1)
 
 );
 
 (%trace,
 
 atom_string(W2,W2S),
 
 findall(B11,(%member(A201,A),
 
 findall([N,WR],get_n_item(A,W2S,N),N1),
 
 put_item_ns(A,N1,B11)
 
 ),B12),foldr(append,B12,B13),
 
 findall(A200,(member(AA,B13),
 	 downcase_atom(AA,A2),

string_codes(A2,Codes),
	%phrase_from_file_s(string(Codes), "file.txt"),

	%split_string2(String1,SepandPad1,File_list),
	split_on_substring117(Codes,SepandPad1,[],A200)
	),A20),

 findall(B11,(member(A201,A20),
 
 findall([N,WR],get_n_item(A201,W2S,N),N1),
 
 put_item_ns(A201,N1,B11)
 
 ),B14),foldr(append,B14,B1)
 

 )),

 foldr(string_concat,B1,B)
 );

 
 ((member(case_sensitive,Options)->

 (
 string_atom(A0,A1),
 string_atom(W,W1),
 atomic_list_concat(D,W1,A1),
 atomic_list_concat(D,WR,B1)
 )
;
 (
 string_atom(A22,A1),
 string_atom(W2,W1),
 atomic_list_concat(D,W1,A1),
 atomic_list_concat(D,WR,B1)
 )
 )),
 atom_string(B1,B)).

*/