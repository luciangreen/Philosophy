% needs t2b repository

:-include('../listprologinterpreter/listprolog.pl').
:-include('../Text-to-Breasonings/text_to_breasonings.pl').

sentence_count(Count) :-

K=["../../../Google Drive/HTML/files/Philosophy/Books/CREATE AND HELP PEDAGOGUES.txt",
"../../../Google Drive/HTML/files/Philosophy/Books/FUNDAMENTALS OF PEDAGOGY.txt",
"../../../Google Drive/HTML/files/Philosophy/Books/PEDAGOGY GUIDE.txt",
"../../../Google Drive/HTML/files/Philosophy/Books/PEDAGOGY INDICATORS.txt"],

% A = 5960.

% sales = 150

findall(J5,(%member(K1,K),	%directory_files(K1,F),
	%delete_invisibles_etc(F,G),

%findall([File_term,"\n"],(
member(H,K),%string_concat(K1,H,H1),
open_string_file_s(H,File_term),flatten(File_term,J1),
foldr(string_concat,J1,"",J2),

split_string(J2,"\n\r.","\n\r.",J3),
delete(J3,"",J4),
length(J4,J5)

),J6),
sum(J6,0,Count).


%N=1,M=u,texttobr2(N,u,J2,M,false,false,false,false,false,false),


%N=1,M=u,texttobr(N,u,J2,M).

