/*

Subterm with address

sub_term_wa(Subterm, Term, Instances).
Subterm - Subterm to find
Term - Initial list to search
Instances - List of addresses and subterms

Subterm (with address) gives the "address" of a term in a term, such as [[[1], a]] for a in a, [[[1, 2], b]] for b in [a,b], etc, and put subterm with address puts an item into an address.

e.g.s of addresses: [1]=a,[1,1]=a in [a,b], [1,1,1]=a in [[a],[b],[c]]

Please don't give a subterm with address terms with _ to find in; it will return results with the search term for each _.

*/

:-include('../listprologinterpreter/listprolog.pl').

test_stwa :-
 test_sub_term_wa,
 test_get_sub_term_wa,
 test_put_sub_term_wa,
 test_delete_sub_term_wa,
 test_foldr_put_sub_term_wa_ae,
 test_sub_term_types_wa,!.
 
 
test_sub_term_wa :-

findall(_,(member([N,ST,T,In],
[
[1,[a,_],[[a,b],[a,c]],
 [[[1, 1], [a, b]], [[1, 2], [a, c]]]],

[2,[a,_],[[a,b],[[a,c]]],
 [[[1, 1], [a, b]], [[1, 2, 1], [a, c]]]],

[3,[],[[a,b],[a,c]],
 []],

[4,[a,_],[[a,b],[a,[a,e]]],
 [[[1, 1], [a, b]], [[1, 2], [a, [a, e]]]]],

[5,[],[[]],
 [[[1, 1], []]]],

[6,[],[],
 [[[1], []]]],

[7,_,_,
 [[[1], _]]],

[8,[_],[[_],_],
 [[[1, 1], [_]], [[1, 2], [_]]]],

[9,_,[[_],_],
 [[[1], [[_], _]]]],

[10,1,[[1,_],1,_],
 [[[1, 1, 1], 1], [[1, 1, 2], 1], [[1, 2], 1], [[1, 3], 1]]],
 
[11,[_,_],[[_,_]],
 [[[1, 1], [_, _]]]],
 
[12,[_,_],[_,_],
 [[[1], [_, _]]]],
 
[13,[_],[_,_],
 [[[1, 1], [_]], [[1, 2], [_]]]],
 
[14,[_],[_],
 [[[1], [_]]]],
 
[15,[[[_]]],[_,_],
 [[[1, 1], [[[_]]]], [[1, 2], [[[_]]]]]],
 
[16,[1],[[1]],
 [[[1, 1], [1]]]],
 
[17,[_],[[_]],
 [[[1], [[_]]]]],

[18,[_],[[_]],

 [[[1], [[_]]]]],
 
[19,[_],_,
 [[[1], [_]]]]
 
]),
 ((sub_term_wa(ST,T,In1),In1=In)->R=success;R=fail),
 writeln([R,sub_term_wa,test,N])),_),!.


sub_term_wa(Find,A,B) :-
 dynamic(stwa/1),
 retractall(stwa(_)),
 assertz(stwa(%[
 find%,Find]
 )),
 sub_term_wa1([1],_Ns2,0,[A],Find,[],B1,true),
 findall([C3,C2],(member([C1,C2],B1),append([_],C3,C1),not(C3=[])),B),
 %length(Find,L),
 %findall(B1,(member(B1,B),length(B1,L)),B2),
 !.
 
%sub_term_wa2(Ns,Ns,_N,E,_Find,B,B,_) :- !.
% var(E), 
sub_term_wa1(Ns1,Ns2,N,E,Find,B,B1,Flag) :-
 (([E1]=E,var(E1))->B1=[[[_,1],E]];
 sub_term_wa2(Ns1,Ns2,N,E,Find,B,B1,Flag)),!.

%sub_term_wa2(Ns,Ns,_N,[],_Find,B,B,_) :- !.
%sub_term_wa2(Ns,Ns,_N,E,_Find,B,B,_) :-
% not(var(E)),E=[],!.
%sub_term_wa2(Ns,Ns,_N,E,_Find,B,B1,_) :-
% ((not(var(E)),E=[])->(C0=types->fail;B1=B);(fail%,var(E),B=[],B1=_
% )),!.
 % put into stwa with types, merge
