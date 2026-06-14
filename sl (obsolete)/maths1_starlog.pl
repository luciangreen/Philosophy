% hi
:-include('../../listprologinterpreter/listprolog.pl').

%hi(Name,A,Op,B,Sentence) :- Sentence is "Hi, ":Name:", are you getting ready for ":A:Op:B:"=": =..([Op,A,B]):".".
%hi(Name,Sentence) :- Sentence is ("Hi, ":Name):", are you getting ready for ".%:A:Op:B:"=":".".
%hi(A,Op,B,Sentence) :- Sentence is number_to_string(..=([Op,A,B])).
hi(Name,A,Op,B,Sentence) :- Sentence is "Hi, ":Name:", are you getting ready for ":A:Op:B:"=": number_to_string(..=([Op,A,B])):".".
