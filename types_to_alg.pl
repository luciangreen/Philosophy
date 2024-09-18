% types_to_alg.pl

:-include('find_lists.pl').
:-include('collect_simplify_types.pl').
:-include('data_to_alg3.pl').
%:-include('data_to_alg4.pl').
:-include('data_to_alg5.pl').
:-include('gen_alg.pl').
:-include('simplify_types_with_n.pl').
:-include('../Prolog-to-List-Prolog/p2lpconverter.pl').
:-include('collect_ga_parts.pl').
:-include('replace_v_with_nothing.pl').
:-include('replace_nothing_with_v.pl').
:-include('flatten_var_term.pl').
:-include('replace_in_term3.pl').

:- dynamic p_name/1.
:- dynamic v_name/1.

test_types2a%(1,Alg)
 :- 
 test1(off,1,_),

/*
Data = [
[[[1,[2, 2],1,[2]]], [[1,[2]]]], % possible versions of input for alg to generate
[[[1,[2],1,[2]]], [[1,[2,2]]]] % " output "
],

Data = [
[[[1,[2, 2],1,[2]]], [[1,[2]]]],
[[[1,[2],1,[2]]], [[1,[2]]]]
],

Data = [
[[[a,[b, b],a,[b]]], [[a,[b]]]],
[[[[b],a,[b],a]], [[[b],a]]]
],

Data = [
[[[a,a]], [[a]]],
[[[a,a]], [[a]]]
],

test X
gen_alg([[[t, list], [[t, atom, 4, a], [t, atom, 7, b]]]], [[[t, list], [[t, atom, 4, b],[t, atom, 7, a]]]],A),pp0(A,B),writeln(B).



Data = [
[[[a,b]]],
[[[a,b]]]
],

v


x


Data = [
[[[a,[b, b],a,[b]]], [[a,[b]]]],
[[[a,[b],a,[b]]], [[a,[b]]]]
],
v

Data = [
[[[a,b]]],
[[[a,b]]]
],

*/
%/*
%*/
%Data = ,

%/*
test_types2a2([
[[[ [b, b],a,[b],a]], [[[b],a]]],
%[[[ [b, b],a,[b],a]], [[[b],a]]]
[[[ a,[b, b],a,[b]]], [[a,[b]]]]
%[[[ [b],a,[b],a]], [[[b],a]]]
]),

test_types2a2([
[[[a,[b, b],a,[b]]], [[a,[b]]]],
%[[[a,[b, b],a,[b]]], [[a,[b]]]]
[[[ [b, b],a,[b],a]], [[[b],a]]]
%[[[[b, b],a,[b]]], [[a,[b]]]]
%[[[a,[b],a,[b]]], [[a,[b]]]]
]),
%trace,

test_types2a2([
[[[a,b]]],
[[[b,a]]]
]),
test_types2a2([
[[[ [b, [c],b,[c]],a,[b,[c]],a]], [[[b,[c]],a]]],
%[[[ [b, b],a,[b],a]], [[[b],a]]]
[[[ a,[b, [c],b,[c]],a,[b,[c]]]], [[a,[b,[c]]]]]
%[[[ [b],a,[b],a]], [[[b],a]]]
]),

%*/
test_types2a2([
[[[ [b, [c],b,[c]],a,[b,[c]],a]], [[[b,[c]],a]]],
%[[[ [b, b],a,[b],a]], [[[b],a]]]
[[[ a,[ [c],b,[c],b],a,[[c],b]]], [[a,[[c],b]]]]
%[[[ [b],a,[b],a]], [[[b],a]]]
]),

%test_types2a2([[[[ [[b, b],a],[[b],a]]], [[[[b],a]]]],[[[[ a,[b, b]],[a,[b]]]]]]),


!.

test_types2a2(Data):-
types_to_alg(Data,Alg),


%trace,
pp0(Alg,Alg2),writeln(Alg2),

%lp2p1(Alg,Alg3),
%writeln1(Alg3),

Data=[[[I|_]|_],[[O|_]|_]],
Query=[[n,p1],[I,[],[v,o]]],
writeln1(Query),
%trace,
writeln([o,O]),
 interpret(off,Query,Alg,R),
R=[[[[v,o],R1]]],
writeln1(R1),
(O=R1->writeln([success]);writeln([fail])),
nl
.%, writeln1(Alg).

types_to_alg(Data,Alg):-
 types_to_alg2(Data,[],L),