sub_term_wa2(Ns1,Ns2,N,A,Find,B,C,First) :-
 stwa(%[
 C0%,Find]
 ),
 (((C0=find,First=true,not(Ns1=[_]))->(A=Find->append(B,[[Ns1,A]],C);fail);
 ((C0=types,First=true%,not(Ns1=[_])
 )->(is_t(Find,A,First,true)->append(B,[[Ns1,A]],C))
 ))->true;
 (not(find_first(is_list(A))),
 sub_term_wa3(Ns1,Ns2,N,A,Find,B,C,First))),!.
sub_term_wa2(Ns,Ns,_N,[],_Find,B,B,_) :- !.
sub_term_wa2(Ns1,Ns2,N,A,Find,B,C,First) :-
 find_first(is_list(A)),
 sub_term_wa4(Ns1,Ns2,N,A,Find,B,C,First).

sub_term_wa3(Ns1,Ns1,_N,A,Find,B,C,true) :-
 stwa(%[
 C0%,Find]
 ),
 (C0=find->A=Find;(C0=types,is_t(Find,A,true,true))),
 not(Ns1=[_]),
 append(B,[[Ns1,A]],C).
sub_term_wa3(Ns,Ns,_N,A,Find,B,B,true) :- 
 stwa(%[
 C0%,Find]
 ),
 (C0=find->not(A=Find);(C0=types,not(is_t(Find,A,true,true)))),!.

sub_term_wa4(Ns1,Ns1,_N,A,Find,B,C,true) :-
 stwa(%[
 C0%,Find]
 ),
 (C0=find->A=Find;(C0=types,is_t(Find,A,true,true))),
 not(Ns1=[_]),
 append(B,[[Ns1,A]],C).
sub_term_wa4(Ns1,Ns2,N,A,Find,B,C,First) :-
 copy_term(Find,Find1), 
 N1 is N+1,
 (First=true->N11=1;N11=N1),
 append(Ns1,[N11],Ns5),
 %trace,
 A=[D|E],sub_term_wa2(Ns5,_Ns3,N11,D,Find1,B,F,true),
 %writeln(N11),
 %writeln(First),trace,
 sub_term_wa2(Ns1,Ns2,N11,E,Find,F,C,false).


test_get_sub_term_wa :-

findall(_,(member([N,T1,Add,It1],
[[1,
[1,2,3],[1,1],
 1],

[2,[1,2,3],[1],
 [1, 2, 3]],

[3,[[1,4],2,3],[1,1,1],
 1],

[4,[[1,4],2,3],[1,1,2],
 4]
]),
 ((get_sub_term_wa(T1,Add,It2),It1=It2)->R=success;R=fail),
 writeln([R,get_sub_term_wa,test,N])),_),!.


get_sub_term_wa(List,[1],List) :- !.
get_sub_term_wa(List,[_|Ns],L1) :-
 get_sub_term_wa1(List,Ns,L1),!.

get_sub_term_wa1(List,Ns,L1) :-
 Ns=[N],
 get_item_n(List,N,L1),!.
get_sub_term_wa1(List,Ns,L1) :-
 Ns=[N|Ns2],
 get_item_n(List,N,L3),
 get_sub_term_wa1(L3,Ns2,L1).


test_put_sub_term_wa :-

findall(_,(member([N,It,Add,T1,T2],
[
[1,9,[1, 2, 1, 1, 2, 3],[[1,2],[[[4,[5,7,8],6]]]],
 [[1, 2], [[[4, [5, 7, 9], 6]]]]],

[2,88,[1,1],[[2,3],4],
 [88, 4]]

]),
 ((put_sub_term_wa(It,Add,T1,T21),T21=T2)->R=success;R=fail),
 writeln([R,put_sub_term_wa,test,N])),_),!.


put_sub_term_wa(List,[1],_L1,List) :- !.
put_sub_term_wa(List,[_|Ns],L1,L2) :-
 put_sub_term_wa1(List,Ns,L1,L2),!.

put_sub_term_wa1(List,Ns,L1,L2) :-
 Ns=[N],
 put_item_n(L1,N,List,L2),!.
put_sub_term_wa1(List,Ns,L1,L2) :-
 Ns=[N|Ns2],
 get_item_n(L1,N,L3),
 put_sub_term_wa1(List,Ns2,L3,L4),
 put_item_n(L1,N,L4,L2).


test_delete_sub_term_wa :-

