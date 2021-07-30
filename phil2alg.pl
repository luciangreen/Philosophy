:- include('../listprologinterpreter/listprolog').

phil2alg :-
	
	/* 

 
correspondences.txt:
[]

connectives.txt:
["a","an","and","by","for","from","i","in","my","of","on","out","the","to","was","were","with"]

connections.txt:
[]

p2a_file.txt:
["chart diary"]

[debug]  ?- phil2alg.
What is a corresponding word for: chart in the pair: (chart, diary)?
or <Return> to skip.
|: map
What is a corresponding word for: diary in the pair: (chart, diary)?
or <Return> to skip.
|: goal
What is a list of connective sentences from: (map to goal)?
e.g. get map for goal,walk from start to goal
|: get map for goal
What is the verb in : "get map for goal" ?
|: get
What are the nouns in : ["map","goal"]
apart from [] ?
|: map,goal
[[["get","map","for","goal"],[1,2,"for",4]]]
true.

 */
 
 	SepandPad="&#@~%`$?-+*^,()|.:;=_/[]<>{}\n\r\s\t\\\"!0123456789", % doesn't have "'" xx

 	phrase_from_file_s(string(Codes_cve), "connectives.txt"),
	string_codes(String_cve,Codes_cve),
	atom_to_term(String_cve,Connectives,_),

 	phrase_from_file_s(string(Codes), "p2a_file.txt"),
	string_codes(String,Codes),
	atom_to_term(String,[File0],_),
	downcase_atom(File0,File1),
	
	split_string(File1,SepandPad,SepandPad,File2),
	File2=[Word1,Word2|_],
	
	phrase_from_file_s(string(Codes2), "correspondences.txt"),
	string_codes(String2,Codes2),
	atom_to_term(String2,Correspondences,_),

	(member([Word1,Word1a],Correspondences)->(Word1b=Word1a,
	Correspondences=Correspondences2);
	(concat_list(["What is a corresponding word for: ",Word1," in the pair: (",Word1,", ",Word2,")?\n","or <Return> to skip."],Notification1),writeln(Notification1),
	read_string(user_input, "\n", "\r", _End1, Input1),
	(Input1=""->(Word1b=Word1);(Word1b=Input1)),append(Correspondences,[[Word1,Word1b]],Correspondences2)
	)),
	
	(member([Word2,Word2a],Correspondences2)->(Word2b=Word2a,
	Correspondences2a=Correspondences2);
	(concat_list(["What is a corresponding word for: ",Word2," in the pair: (",Word1,", ",Word2,")?\n","or <Return> to skip."],Notification2),writeln(Notification2),
	read_string(user_input, "\n", "\r", _End2, Input2),
	(Input2=""->(Word2b=Word2);(Word2b=Input2)),append(Correspondences2,[[Word2,Word2b]],Correspondences2a)
	)),
	

	phrase_from_file_s(string(Codes3), "connections.txt"),
	string_codes(String3,Codes3),
	atom_to_term(String3,Connections,_),
	
	(path(Word1b,Connections,_Map,
	Word2b,[],Path,[],Trail)->(Connections2a=Connections,
	Connectives=Connectives1a);
	(%repeat,%trace,
	concat_list(["What is a list of connective sentences from: (",Word1b," to ",Word2b,")?\n","e.g. get map for goal,walk from start to goal"],Notification3),writeln(Notification3),
	read_string(user_input, "\n", "\r", _End3, Input3),
	(Input3=""->(fail);(
	
	split_string(Input3,".",".",Sentences1))),
	SepandPad2=" ",
	findall(List1,(member(Sentences,Sentences1),split_string(Sentences,SepandPad2,SepandPad2,List1)),List2),
	length(List2,Length),
	%numbers(Length,1,[],N),
	
	%trace,
	process_sentences(1,Length,Sentences1,List2,Connections,Connections2a,Connectives,Connectives1a),
	
	path(Word1b,Connections2a,_Map,
	Word2b,[],Path,[],Trail))),
	
	writeln1(Path), %***
	
	%trace,
	
	% Phil
	
	findall(A_I,(member([[A_A|A_B],_],Path),
	string_concat(A_C,A_D,A_A),
	string_length(A_C,1),
	upcase_atom(A_C,A_E),
	string_concat(A_E,A_D,A_F),
	findall([A_G," "],(member(A_G,A_B)),A_H),
	%trace,
	reverse(A_H,A_K),A_K=[[A_L," "]|A_M],
	reverse([[A_L]|A_M],A_N),
	%string_concat(A_K," ",A_H),
	maplist(append,[A_N],[A_O]),
	concat_list(A_O,A_P),
	concat_list([A_F," ",A_P,". "],A_I)),A_J),
	%trace,
	maplist(append,[[A_J]],[[A_K]]),
	
	writeln(A_K),

	%** Alg ***

	alg(Trail,Alg),	
		
	writeln(Alg),
		
	term_to_atom(Connections2a,Connections12a1),
	(open_s("connections.txt",write,Stream1),
	write(Stream1,Connections12a1),
	close(Stream1)),!,
	
	term_to_atom(Connectives1a,Connectives1a1),
	(open_s("connectives.txt",write,Stream2),
	write(Stream2,Connectives1a1),
	close(Stream2)),!,
	
	term_to_atom(Correspondences2a,Correspondences4),
	(open_s("correspondences.txt",write,Stream3),
	write(Stream3,Correspondences4),
	close(Stream3)),!
	.
	

