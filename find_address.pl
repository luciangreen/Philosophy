/*

find_address([[a,b],[a,c]],[a,_],A).
A = [[a, b], [a, c]].

find_address([[a,b],[[a,c]]],[a,_],A).
A = [[a, b], [a, c]].

find_address([[a,b],[a,c]],[],A).
A = [].

find_address([[a,b],[a,[a,e]]],[a,_],A).
A = [[a, b], [a, [a, e]]].

Records address of get n items of list

*/
:-include('../listprologinterpreter/listprolog.pl').

find_address(A,Find,B) :-
 find_address2([1],_Ns2,0,A,Find,[],B,true),
 !.
 
find_address2(Ns,Ns,_N,[],_Find,B,B,_) :- !.
find_address2(Ns1,Ns2,N,A,Find,B,C,First) :-
 not(is_list(A)),
 find_address3(Ns1,Ns2,N,A,Find,B,C,First).
find_address2(Ns1,Ns2,N,A,Find,B,C,First) :-
 is_list(A),
 find_address4(Ns1,Ns2,N,A,Find,B,C,First).

find_address3(Ns1,Ns1,_N,A,Find,B,C,_) :-
 A=Find,
 append(B,[[Ns1,A]],C).
find_address3(Ns,Ns,_N,A,Find,B,B,_) :- 
 not(A=Find),!.

find_address4(Ns1,Ns1,_N,A,Find,B,C,_) :-
 A=Find,
 append(B,[[Ns1,A]],C).
find_address4(Ns1,Ns2,N,A,Find,B,C,First) :-
 copy_term(Find,Find1), 
 N1 is N+1,
 (First=true->(append(Ns1,[1],Ns5),N11=1);(append(Ns1,[N1],Ns5),N11=N1)),
 A=[D|E],find_address2(Ns5,_Ns3,N11,D,Find1,B,F,true),
 find_address2(Ns1,Ns2,N11,E,Find,F,C,false).

put_address([1],List,_L1,List) :- !.
put_address([_|Ns],List,L1,L2) :-
 put_address1(Ns,List,L1,L2),!.

put_address1(Ns,List,L1,L2) :-
 Ns=[N],
 put_item_n(L1,N,List,L2),!.
put_address1(Ns,List,L1,L2) :-
 Ns=[N|Ns2],
 get_item_n(L1,N,L3),
 put_address1(Ns2,List,L3,L4),
 put_item_n(L1,N,L4,L2).
