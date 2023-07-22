% garbage collect reused values
% - compress_vars - replaces same lists with references to globals
% - uncompress_vars - replaces vars with expanded values

% 

compress_vars0(V1,V2,V4) :-
 foldr(append,V1,V3),
 compress_vars(V3,V4,VG),
 findall(V8,(member(V6,V1),
 findall(V7,(member([V61,_Val],V6),member([V61,Val2],VG),V7=[V61,Val2]),V8)),V2),!.

compress_vars(V1,V2,VG3) :-

 retractall(garbage_token_number(_)),
 assertz(garbage_token_number(1)),

 get_lang_word("v",Dbw_v1),Dbw_v1=Dbw_v,
 findall([Size,V4],(member(V4,V1),V4=[[Dbw_v,_Name],Value],
 size_of_value(Value,Size)
 %(Size>=10 ->
 %();V3=[V4,[]])
 ),V5),
 sort(V5,V11),reverse(V11,V12),
 
 findall(V122,member([_,V122],V12),V123),

findall([G,V13],(member([V14,Val],V123),compress_vars1(V14,Val,[],V13,[],G)),VG1),

 findall(V124,member([V124,_],VG1),VG),
 findall(V125,member([_,V125],VG1),VG2),

 findall([Size,G],(member(G,VG),%V4=[[Dbw_v,Name],Value],
 size_of_value(G,Size)
 %(Size>=10 ->
 %();V3=[V4,[]])
 ),V51),
 sort(V51,V121),%reverse(V111,V121),
 findall(V21,member([_,V21],V121),V22),
 
 foldr(append,V22,V23),
 %trace,
 simplify_by_replacing(V23,VG2,[],V24,%[],
 VG3),
 
 find_tails(V24,[],V2),

 !.
 
size_of_value(Value,Size) :-
 flatten(Value,List),length(List,Size),!.
 
/*
flatten1(A,B) :-
 flatten2(A,[],B),!.
 
flatten2([],B,B,C,C) :- !.
flatten2(A,B,C,G,H) :-
 (not(is_list(A))->(append(B,[A],C),;
 (A=[D|E],flatten(D,D1),(D=D1->append(G,[D)
 flatten2(D,B,F),
 flatten2(E,F,C))),!.
*/

:-dynamic garbage_token_number/1.

% put in ssi at start

%/*
get_garbage_token(G) :-
 garbage_token_number(G),
 retractall(garbage_token_number(_)),
 G1 is G+1,
 assertz(garbage_token_number(G1)),!.
%*/
	
compress_vars1(G41,Statement,S1,[G41,S2],G1,G2) :-
	compress_vars10(G41,Statement,S1,S2,G1,G2),!.
