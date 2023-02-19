/*

[
 [11]
]

and 

[
 [111]
]

make

[
 [1]
]

where this [1] represents a list of 1s

[
 [1,1,[2,2],1,1,[2]]
]

and 

[
 [1,1,[2,2]]
]

make

[
 [1,1,[2]]
]

['../listprologinterpreter/listprolog.pl'].
['pft.pl'].
['find_lists.pl'].

?- pft_expand_types([[1],[1]],[],T,[],V),T=[T1,T2],find_lists(T1,T2,[],L,[],S),writeln(T),writeln(V),writeln(S),writeln(L).

*/

:-include('../listprologinterpreter/listprolog.pl').
:-include('pft.pl').
%:-include('find_lists.pl').

is_empty_list([]).

/*

[debug]  ?- find_lists1([[1, [2, 2], 1, [2]], [1, [2, 2]],[1, [2, 2], 1, [2],1,[2,2,2]]], [],A).
A = [1, [2]].

[debug]  ?- find_lists1([[1, [2, 2], 1, [2]], [1, [2, 2]]], [],A). 
A = [1, [2]].

find d2t with find lists and pft expand types

*/

find_lists1(T1T2,L1,L2,TN1,TN2) :-
 find_lists(T1T2,L1,L2,true,TN1,TN2).
 
find_lists(Ts,L,L,_,TN,TN) :- maplist(is_empty_list,Ts),!.
%find_lists(_,[],L,L,_) :- !.%,fail.%maplist(is_empty_list,Ts),!.
find_lists(TT,L1,L2,_Start,TN1,TN2) :-
 %get_lang_word("t",T),
 %get_lang_word("number",Dbw_number),

 %/*
 (is_type(TT,"number",L1,L2,TN1,TN2)->true;
 (is_type(TT,"string",L1,L2,TN1,TN2)->true;
 (is_type(TT,"atom",L1,L2,TN1,TN2)))),
 !.
 %*/
 %trace,
 %TT=[[T,T1,N]|_],
 %append(L1,[T,T1,N],L2),!.
find_lists(T1T2,L1,L2,Start,TN1,TN2) :-
 get_lang_word("t",T), 
 get_lang_word("brackets",Dbw_brackets), 
 get_lang_word("list",Dbw_list), 
%trace,
 sort(T1T2,T1T22),
 T1T22=[T1|_],

 %trace,
 (T1=[[[T,Dbw_brackets],_]]->(findall(A,(member([[[T,Dbw_brackets],A]],T1T22)),T1T23),B=brackets);(
 
 T1=[[T,Dbw_brackets],_]->(findall(A,(member([[T,Dbw_brackets],A],T1T22)),T1T23),B=brackets2);
 %trace,
 
 (T1T22=T1T23,B=not_brackets))),
 sort(T1T23,T1T24),
 
 findall(J,(member(H,T1T24),length(H,J)),G),
 sort(G,[TL10|_]),
 %T1T24=[T10|_],
  %length(T10,TL10),

 %findall(T13,(member(T13,T1T22),length(T13,TL13)),TL11),
 %length(T1,TL1),
 %length(T2,TL2),
 cut_into_equals_segments(TL10,T1T24,[],TL12),
 sort(TL12,TL14),
 %TL1 is TL2*2,
 %length(A,TL2),
 %append(A,B,T1),
 %trace,
 TL14=[TL15|TL16],
 check_same2(TL15,TL16,[],L3,Start,TN1,TN2),
 (B=brackets->(%trace,
 %(L3=[[T, _,_,_]|_]->L32=[L3];L32=L3),
 L31=[[T,Dbw_list],L3],%notrace,
 %foldr(append,[[[T,Dbw_list]],L32],L31),%notrace,
 append(L1,[L31],L2));
 %foldr(append,[L1,[L31]],L2));
 (B=brackets2->(
 L31=[[T,Dbw_list]|L3],
 %foldr(append,[[[T,Dbw_list]],L3],L31),
 append(L1,[L31],L2));
 %foldr(append,[L1,[L31]],L2));
 append(L1,L3,L2))),
 %foldr(append,[L1,L3],L2))),
 !.
 %check_same2(A,B,L1,L2,Start),*
 %trace,
 % * find 2 sides and directions that work *1 x above, cut into min length segments, sort, (check_same in a line xx *1 x)
 % do d2t after find lists
 %(check_same(A,T2,L1,L2,Start)->true;
 %check_same(T2,B,L1,L2,Start)
 %),!.