% need data in L to collect, merge
 collect_simplify_types1(L,[],T),
 foldr(append,T,T1),
 merge_types(T1,[],MT),
 replace_in_terms(MT,L,L2),
 L2=[I,O],
 %trace,
 gen_alg(I,O,Alg).
 
types_to_alg2([],L,L) :- !.
types_to_alg2(Data,L1,L2):-
 Data=[D|E],
 data_to_types22(D,T,_V),find_lists1(T,[],L,[],_S),
 append(L1,[L],L3),
 types_to_alg2(E,L3,L2).

collect_simplify_types1([],L,L) :- !.
collect_simplify_types1(Data,L1,L2):-
 Data=[D|E],
 collect_simplify_types(D,[],L),
 append(L1,[L],L3),
 collect_simplify_types1(E,L3,L2).
 
merge_types([],MT,MT) :- !.
merge_types(T,MT1,MT2) :-
%trace,
 T=[[TT,Type,N,D]|T2],
 findall([TT,Type,N2,D],(member([TT,Type,N2,D],T2)),N3),
 subtract(T2,N3,T3),
 N4=[[[TT,Type,N,D],N3]],
 %append(N3,[[TT,Type,N,D]],N4),
 append(MT1,N4,MT3),
 merge_types(T3,MT3,MT2).


%replace_in_terms0(M,T,L) :-

replace_in_terms([],L,L) :- !.
replace_in_terms(MT1,L1,L2) :-
 MT1=[[MT3,MT5]|MT4],
 replace_in_terms2(MT3,MT5,L1,L3),
 replace_in_terms(MT4,L3,L2).

replace_in_terms2(_,[],L,L) :-!.
replace_in_terms2(MT1,MT2,L1,L2) :-
 MT2=[MT5|MT6],
 replace_in_term(L1,MT5,MT1,L3),
 replace_in_terms2(MT1,MT6,L3,L2).

replace_in_terms3([],B,B) :-!.
replace_in_terms3(A,B,C) :-
 A=[[D,E]|F],
 replace_in_term(B,D,E,G),
 replace_in_terms3(F,G,C).
 
p_name1(N) :-
 p_name(N1),
 atom_concat(p,N1,N),
 N2 is N1+1,
 retractall(p_name(_)),
 assertz(p_name(N2)).

v_name1([Dbw_v,N]) :-
 get_lang_word("v",Dbw_v),
 v_name(N1),
 atom_concat(Dbw_v,N1,N),
 N2 is N1+1,
 retractall(v_name(_)),
 assertz(v_name(N2)).
 
%is_4([_,_,_,_]).

%generate_alg([],Alg,Alg) :- !.
%generate_alg(L,Alg1,Alg2) :-


%****

