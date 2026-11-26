:-include('../listprologinterpreter/listprolog.pl').

doc_db(String) :-

open_s("docs.txt",read,Stream),
read(Stream,Term),
close(Stream),

findall([Command," - ",Example,"<br>"],
 (member([Command,Example],Term)),Term2),
 
 foldr(append,Term2,Term3),
 foldr(string_concat,Term3,String).
