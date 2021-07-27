/* 

phil automator
- triangulate topic and idea with connection
- build these triangles into sentences

- connect words in topic, then new ones from brdict

store diary, came as goal, start, conn from each of diary, came
with diary, came as words given in sentence, can 
- start at where I came from
- goal is in diary
- walk from start to goal

- 

alg
- simple version of alg eg qadb.pl + tree algs *
- two points of triangle 
 - ways (groups of preds) as words in sentences
 - an xml var get and put fn
 - vars have xml tags to state that they are required with and to pass vars through fn'al parts
 - data->rule or vv producers
 - where to modify fns to others fns (eg games) eg instead of words in crossword, *ordered (could be unordered, or tree) sentences given story
 
 - new data is additional (file2.txt) thing x all automated

 dec tree :
 +
  1
   1
    2
 *
  2
   3
   	6
 ^
  1 
   1
   	1
   	
 walk
 	start
		goal

learns sentence from I walked from the start to the goal
- walk from start to goal
	- uses this pattern for this verb or if any are synonyms
	- exceptions, entered when correct sentence, are displayed as menu options 
	
 use (multiple levels in) thesaurus to find other options

 
*/
:- include('../listprologinterpreter/listprolog').

phil2alg :-
	
	/* 
	1. 
 came,start
 diary,goal
 
 in dict:
 walk (in thes.),travel - start,origin (in thesaurus) - goal, finish (in thes.)
 
 walk(["start","goal"],"start",C).
 walk(A,B,C) :-
 	member([B,C],A).
 	,member([A,D],A1) etc
 ,* ^ finds conjunctions of words (applies to any words, not just last in sequence)
  	- ,member BC A, member DC E
  	^ where get map for goal, walk from start to goal - [type this in response to key terms, filters out connectives], asks which word (resolving ambiguities) correspond to which, confirms sent from db are correct, asks for connections, converts to alg
  	
  	x searches corrs for words A A1, (confirms if ambiguous x), asks for corr if not found, conns for links, A1 B1 (* from start to goal), choose first / xx randomise x from possible combinations, asks for missing links
  	
 ** find conns bw finished sent systems later
 
 * enter rules where 
 () display
 walk from start to goal

 enter: walk from the start to the goal
 add v,a from the v,b to the v,c in dict entry
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
	
	(member([Word2,Word2a],Correspondences2)->(Word2b=Word2a;
	Correspondences3=Correspondences2);
	(concat_list(["What is a corresponding word for: ",Word2," in the pair: (",Word1,", ",Word2,")?\n","or <Return> to skip."],Notification2),writeln(Notification2),
	read_string(user_input, "\n", "\r", _End2, Input2),
	(Input2=""->(Word2b=Word2);(Word2b=Input2)),append(Correspondences2,[[Word2,Word2b]],Correspondences3)
	)),
	

	phrase_from_file_s(string(Codes3), "connections.txt"),
	string_codes(String3,Codes3),
	atom_to_term(String3,Connections,_),
	
	(path(Word1b,Connections,_Map,
	Word2b,[],Path)->(true;
	Connections2a=Connections);
	(%repeat,%trace,
	concat_list(["What is a list of connective sentences from: (",Word1b," to ",Word2b,")?\n","e.g. get map for goal,walk from start to goal"],Notification3),writeln(Notification3),
	read_string(user_input, "\n", "\r", _End3, Input3),
	(Input3=""->(fail);(
	
	split_string(Input3,".,",".,",Sentences1))),
	findall(List1,(member(Sentences,Sentences1),split_string(Sentences,SepandPad,SepandPad,List1)),List2),
	length(List2,Length),
	%numbers(Length,1,[],N),
	
	%trace,
	process_sentences(1,Length,Sentences1,List2,Connections,Connections2a,Connectives,Connectives1a,Correspondences3,Correspondences2a),
	
	path(Word1b,Connections2a,_Map,
	Word2b,[],Path))),
	

	writeln1(Path), %***
	
	%** Phil, Alg ***
		
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

process_sentences(N,N,_Sentences1,_List2,Connections,Connections,Connectives,Connectives,Correspondences,Correspondences) :- !.

process_sentences(N,NA2,Sentences1,List2,Connections1,Connections2a, Connectives,Connectives1a,Correspondences3,Correspondences2a) :-
	
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
	
	%append([Verb1],)
	length(Item2,Length2),
	numbers(Length2,1,[],N2),
%trace,
	append([-],Word7ab,Word7ab1),
	findall(Item4,(member(N3,N2),get_item_n(Item2,N3,Item3),
	(Item3=Verb1->%Verb
	Item4=1;	
	(member(Item3,Connectives1)->%Connectives
	Item4=Item3);
	(%trace,
	member(Item3,Word7ab)->%Noun
	(get_n_item(Word7ab1,Item3,N4),
	Item4=N4)))),Item5),
	
	%trace,
	%maplist(append,[List2],[List21]),
	
	append(Connections1,[[Item2,Item5]],Connections2a),
	sort(Connections2a,Connections2),


	
	

NA3 is N+1,
process_sentences(NA3,NA2,Sentences1,List2,Connections2,Connections2a,Connectives1,Connectives1a,Correspondences3,Correspondences2a),!.

path(Goal,Map,Map,
	Goal,Path,Path) :- !.
path(D,Map1,Map2,
	Goal,Path1,Path2) :-
	%trace,
	member([D1,E],Map1),
	member(Goal,D1),member(D,D1),
	delete(Map1,[D1,E],Map2),
	append(Path1,[[D1,E]],Path2),!.
path(D,Map1,Map2,
	Goal,Path1,Path2) :-
	((member([[A,B,C],E],Map1),delete(Map1,[[A,B,C],E],Map3),
	append(Path1,[[[A,B,C],E]],Path3),
	(D=B->path(C,Map3,Map2,Goal,Path3,Path2);
	(D=C->path(B,Map3,Map2,Goal,Path3,Path2))))->true;
	
	% for e.g. + 1 1 2
	(member([[A,B,C,F],E],Map1),delete(Map1,[[A,B,C,F],E],Map3),
	append(Path1,[[[A,B,C,F],E]],Path3),
	(D=B->(path(C,Map3,Map2,Goal,Path3,Path2)->true;
	path(F,Map3,Map2,Goal,Path3,Path2));
	(D=B->(path(C,Map3,Map2,Goal,Path3,Path2)->true;
	path(F,Map3,Map2,Goal,Path3,Path2));
	(D=F->(path(B,Map3,Map2,Goal,Path3,Path2)->true;
	path(C,Map3,Map2,Goal,Path3,Path2))))))).
	