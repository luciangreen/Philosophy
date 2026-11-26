% version.pl

% Calculates the version of an algorithm from a history file with API changes, features and bug fixes

:-include('../listprologinterpreter/la_files.pl').
:-include('../listprologinterpreter/la_strings.pl').
:-include('../listprologinterpreter/la_strings_string.pl').

version(File,A,F,B) :-

open_file_s(File,File_term),

version1(File_term,0,0,0,A,F,B).


version1([],A,F,B,A,F,B) :- !.
version1(File_term,A1,_F1,_B1,A2,F2,B2) :-
 File_term=[[a,_]|R],
 A3 is A1+1,
 F3 is 0,
 B3 is 0,
version1(R,A3,F3,B3,A2,F2,B2).

version1(File_term,A1,F1,_B1,A2,F2,B2) :-
 File_term=[[f,_]|R],
 A3 is A1,
 F3 is F1+1,
 B3 is 0,
version1(R,A3,F3,B3,A2,F2,B2).

version1(File_term,A1,F1,B1,A2,F2,B2) :-
 File_term=[[b,_]|R],
 A3 is A1,
 F3 is F1,
 B3 is B1+1,
version1(R,A3,F3,B3,A2,F2,B2).



