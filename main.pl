#!/usr/bin/swipl -f -q

:- initialization(catch(main, Err, handle_error(Err))).

handle_error(_Err):-
  halt(1).

main :-
	[Auto,File_list1,Synonym_list1]=[on,["b"," ","e"],[["b","b1"]]],
	paraphrase1(Auto,File_list1,Synonym_list1),
	halt.

main :- halt(1).
paraphrase1(Auto,File_list1,Synonym_list1) :-
	assertz(auto(Auto)),
paraphrase1(File_list1,[],File_list,Synonym_list1,Synonym_list),
term_to_atom([File_list,Synonym_list],A),write(A).
:-include('paraphraser1.pl').
