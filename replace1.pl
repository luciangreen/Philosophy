% Replace

:- include('../listprologinterpreter/listprolog').

% later: replace entire words without entire words, except for breaks in white space

%/*
%replace1([case_sensitive],"AbCdBcD","bC","Bc",B).
%B = "ABcdBcD".

%replace1([entire_word],"A bC d Bc D","bC","Bd",B).
%B = "a Bd d Bd d".

%replace1([],"AbCdBcD","bC","Bc",B).
%B = "aBcdBcd".

%replace1([case_sensitive,entire_word],"A bC d Bc D","bC","Be",B).
%B = "A Be d Bc D".

replace1(Options,A,W,WR,B) :-
	SepandPad="&#@~%`$?-+*^,()|.:;=_/[]<>{}\n\r\s\t\\\"!0123456789'", % doesn't have "'" xxx
	string_codes(SepandPad,SepandPad1),

 	 downcase_atom(A,A2),

string_codes(A2,Codes),
	%phrase_from_file_s(string(Codes), "file.txt"),

	%split_string2(String1,SepandPad1,File_list),
	split_on_substring117(Codes,SepandPad1,[],A20),

string_codes(A,Codes0),
	%phrase_from_file_s(string(Codes), "file.txt"),
	%split_string2(String1,SepandPad1,File_list),
	split_on_substring117(Codes0,SepandPad1,[],A21),
	
 %split_string(A2,SepandPad,SepandPad,A21),
 downcase_atom(W,W2),

 (member(entire_word,Options)->

 (
 (member(case_sensitive,Options)->

 (atom_string(W,WS),
 
 findall([N,WR],get_n_item(A21,WS,N),N1),
 
 put_item_ns(A21,N1,B1));
 
 (%trace,
 
 atom_string(W2,W2S),
 
 findall([N,WR],get_n_item(A20,W2S,N),N1),
 
 put_item_ns(A20,N1,B1))),

 foldr(string_concat,B1,B)
 );

 
 ((member(case_sensitive,Options)->

 (
 string_atom(A,A1),
 string_atom(W,W1),
 atomic_list_concat(D,W1,A1),
 atomic_list_concat(D,WR,B1)
 )
;
 (
 string_atom(A2,A1),
 string_atom(W2,W1),
 atomic_list_concat(D,W1,A1),
 atomic_list_concat(D,WR,B1)
 )
 )),
 atom_string(B1,B)).