/*
find_lists(T1,T2,L1,L2,Start) :-
 length(T1,TL),
 length(T2,TL),
 check_same(T1,T2,L1,L2,Start),!.
*/


is_type([],_Type,L,L,TN,TN) :- !.
is_type(TT,Type,L1,L2,TN1,TN2) :-
 get_lang_word("t",T), 
 get_lang_word(Type,Dbw_type),
 TT=[[T,Dbw_type,_,_]|_],
 forall(member(T0,TT),T0=[T,Dbw_type,_,_]),
 findall([N1,Data],(member(T0,TT),T0=[T,Dbw_type,N1,Data]),Ns),
 %TT=[T1|T2],
 %T1=[T,Dbw_type,N],
 put_TN(Dbw_type,Ns,L1,L2,TN1,TN2).
 %is_a_number(T2,Type,TN3,TN2).

put_TN(Dbw_type,Ns,L1,L2,TN1,TN2) :-
 get_lang_word("t",T), 
 % in [1,2],[3,4] compares 1-3, then 2-4
 
 % in [1,1],[2,2] in these if 1=1 then 2 must =2
 % in [1,2],[3,3] in these if 3=3 then 1 must equal 2 - fails
 
 % puts var into all places of var to replace
 % fails if incompatible
 (Ns=[[N,_Data]]->(append(TN1,[[[T,Dbw_type,0 %end
 %,end
 ],[T,Dbw_type,N
 %,Data
 ]]],TN2),L1=L3);
 (Ns=[[N1,_Data1],[N2,Data2]|N3]->append(TN1,[[[T,Dbw_type,N1%,Data1
 ],[T,Dbw_type,N2%,Data2
 ]]],TN3),
 put_TN2(T,Dbw_type,[[N2,Data2]|N3],L1,L3,TN3,TN2))),
 
 append(_,[[N4,Data3]],Ns),
 append(L3,[T,Dbw_type,N4,Data3],L2).

put_TN2(_T,_Dbw_type,[],L,L,TN,TN) :- !.
put_TN2(_T,_Dbw_type,[_],L,L,TN,TN) :- !.
 %append(TN1,[[[T,Dbw_type,N],end]],TN2).
put_TN2(T,Dbw_type,Ns,L1,L2,TN1,TN2) :-
 Ns=[[N1,Data1],[N2,Data2]|Ns2],
 replace_in_term(TN1,
 [[T,Dbw_type,N0],[T,Dbw_type,N1]],
 [[T,Dbw_type,N0],[T,Dbw_type,N2]],TN3),

 append(TN3,[[[T,Dbw_type,N1],[T,Dbw_type,N2]]],TN4),

 append(Data1,[Data2],Data3),
 replace_in_term(L1,
 [T,Dbw_type,N1,Data1],
 [T,Dbw_type,N2,Data3],L3),

 put_TN2(T,Dbw_type,[N2|Ns2],L3,L2,TN4,TN2).



check_same([],[],L,L,_,TN,TN) :- !.
check_same(A,B,L1,L2,_Start,TN1,TN2) :-
 get_lang_word("t",T), 
 get_lang_word("list",Dbw_list), 
 A=[T11|T12],
 B=[T21|T22],
 append([T11],[T21],T11T21),
 find_lists(T11T21,[],L3,true,TN1,TN3),
 %trace,
 %(false%
 %Start=true
 %->
 %foldr(append,[L1,[[T,Dbw_list],L3]],L4);
 append(L1,[L3],L4),
 %foldr(append,[L1,[L3]],L4)),
 append(T12,T22,T12T22),
 find_lists(T12T22,L4,L2,false,TN3,TN2).


