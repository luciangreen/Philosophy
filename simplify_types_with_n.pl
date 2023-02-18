%% simplify_types_with_n.pl

/**

?- simplify_types_with_n([[[t, brackets], [[t, number]]], [t, string], [t, number]],[],T).
T = [[[t, number]], [t, string], [t, number]].

**/


simplify_types_with_n([],Types,Types) :- !.
simplify_types_with_n(Data,Types1,Types2) :-
get_lang_word("t",T),
get_lang_word("number",Dbw_number),
Data=[T,Dbw_number,_N,D],
%	number(Data),
append(Types1,[D],Types2),!.
simplify_types_with_n(Data,Types1,Types2) :-
get_lang_word("t",T),
get_lang_word("string",Dbw_string),
Data=[T,Dbw_string,_N,D],
	%string(Data),
	append(Types1,[D],Types2),!.
simplify_types_with_n(Data,Types1,Types2) :-
get_lang_word("t",T),
get_lang_word("atom",Dbw_atom),
Data=[T,Dbw_atom,_N,D],
	%string(Data),
	append(Types1,[D],Types2),!.
simplify_types_with_n(Data1,Types1,Types2) :-
get_lang_word("t",T),
get_lang_word("brackets",Dbw_brackets),
	Data1=[[[T,Dbw_brackets],Types4]|Types6],
	simplify_types_with_n(Types4,[],Data2),
	Types5=[Data2],
	append_list3([Types1,Types5],Types2a),
	
simplify_types_with_n(Types6,Types2a,Types2),!.
	

simplify_types_with_n(Data1,Types1,Types2) :-
get_lang_word("t",T),
get_lang_word("list",Dbw_list),
%trace,
	Data1=[[[T,Dbw_list],Types4]|Types6],
%trace,
	simplify_types_with_n(Types4,[],Types21),%[Data2|Data2a]),
	Types22=[Types21],
/*
(Data2=[Data2a]->Types5=[{Data2a}];
(Data2=[Data2a|Data2b]->	
(square_to_round([Data2a|Data2b],Types52),
round_to_curly(Types52,Types51),
Types5=[Types51]);false)),
*/
	append_list3([Types1,Types22],Types2a),
	simplify_types_with_n(Types6,Types2a,Types2),!.
	
	/*
simplify_types_with_n(Data1,Types1,Types2) :-
get_lang_word("t",T),
get_lang_word("brackets",Dbw_brackets),
	Data1=[[T,Dbw_brackets]|Types4],
	simplify_types_with_n(Types4,[],Data2),
	Types5=[[Data2],Data4],
	simplify_types_with_n(Data4,[],Types6),
	append_list3([Types1,Types5,Types6],Types2),!.
*/

/*
simplify_types_with_n(Data1,Types1,Types2) :-
get_lang_word("t",T),
get_lang_word("brackets",Dbw_brackets),
	Data1=[[Data2|Data3]|Data4],
	simplify_types_with_n(Data2,[],Types3),
	simplify_types_with_n(Data3,Types3,Types4),
	Types5=[[[T,Dbw_brackets],Types4]],
	simplify_types_with_n(Data4,[],Types6),
	append_list3([Types1,Types5,Types6],Types2),!.
	
*/


simplify_types_with_n(Data,Types1,Types2) :-
get_lang_word("t",T),
%get_lang_word("string",Dbw_string),
Data=[T,A],
	%string(Data),
	append(Types1,[[T,A]],Types2),!.

simplify_types_with_n(Data,Types1,Types2) :-
get_lang_word("t",T),
%get_lang_word("string",Dbw_string),
Data=[T,_A,_N,D],
	%string(Data),
	append(Types1,[D],Types2),!.


simplify_types_with_n(Data1,Types1,Types2) :-
	Data1=[Data2|Data3],
	simplify_types_with_n(Data2,Types1,Types3),
	simplify_types_with_n(Data3,Types3,Types2),!.
	%%Types2=[Types4].

/*
append_list3(A1,B):-
	append_list3(A1,[],B),!.

append_list3([],A,A):-!.
append_list3(List,A,B) :-
	List=[Item|Items],
	append(A,Item,C),
	append_list3(Items,C,B).
*/