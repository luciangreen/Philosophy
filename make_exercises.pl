% fill the gap, multi choice fill the gap, matching
% - ignore words starting with _, connectives, duplicate answers

% (split on space), split and keep punctuation and space except '-

:-include('../listprologinterpreter/la_strings.pl').
:-include('../listprologinterpreter/la_strings_string.pl').
:-include('../listprologinterpreter/la_maths.pl').

% ?- trace,split_into_sentences("a b c. d e f.",2, E).
% E = [["a b _____.", "c"], [" _____ e f.", "d"]].

split_into_sentences(Text,Number_of_questions,Exercises) :-

 	phrase_from_file_s(string(Codes_cve), "connectives.txt"),
string_codes(String_cve,Codes_cve),
	atom_to_term(String_cve,Connectives,_),
	split_string(Text,".\n\r",".\n\r",Sentences2),
		findall(Sentences3,(member(Sentence2,Sentences2),
	foldr(string_concat,[Sentence2,"."],"",Sentences3)),Sentences),
	
make_exercise0(Connectives,Sentences,%Sentences1,
Number_of_questions,[],Exercises1),

findall([Exercise4,Word],(member([Exercise2,Word],Exercises1),foldl(replace_undefined_with_gap,Exercise2,[],Exercise3),
foldr(string_concat,Exercise3,Exercise4)),Exercises)
.

replace_undefined_with_gap(A,C,D) :-
	(var(A)-> B="_____";B=A),append(C,[B],D).
	
make_exercise0(_,_,%_Sentences,
0,Exercises,Exercises) :- !.
make_exercise0(Connectives,Sentences,%Sentences1,
Number_of_questions,Exercises1,Exercises2) :-

make_exercise1(Connectives,Sentences,%Sentences1,
Sentences0,%Sentences01,
Exercise),

append(Exercises1,[Exercise],Exercises3),

Number_of_questions2 is Number_of_questions-1,

make_exercise0(Connectives,Sentences0,%Sentences01,
Number_of_questions2,Exercises3,Exercises2).

make_exercise1(Connectives,Sentences,%Sentences1,
Sentences0,%Sentences01,
Exercise) :-
	
length(Sentences,Length),	numbers(Length,1,[],N),
	random_member(N1,%Item,%Pair,%[Sentence,Sentence1],
	N%Sentences1
	),
	
	get_item_n(Sentences,N1,Item),

delete_item_n(Sentences,N1,Sentences11),
%delete_item_n(Sentences1,N1,Sentences12),

%trace,
(make_exercise(Connectives,Sentences,Item,Exercise)->
(Sentences11=Sentences0%,Sentences12=Sentences01
);
(make_exercise1(Connectives,Sentences11,%Sentences12
Sentences0,%Sentences01
Exercise))).
% if fails then try again
	%delete()
% don't use if there is a duplicate


make_exercise(Connectives,Sentences1,%[
String%,Words]
,Exercise) :-
	string_codes(String,Codes),

Punct1='&#@~%`$?+*^,()|.:;=_/[]<>{}\s\t\\"!0123456789',
string_codes(Punct1,Punct),
	split_on_substring117(Codes,Punct,[],Exercise1), % except -'\n\r

find_a_word_to_blank(Connectives,Exercise1,Punct,Sentences1,Exercise).


find_a_word_to_blank(Connectives,Exercise1,Punct,Sentences,Exercise) :-
	
length(Exercise1,Length),	numbers(Length,1,[],N),	findall(List,(member(N1,N),get_item_n(Exercise1,N1,Word),(((member(Word,Connectives))->true;(string_codes(Word,[Codes]),
		member(Codes,Punct)))-> List=[-,N1,Word];List=[+,N1,Word])),List1),
		
findall([+,N2,Word],member([+,N2,Word],List1),List2),

random_member([+,N2,Word],List2),

put_item_n(Exercise1,N2,_,Exercise2),

(member(Exercise2,Sentences)-> 
find_a_word_to_blank(Connectives,Exercise1,Punct,Sentences,Exercise);
Exercise=[Exercise2,Word]).