%****

process_sentences(N1,N2,_Sentences1,_List2,Connections,Connections,Connectives,Connectives) :- 
N1 is N2+1, !.

process_sentences(N,NA2,Sentences1,List2,Connections1,Connections2a1, Connectives,Connectives1a11) :-
	
	%findall(*,(member(Item,N),
	get_item_n(Sentences1,N,Item1),
	get_item_n(List2,N,Item2),
	Item2=[Verb|Words],

	% * check for verb v
	(member([[Verb|_],_],Connections1)->Verb1=Verb;
	(%repeat,
	term_to_atom(Item1,Item11),
	concat_list(["What is the verb in : ",Item11," ?"],Notification4),writeln(Notification4),
	read_string(user_input, "\n", "\r", _End4, Input4),
	(Input4=""->(fail);Verb1=Input4))),
	
	% * don't forget to add to connectives v	
	% * ask if agree with corr,Connections x
	%  - helps ensure algs are different
	
		%trace,

	findall(Word4,(member(Word3,Words),
	((member([[_|Words1],_],Connections1),
	member(Word3,Words1))->Word4=[noun,Word3];
	(member(Word3,Connectives)->Word4=[connective,Word3];
	Word4=[undef,Word3]))),Word5),
	
	findall(Word6,member([undef,Word6],Word5),Word7),
	findall(Word6,member([noun,Word6],Word5),Word7a),
	findall(Word6,member([connective,Word6],Word5),Word7b),
	
	append(Connectives,Word7b,Connectives1a1),
	sort(Connectives1a1,Connectives1a),

%trace,

	(Word7=[]->Input5a=[];
	(%repeat,
	%findall(Input5a,(%member([undef,Word6]*,Word5),
	term_to_atom(Word7,Word71),
	term_to_atom(Word7a,Word7a1),
	concat_list(["What are the nouns in : ",Word71,"\n","apart from ",Word7a1," ?"],Notification5),writeln(Notification5),
	read_string(user_input, "\n", "\r", _End5, Input5),
	(Input5=""->(fail);(split_string(Input5,",. ",",. ",Input5a),
	((forall(member(Input5b,Input5a),member(Input5b,Word7)),
	forall(member(Input5b,Input5a),not(member(Input5b,Word7a))))->
	true;
	(concat_list(["Error: Please enter only words in the list : ",Word7,"\n and not in the list : ",Word7a,"."],Notification6),writeln(Notification6),fail)))))),
	%))),Input5c),
	
	%trace,
	
	subtract(Word7,Input5a,New_connectives),
	append(Connectives1a,New_connectives,Connectives1),
	
	append(Word7a,Input5a,Word7aa), % All nouns in sentence
	intersection(Item2,Word7aa,Word7ab), % All nouns in sentence in order
	% v1 c1 w1 c2 c2
	% [1,c1,2,cw,3]
	
	% get map for Goal
	% [1,2,for,3]
	%append([Verb1],)
	length(Item2,Length2),
	numbers(Length2,1,[],N2),
%trace,
	%append([-],Word7ab,Word7ab1),
	findall(Item4,(member(N3,N2),get_item_n(Item2,N3,Item3),
	(Item3=Verb1->%Verb
	Item4=1;	
	(member(Item3,Connectives1)->%Connectives
	Item4=Item3);
	(%trace,
	member(Item3,Word7ab)->%Noun
	(get_n_item(Item2,Item3,N4),
	Item4=N4)))),Item5),
	
	%trace,
	%maplist(append,[List2],[List21]),
	
	append(Connections1,[[Item2,Item5]],Connections2a),
	sort(Connections2a,Connections2),


	