cut_into_equals_segments(_,[],TL13,TL13) :- !.
cut_into_equals_segments(L,TL11,TL13,TL12) :-
 TL11=[TL14|TL15],
 cut_into_equals_segments2(L,TL14,[],TL16),
 append(TL13,TL16,TL17),
 cut_into_equals_segments(L,TL15,TL17,TL12).

cut_into_equals_segments2(_,[],T,T) :- !.
cut_into_equals_segments2(L,TL14,TL15,TL16) :-
 length(A,L),
 append(A,B,TL14),
 append(TL15,[A],TL17),
 cut_into_equals_segments2(L,B,TL17,TL16).

check_same2(A,[],L1,L2,_Start,TN,TN) :- %trace,
 append(L1,[A],L2),!.

%check_same2(A,[],L1,L2,_Start,TN,TN) :- %trace,
 %append(L1,[A],L2),!.

%check_same2(_A,[],L,L,_Start) :- !.%append(L1,[A],L2),!.

/*
check_same2(TL14,TL17,L1,L2,Start,TN1,TN2) :-
 get_lang_word("t",T), 
 get_lang_word("brackets",Dbw_brackets), 
 get_lang_word("list",Dbw_list), 
 %trace,
 TL14=[[T,Dbw_brackets],[TL141|TL142]],
 TL17=[TL15|TL16],
 TL15=[[T,Dbw_brackets],[TL151|TL152]],
 check_same([TL141],[TL151],[],L3,Start,TN1,TN3),
 append(TL142,TL152,TL142TL152),
 find_lists(TL142TL152,[],L4,Start,TN3,TN4),
 foldr(append,[L3,[[t,list],L4]],L34), %***
 foldr(append,[L1,L34],L5),
 %trace,
 %append(TL17,))
 (TL16=[]->(L5=L2,TN4=TN2);
 (TL16=[TL171|TL18],
 check_same2(TL171,[L5],TL18,L2,Start,TN4,TN2))),!.
 
%check_same2(_A,[],L,L,_Start) :- !.%append(L1,[A],L2),!.
check_same2(TL14,TL17,L1,L2,Start,TN1,TN2) :-
 get_lang_word("t",T), 
 get_lang_word("brackets",Dbw_brackets), 
 %trace,
 TL14=[[[T,Dbw_brackets],[TL141|TL142]]], % this is the different part
 TL17=[TL15|TL16],
 TL15=[[[T,Dbw_brackets],[TL151|TL152]]],
 check_same([TL141],[TL151],[],L3,Start,TN1,TN3),
 append(TL142,TL152,TL142TL152),
 find_lists(TL142TL152,[],L4,Start,TN3,TN4),
 foldr(append,[L3,[[t,list],L4]],L34), %**
 foldr(append,[L1,[[t,list],L34]],L5),
 %trace,
 %append(TL17,))
 (TL16=[]->(L5=L2,TN4=TN2);
 (TL16=[TL171|TL18],
 check_same2(TL171,[L5],TL18,L2,Start,TN4,TN2))),!.
  */
check_same2(TL14,TL17,L1,L2,Start,TN1,TN2) :-
 %trace,
 TL14=[TL141|TL142],
 TL17=[TL15|TL16],
 TL15=[TL151|TL152],
 check_same([TL141],[TL151],L1,L3,Start,TN1,TN3),
 append(TL142,TL152,TL142TL152),
 find_lists(TL142TL152,[],L4,Start,TN3,TN4),
 append(L3,L4,L5),
 %trace,
 %append(TL17,))
 (TL16=[]->(L5=L2,TN4=TN2);
 (TL16=[TL171|TL18],
 check_same2(TL171,[L5],TL18,L2,Start,TN4,TN2))).


/*

make 1 into [t,number,1]

check same 2 keeps segments in order, adds vars for 1=2 for [,,1] in same place as [,,2] to check they have the same pattern - can join, not diverge

provides descriptive errors

*/
