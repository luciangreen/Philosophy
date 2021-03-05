% phil_tree(["hello, how are you","hello there","hello, how is it?"],Tree).

% [[1,"hello",2],[2,"how",9],[2,"there",[-,"hello there"]],[9,"are",[-,"hello, how are you"]],[9,"is",[-,"hello, how is it?"]]]

% Sentences are deliberately truncated for a decision tree.

:-include('../../mindreader/make_mind_reading_tree4 working1.pl').

phil_tree(Strings,Tree) :-
	%SepandPad="&#@~%`$?-+*^,()|.:;=_/[]<>{}\n\r\s\t\\\"!'0123456789",

	sort(Strings,Options1),
	abort_if_empty_string(Options1),
	
	%findall(Options2,(member(Options,Options1),
	%split_string(Options,SepandPad,SepandPad,Options2)),Options2a),
	string_to_list_a1(Options1,1,_,[],Options2),
	maplist(append,[Options2],[Options2a]),
%writeln1(merge_lists1a(Options2,Options2a,Options3a)),
	make_mind_reading_tree4_a(Options2a,Tree).


string_to_list_a1([],N,N,Options,Options) :- !.
string_to_list_a1(Options1,N1,N2,Options2a,Options2b) :-
	Options1=[B|Rest],
	%%findall(C,(member(B,Options1),
		SepandPad="&#@~%`$?-+*^,()|.:;=_/[]<>{}\n\r\s\t\\\"!'0123456789",
		split_string(B,SepandPad,SepandPad,B2),

string_to_list_a2(B2,B,N1,N3,Options2a,Options2c),%%),Options2).
	%%trace,
	[Options2c]=Options2d,
%%trace,

	string_to_list_a1(Rest,N3,N2,[],Options2e),
	%%trace,
	Options2d=[[[_,D1,D2]|D3]],
	Options2f=[[[1,D1,D2]|D3]],
	append(Options2f,Options2e,Options2b).

string_to_list_a2(B,B1,N1,N2,A1,A2) :- 
	%string_concat(D,"",B),
	%string_length(D,1),
	B=[D],
	append(A1,[[N1,D,[-,B1]]],A2),
	N2 is N1 + 1,!.
string_to_list_a2(A,B1,N1,N2,B,C) :-
	%string_concat(D,E,A),
	%string_length(D,1),
	A=[D|E],
	N3 is N1 + 1,
	append(B,[[N1,D,N3]],F),
	%%maplist(append,[[B,D]],[F]),
	string_to_list_a2(E,B1,N3,N2,F,C).
	