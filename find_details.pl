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
% find s1 with dfs, etc until link from a-b
% max sentences=3, retry others from a b c

% last step is too complex - alg xx dfs

% ["     I prepared to enjoy being rewarded for answering the question correctly","  In this way, I prepared to enjoy being rewarded for answering the question correctly by eating the lolly snake","  I did this by eating the lolly snake","  I did this by eating the lolly centipede","  First, I ate the head of the lolly centipede","  First, I ate the head of the lolly snake","  First, I ate the head of the lolly millipede","  I did this by eating the lolly millipede","  I did this by stating that 190 breasonings were written for the musical composition"]

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
	%concat_list(["../Lucian-Academy/",Dept,"/"],Dept1),
	concat_list([Dept,"/"],Dept1),
	directory_files(Dept1,F),
	delete_invisibles_etc(F,G),
 	SepandPad="&#@~%`$?-+*^,()|.:;=_/[]<>{}\n\r\s\t\\\"!0123456789", % doesn't have "'" xx

	findall(Texts3,(member(Filex1,G),
	string_concat(Dept1,Filex1,Filex),
		phrase_from_file_s(string(String00a), Filex),
		string_codes(String02b,String00a),
		
		%downcase_atom(String02b,String00a1),
		String02b=String00a1,
		
	split_string(String00a1, ".\n\r", ".\n\r", String02cb),

	findall([String02cd,H],(member(H,String02cb),
	downcase_atom(H,H1),
	split_string(H1, SepandPad,SepandPad, String02cd)),
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

	findall([A,WC],(member([B,WC],Texts2),subtract(B,Connectives,A)),C),

% a b d->1 2 3->12 s1,13 s1,23 s1 where s1=a b d

% convert to numbers

	retractall(word_nums(_)),
	assertz(word_nums([])),
	
	retractall(word_num(_)),
	assertz(word_num(0)),

	findall([D,E,With_conn],(member([E,With_conn],C),
	findall(N,(member(E1,E),
	word_nums(WN),((member([E1,N],WN)->true;
	(word_num(N1),N is N1+1,
	retractall(word_num(_)),
	assertz(word_num(N)),
	append(WN,[[E1,N]],WN2),
	retractall(word_nums(_)),
	assertz(word_nums(WN2)))))),D)),D1),

% find combination pairs

	findall(D2,(member([D3,E,WC],D1),
	findall([D5,D6,E,WC],(member(D5,D3),
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
	close(Stream1)),

	word_nums(WN1),
	term_to_atom(WN1,D84),
	string_atom(D85,D84),

	(open_s("find_details_wn.txt",write,Stream2),
	write(Stream2,D85),
	close(Stream2)),!.
	
	
process([],D,D) :- !.
process(D1,D2,D3) :-
	D1=[[D4,D5,DD,WC]|D6],%sort(DD1,DD),
	delete(D6,[D5,D4,_,_],D82),
	%delete(D81,[D4,D5,DD],D82),
	append(D82,[[D4,D5,DD,WC]],D83),
	findall([E,WC],(member([D4,D5,E,WC],D83)),E3),
	sort(E3,E2),
	delete(D82,[D4,D5,_,_],D84),
	append(D2,[[D4,D5,E2]],D9),
	process(D84,D9,D3),!.
	
% find synth
	
find_synth :-%(Chain2) :-

% randomly choose a b from a b c

		phrase_from_file_s(string(String00awn), "find_details_wn.txt"),
		string_codes(String02bwn,String00awn),
		atom_to_term(String02bwn,WN,[]),

	retractall(word_nums(_)),
	assertz(word_nums(WN)),

		phrase_from_file_s(string(String00a), "find_details_db.txt"),
		string_codes(String02b,String00a),
		atom_to_term(String02b,DB,[]),

		phrase_from_file_s(string(String00a1), "file_fddb.txt"),
		string_codes(String02b1,String00a1),
		downcase_atom(String02b1,String02b12),
		
 	SepandPad="&#@~%`$?-+*^,()|.:;=_/[]<>{}\n\r\s\t\\\"!0123456789", % doesn't have "'" xx

	split_string(String02b12, ".\n\r", ".\n\r", String02cb),

	findall([String02cd,H],(member(H,String02cb),
		split_string(H, SepandPad,SepandPad, String02cd)),
	Texts3),

% find 1 2 from above

%trace,

%findnsols(1,Chain,%member(A,[1,2,3]),B).

findall([Sent,Chain4],
(member([B,Sent]
,Texts3),

%findnsols(1,Chain2,(%member(A,[1,2,3]),B).
findnsols1(B,WN,Sent,DB,Chain4)),T),
%sort(Chain2,Chain3)
%Chain2=Chain3),F),

%sort(F,F1)
%F=F1
%), 

%member(P,F1)

%trace,
%pp(Chain3,P)
writeln1(T),!%,Chain2)
.

findnsols1(B,WN,Sent,DB,T) :-

%member(A,[1,2,3]),B).

(member(C,B),member(D,B),
not(C=D),

% find s1 with dfs, etc until link from a-b

	word_nums(WN),
	%member(C,D,C51,D51,WN),
	member([C,C51],WN),
	member([D,D51],WN),

%trace,

%findall(Chain3,(
dfs1(C51,D51,Sent,DB,_,0,[],T)),!.
%member1(A,B):-
%	member(A,B),!.
	
/*
member(C,D,C51,D51,WN) :-
	member([C,C51],WN),
	member([D,D51],WN),!.
*/


% max sentences=3, retry others from a b c

dfs1(C51,D51,Sent,DB,_,A,[],Chain2) :-
 dfs(C51,D51,Sent,DB,_,A,[],Chain2),!.


dfs(_,_D,_Sent,_DB,_,1,Chain,Chain) :- fail, !.
dfs(C1,D1,_Sent,DB,DB,_N,Chain1,Chain2) :-
	%word_nums(WN),
	%member([C,C1],WN),	member([D,D1],WN),
	symmetrical_member([C1,D1,E],DB),%not(member(Sent,E)),
	member([_,E1],E),
	not(member(E1,Chain1)),
	append(Chain1,[E1],%[[D,E]],
	Chain2).
dfs(C51,D,Sent,DB,DB3,N,Chain1,Chain2) :-
	%word_nums(WN),
	%member([C,C51],WN),
	findall([C1,E],(symmetrical_member([C51,C1,E],DB)),
	C2),
	delete(DB,[C51,_,_],DB1),
	delete(DB1,[_,C51,_],DB2),
		%->C11=C1;
	%(member([C1,C51,E],DB),C11=C1))),%not(member(Sent,E)),
	(C2=[]->fail;%delete_last(Chain1,Chain2);
	(member([C3,C31],C2),%|C4],
	N1 is N+1,
	member([_,C32],C31),
	not(member(C32,Chain1)),

	%member([C3,C32],WN),
	append(Chain1,[%[C32,
	C32],Chain3),
	dfs(C3,D,Sent,DB2,DB3,N1,Chain3,Chain2))).
	%dfs1(C4,D,Sent,DB4,DB3,N1,Chain4,Chain2))).%,
	%!.
	
	/*
dfs1([],_D,_Sent,DB,DB,_,Chain,Chain) :- !.
dfs1(_,_D,_Sent,_DB,_,6,Chain,Chain) :- fail, !.
dfs1(C2,D,Sent,DB,DB1,N,Chain1,Chain2) :-
	%word_nums(WN),
	%member([C2,C51],WN),
	member([C3,C31],C2),%|C4],
	N1 is N+1,
	member([_,C32],C31),
	append(Chain1,[C32],%,C31]],
	Chain3),
	dfs(C3,D,Sent,DB,DB1,N1,Chain3,Chain2).
	%dfs1(C4,D,Sent,DB2,DB1,N1,Chain4,Chain2).
	%!.
	*/

%delete_last(A,B) :-
%	reverse(A,C),
%	(C=[B|_E]->true;(C=[],B=[])).
	
symmetrical_member([A,B,C],D) :-
	member([A,B,C],D).
symmetrical_member([A,B,C],D) :-
	member([B,A,C],D).

/*
pp(C,N1) :-
	findall(N,(member(B,C),B=[D|E],string_concat(F,H,D),
	string_length(F,1),upcase_atom(F,G),concat_list([G,H," "],J),
	findall([K," "],member(K,E),L),maplist(append,[L],[L1]),concat_list(L1,M),string_concat(M1,M2,M),
	string_length(M2,1),
	concat_list([J,M1,". "],N)),P),
	concat_list(P,N1),!.
*/