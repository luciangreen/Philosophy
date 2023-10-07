% 7 10 23

% 35-3=33 algs

% ["Computational English","COMPUTATIONAL ENGLISH by Lucian Green Philosophical Computational English 2 of 4.txt",0,algorithms,"14.   I prepared to verify that the algorithms had the same qualities.  I did this by stating that the self should find similarities of ontologies in the other's five algorithms.  First, I observed that the ontologies of the five algorithms had the same branching point.  Second, I observed that the ontologies of the five algorithms had the same length.  Third, I observed that the ontologies of the five algorithms had the same number of items in total.  In this way, I prepared to verify that the algorithms had the same qualities by stating that the self should find similarities of ontologies in the other's five algorithms."]

% I prepared to verify that the algorithms had the same qualities.

% ?- professor_algorithm("In this way, I prepared to verify that the algorithms had the same qualities by stating that the self should find similarities of ontologies in the other's five algorithms.",A).
% A = "A=[verify1, verify2, verify3],maplist(to,A).\nto(A):-write(A).".

/*

?- professor_algorithm("In this way, I prepared to verify that the algorithms had the same qualities by stating that the self should find similarities of ontologies in the other's five algorithms.",A).
A = "A=[verify1, verify2, verify3],maplist(to,A).\nto(A):-write(A).".

?- professor_algorithm("go hill",A).
A = "A=[hill1, hill2, hill3],maplist(go,A).\ngo(A):-write(A).".

?- professor_algorithm("walk to paper.",A).
A = "A=[paper1, paper2, paper3],maplist(to,A).\nto(A):-write(A).".

professor_algorithm("Plus item.", A).
A = "A=[item1, item2, item3],foldr(plus,A,\"\",B).\nplus(A,B,C):-string_concat(A,B,C).".

*/

:-include('../Text-to-Breasonings/text_to_breasonings.pl').

professor_algorithm(String, Algorithm) :-
	phrase_from_file_s(string(BrDict0), "../Text-to-Breasonings/brdict1.txt"),
	splitfurther(BrDict0,BrDict01),
	sort(BrDict01,BrDict012),
	
 SepandPad="#@~%`$?-+*^,()|.:;=_/[]<>{}\n\r\s\t\\!'\"0123456789",
 split_string(String,SepandPad,SepandPad,String1),
	findall([A,POS],(member(A,String1),downcase_atom(A,A11),atom_string(A11,A12),find_pos(A12,POS,BrDict012)),B),
	((%get_next(B,n,_N1,D),
	B=D,
	get_next(D,v,V,E),
	get_next(E,n,N2,_))->
	
	(numbers(3,1,[],Ns),
	findall([N2,N,", "],member(N,Ns),A1),
	flatten(A1,A3),
	append(A2,[_],A3),
	foldr(string_concat,A2,A4),
	
	foldr(string_concat,["A=[",A4,"],maplist(",V,",A).\n",V,"(A):-write(A)."],Algorithm
	));
	(
	(%trace,%get_next(B,n,_N1,D),
	B=D,
	get_next(D,a,V,E),
	get_next(E,n,N2,_))->
	
	(numbers(3,1,[],Ns),
	findall([N2,N,", "],member(N,Ns),A1),
	flatten(A1,A3),
	append(A2,[_],A3),
	foldr(string_concat,A2,A4),
	
	foldr(string_concat,["A=[",A4,"],foldr(",V,",A,\"\",B).\n",V,"(A,B,C):-string_concat(A,B,C)."],Algorithm));
	writeln(["Error, no VN or AN parts of speech in",String]),abort)),!.
	
find_pos("right",v,_) :- !.
find_pos("plus",a,_) :- !.
find_pos(Item,POS2,BrDict012) :-
	member([Item,POS1],BrDict012),
	POS1="right",
	POS2=v,!.
find_pos(Item,POS2,BrDict012) :-
	member([Item,POS1],BrDict012),
	POS1="plus",
	POS2=a,!.
find_pos(_Item,POS2,_BrDict012) :-
	POS2=n.