compress_vars10(_,[],S1,S1,G,G) :- !.
compress_vars10(G41,Statement,S1,S2,G1,G2) :-
	get_garbage_token(G4),
	flatten(Statement,Statement_f),
	(Statement=Statement_f->
	(append(G1,[[Statement,['&',G4]]],G2),
	append(S1,%[%[
	%G41,
	['&',G4]%]%]
	,S2));
	%(%G1=G2,
%variable_name(Statement)->
%match_get_val(Statement,Value,Vars),
%append(S1,[Value],S2));
	(Statement=[Statement1|Statement2],
	(variable_name(Statement1)->
%
(%match_get_val(Statement1,Value1,Vars),
append(S1,[Statement1],S3));
 (single_item_or_var(Statement1)->
 (%Value1=Statement1,
append(S1,[Statement1],S3));
	(compress_vars10(G41,Statement1,[],S31,G1,G3),
	S3=[S31]))),
	compress_vars10(G41,Statement2,[],S4,G3,G2),
	foldr(append,[S3,S4],S5),
	%trace,
	%S6=[S5],
	%(S1=[]->S2=S5;
	foldr(append,[S1,S5],S2))),!.
	
%match_get_val(Variable,Value,Vars)	 :-
% (member([Variable,Value],Vars)->true;
% Variable=Value),!.

find_tails([],V,V) :- !.
find_tails(V1,V2,V3) :-
 V1=[[G,Val1]|V4],
 find_tails1([G,Val1],V4,V2,V3),!.
 
find_tails1([G,Val1],[],V1,V2) :-
 append(V1,[[G,Val1]],V2),!.

find_tails1([G,Val1],V4,V2,V3) :-
 V4=[[G2,[Val2|Val1]]|V6],
 append(V2,[[G,[['&',tail],G2]]],V5),
 find_tails1([G2,[Val2|Val1]],V6,V5,V3),!.

/*
find_tails1([G,Val1],V4,V2,V3) :-
 V4=[[G2,[Val2|Val1]]],
 trace,
 append(V2,[[G2,[tail,G]]],V5),
 append(V5,[[G2,[Val2|Val1]]],V3),!.
 %find_tails1([G2,[Val2|Val1]],V6,V5,V3),!.
*/

find_tails1([G,Val1],V4,V2,V3) :-
 V4=[[G2,Val2]|V6],
 append(V2,[[G2,Val2]],V5),
 find_tails1([G,Val1],V6,V5,V3),!.

/*
simplify_by_replacing([],V,V) :- !.
simplify_by_replacing(V1,V2,V3) :-
	V1=[[V4,Val]|V5],
	delete(V5,[_,Val],V6),
	append(V2,[[V4,Val]],V7),
	simplify_by_replacing(V6,V7,V3).
*/
simplify_by_replacing([],VG,V,V,%VG,
VG) :- !.
simplify_by_replacing(V1,VG1,V2,V3,%VG2,
VG3) :-
	V1=[[V4,Val]|V5],
	delete(V5,[_,Val],V6),
	findall(V61,member([V61,Val],V5),V62),
	replace_in_term2_gc(VG1,V62,V4,VG4),
	%delete(VG1,[_,Val],VG6),
	append(V2,[[V4,Val]],V7),
	%append(VG2,[[V4,Val]],V7),
	simplify_by_replacing(V6,VG4,V7,V3,VG3).

replace_in_term2_gc(C,[],_,C) :- !.
replace_in_term2_gc(A,B,C,D) :-
	B=[E|F],
	replace_in_term(A,E,C,D1),
	replace_in_term2_gc(D1,F,C,D).


/*

	simplify_by_replacing1([V4,Val],V5,[],V6),

simplify_by_replacing1([V1,Val],[],V,V) :- !.
simplify_by_replacing1([V1,Val],V2,V3,V4) :-
	V2=[V5|V6],
	(V5=[V7,Val]->append(V4,[[]])
	*/
/*
 Val1=[_|Val2],
 %findall([[G1,Va12],[G1,[tail,G]]],member([G1,Val2],V4),New_GV),
 
 findall(A,member([A,_],New_GV),B),
 subtract(V4,B,C),
 findall(A,member([_,A],New_GV),B1),
 append(C,B1,D),
 find_tails(V1,V2,V3) :-

*/

% uncompress_vars([[3, [tail, 2]], [2, [tail, 1]], [1, [1, 2, 3]]],V2).
% V2 = [[[v,a],[2,3]],[[v,b],[3]],[[v,c],[1,2,3]]]

%uncompress_vars(V1,V2) :-

% make &1 into [v,a] x

% still record var vals elsewhere

% do multiple var lists v
% - check for dups
% - test vars, two in one vars

% gather same lists together for find tails
% gather non-related lists to process later

% symbol for global, only gc cps
% need appended lists (:) x "|" x

/*
compress_vars([[[v,a],[[1],[2,3]]],[[v,b],[[1],[3]]]],V,V1),writeln1(V1).

V = [[[[&, 2], [1]], [[&, 4], [2, 3]]], [[[&, 6], [1]], [[&, 8], [3]]]],
V1 = [[[v, a], [[&, 2], [&, 4]]], [[v, b], [[&, 6], [&, 8]]]].

                                                             compress_vars0([[[[v,a],[[1],[2,3]]],[[v,b],[[1],[3]]]],[[[v,c],[1]]]],V2,VG).
V2 = [[[[v, a], [[&, 2], [&, 4]]], [[v, b], [[&, 6], [&, 8]]]], [[[v, c], [&, 9]]]],
VG = [[[1], [&, 6]], [[3], [&, 8]], [[1], [&, 2]], [[2, 3], [&, 4]], [[1], [&, 9]]].
                                                             compress_vars([[[v,a],[2,3]],[[v,b],[3]]],V,V1).
V = [[[&, 2], [[&, tail], [&, 1]]], [[&, 1], [2, 3]]],
V1 = [[[v, a], [&, 1]], [[v, b], [&, 2]]].

uncompress_vars0([[[[&, 2], [[&, tail], [&, 1]]], [[&, 1], [2, 3]]]],[[[v, a], [&, 1]], [[v, b], [&, 2]]],V).
V = [[[[v, b], [3]], [[v, a], [2, 3]]]].

uncompress_vars0([[[[v, a], [[&, 2], [&, 4]]], [[v, b], [[&, 6], [&, 8]]]], [[[v, c], [&, 9]]]],[[[1], [&, 6]], [[3], [&, 8]], [[1], [&, 2]], [[2, 3], [&, 4]], [[1], [&, 9]]],V).
V = [[[[v, a], [[1], [2, 3]]], [[v, b], [[1], [3]]]], [[[v, c], [1]]]].

*/

uncompress_vars0(V1,VG,V3) :-
	findall(V31,(member(V2,V1),
	uncompress_vars(V2,VG,V31)),V3),!.

uncompress_vars(V1,VG,V3) :-
	uncompress_vars1(V1,VG,V2),
	uncompress_vars2(V2,V2,[],V3),!.

uncompress_vars1(V,[],V%,V2
) :- !.
/*
uncompress_vars1(V1,VG,V32) :-
	V1=[[V3,[[&, tail],Val]]|V4],
	append(V2,[[V3,[[&, tail],Val]]],V31),
	uncompress_vars1(V4,VG,V32),!.
*/
uncompress_vars1(V1,VG,V2) :-
	VG=[[V3,Val]|V4],
	replace_in_term(V1,Val,V3,V5),
	uncompress_vars1(V5,V4,V2),!.

uncompress_vars2(_,[],V,V%,V2
) :- !.
uncompress_vars2(V1,V11,V2,V32) :-
	V11=[[V3,[[&, tail],Val]]|V4],
	member([Val,[_|Val2]],V1),
	append(V2,[[V3,Val2]],V31),
	uncompress_vars2(V1,V4,V31,V32),!.
uncompress_vars2(V1,V11,V2,V32) :-
	V11=[[V3,Val]|V4],
	append(V2,[[V3,Val]],V31),
	uncompress_vars2(V1,V4,V31,V32),!.
	
% get and put var

% - uncompress, get or (put, compress)

% it can process varlists, cps
