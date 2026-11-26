% gen_alg([a,[[b],c]],A).
/* A=
[["p1", ":", a, "p2"], ["p2", ":", "p3", b], ["p3", ":", c]]
*/

:-include('find_lists.pl').

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

gen_alg(L,A2):-
 retractall(p_name(_)),
 assertz(p_name(1)),
 retractall(v_name(_)),
 assertz(v_name(1)),
 p_name1(PN1),
 gen_alg(L,[],A2,[],_B2,true,PN1).

gen_alg([],A1,A2,B,B,_,_) :- append([B],A1,A2),!.
gen_alg(L,A1,A2,B1,B2,Start,PN1):-
 (Start=true->
 (%p_name1(PN1),
 foldr(append,[B1,[PN1],[":"]],B3),
 gen_alg(L,A1,A2,B3,B2,false,_)
 );
 (
 L=[L1|L2],
 (atom(L1)->
 (foldr(append,[B1,[L1]],B3),
 gen_alg(L2,A1,A2,B3,B2,false,_)
 )
 ;
 (is_list(L1),
 p_name1(PN2),
 gen_alg(L1,A1,A3,[],_B3,true,PN2),
 foldr(append,[B1,[PN2]],B4),
 gen_alg(L2,A3,A2,B4,B2,false,_)
 )
 ))).
 