get_next(B,POS,N1,D) :-
	append(_,A,B),
	append([[C,POS]],D,A),
	downcase_atom(C,N1),!.
	
	/*
	a:-
	A=[item1, item2, item3],foldr(plus1,A,"",B).
	plus1(A,B,C):-string_concat(A,B,C).
	*/
	
% 33-14=19 left

% I did this by stating that the self should find similarities of ontologies in the other's five algorithms.

% The algorithm is useful for writing arguments and algorithms.

% ontology_connection(a,b,all,[[all,[e,f]],[f,[a]],[e,[]],[all,[b]]],C).
% C = [all, [f, a], [b]]

% ontology_connection(a,j,all,[[all,[e,f]],[f,[a,c,g]],[c,[]],[g,[]],[e,[]],[all,[k]],[k,[j]]],C).
% C = [all, [f, a], [k, j]]

ontology_connection(A,B,First,Tree,C2) :-
 path(First,A,Tree,[],A1),
 path(First,B,Tree,[],B1),
 reverse(A1,A2),
 reverse(B1,B2),
 append(A3,C,A2),
 not(C=[]),
 append(B3,C,B2),
 reverse(A3,A4),
 reverse(B3,B4),
 append(_,[C1],C),
 C2=[C1,A4,B4].
path(A,A,_Tree,A0,A1) :-
 append(A0,[A],A1),!.
path(First,A,Tree,A0,A1) :-
 member([First,Second],Tree),
 member(Second1,Second),
 append(A0,[First],A2),
 path(Second1,A,Tree,A2,A1).

% 19-5=14-2 (grammar_logic_to_alg.pl)=12

% arg_conn(a,j,[[all,[e,f]],[f,[a,c,g]],[c,[]],[g,[]],[e,[]],[all,[k]],[k,[j]]],all,C).
% C = "a, f, all, k and j.".

% arg_conn(a,b,[[all,[e,f]],[f,[a]],[e,[]],[all,[b]]],all,C).
% C = "a, f, all and b.".

% arg_conn(paper,pen,[[idea,[paper]],[idea,[pen]]],idea,C).
% C = "paper, idea and pen.".

% arg_conn(wind,sun,[[change,[wind]],[change,[sun]]],change,C).
% C = "wind, change and sun.".

% arg_conn(two_lists,one_list,[[append,[two_lists]],[append,[one_list]]],append,C).
% C = "two_lists, append and one_list.".

arg_conn(A,B,Tree,First,C) :-
 ontology_connection(A,B,First,Tree,[C2,C1,C3]),
 reverse(C1,C11),
 foldr(append,[C11,[C2],C3],C41),
 findall([C5,", "],member(C5,C41),C51),
 flatten(C51,C52),
 append(C53,[", ",C54,", "],C52),
 foldr(append,[C53,[" and "],[C54],["."]],C531),
 foldr(string_concat,C531,C),!.
 
/*
alg_conn("c:-d","b:-f",[["a:-b",["b:-c"]],["b:-c",["c:-d"]],["a:-b",["b:-f"]]],"a:-b",C).
C = "a:-b\nb:-c\nc:-d\nb:-f\n".


% 
alg_conn("a(A,B):-foldr(append,A,B).","b(A,B):-flatten(A,C),foldr(string_concat,C,B).",[["c(A,B):-a(A,C),b(C,B).",["a(A,B):-foldr(append,A,B)."]],["c(A,B):-a(A,C),b(C,B).",["b(A,B):-flatten(A,C),foldr(string_concat,C,B)."]]],"c(A,B):-a(A,C),b(C,B).",C).
C = "c(A,B):-a(A,C),b(C,B).\na(A,B):-foldr(append,A,B).\nb(A,B):-flatten(A,C),foldr(string_concat,C,B).\n".

*/

alg_conn(A,B,Tree,First,C) :-
 ontology_connection(A,B,First,Tree,[C2,C1,C3]),
 foldr(append,[[C2],C1,C3],C4),
 findall([D,"\n"],member(D,C4),E),
 flatten(E,F),
 foldr(string_concat,F,C),!.

% a([[a],[b]],B).
% B = [a, b].

c(A,B):-a(A,C),b(C,B).
a(A,B):-foldr(append,A,B).
b(A,B):-flatten(A,C),foldr(string_concat,C,B).
