%% pft_expand_types1.pl

% not the following anymore, as LPI types are simple.

% numbers(68,1,[],N),findall([N1,T3,"\n"],(member(N1,N),test_types_cases(N1,_,T,M,F,_),findall(TC,(member(T0,T),T0=[TA,TB],simplify_types(TB,[],T1),pft_expand_types(T1,[],T2),(TB=T2->TC=y;TC=[TB,T2])),T3)),T4),writeln1(T4).

% numbers(35,1,[],N),findall([N1,T3,"\n"],(member(N1,N),test_open_types_cases(N1,_,T,M,F),findall(TC,(member(T0,T),T0=[TA,TB],simplify_types(TB,[],T1),pft_expand_types(T1,[],T2),(TB=T2->TC=y;TC=[TB,T2])),T3)),T4),writeln1(T4).

/**

?- pft_expand_types1([[[t, number]], [t, string], [t, number]],[],T).
T = [[[t, brackets], [[t, number]]], [t, string], [t, number]].

**/

:-include('../listprologinterpreter/curly_brackets.pl').
:-include('../listprologinterpreter/simplify_types.pl').

/*
pft_expand_types(Data1,Types1,Types2) :-
get_lang_word("t",T),
get_lang_word("brackets",Dbw_brackets),
	Data1=[Data2],
	
	not(Data2=[T,_]),
	pft_expand_types1(Data2,[],Types4),
	Types5=Types4,
	append_list3([Types1,Types5],Types2),!.
	
pft_expand_types(Data1,Types1,Types2) :-
get_lang_word("t",T),
get_lang_word("brackets",Dbw_brackets),

	Data1=[[Data2|Data3]|Data41],

not([Data2|Data3]=[T,_]),
	pft_expand_types1(Data2,[],Types3),
	pft_expand_types1(Data3,Types3,Types4),
	Types5=Types4,

findall(Types61,(member(Data4,Data41),	pft_expand_types1(Data4,[],Types61)),Types62),
foldr(append,Types62,Types6),
	append_list3([Types1,Types5,Types6],Types2),!.

*/
pft_expand_types(Data1,Types1,Types2,VD1,VD2) :-
 pft_expand_types1(Data1,Types1,Types2,VD1,VD2).


pft_expand_types1([],Types,Types,VD,VD) :- !.
pft_expand_types1(Data,Types1,Types2,VD1,VD2) :-
get_lang_word("t",T),
get_lang_word("number",Dbw_number),

number(Data),%=[T,Dbw_number],	%number(Data),
	(false%member([Dbw_number,Data,N],VD1)
	->VD2=VD1;
	(get_data_n(N),
	append(VD1,[[Dbw_number,Data,N]],VD2))),
	append(Types1,[[T,Dbw_number,N]],Types2),!.
%append(Types1,[[T,Dbw_number]],Types2),!.

pft_expand_types1(Data,Types1,Types2,VD1,VD2) :-
get_lang_word("t",T),
get_lang_word("string",Dbw_string),

string(Data),%=[T,Dbw_string],	%string(Data),
	(false%member([Dbw_string,Data,N],VD1)
	->VD2=VD1;
	(get_data_n(N),
	append(VD1,[[Dbw_string,Data,N]],VD2))),
	append(Types1,[[T,Dbw_string,N]],Types2),!.
%append(Types1,[[T,Dbw_string]],Types2),!.

pft_expand_types1(Data,Types1,Types2,VD1,VD2) :-
get_lang_word("t",T),
get_lang_word("atom",Dbw_atom),

atom(Data),%=[T,Dbw_atom],	%string(Data),
	(false%member([Dbw_atom,Data,N],VD1)
	->VD2=VD1;
	(get_data_n(N),
	append(VD1,[[Dbw_atom,Data,N]],VD2))),
	append(Types1,[[T,Dbw_atom,N]],Types2),!.

