% find_algs.pl - finds sequence of n algs with types x also lpiv, (later: lg on gh) through words in descriptions x, replaces words in alg with a word from the description to make them link together
% - from randomly selected algs x later

:-include('../listprologinterpreter/listprolog.pl').

find_algs(T4) :-

		phrase_from_file_s(string(String00a), "file_fa.txt"),
		string_codes(String02b,String00a),

 	SepandPad="&#@~%`$?-+*^,()|.:;=_/[]<>{}\n\r\s\t\\\"!0123456789", % doesn't have "'" xx

	split_string(String02b, ".\n\r", ".\n\r", String02cb),

	findall([String02cd,H],(member(H,String02cb),
		split_string(H, SepandPad,SepandPad, String02cd)),
	Texts3),

	findall([_A,B,C,D],test(A%24
	%26%24
	,B,C,D),E),
	%findall([A,B,C,D],test_types_cases(A,B,_,_,C,D),F),
	F=[],
	append(E,F,G),
%trace,
	findall([T2,QueryB,C3,D3],(member(T3,Texts3),
	find_first_working_alg(T3,G,[T2,QueryB,C3,D3])),
	T4).

find_first_working_alg(T3,G,[T2,QueryB,C3,D3]) :-
	T3=[T1,T2],member(A1,T1),member(A2,T1),
	not(A1=A2),
	
	random_member([_A,B,C,D],G),
	%writeln([a,A]),
	%trace,
	B=[[n,N],Args1],
	
	%trace,
	member_117(B1,Args1),not(B1=[v,_]),
	%string(B1),
	[D1]=D,
	%member([[v, _], B2],D1),%not(B2=[v,_]),
	member_117(B2,D1),%not(B2=[v,_]),
	%string(B2),

	replace_a_word(A1,B1,Args1,[],Args2),
	replace_a_word(A2,B2,Args2,[],Args3),
	
	QueryB=[[n,N],Args3],
	%trace,
	replace_a_word(A1,B1,C,[],C2), % it doesn't replace variable names
	replace_a_word(A2,B2,C2,[],C3),

	replace_a_word(A1,B1,D1,[],D2),
	replace_a_word(A2,B2,D2,[],D4),
	%trace,
	[D4]=D3,
	%trace,
	%writeln1(interpret(off,QueryB,C3,D3)),
	(interpret(off,QueryB,C3,D3)->true;
	find_first_working_alg(T3,G,[T2,QueryB,C3,D3])),!.


	
	%delete(Args10,[v,_],Args1),


replace_a_word(_A1,_B1,[],Args,Args).
replace_a_word(A1,B1,Args1,Args2,Args3) :-
	Args1=[A222|A3],
	((is_list(A222),not(variable_name(A222)))->
	(replace_a_word(A1,B1,A222,[],A21),
	A21=A2);%append(Args2,A21,A2));
	A222=A2),
%writeln1([a2,A2]),
	(((A2=[v,_V]->true;not(A2=B1)))->
	(append(Args2,[A2],Args4),
	replace_a_word(A1,B1,A3,Args4,Args3));
	
	(
	term_to_atom(A2,A21),
	string_codes(A21,Args21),
	string_codes("[]\"'",Codes1),
	split_on_substring117(Args21,Codes1,[],List),

%trace,
	replace_a_word1(A1,List,[],List3),
	%term_to_atom(List21,List22),
	%string_atom(List3,List22),
	%writeln1(List21),
	%trace,
	%maplist(append,[[List21]],[List2]),
	%maplist(append,[List22],[List23]),
	%maplist(append,[List23],[List2]),
	%concat_list(List2,List3),
	%maplist(append,[[Args2,List3,A3]],[Args3]))).
	%trace,
	maplist(append,[[List3]],[List31]),

	%(false%maplist(append,[[Args2,List31]],[[Args52]])
	%->true;
	maplist(append,[[Args2,List31]],[Args52]),%),
	%((trace,
	%is_list(Args52),Args52=[Args53],is_list(Args53))->
	%Args51=Args53;Args51=Args52),
	%concat_list(Args51,Args5),
	%findall(E2,(member(E1,Args52),
	%(is_list(E1)->(concat_list(E1,E3),[E3]=E2);E1=E2)),Args5),
	%term_to_atom(Args52,Args53),
	%string_atom(Args5,Args53),
	replace_a_word(A1,B1,A3,Args52,Args3))).
	
replace_a_word1(_A1,[],List,List).
replace_a_word1(A1,List1,List2,List3) :-
	List1=[L|Ls],
	%trace,
	(((L="["->true;(L="]"->true;(L="\""->true;(L="'"))))->
	((L="\""->L1="";L=L1),append(List2,[L1],List41),
	concat_list(List41,List4),
	replace_a_word1(A1,Ls,[List4],List3)));
	%maplist(append,[[List2,A1,Ls]],[List3])).
	(%trace,
	maplist(append,[[List2,[A1]]],List52),
	maplist(append,[List52],[List51]),
	concat_list(List51,List5),
	replace_a_word1(A1,Ls,[List5],List3))).

member_117(L,List)	 :-
	term_to_atom(List,A21),
	string_codes(A21,Args21),
	string_codes("[]\"',",Codes1),
	split_on_substring117(Args21,Codes1,[],List2),
	member(L,List2),
	string(L),
	not((L="["->true;(L="]"->true;(L="\""->true;(L="'"->true;(L=","->true;L="v")))))).


