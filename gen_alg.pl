% gen_alg([a,[[b],c]],A).
/* A=
[["p1", ":", a, "p2"], ["p2", ":", "p3", b], ["p3", ":", c]]
*/

%:- include('find_lists.pl').

/*
:- dynamic p_name/1.
:- dynamic v_name/1.

p_name1(N) :-
 p_name(N1),
 string_concat("p",N1,N),
 N2 is N1+1,
 retractall(p_name(_)),
 assertz(p_name(N2)).

v_name1([Dbw_v,N]) :-
 get_lang_word("v",Dbw_v),
 v_name(N1),
 string_concat("v",N1,N),
 N2 is N1+1,
 retractall(v_name(_)),
 assertz(v_name(N2)).
*/

gen_alg(L,O,A2):-
 retractall(p_name(_)),
 assertz(p_name(1)),
 retractall(v_name(_)),
 assertz(v_name(1)),
 p_name1(PN1),
 %trace,
 gen_alg(L,O,[],A2,[],_B2,true,PN1).

gen_alg([],[],A1,A2,B,B,_,_) :- append(_%[B]
 ,A1,A2),!.
 
gen_alg(L0,O0,A1,A2,_B1,_B2,Start,PN1):- %*** test if need B1,B2
 get_lang_word("n",Dbw_n),
 get_lang_word("v",Dbw_v),
 get_lang_word("equals4",Dbw_equals4),
 get_lang_word("append",Dbw_append),
 get_lang_word("t",T),
 get_lang_word("append",Dbw_append),
 %get_lang_word("list",Dbw_list),
 get_lang_word("brackets",Dbw_brackets),
 
 ((L0=[[[T, Dbw_brackets],L00]],
 O0=[[[T, Dbw_brackets],O00]])->(O=O00,L=L00,_Brackets=true);
 ((L0=[[T, Dbw_brackets],L00],
 O0=[[T, Dbw_brackets],O00])->(O=O00,L=L00,_Brackets=true);
 fail%L0=L,O0=O,Brackets=false
 )),

 (Start=true->
 (%trace,
 length(L,LL),
 numbers(LL,1,[],IVNs),
 
 %data_to_alg(L,O,IVNs,OVNs1),
 findall(Same_items,(member(IVN,IVNs),
 get_item_n(L,IVN,LIVN),
 findall([IVN,LIVN,OIVN],(member(OIVN,O),
 same_items(LIVN,OIVN)),Same_items)),Same_items2),
 
 foldr(append,Same_items2,Same_items3),
 sort(Same_items3,Same_items4),
 
 (not(length(Same_items4,LL))->(writeln("Input and output have different items."),abort);true),
 
 findall([IVN,A42],(member([IVN,LIVN1,OIVN1],Same_items4),
 not(no_repeating_lists(OIVN1)),
 gen_alg(LIVN1,OIVN1,[],A42,[]%B3
  ,_B2,false,_)),A41),

 findall(A43,member([_,A43],A41),A44),
 foldr(append,A44,A4),

%p_name1(PN1),
 v_name1(VN1),
 %v_name1(VN11),
 v_name1(VN2),
 %L1=[[[Dbw_n,PN1],[[],VN1,VN1]]],
 L2=[[Dbw_n,PN1],[VN1,[],VN2],":-"],
%trace,

 findall(VN5,(member(_,IVNs),v_name1(VN5)),VN5s),
 %v_name1(VN6),
 %v_name1(VN61), **?
 v_name1(VN62),
 %VN6=[VN8,VN9],
 %append(VN5s,["|",VN6],VN7),
 L3=[[[Dbw_n,Dbw_equals4],[VN1,VN5s]]],

%trace,
 %(A4=[[[n,PN3]|_]|_]->_PN3F=true;_PN3F=false),
 %trace,
 findall(V,member([Dbw_v,V],VN5s),V1),
 data_to_alg(L,O,V1,VN6s),
 findall([Dbw_v,V],member(V,VN6s),V2),
 findall(Item,(member(IVN,IVNs),get_item_n(V2,IVN,VN51),
 get_item_n(O,IVN,LIVN), %%*** Test L as O
 (not(member([IVN,_],A41))%LIVN=[T,_,_,Data]
 -> 
 Item=[]%[[[Dbw_n,=],[VN51,Data]],[VN51,VN51]]
 ;
 (%A4=[[Dbw_n,PV3]|_], %***
 %writeln(A1),
 %trace,
 get_item_n(A41,IVN,[_,[[Dbw_n,PN3]|_]]),
 Item=[[[Dbw_n,PN3],%*
 [VN51,[],VN62]],[VN51,VN62]]
 ))),Items2),
%trace,
 findall([B,[A]],member([_,[A,B]],Items2),C),
 
 (forall(member([B,[A]],C),A=B)->A411=[];A411=A4),
 %trace,
 replace_in_terms(C,V2%VN6s%VN8
  ,VN821),
 
 findall(A,member([A,_],Items2),C1),
 %trace,
 %findall([Dbw_v,VN823],member(VN823,VN821),VN822),
 %Calls,
 Item3=[[[Dbw_n,Dbw_equals4],[VN2,VN821]]%,
 %[[Dbw_n,PN1],[VN6,VN61,VN2]]],
 ],
 %foldr(append,[B1,[L1]],B3),
 %L1
 foldr(append,[L3,C1,Item3],L4),
 foldr(append,[L2,[L4]],A3),
 foldr(append,[[A3]],A5),
 %foldr(append,[[A31]],A5),
 %foldr(append,[A4],A41),
 %foldr(append,[A41],A42),
 foldr(append,[A1,%L1,
  A5,A411],A2)
 )),!.
 
