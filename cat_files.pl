:-include('../listprologinterpreter/listprolog.pl').
:-include('../listprologinterpreter/la_files.pl').
cat_files :-
 
 directory_files('Books/',F),
	delete_invisibles_etc(F,G),


findall([F5,"\n"],
(member(F2,G),

foldr(atom_concat,['Books/',F2,'/'],F1),

 directory_files(F1,F21),
	delete_invisibles_etc(F21,G2),

member(F3,G2),
foldr(atom_concat,['Books/',F2,'/',F3],F4),
open_string_file_s(F4,F5)),F6),

flatten(F6,F7),
foldr(string_concat,F7,F8),

open_s("../Text-to-Breasonings/file.txt",write,S),
write(S,F8),close(S)
,!.

