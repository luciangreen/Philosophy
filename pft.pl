/*

Moral compass

1. I performed the task for the student well. *

- replicating work for the student
text
- ontologies, connections, possibly algs
 - algs (sentences or words instead of letters, pft - sees if have predictable patterns otherwise uses nn like caw (starting closer to the place x) - recog sort or max with algs, (which also produces data in the backwards direction) x forwards direction)
 - nn x pft
 - recn
role


- replace data including characters in strings with symbols
- move data using prev alg
 - equals4 version that concatenates strings
- recn for patterns (list type) - use data types and vars in pft types

1. data to types
2. groups types into lists - multiple sets of i,o
3. alg to write pred that converts i->o x uses types to convert x prev alg
4. try with new data


data: i:[1,[a,a,a]] o: [[a,a,a],2]
types: {atom...}

i:"ab" or "abab"
o:"ba" or "baba"

[a,b,a] - {[a,1],[a,2]}:[a,1]
[[a,b],a] - [{[a,1],[a,2]}]:[a,1]
x
[[a,b],a] - {[a,1],[a,2]}:[a,1]

i: [3,1,2]
o: [1,2]

result: sort, remove last item

*/

% data to types with lists

%% data_to_types2.pl

% needs vars, list of vars-data and finds lists across sets of data

% data to types with strings

/**

['../listprologinterpreter/listprolog.pl'].

** Data given is the list of lists in input, not input and output.

% try with single v, mult v items, mult sets v with prev, l=5,4, brackets of brackets with prev


[[1]] is the list of input lists - of which there is one: [1], i.e. the input: 1.  Without brackets around [1] we can't signify multiple items in the input.
[[t, number, 1]] just means [t, number, 1], with brackets around it in case there are multiple items.

data_to_types22([[1]],T1,VD),find_lists(T1,[],Sets2),writeln(T1),writeln(VD),writeln(Sets2).                                                
Sets2 = [[t, number, 1]].

data_to_types22([[[1,1]]],T1,VD),find_lists(T1,[],Sets2),writeln(T1),writeln(VD),writeln(Sets2).
Sets2 = [[[[t, number, 1], [t, number, 1]]]].

data_to_types22([[[1]],[[2]]],T1,VD),find_lists(T1,[],Sets2),writeln(T1),writeln(VD),writeln(Sets2).
Sets2 = [[[[t, list], [[t, number, 1]]]]].

data_to_types22([[[1]],[[1]]],T1,VD),find_lists(T1,[],Sets2),writeln(T1),writeln(VD),writeln(Sets2).
Sets2 = [[[[t, list], [[t, number, 1]]]]].


data_to_types22([[[1,"a"]],[[2,"b"]]],T1,VD),find_lists(T1,[],Sets2),writeln(T1),writeln(VD),writeln(Sets2).
Sets2 = [[[[t, list], [[t, number, 1], [t, string, 2]]]]].

data_to_types22([[[1]],[[2,2]]],T1,VD),find_lists(T1,[],Sets2),writeln(T1),writeln(VD),writeln(Sets2).
Sets2 = [[[[t, list], [[t, number, 1]]]]].

data_to_types22([[[1,1]],[[2,2,2,2]]],T1,VD),find_lists(T1,[],Sets2),writeln(T1),writeln(VD),writeln(Sets2).
Sets2 = [[[[t, list], [[t, number, 1], [t, number, 1]]]]].

data_to_types22([[["1",1]],[["2",2,"2",2]]],T1,VD),find_lists(T1,[],Sets2),writeln(T1),writeln(VD),writeln(Sets2).
Sets2 = [[[[t, list], [[t, string, 1], [t, number, 2]]]]].

data_to_types22([[["2",2,"2",2]],[["2",2,"2",2]]],T1,VD),find_lists(T1,[],Sets2),writeln(T1),writeln(VD),writeln(Sets2).
Sets2 = [[[[t,list],[[t,string,1],[t,number,2],[t,string,1],[t,number,2]]]]]


data_to_types22([[[1]],[[1,1]]],T1,VD),find_lists(T1,[],Sets2),writeln(T1),writeln(VD),writeln(Sets2). 
Sets2 = [[[[t, list], [[t, number, 1]]]]].

data_to_types22([[[1,2,3,4]],[[1,2,3,4,1,2,3,4]]],T1,VD),find_lists(T1,[],Sets2),writeln(T1),writeln(VD),writeln(Sets2).
Sets2 = [[[[t,list],[[t,number,1],[t,number,2],[t,number,3],[t,number,4]]]]]

data_to_types22([[[[[1,2,3,4]]]],[[[[1,2,3,4,1,2,3,4]]]]],T1,VD),find_lists(T1,[],Sets2),writeln(T1),writeln(VD),writeln(Sets2).
Sets2 = [[[[t, list], [[[t, list], [[t|...], [...|...]|...]]]]]].


* need data ID(N) to write alg

**/