gen_alg(L0,O0,A1,A2,B1,B2,Start,PN1):-
 get_lang_word("n",Dbw_n),
 get_lang_word("v",Dbw_v),
 get_lang_word("equals4",Dbw_equals4),
 get_lang_word("t",T),
 get_lang_word("append",Dbw_append),
 get_lang_word("list",Dbw_list),
 
 ((L0=[[[T, Dbw_list],L00]],
 O0=[[[T, Dbw_list],O00]])->(O=O00,L=L00,Brackets=true);
 ((L0=[[T, Dbw_list],L00],
 O0=[[T, Dbw_list],O00])->(O=O00,L=L00,Brackets=true);
 L0=L,O0=O,Brackets=false)),

 (Start=true->
 (%p_name1(PN1),
 %trace,
 length(L,LL),
 numbers(LL,1,[],IVNs),

 findall(Same_items,(member(IVN,IVNs),
 get_item_n(L,IVN,LIVN),
 findall([IVN,LIVN,OIVN],(member(OIVN,O),
 same_items(LIVN,OIVN)),Same_items)),Same_items2),
 
 foldr(append,Same_items2,Same_items3),
 sort(Same_items3,Same_items4),
 
 (not(length(Same_items4,LL))->(writeln("Input and output have different items."),abort);true),
 
 findall([IVN,A42],(member([IVN,LIVN1,OIVN1],Same_items4),
 not(no_repeating_lists(OIVN1)),
 gen_alg(LIVN1,OIVN1,[],A42,[]%B3
  ,_B2,false,_)),A41),

 findall(A43,member([_,A43],A41),A44),
 foldr(append,A44,A4),
 
 v_name1(VN1),
 v_name1(VN11),
 v_name1(VN2),
 L1=[[[Dbw_n,PN1],[[],VN1,VN1]]],
 L2=[[Dbw_n,PN1],[VN1,VN11,VN2],":-"],
%trace,

 findall(VN5,(member(_,IVNs),v_name1(VN5)),VN5s),
 v_name1(VN6),
 v_name1(VN61),
 v_name1(VN62),
 %VN6=[VN8,VN9],
 append(VN5s,["|",VN6],VN7),
 L3=[[[Dbw_n,Dbw_equals4],[VN1,VN7]]],

 %(A4=[[[n,PN3]|_]|_]->_PN3F=true;_PN3F=false),
 %trace,
 findall(V,member([Dbw_v,V],VN5s),V1),
 data_to_alg(L,O,V1,VN6s),
 findall([Dbw_v,V],member(V,VN6s),V2),
 findall(Item,(member(IVN,IVNs),get_item_n(V2,IVN,VN51),
 get_item_n(L,IVN,LIVN),
 (not(member([IVN,_],A41))%LIVN=[T,_,_,Data]
 -> 
 Item=[]%[[[Dbw_n,=],[VN51,Data]],[VN51,VN51]]
 ;
 (%A4=[[Dbw_n,PV3]|_], %***
 %writeln(A1),
 get_item_n(A41,IVN,[_,[[Dbw_n,PN3]|_]]),
 Item=[[[Dbw_n,PN3],%*
 [VN51,[],VN62]],[VN51,VN62]]
 ))),Items2),
%trace,
 findall([B,[A]],member([_,[A,B]],Items2),C),
 
 (forall(member([B,[A]],C),A=B)->A411=[];A411=A4),
 %trace,
 replace_in_terms(C,V2%VN5s%VN8
  ,VN821),
 
 findall(A,member([A,_],Items2),C1),
 %trace,
 %findall([Dbw_v,VN823],member(VN823,VN821),VN822),
 %Calls,
 Item3=[[[Dbw_n,Dbw_append],[VN11,VN821,VN61]],
 [[Dbw_n,PN1],[VN6,VN61,VN2]]],
 
 %foldr(append,[B1,[L1]],B3),
 %L1
 foldr(append,[L3,C1,Item3],L4),
 foldr(append,[L2,[L4]],A3),
 foldr(append,[[A3]],A5),
 %foldr(append,[[A31]],A5),
 %foldr(append,[A4],A41),
 %foldr(append,[A41],A42),
 foldr(append,[A1,L1,A5,A411],A2)
 )).

