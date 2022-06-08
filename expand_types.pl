%% expand_types1.pl

% numbers(68,1,[],N),findall([N1,T3,"\n"],(member(N1,N),test_types_cases(N1,_,T,M,F,_),findall(TC,(member(T0,T),T0=[TA,TB],simplify_types(TB,[],T1),expand_types(T1,[],T2),(TB=T2->TC=y;TC=[TB,T2])),T3)),T4),writeln1(T4).

/**

?- expand_types1([[1],"a",1],[],T).
T = [[[t, brackets], [[t, number]]], [t, string], [t, number]].

?- expand_types1([1,["a"],1],[],T).
T = [[t, number], [[t, brackets], [[t, string]]], [t, number]].

?- expand_types1([1,"a",[1]],[],T).
T = [[t, number], [t, string], [[t, brackets], [[t, number]]]].

**/

:-include('curly_brackets.pl').
:-include('simplify_types.pl').

/*
expand_types(Data1,Types1,Types2) :-
get_lang_word("t",T),
get_lang_word("brackets",Dbw_brackets),
	Data1=[Data2],
	
	not(Data2=[T,_]),
	expand_types1(Data2,[],Types4),
	Types5=Types4,
	append_list([Types1,Types5],Types2),!.
	
expand_types(Data1,Types1,Types2) :-
get_lang_word("t",T),
get_lang_word("brackets",Dbw_brackets),

	Data1=[[Data2|Data3]|Data41],

not([Data2|Data3]=[T,_]),
	expand_types1(Data2,[],Types3),
	expand_types1(Data3,Types3,Types4),
	Types5=Types4,

findall(Types61,(member(Data4,Data41),	expand_types1(Data4,[],Types61)),Types62),
foldr(append,Types62,Types6),
	append_list([Types1,Types5,Types6],Types2),!.

*/
expand_types(Data1,Types1,Types2) :-
 expand_types1(Data1,Types1,Types2).


expand_types1([],Types,Types) :- !.
expand_types1(Data,Types1,Types2) :-
get_lang_word("t",T),
get_lang_word("number",Dbw_number),

Data=[T,Dbw_number],	%number(Data),
append(Types1,[[T,Dbw_number]],Types2),!.
expand_types1(Data,Types1,Types2) :-
get_lang_word("t",T),
get_lang_word("string",Dbw_string),

Data=[T,Dbw_string],	%string(Data),
append(Types1,[[T,Dbw_string]],Types2),!.
expand_types1(Data1,Types1,Types2) :-
get_lang_word("t",T),
get_lang_word("brackets",Dbw_brackets),
	Data1=[Data2],
	
	not(Data2=[T,_]),
	not(Data2={[T,_]}),
	expand_types1(Data2,[],Types4),
	Types5=[[[T,Dbw_brackets],Types4]],
	append_list([Types1,Types5],Types2),!.

/*
expand_types1(Data1,Types1,Types2) :-
get_lang_word("t",T),
get_lang_word("brackets",Dbw_brackets),
	Data1=[[Data2]|Data4],
	expand_types1(Data2,[],Types4),
	Types5=[[[T,Dbw_brackets],Types4]],
	expand_types1(Data4,[],Types6),
	append_list([Types1,Types5,Types6],Types2),!.
*/
	
expand_types1(Data1,Types1,Types2) :-
get_lang_word("t",T),
get_lang_word("brackets",Dbw_brackets),

	Data1=[[Data2|Data3]|Data41],

not([Data2|Data3]=[T,_]),
	expand_types1(Data2,[],Types3),
	expand_types1(Data3,Types3,Types4),
	Types5=[[[T,Dbw_brackets],Types4]],

findall(Types61,(member(Data4,Data41),	expand_types1(Data4,[],Types61)),Types62),
foldr(append,Types62,Types6),
	append_list([Types1,Types5,Types6],Types2),!.

expand_types1(Data1,Types1,Types2) :-
get_lang_word("t",T),
get_lang_word("list",Dbw_list),
	Data1=[Data2Data3|Data41],

not(Data2Data3=[T,_]),

curly_head_tail(Data2Data3,Data2,Data3),
	expand_types1(Data2,[],Types3),
	expand_types1(Data3,Types3,Types4),
	Types5=[[[T,Dbw_list],Types4]],
%trace,
findall(Types61,(member(Data4,Data41),	expand_types1(Data4,[],Types61)),Types62),
foldr(append,Types62,Types6),
	append_list([Types1,Types5,
	Types6],Types2),!.
	
	
	expand_types1(Data1,Types1,Types2) :-
get_lang_word("t",T),
get_lang_word("list",Dbw_list),
	%Data1=[Data2Data3|Data41],

%not(Data2Data3=[T,_]),
not(Data1=[T,_]),

curly_head_tail(Data1,Data2,Data3),
	expand_types1(Data2,[],Types3),
	expand_types1(Data3,Types3,Types4),
	Types5=[[[T,Dbw_list],Types4]],
%trace,
%findall(Types61,(member(Data4,Data41),	
%expand_types1(Data4,[],Types6),%),Types62),
%foldr(append,Types62,Types6),
	append_list([Types1,%Types5,
	Types5],Types2),!.
	expand_types1(Data,Types1,Types2) :-
get_lang_word("t",T),
%get_lang_word("string",Dbw_string),

Data=[T,A],	%string(Data),
append(Types1,[[T,A]],Types2),!.


expand_types1(Data1,Types1,Types2) :-
	Data1=[Data2|Data3],
	expand_types1(Data2,Types1,Types3),
	expand_types1(Data3,Types3,Types2),!.
	%%Types2=[Types4].

append_list(A1,B):-
	append_list(A1,[],B),!.

append_list([],A,A):-!.
append_list(List,A,B) :-
	List=[Item|Items],
	append(A,Item,C),
	append_list(Items,C,B).