:- dynamic get_data_n1/1.

data_to_types22(Data,Types4,VD) :-
	retractall(get_data_n1(_)),
	assertz(get_data_n1(0)),
	%findall([Types2,VD2],(member(Data1,Data),data_to_types2(Data1,[],Types2,[],VD2)),Types31),
	data_to_types221(Data,[],Types4,[],VD).
	%sort(Types3,Types4).
	%findall(Types,member([Types,_],Types31),Types3),
	%findall(VD1,member([_,VD1],Types31),VD).

data_to_types221([],Types,Types,VD,VD) :- !.
data_to_types221(Data,Types1,Types2,VD1,VD2) :-
	Data=[Data1|Data2],
	data_to_types2(Data1,[],Types3,VD1,VD3),
	append(Types1,[Types3],Types4),
	data_to_types221(Data2,Types4,Types2,VD3,VD2).

	
get_data_n(N) :-
	get_data_n1(N1),
	N is N1+1,
	retractall(get_data_n1(_)),
	assertz(get_data_n1(N)).

data_to_types2([],Types,Types,VD,VD) :- !.
data_to_types2(Data,Types1,Types2,VD1,VD2) :-
get_lang_word("t",T),
get_lang_word("number",Dbw_number),
	number(Data),
	(member([Dbw_number,Data,N],VD1)->VD2=VD1;
	(get_data_n(N),
	append(VD1,[[Dbw_number,Data,N]],VD2))),
	append(Types1,[[T,Dbw_number,N]],Types2),!.
data_to_types2(Data,Types1,Types2,VD1,VD2) :-
%trace,
get_lang_word("t",T),
get_lang_word("string",Dbw_string),
	string(Data),
	(member([Dbw_string,Data,N],VD1)->VD2=VD1;
	(get_data_n(N),
	append(VD1,[[Dbw_string,Data,N]],VD2))),
	append(Types1,[[T,Dbw_string,N]],Types2),!.
data_to_types2(Data,Types1,Types2,VD1,VD2) :-
get_lang_word("t",T),
get_lang_word("atom",Dbw_atom),
	atom(Data),
	(member([Dbw_atom,Data,N],VD1)->VD2=VD1;
	(get_data_n(N),
	append(VD1,[[Dbw_atom,Data,N]],VD2))),
	append(Types1,[[T,Dbw_atom,N]],Types2),!.
data_to_types2(Data1,Types1,Types2,VD1,VD2) :-
get_lang_word("t",T),
get_lang_word("brackets",Dbw_brackets),
	Data1=[[Data2]],
	data_to_types2(Data2,[],Types4,VD1,VD2),
	Types5=[[[T,Dbw_brackets],Types4]],
	foldr(append,[Types1,Types5],Types2),!.
data_to_types2(Data1,Types1,Types2,VD1,VD2) :-
get_lang_word("t",T),
get_lang_word("brackets",Dbw_brackets),
	Data1=[[Data2]|Data4],
	data_to_types2(Data2,[],Types4,VD1,VD3),
	Types5=[[[T,Dbw_brackets],Types4]],
	data_to_types2(Data4,[],Types6,VD3,VD2),
	foldr(append,[Types1,Types5,Types6],Types2),!.
data_to_types2(Data1,Types1,Types2,VD1,VD2) :-
get_lang_word("t",T),
get_lang_word("brackets",Dbw_brackets),
	Data1=[[Data2|Data3]|Data4],
	data_to_types2(Data2,[],Types3,VD1,VD3),
	data_to_types2(Data3,Types3,Types4,VD3,VD4),
	Types5=[[[T,Dbw_brackets],Types4]],
	data_to_types2(Data4,[],Types6,VD4,VD2),
	foldr(append,[Types1,Types5,Types6],Types2),!.
data_to_types2(Data1,Types1,Types2,VD1,VD2) :-
	Data1=[Data2|Data3],
	%trace,
	data_to_types2(Data2,Types1,Types3,VD1,VD3),
	data_to_types2(Data3,Types3,Types2,VD3,VD2),!.
	%%Types2=[Types4].

%************

find_lists(Sets,Sets1,Sets1) :- maplist(is_empty_list,Sets),!.
find_lists(Sets,Sets1,Sets2) :-
 findall(Heads3,member([Heads3|_],Sets),Heads),
 findall(Bodies3,member([_|Bodies3],Sets),Bodies),
 find_lists2(Heads,[],Sets3),
 append(Sets1,[Sets3],Sets4),
 find_lists(Bodies,Sets4,Sets2).

