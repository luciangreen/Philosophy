:-include('../Text-to-Breasonings/text_to_breasonings.pl').
:-include('../listprologinterpreter/la_files.pl').

print_totals :-
 open_string_file_s("aa_log.txt",File_string),
 term_to_atom(File_string2,File_string),
 
 BL is %1000,%
 5*16000*8*5,
findall(Args1,(member([arg,_,_,Args1],File_string2)),Args11),
 sum(Args11,Args12),

 writeln([args,Args12,/,BL]), 
 findall(Algs1,(member([alg,_,_,Algs1],File_string2)),Algs11),
 sum(Algs11,Algs12),
 
 writeln([algs,Algs12,/,BL]),!.