%append(Types1,[[T,Dbw_atom]],Types2),!.
/*
pft_expand_types1(Data1,Types1,Types2) :-
get_lang_word("t",T),
get_lang_word("brackets",Dbw_brackets),
	Data1=[Data2],
	
	not(Data2=[T,_]),
	not(Data2={[T,_]}),
	pft_expand_types1(Data2,[],Types4),
	Types5=[[[T,Dbw_brackets],Types4]],
	append_list3([Types1,Types5],Types2),!.
*/
/*
pft_expand_types1(Data1,Types1,Types2) :-
get_lang_word("t",T),
get_lang_word("brackets",Dbw_brackets),
	Data1=[[Data2]|Data4],
	pft_expand_types1(Data2,[],Types4),
	Types5=[[[T,Dbw_brackets],Types4]],
	pft_expand_types1(Data4,[],Types6),
	append_list3([Types1,Types5,Types6],Types2),!.
*/
	
pft_expand_types1(Data1,Types1,Types2,VD1,VD2) :-
get_lang_word("t",T),
get_lang_word("brackets",Dbw_brackets),
%trace,
	Data1=[[Data2|Data3]|Data41],

%not([Data2|Data3]=[T,_]),
	pft_expand_types1([Data2],[],Types3,VD1,VD3),
	pft_expand_types1(Data3,Types3,Types4,VD3,VD4),
	Types5=[[[T,Dbw_brackets],Types4]],

pft_expand_types2(Data41,[],Types6,VD4,VD2),

%findall(Types61,(member(Data4,Data41),	pft_expand_types1([Data4],[],Types61,VD1,VD2)),Types62),
%foldr(append,Types62,Types6),
	foldr(append,[Types1,Types5,Types6],Types2),!.

pft_expand_types1(Data1,Types1,Types2,VD1,VD2) :-
	Data1=[Data2|Data3],
	pft_expand_types1(Data2,Types1,Types3,VD1,VD3),
	pft_expand_types1(Data3,Types3,Types2,VD3,VD2),!.

pft_expand_types2([],Types,Types,VD,VD) :- !.
pft_expand_types2(Data1,Types1,Types2,VD1,VD2) :-
%get_lang_word("t",T),
%not(Data1=[T,_]),

	Data1=[Data2|Data3],
	pft_expand_types1([Data2],[],Types61,VD1,VD3),%),Types62),
	append(Types1,Types61,Types3),
	pft_expand_types2(Data3,Types3,Types2,VD3,VD2),!.


/*
	pft_expand_types1(Data1,Types1,Types2) :-
get_lang_word("t",T),
get_lang_word("list",Dbw_list),
	%Data1=[Data2Data3|Data41],

%not(Data2Data3=[T,_]),
not(Data1=[T,_]),
%trace,
curly_head_taila(Data1,Data2,Data3),
%trace,
	pft_expand_types1(Data2,[],Types3),
	pft_expand_types1(Data3,Types3,Types4),
	Types5=[[[T,Dbw_list],Types4]],
%trace,
%findall(Types61,(member(Data4,Data41),	
%pft_expand_types1(Data4,[],Types6),%),Types62),
%foldr(append,Types62,Types6),
	append_list3([Types1,%Types5,
	Types5],Types2),!.


pft_expand_types1(Data1,Types1,Types2) :-
get_lang_word("t",T),
get_lang_word("list",Dbw_list),
	Data1=[Data2Data3|Data41],

not(Data2Data3=[T,_]),

curly_head_taila(Data2Data3,Data2,Data3),
	pft_expand_types1(Data2,[],Types3),
	pft_expand_types1(Data3,Types3,Types4),
	Types5=[[[T,Dbw_list],Types4]],
%trace,
findall(Types61,(member(Data4,Data41),	pft_expand_types1([Data4],[],Types61)),Types62),
foldr(append,Types62,Types6),
	append_list3([Types1,Types5,
	Types6],Types2),!.
	*/
	
	/*
	pft_expand_types1(Data,Types1,Types2) :-
get_lang_word("t",T),
%get_lang_word("string",Dbw_string),

Data=[T,A],	%string(Data),
append(Types1,[[T,A]],Types2),!.
*/

	%%Types2=[Types4].

/*
append_list3(A1,B):-
	append_list3(A1,[],B),!.

append_list3([],A,A):-!.
append_list3(List,A,B) :-
	List=[Item|Items],
	append(A,Item,C),
	append_list3(Items,C,B),!.
*/