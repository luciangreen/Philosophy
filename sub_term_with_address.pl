/*

Subterm with address

sub_term_wa(Subterm, Term, Instances).
Subterm - Subterm to find
Term - Initial list to search
Instances - List of addresses and subterms

e.g.s of addresses: [1]=a,[1,1]=a in [a,b], [1,1,1]=a in [[a],[b],[c]]

sub_term_wa([a,_],[[a,b],[a,c]],A).
A = [[[1, 1], [a, b]], [[1, 2], [a, c]]].

sub_term_wa([a,_],[[a,b],[[a,c]]],A).
A = [[[1, 1], [a, b]], [[1, 2, 1], [a, c]]].

sub_term_wa([],[[a,b],[a,c]],A).
A = [].

sub_term_wa([a,_],[[a,b],[a,[a,e]]],A).
A = [[[1, 1], [a, b]], [[1, 2], [a, [a, e]]]].

*/

sub_term_wa(Find,A,B) :-
 sub_term_wa2([1],_Ns2,0,A,Find,[],B,true),
 !.
 
sub_term_wa2(Ns,Ns,_N,[],_Find,B,B,_) :- !.
sub_term_wa2(Ns1,Ns2,N,A,Find,B,C,First) :-
 not(is_list(A)),
 sub_term_wa3(Ns1,Ns2,N,A,Find,B,C,First).
sub_term_wa2(Ns1,Ns2,N,A,Find,B,C,First) :-
 is_list(A),
 sub_term_wa4(Ns1,Ns2,N,A,Find,B,C,First).

sub_term_wa3(Ns1,Ns1,_N,A,Find,B,C,_) :-
 A=Find,
 append(B,[[Ns1,A]],C).
sub_term_wa3(Ns,Ns,_N,A,Find,B,B,_) :- 
 not(A=Find),!.

sub_term_wa4(Ns1,Ns1,_N,A,Find,B,C,_) :-
 A=Find,
 append(B,[[Ns1,A]],C).
sub_term_wa4(Ns1,Ns2,N,A,Find,B,C,First) :-
 copy_term(Find,Find1), 
 N1 is N+1,
 (First=true->N11=1;N11=N1),
 append(Ns1,[N11],Ns5),
 A=[D|E],sub_term_wa2(Ns5,_Ns3,N11,D,Find1,B,F,true),
 sub_term_wa2(Ns1,Ns2,N11,E,Find,F,C,false).

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

% delete_sub_term_wa([[1, 1], [1, 2]], [a, b], A).
% A = []

delete_sub_term_wa(NNs,L1,L2) :-
 foldr(put_sub_term_wa("&del"), NNs, L1, L3),
 delete_sub_term_wa2(L3,"&del",L2),!.

delete_sub_term_wa2(A,Find,B) :-
 delete_sub_term_wa3(A,Find,[],B),
 !.
 
delete_sub_term_wa3([],_,B,B) :- !.
delete_sub_term_wa3(A,Find,B,C) :-
 not(is_list(A)),
 delete_sub_term_wa4(A,Find,B,C).
delete_sub_term_wa3(A,Find,B,C) :-
 is_list(A),
 delete_sub_term_wa5(A,Find,B,C).

delete_sub_term_wa4(A,Find,B,B) :-
 A=Find,!.
delete_sub_term_wa4(A,Find,B,C) :-
 not(A=Find),append(B,[A],C).
delete_sub_term_wa4(A,Find,B,B) :- 
 not(A=Find),!.

delete_sub_term_wa5(A,_Find,B,C) :-
 A=delete_sub_term_wa2,append(B,[A],C).
delete_sub_term_wa5(A,Find,B,C) :-
 copy_term(Find,Find1), 
 A=[D|E],delete_sub_term_wa3(D,Find1,B,F),
 delete_sub_term_wa3(E,Find,F,C).

%% get_item_n([a,b,c],3,Item).
%% Item = c

get_item_n([],_,[]) :-!.
get_item_n(E,N1,Item) :-
 N2 is N1-1,
 length(List,N2),
 append(List,[Item|_],E),!.

put_item_n(E,N1,Item2,E2) :-
 N2 is N1-1,
 length(List,N2),
 append(List,[_Item1|Rest],E),
 append(List,[Item2|Rest],E2),!.

foldr(Function,A,L,B) :-
 reverse(A,C),
 foldl(Function,C,L,B),!.
