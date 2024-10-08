:-include('../listprologinterpreter/la_strings.pl').
:-include('../listprologinterpreter/la_strings_string.pl').

% word_frequency_count(["file","file.txt"],Freq).

% word_frequency_count(["string","a b c"],Freq).
% Freq = [["a", 1], ["b", 1], ["c", 2]]

word_frequency_count2([Type,String1],Freq) :-
	SepandPad="&#@~%`$?-+*^,()|.:;=_/[]<>{}\n\r\s\t\\\"!'0123456789",

	(Type="file"->
	(phrase_from_file_s(string(String2), String1));
	String1=String2),
	split_string(String2,SepandPad,SepandPad,String3),
	%writeln(String3),
	%length(String3,Words),
	
	word_frequency_count2(String3,Freq1),
	findall(A-B,member(B-A,Freq1),Freq),!.

/*
	sort(String3,String4),
	findall([A2,A],(member(A,String4),findall(A,(member(A,String3)),A1),length(A1,A2)),Freq).
	*/


word_frequency_count2(Words,Counts) :-
    maplist(downcase_atom, Words, LwrWords),
    msort(LwrWords, Sorted),
    clumped(Sorted, Counts),!.
