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
gen_alg(L0,O0,A1,A2,B1,B2,Start,PN1):-
 get_lang_word("n",Dbw_n),
 %get_lang_word("v",Dbw_v),
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
 v_name1(VN1),
 v_name1(VN11),
 v_name1(VN2),
 L1=[[[Dbw_n,PN1],[[],VN1,VN1]]],
 L2=[[Dbw_n,PN1],[VN1,VN11,VN2],":-"],
%trace,

 gen_alg(L,O,[],A4,[]%B3
  ,B2,false,_),

 length(L,LL),
 numbers(LL,1,[],IVNs),
 findall(VN5,(member(_,IVNs),v_name1(VN5)),VN5s),
 v_name1(VN6),
 v_name1(VN61),
 v_name1(VN62),
 %VN6=[VN8,VN9],
 append(VN5s,["|",VN6],VN7),
 L3=[[[Dbw_n,Dbw_equals4],[VN1,VN7]]],
%trace,
 %simplify_types_with_n(L,[],LN),
 %simplify_types_with_n(O,[],ON),
 %findall(OVN,member([v,OVN],VN5s),VN5s1),
 /*
 %trace,
 data_to_alg(%A4
 %VN5s%
 %L,O,VN5s,VN82
 %B2,
 LN,
 ON
 ,VN5s1%,ON
 ,VN82
 ),
 */
%trace,
 (A4=[[[n,PN3]|_]|_]->_PN3F=true;_PN3F=false),
 findall(Item,(member(IVN,IVNs),get_item_n(VN5s,IVN,VN51),
 get_item_n(L,IVN,LIVN),
 (LIVN=[T,_,_,Data]-> 
 Item=[[[Dbw_n,=],[VN51,Data]],[VN51,VN51]];
 (%A4=[[Dbw_n,PV3]|_], %***
 %writeln(A1),
 Item=[[[Dbw_n,PN3],%*
 [VN51,[],VN62]],[VN51,VN62]]
 ))),Items2),
%trace,
 findall([B,[A]],member([_,[A,B]],Items2),C),
 
 (forall(member([B,[A]],C),A=B)->A41=[];A41=A4),
 %trace,
 replace_in_terms(C,VN5s%VN8
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
 foldr(append,[A1,L1,A5,A41],A2)
 );
 (%trace,
 %L0=L,O0=O,
 L=[L1|L2],
 O=[O1|O2],
 ((L1=[T,_,_,Data],O1=[T,_,_,_Data2])->
 (
 (Brackets=true->
 Data2=[[Data]];
 Data2=[Data]),
 
 foldr(append,[B1,Data2],B3),
 (not(L2=[T,_,_,_])->
 (%trace,
 p_name1(PN2),
 gen_alg(L2,O2,[],A4,B3,B2,true,PN2));
 gen_alg(L2,O2,[],A4,B3,B2,false,_)),
 foldr(append,[A1,A4],A2)
 )
 %trace,
 /*
 (Brackets=true->
 foldr(append,[A1,[A4]],A2);
 foldr(append,[A1,A4],A2))
 )
 */
 ;
 (%trace,
 not(L1=[T,_,_,_]),
 p_name1(PN2),
 gen_alg(L1,O1,[],A3,[],_B3,true,PN2),
 foldr(append,[B1,[PN2]],B4),
 gen_alg(L2,O2,A3,A4,B4,B2,false,_),
 
 (Brackets=true->
 foldr(append,[A1,A4],A2);
 foldr(append,[A1,A4],A2))
 )
 
 
 ))).
 