/*
generate_alg([],Alg,Alg) :- !.
generate_alg(L,Alg1,Alg2) :-
 L=[I,O],
 retractall(p_name(_)),
 assertz(p_name(1)),
 retractall(v_name(_)),
 assertz(v_name(1)),
 trace,
 generate_p1([I,O],Alg1,Alg2%,Alg3,Alg4
 ),
 foldr(append,[Alg1%,Alg3,Alg4
 ],Alg2).
 
generate_p1([I0,O0],Alg1,Alg2%,Alg3,Alg4
) :-
 get_lang_word("t",T),
 get_lang_word("n",Dbw_n),
 get_lang_word("list",Dbw_list),
 ((I0=[[[T, Dbw_list],I]],
 O0=[[[T, Dbw_list],O]])->true;

 %((I0=[I],
 %O0=[O])->true;
 
 %(
 I0=I,O0=O)%))
 ,
 v_name1(VN1),
 v_name1(VN2),
 p_name1(PN1),
 (%maplist(is_4,I)
 not(I=[T,_,_,_Data])->
 (p_name1(PN2),
 B=[[[Dbw_n,PN2],[VN1,[],VN2]]],
 generate_p11([I,O],%[],
  PN1,Alg3,Alg4)
 );
 (I=[_,_,_,Data],
 O=[_,_,_,Data],
 B=[[[Dbw_n,=],[VN1,Data]],
 [[Dbw_n,=],[VN1,VN2]]],
 Alg3=[],Alg4=[]
 )),
 L1=[[Dbw_n,PN1],[VN1,VN2],":-",B],
 foldr(append,[Alg1,L1,Alg3,Alg4
 ],Alg2).


 %generate_p11([],Alg,Alg) :- !.
generate_p11([I,O],%Alg1,
 PN1,Alg2,Alg4) :-
 
 (generate_p31(I,O,_VN5s,_IVNs,_Calls1,Calls2,_Alg3,Alg4)->true;
 (%trace,
 
 get_lang_word("n",Dbw_n),
 get_lang_word("equals4",Dbw_equals4),
 get_lang_word("append",Dbw_append),
 v_name1(VN1),
 v_name1(VN2),
 v_name1(VN3),
 v_name1(VN4),
 length(I,IL),
 numbers(IL,1,[],IVNs),
 findall(VN5,(member(_,IVNs),v_name1(VN5)),VN5s),
 v_name1(VN6),
 v_name1(VN61),
 %VN6=[VN8,VN9],
 append(VN5s,["|",VN6],VN7),
%trace,
 generate_p3(I,O,VN5s,IVNs,[],Calls,[],Alg4),
 data_to_alg(I,O,VN5s,VN8),
%findall(*,(member(IVN,IVNs),get_item_n(I,IVN,IN),get_item_n(VN5s,IVN,VN8),
 %(%is_list(IN)->(
 %generate_p2(IN,VN8,Call,A1),*
 Alg2=[[[Dbw_n,PN1],[[],VN1,VN1]],
 [[Dbw_n,PN1],[VN2,VN3,VN4]],":-",
 [[[Dbw_n,Dbw_equals4],VN7],Calls,[[Dbw_n,Dbw_append],[VN3,VN8,VN61]],
 [[Dbw_n,PN1],[VN6,VN61,VN4]]]]
 )).
 



generate_p31(I,O,_VN5s,_IVNs,_Calls1,Calls2,_Alg3,Alg4
) :-
 v_name1(VN1),
 v_name1(VN2),
 I=[_,_,_,Data],
 O=[_,_,_,Data],
 Calls2=[[[Dbw_n,=],[VN1,Data]],
 [[Dbw_n,=],[VN1,VN2]]],
 Alg4=[],!.

generate_p3(_,_,_,[],Calls,Calls,Alg,Alg) :- !.

generate_p3(I0,O0,VN5s,IVNs,Calls1,Call2,Alg3,Alg4) :-
 generate_p31(I0,O0,VN5s,IVNs,Calls1,Call2,Alg3,Alg4),!.
generate_p3(I0,O0,VN5s,IVNs,Calls1,Call2,Alg3,Alg4) :-

 ((I0=[[[T, Dbw_list],I]],
 O0=[[[T, Dbw_list],O]])->true;

 %((I0=[I],
 %O0=[O])->true;
 
 %(
 I0=I,O0=O),%))
 
 IVNs=[IVN|IVNs2],
 get_item_n(I,IVN,IN),get_item_n(VN5s,IVN,VN8),
 get_item_n(O,IVN,ON),
 %is_list(IN)->(
 generate_p11([IN,ON],%[],A0,
  VN8,Call,A1%,Alg31,Alg41
  ),
 generate_p1([IN,ON],%[],A0,
  [],A0%VN8,Call,A1%,Alg31,Alg41
  ),
 append(Calls1,[Call],Calls3),
 foldr(append,[Alg3,[A1],A0%,Alg31,Alg41
 ],Alg5),
 generate_p3(I,O,VN5s,IVNs2,Calls3,Call2,Alg5,Alg4
 ).
*/
% X:
 % this version: don't find associated vars and call with them
 % just assume each level has the same vars
 % x find associated vars
 
 % transformations: append, length, equals4, member (intermediate) - findall - transf's across lists, delete, sort, intersection
 
 % order data by order of transformation x later x
 
 % map vars' paths through the data as a graph x with transformations, later *1 x
 
% instead, add lists to data to alg x state machine with *1
 
 % *([1,[2]],C). (C=[2,1]) x
 % *(B,C,A):-
 % B=[D,E]
 % D=1, *2(F), C=[F,D].
 % *2(F):-F=[2]
 
 % *([1],[1])=*(A,B):-*1(A),*2(B). *1,2([1]). x

 % *([1,2],C)=*(A,C):-*1(A,[],A1),A1=C. where C=[2,1].
 % *1([],A,A). *1(A,B,C):-A=[D1,D2|E],D1=1,D2=2,append(B,[D2,D1],F),*1(E,F,C).

% assumes L in generate_alg is i,o

% later:

% add associations of vars levels away, have both *1(for a list)
% and A=[B,C|_] for getting vals x decompose and build in one pred

% brackets or lists

% what if data is 1,2,3 and 1,2 or 2,3 - different

% what if o->i x
% what if verifying i->i

% if detects rec struct, rec