%trace,	

/*
path(b,[[[a,b,c,d],[1,2,c,4]]],M,d,[],P).
M = [],
P = [[[a, b, c, d], [1, 2, c, 4]]].

path(b,[[[a,b,c,d],[1,2,c,4]],[[e,d,f],[1,2,3]]],M,f,[],P).
M = [],
P = [[[a, b, c, d], [1, 2, c, 4]], [[e, d, f], [1, 2, 3]]].
*/


NA3 is N+1,
process_sentences(NA3,NA2,Sentences1,List2,Connections2,Connections2a1,Connectives1,Connectives1a11),!.

path(Goal,Map,Map,
	Goal,Path,Path,Trail,Trail) :- !.
path(D,Map1,Map2,
	Goal,Path1,Path2,Trail1,Trail2) :-
	%trace,
	member([[D2|D1],[E2|E]],Map1),
	length(D1,L),
	numbers(L,1,[],N),
	member(N1,N),
	get_item_n(D1,N1,Goal),
	get_item_n(E,N1,Goal3),
	number(Goal3),
	member(N2,N),
	get_item_n(D1,N2,D),
	get_item_n(E,N2,D3),
	number(D3),
	delete(Map1,[[D2|D1],[E2|E]],Map2),
	append(Path1,[[[D2|D1],[E2|E]]],Path2),
	append(Trail1,[[D,Goal]],Trail2),!.
path(D,Map1,Map2,
	Goal,Path1,Path2,Trail1,Trail2) :-
	%trace,
	member([[D2|D1],[E2|E]],Map1),

	delete(Map1,[[D2|D1],[E2|E]],Map3),
	append(Path1,[[[D2|D1],[E2|E]]],Path3),

	append(Trail1,[[D,Goal]],Trail3),
	
	length(D1,L),
	numbers(L,1,[],N),
	member(N1,N),
	get_item_n(D1,N1,D),
	get_item_n(E,N1,Goal3),
	number(Goal3),
	member(D,D1),
	delete(D1,D,D4),get_n_item(D1,D,N4),
	delete_item_n(E,N4,E4),
	length(D4,L2),
	path2(1,L2,D4,E4,Goal,Map3,Map2,_Goal6,Path3,Path2,Trail3,Trail2),!.

path2(L3,L2,_D4,_E4,_Goal4,Map,Map,_Goal6,Path,Path,Trail,Trail) :-
	L3 is L2+1,!.
path2(N3,L2,D4,E4,Goal,Map1,Map2,_Goal6,Path1,Path2,Trail1,Trail2) :-
	((get_item_n(D4,N3,Goal4),
	get_item_n(E4,N3,Goal5),
	number(Goal5))->
	path(Goal4,Map1,Map3,Goal,Path1,Path3,Trail1,Trail3);(Map1=Map3,Path1=Path3,Goal4=Goal)),
	N4 is N3+1,
	path2(N4,L2,D4,E4,Goal4,Map3,Map2,_Goal61,Path3,Path2,Trail3,Trail2),!.
	
	
%c([a,b],[b,c],a,B3).
%B3=c

%c(A1,A2,B1,B3) :-
%A1=[B1,B2],
%A2=[B2,B3].
	
alg(Trail,Alg) :-
	Trail=[[A,_]|_],
	reverse(Trail,[[_,C]|_]),
	length(Trail,Length),
	Length2 is Length+1,
	numbers(Length,1,[],N),
	
	term_to_atom(Trail,Trail2),
	string_concat("[",C1,Trail2),
	string_concat(C2,"]",C1),
	
	findall(L,(member(N1,N),N2 is N1+1,concat_list(["A",N1,"=[B",N1,",B",N2,"],"],L)),L2),
	findall(["A",N3,","],member(N3,N),L5),%trace,
	maplist(append,[L5],[L8]),append(L9,[","],L8),%string_concat(L5,",",L6),
	concat_list(L9,L7),
	%concat_list(L6,L5),
	%maplist(append,[L2],[L4]),
	concat_list(L2,L4),
	string_concat(L4,"!.",L3),
	concat_list(["anone(",C2,",\"",A,"\",B",Length2,").\n","B",Length2,"=\"",C,"\"\n\n",
	"anone(",L7,",B1,B",Length2,"):-\n",
	L3],Alg),!.

	