findall(_,(member([N,In,T,T2],
[
[1,[[1, 1], [1, 2]], [a, b],
 []],

[2,[[1]],1,
 []]
 
]),
 ((delete_sub_term_wa(In,T,T21),T21=T2)->R=success;R=fail),
 writeln([R,delete_sub_term_wa,test,N])),_),!.
 
 
delete_sub_term_wa(NNs,L1,L2) :-
 foldr(put_sub_term_wa("&del"), NNs, L1, L3),
 delete_sub_term_wa2(L3,"&del",[],L2),!.

delete_sub_term_wa2(Find,Find,A,A) :-!.
delete_sub_term_wa2([],_,A,A).
delete_sub_term_wa2([Find|D],Find,B,C):-
 delete_sub_term_wa2(D,Find,B,C),!.
delete_sub_term_wa2([A|D],Find,B,[A1|C]):-
 (is_list(A)->delete_sub_term_wa2(A,Find,[],A1);A=A1),
 delete_sub_term_wa2(D,Find,B,C).


/*

A5=[[v,1],[v,2]],sub_term_wa([v,_],A5,A),findall([Ad,[v,A1]],(member([Ad,[v,A2]],A),A1 is A2+1),A3),foldr(put_sub_term_wa_ae,A3,A5,A4).
A5 = [[v, 1], [v, 2]],
A = [[[1, 1], [v, 1]], [[1, 2], [v, 2]]],
A3 = [[[1, 1], [v, 2]], [[1, 2], [v, 3]]],
A4 = [[v, 2], [v, 3]].

*/

test_foldr_put_sub_term_wa_ae :-

findall(_,(member([N,In,T,T2],
[
[1,[[[1, 1], [v, 2]], [[1, 2], [v, 3]]], [[v, 1], [v, 2]],
 [[v, 2], [v, 3]]]

]),
 ((foldr(put_sub_term_wa_ae,In,T,T21),T21=T2)->R=success;R=fail),
 writeln([R,foldr(put_sub_term_wa_ae),test,N])),_),!.



put_sub_term_wa_ae([E,A],B,C) :-
 put_sub_term_wa(A,E,B,C),!.


test_sub_term_types_wa :-

findall(_,(member([N,H,T,In],
[
[1,[string,atom,[],number,_], ["a",a,[],1,_],
 [[[1, 1], "a"], [[1, 2], a], [[1, 3], []], [[1, 4], 1], [[1, 5], _]]],
 
[2,[[]], [],
 [[[1], []]]],

[3,[[]],[[]],
 [[[1, 1], []]]]

]),
 ((sub_term_types_wa(H,T,In1),In1=In)->R=success;R=fail),
 writeln([R,sub_term_types_wa,test,N])),_),!.


sub_term_types_wa(H,A,B) :-
 dynamic(stwa/1),
 retractall(stwa(_)),
 assertz(stwa(types)),
 sub_term_wa2([1],_Ns2,0,A,H,[],B,true),
 !.

% find terminal lists with particular types
% sub_term_types_wa([all([string])],["a","b",["c","d",["e"]]],In).

% In = [[[1, 3, 3], ["e"]]].

is_t(H,A,First0,First) :-
	((member(string,H),string(A))->true;
	((member(atom,H),atom(A))->true;
	((member([],H),not(var(A)),A=[])->true;
	((member(number,H),number(A)->true;
	((member(Item,H),var(Item),var(A))->true;
	((%trace,
	First0=true,First=true,member(all(K),H),%trace,
	%trace,%forall(%member(J,H),
	%member(K1,K)),
	is_list(A),
	forall(member(A1,A),is_t(K,A1,First0,false)))%->true;
	))))))),!.
	/*
	%((member(	Item,H),var(Item),var(A))->true;
	((%trace,
	First0=true,First=true,member(all_resolution_level(K),H),%trace,
	%trace,%forall(%member(J,H),
	%member(K1,K)),
	is_list(A),
	%writeln1(A),
	%(A=["e", [r, 1, ["a"]]]->trace;true),
	member([r,_N,_A],A),
	sub_term_wa([r,_N,_A],A,Inst2),
	findall([Ad,A3],(member([Ad,_A4],Inst2),A3=0),Inst3),
	foldr(put_sub_term_wa_ae,Inst3,A,A2),
	%trace,
	%A2=A,
	forall(member(A1,A2),is_t([number|K],A1,First0,false))
	
	)))
	)))))),!.
	*/
	
	
	
	%* only test next level