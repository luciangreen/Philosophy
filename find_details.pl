% do this as one of 16 algs

% finds details for philosophy sentences that are chains of A-B, B-C given sentence A-C

% find db
% a to b 
% a b
% a1 b2
% 1 2 s1
% find pairs, delete singles, delete mirrors, merge and keep lists of 1 2 s1,2

% find synth
% randomly choose a b from a b c
% find 1 2 from above
% find s1 with bfs, etc until link from a-b
% max sentences=3, retry others from a b c

% last step is too complex - alg xx bfs

%:-include('../Lucian-Academy/folders.pl').
:-include('folders1.pl').
:-include('../listprologinterpreter/la_files.pl').
:-include('../listprologinterpreter/la_strings.pl').
:-include('../listprologinterpreter/la_strings_string.pl').

:- dynamic word_nums/1.
:- dynamic word_num/1.

% find db

find_db :-

% a to b 

	folders(Folders),
	
	findall(Texts11,(member(Dept,Folders),
	string_concat(Dept,"/",Dept1),
	directory_files(Dept1,F),
	delete_invisibles_etc(F,G),
	findall(Texts3,(member(Filex1,G),
	string_concat(Dept1,Filex1,Filex),
		phrase_from_file_s(string(String00a), Filex),
		string_codes(String02b,String00a),
		
		downcase_atom(String02b,String00a1),
		
	split_string(String00a1, ".\n\r", ".\n\r", String02cb),

	findall(String02cd,(member(H,String02cb),
		split_string(H, " ", " ", String02cd)),
	Texts3)
	%maplist(append,[Texts3],[Texts31])
		
		),Texts1),
			maplist(append,[Texts1],[Texts11])
),
		Texts21),
				maplist(append,[Texts21],[Texts2]),

% a b

 	phrase_from_file_s(string(Codes_cve), "connectives.txt"),
	string_codes(String_cve,Codes_cve),
	atom_to_term(String_cve,Connectives,_),

	findall(A,(member(B,Texts2),subtract(B,Connectives,A)),C),

% a b d->1 2 3->12 s1,13 s1,23 s1 where s1=a b d

% convert to numbers

	retractall(word_nums(_)),
	assertz(word_nums([])),
	
	retractall(word_num(_)),
	assertz(word_num(0)),

	findall([D,E],(member(E,C),
	findall(N,(member(E1,E),
	word_nums(WN),((member([E1,N],WN)->true;
	(word_num(N1),N is N1+1,
	retractall(word_num(_)),
	assertz(word_num(N)),
	append(WN,[[E1,N]],WN2),
	retractall(word_nums(_)),
	assertz(word_nums(WN2)))))),D)),D1),

% find combination pairs

	findall(D2,(member([D3,E],D1),
	findall([D5,D6,E],(member(D5,D3),
	member(D6,D3),not(D5=D6)),D2)),D71),

%trace,
	delete(D71,[],D72),
	maplist(append,[D72],[D7]),

% delete singles x are none, delete mirrors, merge and keep lists of 1 2 s1,2

%trace,

	process(D7,[],D8),
	
	term_to_atom(D8,D82),
	string_atom(D83,D82),

	(open_s("find_details_db.txt",write,Stream1),
	write(Stream1,D83),
	close(Stream1)),!.
	
	
process([],D,D) :- !.
process(D1,D2,D3) :-
	D1=[[D4,D5,DD]|D6],%sort(DD1,DD),
	delete(D6,[D5,D4,_],D82),
	%delete(D81,[D4,D5,DD],D82),
	append(D82,[[D4,D5,DD]],D83),
	findall(E,(member([D4,D5,E],D83)),E3),
	sort(E3,E2),
	delete(D82,[D4,D5,_],D84),
	append(D2,[[D4,D5,E2]],D9),
	process(D84,D9,D3),!.
	
% find synth
	
find_synth :-%(Chain2) :-

% randomly choose a b from a b c

		phrase_from_file_s(string(String00a), "find_details_db.txt"),
		string_codes(String02b,String00a),
		atom_to_term(String02b,DB,[]),

		phrase_from_file_s(string(String00a1), "file_fddb.txt"),
		string_codes(String02b1,String00a1),
		downcase_atom(String02b1,String02b12),
		
	split_string(String02b12, ".\n\r", ".\n\r", String02cb),

	findall([String02cd,H],(member(H,String02cb),
		split_string(H, " ", " ", String02cd)),
	Texts3),

% find 1 2 from above

%trace,

%findnsols(1,Chain,%member(A,[1,2,3]),B).

%findall(*,
(member([B,Sent]
,Texts3),
member(C,B),member(D,B),
not(C=D),

% find s1 with bfs, etc until link from a-b

	word_nums(WN),
	member([C,C51],WN),
	member([D,D51],WN),

bfs(C51,D51,Sent,DB,0,[],Chain2)

), 
trace,
pp(Chain2,P),writeln1(P)%,Chain2)
,!.

% max sentences=3, retry others from a b c


bfs(_,_D,_Sent,_DB,6,Chain,Chain) :- fail, !.
bfs(C1,D1,_Sent,DB,_N,Chain1,Chain2) :-
	%word_nums(WN),
	%member([C,C1],WN),	member([D,D1],WN),
	symmetrical_member([C1,D1,E],DB),%not(member(Sent,E)),
	member(E1,E),
	append(Chain1,[E1],%[[D,E]],
	Chain2),!.
bfs(C51,D,Sent,DB,N,Chain1,Chain2) :-
	%word_nums(WN),
	%member([C,C51],WN),
	findall([C1,E],(member([C51,C1,E],DB)),%not(member(Sent,E)),
	C2),
	C2=[[C3,C31]|C4],
	N1 is N+1,
	member(C32,C31),
	%member([C3,C32],WN),
	append(Chain1,[%[C32,
	C32],Chain3),
	bfs(C3,D,Sent,DB,N1,Chain3,Chain4),
	bfs1(C4,D,Sent,DB,N1,Chain4,Chain2),
	!.
	
bfs1([],_D,_Sent,_DB,_,Chain,Chain) :- !.
bfs1(_,_D,_Sent,_DB,6,Chain,Chain) :- fail, !.
bfs1(C2,D,Sent,DB,N,Chain1,Chain2) :-
	%word_nums(WN),
	%member([C2,C51],WN),
	C2=[[C3,C31]|C4],
	N1 is N+1,
	member(C32,C31),
	append(Chain1,[C32],%,C31]],
	Chain3),
	bfs(C3,D,Sent,DB,N1,Chain3,Chain4),
	bfs1(C4,D,Sent,DB,N1,Chain4,Chain2),
	!.

symmetrical_member([A,B,C],D) :-
	member([A,B,C],D),!.
symmetrical_member([A,B,C],D) :-
	member([B,A,C],D),!.

pp(C,N1) :-
	findall(N,(member(B,C),B=[D|E],string_concat(F,H,D),
	string_length(F,1),upcase_atom(F,G),concat_list([G,H," "],J),
	findall([K," "],member(K,E),L),maplist(append,[L],[L1]),concat_list(L1,M),string_concat(M1,M2,M),
	string_length(M2,1),
	concat_list([J,M1,". "],N)),P),
	concat_list(P,N1),!.