% out of order items

% also need geode (no repeating lists) detector

% after writing these two predicates, can delete previous two gen_alg predicates

% x don't need these two predicates, just run gen alg false for needed predicates, in accordance with above


/*

same_items([[t,list],[[_,_,_,2],[[t,list],[[_,_,_,1]]]]],[[t,list],[[[t,list],[[_,_,_,1]]],[_,_,_,2]]]).                                            true.

same_items([[t,list],[[_,_,_,2],[[t,list],[[_,_,_,1]]]]],[[t,list],[[[t,list],[[_,_,_,1]]],[_,_,_,3]]]).
false.

*/

same_items(A0,B0):-
 get_lang_word("t",T),
 get_lang_word("list",Dbw_list),
 get_lang_word("brackets",Dbw_brackets),
 (A0=[[T,Dbw_list],A]->true;(A0=[[T,Dbw_brackets],A]->true;[A0]=A)),
 (B0=[[T,Dbw_list],B]->true;(B0=[[T,Dbw_brackets],B]->true;[B0]=B)),
 findall(Data,member([T,_,_,Data],A),Data_A),
 findall(Data,member([T,_,_,Data],B),Data_B),
 subtract(Data_A,Data_B,[]),
 subtract(Data_B,Data_A,[]),
 findall(A1,(member(A1,A),not(A1=[T,_,_,_])),Data_A2),
 findall(B1,(member(B1,B),not(B1=[T,_,_,_])),Data_B2),
 ((Data_A2=[]->true;Data_B2=[])->true;
 (forall((member(A2,Data_A2),
 member(B2,Data_B2)),
 same_items(A2,B2)))).

/*

no_repeating_lists([[t,brackets],[[_,_,_,2],[[t,brackets],[[_,_,_,1]]]]]).                                                                          true.

no_repeating_lists([[t,brackets],[[_,_,_,2],[[t,list],[[_,_,_,1]]]]]).
false.

no_repeating_lists([[t,list],[[_,_,_,2],[[t,list],[[_,_,_,1]]]]]).  false.

*/

no_repeating_lists(A0) :-
 get_lang_word("t",T),
 get_lang_word("list",Dbw_list),
 get_lang_word("brackets",Dbw_brackets),
 (A0=[[T,Dbw_list],A]->false;(A0=[[T,Dbw_brackets],A]->true;[A0]=A)),
 findall(A1,(member(A1,A),not(A1=[T,_,_,_])),Data_A2),
 (Data_A2=[]->true;
 (forall(member(A2,Data_A2),
 no_repeating_lists(A2)))).
