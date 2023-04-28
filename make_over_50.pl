:- include('../listprologinterpreter/listprolog').

make_over_50 :-
	phrase_from_file_s(string(Codes), "1.txt"),
	string_codes(String1,Codes),
	SepandPad="\n",%"&#@~%`$?-+*^,()|.:;=_/[]<>{}\n\r\s\t\\\"!0123456789", % doesn't have "'" xx
	split_string(String1,SepandPad,SepandPad,File_list),

length(File_list,FL),
make_over_50_1(FL,File_list,1,File_list,[],File_list1),

	term_to_atom(File_list1,File_list2),
	
	(open_s("11.txt",write,Stream2),
	write(Stream2,File_list2),
	close(Stream2)),!.

make_over_50_1(_,_,_,[],File_list,File_list) :- !.
make_over_50_1(FL,F,N,File_list,File_list1,File_list2) :-
	File_list=[File_list3|File_list4],
	string_length(File_list3,L),
	(L>=50->File_list3=File_list5;
	get_more(FL,F,[N],File_list3,File_list5)),
	append(File_list1,[File_list5],File_list6),
	N1 is N+1,
	make_over_50_1(FL,F,N1,File_list4,File_list6,File_list2).
	
get_more(_,_F,_Ns,File_list1,File_list3) :-
	string_length(File_list1,L),
	(L>=50->File_list1=File_list3),!.
get_more(FL,F,Ns,File_list1,File_list3) :-
	append(_,[N],Ns),
	(N>=FL-> %*** 500 in 1.txt
	(append([N1],_,Ns),N2 is N1-1);
	N2 is N+1),
	get_item_n(F,N2,F2),
	foldr(string_concat,[File_list1," ",F2],F3),
	append(Ns,[N2],N4),
	sort(N4,N3),
	get_more(FL,F,N3,F3,File_list3),!.
