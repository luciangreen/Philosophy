% 21 5 23.pl

% 23 algs

% ["Medicine","MEDICINE by Lucian Green Go to Bed at 9-30 PM 1 of 4.txt",0,algorithms,"8. I prepared to state that essent in Heidegger, from das Seiende, {n} meant that which has being.  I did this by maintaining motivation.  First, I wrote down the effervent's (sic) heading.  Second, I wrote down 'you'.  Third, I reduced essential enthusiasm to essent (sic).  In this way, I prepared to state that essent in Heidegger, from das Seiende, {n} meant that which has being by maintaining motivation."]

% * I prepared to state that essent in Heidegger, from das Seiende, {n} meant that which has being.

% to be is to have thoughts - find keywords in sent with keywords, etc. for PhD

:-include('../listprologinterpreter/la_files.pl').
:-include('../listprologinterpreter/listprolog.pl').
:-include('word_frequency_count.pl').

kw_for_kw1([Type,String1],KW) :-
 	(Type="file"->
	(phrase_from_file_s(string(String2), String1));
	String1=String2),
	kw_for_kw(String2,KW),!.


kw_for_kw(Text,%T5,
T6) :-
 SepandPad=%".",%
 "&#@~%`$-+*^,()|:;=_/[]<>{}\s\t\\\"0123456789", % doesn't have "'" xx
 split_string(Text,SepandPad,SepandPad,Words),
 open_file_s("../Text-to-Breasonings/connectives.txt",Conn),
% subtract(Words,Conn,T1),

 findall([T12," "],(member(T11,Words),downcase_atom(T11,T12),
 atom_string(T12,T13),
 not(member(T13,Conn))),T2),
 foldr(append,T2,T3),
 foldr(string_concat,T3,T4),

 word_frequency_count(["string",T4],Freq),
 keep(10,Freq,T6).%,
/*
 findall(T4,(member(S,Sents),
 split_string(S,SepandPad,SepandPad,Text2),

 subtract(Text2,Conn,KW),
 sort(KW,KW1),
 
 findall([T11," "],member(T11,KW1),T21),
 foldr(append,T21,T31),
 foldr(string_concat,T31,T41),

 %word_frequency_count(["string",T41],Freq),

 %(KW=[]->T7=[];
 findall([T1," "],member(T1,KW),T2),
 foldr(append,T2,T3),
 foldr(string_concat,T3,T4)
 %kw_for_kw(T4,[],T7)))
 ),T8),
 
 findall([T1,". "],member(T1,T8),T2),
 foldr(append,T2,T3),
 foldr(string_concat,T3,T4),
 
 keep(10,Freq,KW3),
 
 (KW3=[]->T5=T6;
 (append(T5,[KW3],T7),
 kw_for_kw(T4,T7,T6))),!.
*/
keep(N,Freq,KW2) :-
	findall(KW,(member([N1,KW],Freq),N1>=N),KW2),!.
/*
split_on_words(T,File_list) :-
	SepandPad=%".",%
	"&#@~%`$?-+*^,()|.:;=_/[]<>{}\n\r\s\t\\\"!0123456789", % doesn't have "'" xx
	%string_codes(String1,Codes),
	%string_to_list2(SepandPad,[],SepandPad1),
	string_codes(T,Codes),
	string_codes(SepandPad,SepandPad1),
	%split_string2(String1,SepandPad1,File_list),
	split_on_substring117(Codes,SepandPad1,[],File_list),!.
*/

% 7