is_empty_list([]).

find_lists2([],Sets,Sets) :- !.
find_lists2(Heads,Sets1,Sets2) :-
get_lang_word("t",Dbw_t),
get_lang_word("brackets",Dbw_brackets),
get_lang_word("list",Dbw_list),
 Heads=[Head|Heads2],
 %trace,
 get_type1(Head,Type),
 (not(Type=brackets)->
 (forall(member(Head1,Heads2),get_type1(Head1,Type)),
 findall(N,(member([_,_,N],Heads)),Ns),
 Ns=[N1|_],
 append(Sets1,[Dbw_t,Type,N1],Sets3));
 (%findall(Heads3,Heads=[[[Dbw_t, Dbw_brackets]|Heads3]|_],Heads4),
 findall(Heads3,member([[Dbw_t, Dbw_brackets],Heads3],Heads),Heads4),
 
 %trace,
 ((forall(member([Head1],Heads4),get_type1(Head1,brackets)),
 findall(Heads451,(member(Heads44,Heads4),findall(Heads43,(member([[Dbw_t, Dbw_brackets],Heads43],Heads44)),Heads45),foldr(append,Heads45,Heads451)),Heads42), not(maplist(is_empty_list,Heads42))
 )->
 (%findall(Head1,member([Head1],Heads4),Heads41),
 
 List_of_lists=true%Heads42=Heads41
  
  ); (List_of_lists=false,Heads42=Heads4)),
 (%trace,
 %Heads=[[[Dbw_t, Dbw_brackets]|Heads4]|_H5],
 test_lists(Heads42,L,CFLM),%,Heads5
 %trace,
 (CFLM=single%false%length(L,1)
 ->L1=[L];L1=[[[Dbw_t, Dbw_list],L]]),
 (List_of_lists=true->L2=[[[Dbw_t, Dbw_list],L1]];L2=L1),
 append(Sets1,L2,Sets3)))),
 %append(Sets1,[[[Dbw_t, Dbw_list],L]],Sets3))))),
 Sets3=Sets2.
 %find_lists2(Heads2,Sets3,Sets2).
  
get_type1(Head1,Type) :-
 Head1=[_,Head|_],
 (Head=number->Type=number;
 (Head=string->Type=string;
 (Head=atom->Type=atom;
 (Head1=[[_,brackets]|_]->Type=brackets)))).

test_lists(Heads1,L,CFLM%,Heads3
) :-
%trace,
 findall(Common_factors1,(member(Head,Heads1),length(Head,Length),
 common_factors(Length,Common_factors1)),Common_factors),
 %foldr(append,Common_factors,Common_factors3),
 %sort(Common_factors3,Common_factors4),
 length(Common_factors,CFL),
 (CFL>1->CFLM=multiple;CFLM=single),
 Common_factors=[CF1|CF2],
 (CF2=[]->Common_factors4=CF1;
 (%trace,
 foldr(intersection,CF2,CF1,Common_factors4))),
 reverse(Common_factors4,Common_factors5),
 test_lists2(Common_factors5,Heads1,L%,Heads3
 ).

common_factors(Length,Common_factors1) :-
 Length2 is ceiling(Length),
 numbers(Length2,1,[],Ns),
 findall(N,(member(N,Ns),0 is mod(Length2,N)),Common_factors1).
 
test_lists2(Common_factors1,Heads1,L%,Heads2
) :-
 member(Common_factor,Common_factors1),%,|Common_factors2],
 test_lists3(Common_factor,Heads1,L),%,Heads3
 %)->
 
 !.
 
test_lists3(Common_factor,Heads1,L%,Heads3
) :-
 length(L,Common_factor),
 Heads1=[Head|_],
 append(L,_Head2,Head),
 forall(member(Head3,Heads1),types_in(Common_factor,L,Head3)).
 %test_lists4(Common_factor,L,Heads1,Heads3).

%test_lists4(Common_factor,L,Heads1,Heads3) :-
 
types_in(_Common_factor,_L,[]) :- !.
types_in(Common_factor,L,Head3) :-
 length(M,Common_factor),
 append(M,N,Head3),
 types_in2(L,M),
 types_in(Common_factor,L,N).

% find L at end above
% L should be [_,_,_] not [_]

% insert list[]

types_in2([],[]) :- !.
types_in2(L,M) :-
 L=[L1|L2],
 M=[M1|M2],
 %trace,
 L1=[_,Type,_N1],
 M1=[_,Type,_N2],
 types_in2(L2,M2).

 

 
