%% collect_simplify_types.pl

/**

?- collect_simplify_types([[[t, brackets], [[t, number]]], [t, string], [t, number]],[],T).
T = [[[t, number]], [t, string], [t, number]].

**/


collect_simplify_types([],Types,Types) :- !.
collect_simplify_types(Data,Types1,Types2) :-
get_lang_word("t",T),
get_lang_word("number",Dbw_number),
Data=[T,Dbw_number,N,D],
%	number(Data),
append(Types1,[[T,Dbw_number,N,D]],Types2),!.
collect_simplify_types(Data,Types1,Types2) :-
get_lang_word("t",T),
get_lang_word("string",Dbw_string),
Data=[T,Dbw_string,N,D],
	%string(Data),
	append(Types1,[[T,Dbw_string,N,D]],Types2),!.
collect_simplify_types(Data,Types1,Types2) :-
get_lang_word("t",T),
get_lang_word("atom",Dbw_atom),
Data=[T,Dbw_atom,N,D],
	%string(Data),
	append(Types1,[[T,Dbw_atom,N,D]],Types2),!.

/*
collect_simplify_types(Data1,Types1,Types2) :-
get_lang_word("t",T),
get_lang_word("brackets",Dbw_brackets),
	Data1=[[[T,Dbw_brackets],Types4]|Types6],
	collect_simplify_types(Types4,[],Data2),
	Types5=[Data2],
	append_list3([Types1,Types5],Types2a),
	
collect_simplify_types(Types6,Types2a,Types2),!.
	*/
%/*
collect_simplify_types(Data1,Types1,Types2) :-
get_lang_word("t",T),
get_lang_word("brackets",Dbw_brackets),
	Data1=[[[T,Dbw_brackets],Types4]|Types6],
%trace,
	collect_simplify_types(Types4,[],Data2),%[Data2|Data2a]),
	append_list3([Types1,Data2],Types2a),
	collect_simplify_types(Types6,Types2a,Types2),!.
%*/

collect_simplify_types(Data1,Types1,Types2) :-
get_lang_word("t",T),
get_lang_word("list",Dbw_list),
	Data1=[[[T,Dbw_list],Types4]|Types6],
%trace,
	collect_simplify_types(Types4,[],Data2),%[Data2|Data2a]),

%(Data2=[Data2a]->Types5=[{Data2a}];
%(Data2=[Data2a|Data2b]->	
%(square_to_round([Data2a|Data2b],Types52),
%round_to_curly(Types52,Types51),
%Types5=[Types51]);false)),
	append_list3([Types1,Data2],Types2a),
	collect_simplify_types(Types6,Types2a,Types2),!.
	
	/*
collect_simplify_types(Data1,Types1,Types2) :-
get_lang_word("t",T),
get_lang_word("brackets",Dbw_brackets),
	Data1=[[T,Dbw_brackets]|Types4],
	collect_simplify_types(Types4,[],Data2),
	Types5=[[Data2],Data4],
	collect_simplify_types(Data4,[],Types6),
	append_list3([Types1,Types5,Types6],Types2),!.
*/

/*
collect_simplify_types(Data1,Types1,Types2) :-
get_lang_word("t",T),
get_lang_word("brackets",Dbw_brackets),
	Data1=[[Data2|Data3]|Data4],
	collect_simplify_types(Data2,[],Types3),
	collect_simplify_types(Data3,Types3,Types4),
	Types5=[[[T,Dbw_brackets],Types4]],
	collect_simplify_types(Data4,[],Types6),
	append_list3([Types1,Types5,Types6],Types2),!.
	
*/

/*
collect_simplify_types(Data,Types1,Types2) :-
get_lang_word("t",T),
%get_lang_word("string",Dbw_string),
Data=[T,A],
	%string(Data),
	append(Types1,[[T,A]],Types2),!.
*/

collect_simplify_types(Data1,Types1,Types2) :-
	Data1=[Data2|Data3],
	collect_simplify_types(Data2,Types1,Types3),
	collect_simplify_types(Data3,Types3,Types2),!.
	%%Types2=[Types4].
%*/

/*
append_list3(A1,B):-
	append_list3(A1,[],B),!.

append_list3([],A,A):-!.
append_list3(List,A,B) :-
	List=[Item|Items],
	append(A,Item,C),
	append_list3(Items,C,B).
*/