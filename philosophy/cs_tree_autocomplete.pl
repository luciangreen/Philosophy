% cs_tree(Tree),writeln1(Tree).

% [[1,",",115],[115,"append1",[-,["[","[","[","n",",","append1","]",",","[","[","v",",","a","]","]",",",""":-""",",","[","[","[","n",",","b","]",",","[","[","v",",","b","]","]","]",",","[","[","n",",","c","]",",","[","[","v",",","c","]","]","]",",","[","[","n",",","append","]",",","[","[","v",",","b","]",",","[","v",",","c","]",",","[","v",",","a","]","]","]","]","]",",","[","[","n",",","b","]",",","[","[","""b""","]","]","]",",","[","[","n",",","c","]",",","[","[","""c""","]","]","]","]"]]],[115,"function",206],[164,"c",[-,["[","[","[","n",",","function","]",",","[","[","v",",","a","]",",","[","v",",","b","]",",","[","v",",","c","]","]",",",""":-""",",","[","[","[","n",",","+","]",",","[","[","v",",","a","]",",","[","v",",","b","]",",","[","v",",","c","]","]","]","]","]","]"]]],[164,"d",[-,["[","[","[","n",",","function","]",",","[","[","v",",","a","]",",","[","v",",","b","]",",","[","v",",","c","]","]",",",""":-""",",","[","[","[","n",",","+","]",",","[","[","v",",","a","]",",","[","v",",","b","]",",","[","v",",","d","]","]","]",",","[","[","n",",","+","]",",","[","[","v",",","d","]",",","1",",","[","v",",","c","]","]","]","]","]","]"]]],[206,"+",164],[206,"function2",[-,["[","[","[","n",",","function","]",",","[","[","v",",","a","]",",","[","v",",","b","]",",","[","v",",","c","]","]",",",""":-""",",","[","[","[","n",",","function2","]",",","[","[","v",",","d","]",",","[","v",",","f","]","]","]",",","[","[","n",",","+","]",",","[","[","v",",","a","]",",","[","v",",","b","]",",","[","v",",","e","]","]","]",",","[","[","n",",","+","]",",","[","[","v",",","e","]",",","[","v",",","f","]",",","[","v",",","g","]","]","]",",","[","[","n",",","+","]",",","[","[","v",",","g","]",",","[","v",",","d","]",",","[","v",",","c","]","]","]","]","]",",","[","[","n",",","function2","]",",","[","[","v",",","a","]",",","[","v",",","f","]","]",",",""":-""",",","[","[","[","n",",","is","]",",","[","[","v",",","a","]",",","2","]","]",",","[","[","n",",","is","]",",","[","[","v",",","f","]",",","1","]","]","]","]","]"]]]]

:-include('../../listprologinterpreter/listprolog.pl').
:-include('../../mindreader/make_mind_reading_tree4 working1.pl').
:-include('phil_tree.pl').
:-include('autocomplete.pl').


cs_tree(Tree) :-
	SepandPad_code=" &#@~%`$?;{}\n\r\s\t",

	test(1,_,Code1,_),
	test(2,_,Code2,_),
	%test(3,_,Code3,_),
	%test(4,_,Code4,_),
	maplist(append,[[Code1],[Code2]%,[Code3],[Code4]
	],Codes),
	findall(String5,(member(Code,Codes),
	term_to_atom(Code,Atom),
	string_atom(String1,Atom),
	split_string_onnonletter_by_itself(String1,"[],()|",String2),
	findall(String4,(member(String3,String2),
	split_string(String3,SepandPad_code,SepandPad_code,String4)),String4a),
	maplist(append,[String4a],[String5])),String6),

	sort(String6,Options1),
	abort_if_empty_string(Options1),
	string_to_list_b1(Options1,1,_,[],Options2),
	maplist(append,[Options2],[Options2a]),
	%writeln1([options2a,Options2a]),
	merge_lists_a([1],Options2a,[],%%Options2a,
	Options3a),
%writeln1(merge_lists_a([1],Options2a,[],%%Options2a,
%	Options3a)),
	sort(Options3a,Tree),
	traverse_tree(1,Tree).

split_string_onnonletter_by_itself(String00,Chars,List1) :-
	string_codes(String00,String1),
	split_string_onnonletter_by_itself(String1,[],Chars,List0),
	string_codes(List0,List2),
	split_string(List2,"@","@",List1),!.
split_string_onnonletter_by_itself([],Input,_Chars,Input) :- !.
split_string_onnonletter_by_itself(Input1,Input2,Chars,Input3) :-
	Input1=[Input4|Input5],
	%not(char_type(Input4,alpha)),
	string_codes(Chars,Codes),
	member(Code,Codes),
	Input4=Code,
	append(Input2,`@`,Input8),
	append(Input8,[Code],Input7),
	append(Input7,`@`,Input6),
	split_string_onnonletter_by_itself(Input5,Input6,Chars,Input3), !.
split_string_onnonletter_by_itself(Input1,Input2,Chars,Input3) :-
	Input1=[Input4|Input5],
	append(Input2,[Input4],Input6),
	split_string_onnonletter_by_itself(Input5,Input6,Chars,Input3), !.




string_to_list_b1([],N,N,Options,Options) :- !.
string_to_list_b1(Options1,N1,N2,Options2a,Options2b) :-
	Options1=[B2|Rest],
	%%findall(C,(member(B,Options1),
		%SepandPad="&#@~%`$?-+*^,()|.:;=_/[]<>{}\n\r\s\t\\\"!'0123456789",
		%split_string(B,SepandPad,SepandPad,B2),

string_to_list_b2(B2,B2,N1,N3,Options2a,Options2c),%%),Options2).
	%%trace,
	[Options2c]=Options2d,
%%trace,

	string_to_list_b1(Rest,N3,N2,[],Options2e),
	%%trace,
	Options2d=[[[_,D1,D2]|D3]],
	Options2f=[[[1,D1,D2]|D3]],
	append(Options2f,Options2e,Options2b).

string_to_list_b2(B,B1,N1,N2,A1,A2) :- 
	%string_concat(D,"",B),
	%string_length(D,1),
	B=[D],
	append(A1,[[N1,D,[-,B1]]],A2),
	N2 is N1 + 1,!.
string_to_list_b2(A,B1,N1,N2,B,C) :-
	%string_concat(D,E,A),
	%string_length(D,1),
	A=[D|E],
	N3 is N1 + 1,
	append(B,[[N1,D,N3]],F),
	%%maplist(append,[[B,D]],[F]),
	string_to_list_b2(E,B1,N3,N2,F,C).
	