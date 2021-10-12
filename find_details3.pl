% find_details3.pl

% find_db - converts texts into lowercase, splits, removes non trivial words (keeps original sentences as well)

% find_details3 - finds conns through sentences, ()removes duplicates without sorting
% - from randomly selected texts x later

%:-include('../Lucian-Academy/folders.pl').
:-include('folders1.pl').
:-include('../listprologinterpreter/la_files.pl').
:-include('../listprologinterpreter/la_strings.pl').
:-include('../listprologinterpreter/la_strings_string.pl').

find_db :-

	folders(Folders),
	
	findall(Texts11,(member(Dept,Folders), % Dept2->Dept
	%concat_list(["../Lucian-Academy/",Dept2,"/"],Dept),
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
	
	term_to_atom(C,D82),
	string_atom(D83,D82),

	(open_s("find_details3_db.txt",write,Stream1),
	write(Stream1,D83),
	close(Stream1)),!.


find_details3 :-

		phrase_from_file_s(string(String00a), "find_details3_db.txt"),
		string_codes(String02b,String00a),
		atom_to_term(String02b,DB,[]),

		phrase_from_file_s(string(String00a1), "file_fd3.txt"),
		string_codes(String02b1,String00a1),
		downcase_atom(String02b1,String02b12),
		
 	phrase_from_file_s(string(Codes_cve), "connectives.txt"),
	string_codes(String_cve,Codes_cve),
	atom_to_term(String_cve,Connectives,_),

	 	SepandPad="&#@~%`$?-+*^,()|.:;=_/[]<>{}\n\r\s\t\\\"!0123456789", % doesn't have "'" xx

	split_string(String02b12, ".\n\r", ".\n\r", String02cb),
%	findall([A,WC],(member([B,WC],Texts2),),C),

	findall([String02cd,H],(member(H,String02cb),
		split_string(H, SepandPad,SepandPad, String02cda),
		subtract(String02cda,Connectives,String02cd)),
	Texts3),

%findall([Sent,Chain4],
trace,
member([B,Sent]
,Texts3),

member(C,B),%member(D,B),
%not(C=D),
%trace,
dfs(C,_D,Sent,DB,_,1,[],T),%Chain4))),T1),

%T1=[T|_],

writeln1([Sent,T]),!.


max_depth(1).


dfs(C1,_D1,Sent,DB,DB2,N,Chain1,Chain2) :-
	max_depth(N0),
	N=<N0,
	((N is N0,member([E3,E],DB),
	member(C1,E3),	%member(_D1,E3),
	not(member(E,Chain1)),
	append(Chain1,[E],
	Chain2),
	DB=DB2)->true;
	(member([E3,E],DB),
	member(C1,E3),
	member(C22,E3),
	not(C1=C22),
	/* 
	findall([C22,E],(
	member(C1,E3),
	member(C22,E3),not(C1=C22)),C2),
	delete(DB,[E3,E],DB3), % unlike find db 1, doesn't find details from same sentence again
	(C2=[]->fail;
	(member([C3,C32],C2),%|C4],
	*/
	delete(DB,[E3,E],DB3),
	N1 is N+1,
	not(member(C22,Chain1)),

	append(Chain1,[
	C22],Chain3),
	dfs(C22,_D12,Sent,DB3,DB2,N1,Chain3,Chain2))).


	