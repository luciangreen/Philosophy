% 9 4 23.pl

:-include('../listprologinterpreter/listprolog.pl').

% 36 algs needed

% 21.   I prepared to hand Peter the trophy.  I did this by writing that the ablative case of the noun was given by the example, 'Peter will run with speed'.  First, I pointed out the starting line of the run to Peter.  Second, I pointed out the finishing line of the run to Peter.  Third, I observed Peter running with speed.  In this way, I prepared to hand Peter the trophy by writing that the ablative case of the noun was given by the example, 'Peter will run with speed'.

time(1,[*,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-]).
time(2,[-,-,*,-,-,-,-,-,-,-,-,-,-,-,-,-,-]).
time(3,[-,-,-,*,-,-,-,-,-,-,-,-,-,-,-,-,-]).
time(4,[-,-,-,-,-,-,*,-,-,-,-,-,-,-,-,-,-]).
time(5,[-,-,-,-,-,-,-,*,-,-,-,-,-,-,-,-,-]).
time(6,[-,-,-,-,-,-,-,-,-,*,-,-,-,-,-,-,-]).
time(7,[-,-,-,-,-,-,-,-,-,-,-,*,-,-,-,-,-]).
time(8,[-,-,-,-,-,-,-,-,-,-,-,-,-,*,-,-,-]).
time(9,[-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,*]).

%speeds(Running_speed,Average_speed).
%Running_speed = [1, 1.5, 1.3, 1.8, 1.6, 1.7, 1.7, 1.8, 1.9],
%Average_speed = 1.9 
speeds(Running_speed,Average_speed):-
findall([T1,S],time(T1,S),T),find_speeds(T,Running_speed,Average_speed).

%find_running_speeds([],S,S):-!.
find_speeds(T,Running_speed,Average_speed):-
 findall([D,T1],(member([T1,M],T),get_n_item(M,*,D)),M2),
 sort(M2,M3),
 append(_,[[Max_D,_]],M3),
 length(M2,Max_T),
 findall(S,(member([D,T1],M2),S is round((D/T1)*10)/10),Running_speed),
 %trace,
 Average_speed is round((Max_D/Max_T)*10)/10,!.

% 24 needed

% 31.    I prepared to research Heidegger's life.  I did this by meeting Heidegger's friend.  First, I breasoned out 50 As.  Second, I was accepted to speak at the Australasian Society for Continental Philosophy Annual Conference in 2013.  Third, I met Heidegger's friend.  In this way, I prepared to research Heidegger's life by meeting Heidegger's friend.

% venn of friends, avail

venn(person1,[friend,available]).
venn(person2,[available]).
venn(person3,[available]).
venn(person3,[]).
venn(person3,[do_not_contact]).
venn(person3,[friend,do_not_contact]).

%venn_select([friend,available],Person).
% Person = person1.

venn_select(Properties1,Person) :-
 venn(Person,Properties2),
 list_to_set(Properties1,Properties2),!.
 
% 16 needed

% 1a. If intertextuality is defined with a 'functional unit' of forming a conclusion from two sentences, one from each text, the first technique could be a possible solution. For example, given the input from sensors 'The baby has finished the meal' and the secondary text 'When the baby has finished the meal, read to him/her' (and another with the baby's name) the conclusion could be 'Read to Tom'.

% two_contact_points(S3),writeln(S3).

/*
?- two_contact_points(S3),writeln(S3).
What is the first sentence?
|: a
What is the second sentence?
|: b
[Is there a connection between,a,and,b,? (y/n)]
|: y
[What is the connection between,a,and,b,?]
|: c
[Is there a connection between,a,and,c,? (y/n)]
|: y
[What is the connection between,a,and,c,?]
|: d
[Is there a connection between,c,and,b,? (y/n)]
|: n
[Is there a connection between,a,and,d,? (y/n)]
|: n
[Is there a connection between,d,and,c,? (y/n)]
|: n
[[a,b,done],[a,c,done],[c,b,done],[a,d,done],[d,c,done]]
*/

two_contact_points(S3) :-
 ask("What is the first sentence?",S1),
 ask("What is the second sentence?",S2),
 connect([[S1,S2,undone]],S3).

ask(Prompt,S) :-
 writeln(Prompt),
 read_string(user_input,"\n\r","\n\r",_,S),!.

connect(S,S) :- not(member([_,_,undone],S)),writeln(S),abort,!.
connect(S1,S3) :-
 %member([_,_,undone],S1),
 connect1(S1,S9),
 %connect1(S2,S9),
 %ask("Would you like to continue? (y/n)",YN),
 %(YN="n"->S9=S3;
 connect(S9,S3).

connect1(S1,S9) :-
 member([S4,S5,undone],S1),
 delete(S1,[S4,S5,undone],S6),
 append(S6,[[S4,S5,done]],S7), 
 repeat,
 ask(["Is there a connection between",S4,"and",S5,"? (y/n)"],YN),
 %trace,
 (YN="y"->true;YN="n"),
 (YN="n"->S7=S9;
 (ask(["What is the connection between",S4,"and",S5,"?"],C),
 append(S7,[[S4,C,undone]],S8),
 append(S8,[[C,S5,undone]],S9))).

% 10 left

% 11. I prepared to play tennis at the appointed time.  I did this by joining the sentences about the grandfather clock together.  First, I wrote 'Grandfather clocks are the largest hall clocks'.  Second, I wrote 'Clocks contain faces to tell the time'.  Third, I wrote 'The grandfather clock face should be at head height to tell the time most easily'.  In this way, I prepared to play tennis at the appointed time by joining the sentences about the grandfather clock together.

% clarify(S),writeln(S).
/*
What is the first sentence?
|: a
What is the second sentence?
|: b
[Is it more likely that,
,1.,a,because,b,
,or 
,2.,b,because,a,
,? (1/2)]
|: 1
[What part of,b,leads to,a,?]
|: o
[What part of,a,is lead to by,b,?]
|: c
[Complete:,o,...,c]
|: d
[Is there a connection between,a,and,c,? (y/n)]
|: n
[Is there a connection between,o,and,b,? (y/n)]
|: n
[Is there a connection between,c,and,d,? (y/n)]
|: n
[Is there a connection between,d,and,o,? (y/n)]
|: n
[[a,b,done],[a,c,done],[o,b,done],[c,d,done],[d,o,done]]
*/
clarify(S3) :-
 ask("What is the first sentence?",S1),
 ask("What is the second sentence?",S2),
 repeat,
 ask(["Is it more likely that","\n","1.",S1,"because",S2,"\n","or \n","2.",S2,"because",S1,"\n","? (1/2)"],Option),
 (Option="1"->true;Option="2"),
 (Option="1"->
 clarify1(S1,S2,S3);
 clarify1(S2,S1,S3)).

clarify1(S1,S2,S3):-
 ask(["What part of",S2,"leads to",S1,"?"],Part1),
 ask(["What part of",S1,"is lead to by",S2,"?"],Part2),
 ask(["Complete:",Part1,"...",Part2],C),
 connect([[S1,S2,done],[S1,Part2,undone],[Part1,S2,undone],[Part2,C,undone],[C,Part1,undone]],S3).

% 7 left

% 21. I prepared to keep my mind and body active.  I did this by collecting the way's text to metaphysically keep my life's text open by supporting it.  First, I wrote from a single 80-breasonings-long A to 50 250-breasonings-long pedagogical argument.  Second, I breasoned out each object's X, Y and Z dimensions in each sentence of the argument.  Third, I supported myself living.  First, I prepared to keep my mind and body active by collecting the way's text to metaphysically keep my life's text open by supporting it.

% fill(5,5,[],L),writeln(L).
% [[5,1,4*50 As],[4,3,4*50 As],[4,1,4*50 As],[1,4,4*50 As],[0,2,4*50 As],[2,1,4*50 As],[4,5,4*50 As],[3,3,4*50 As],[0,4,4*50 As],[3,2,4*50 As],[3,1,4*50 As],[2,0,4*50 As],[0,3,4*50 As],[2,4,4*50 As],[1,2,4*50 As],[3,4,4*50 As],[1,1,4*50 As],[2,3,4*50 As],[0,0,4*50 As],[2,2,4*50 As],[5,2,4*50 As],[1,3,4*50 As],[5,0,4*50 As],[4,4,4*50 As],[0,1,4*50 As]]

fill(X,Y,L1,L2) :-
 XY is X*Y,
 (length(L1,XY)->L1=L2;
 (random(X1),X2 is round(X1*X),
 random(Y1),Y2 is round(Y1*Y),
 (member([X2,Y2,"4*50 As"],L1)->
 L3 = L1;
 append(L1,[[X2,Y2,"4*50 As"]],L3)),
 fill(X,Y,L3,L2))),!.

% 31. I prepared to measure the distance between the positions in space of Sam and Tony.  I did this by representing the positions of Sam and Tony in space along the Z axis.  First, I observed that Sam was positioned at (0, 0, 1) (in metres).  Second, I observed that Tony was positioned at (0, 0, 2) (in metres).  Third, given that the X and Y values of the positions of Sam and Tony were equal to 0, I determined that Sam and Tony were positioned at different points in space on the Z axis.  In this way, I prepared to measure the distance between the positions in space of Sam and Tony by representing the positions of Sam and Tony in space along the Z axis.

% distance(0,0,0,1,1,1,D).
% D = 1.7320508075688772.

distance(X1,Y1,Z1,X2,Y2,Z2,D):-
 D is sqrt((X2-X1)^2+(Y2-Y1)^2+(Z2-Z1)^2).
 
% 3 left

% Kolmogorov Hermeneutics 1 of 4

% Once texts have been interpreted (using hierarchies of arguments with the text as the child nodes and the main conclusion as the root) interpretations of other texts can be merged with it enabling it to be applied to different texts in the future. For example, synonyms can be added for words in a sentence to create possible new interpretations. Also, sentences with new grammars (synogrammars) can be added in disjunction to sentences.

/*
?- rhetoric_merge_trees([a,[b,[]]],[c,[d,[]]],T3).
T3 = [a-c, [b-d, [[]]]].

?- rhetoric_merge_trees([a,[[b,[]],[e,[]]]],[c,[[d,[]],[f,[]]]],T3).
T3 = [a-c, [[b-d], [e-f]]] ;
false.

?- rhetoric_merge_trees([a,[b,[e,[]]]],[c,[d,[f,[]]]],T3).
T3 = [a-c, [b-d, [[e-f, [[]]]]]].

?- rhetoric_merge_trees([a,[b,[e,[]]]],[c,[d,[]]],T3).
T3 = [a-c, [b-d, [[[]-e, [[]]]]]].

?- rhetoric_merge_trees([a,[b,[e,[]]]],[c,[]],T3).
T3 = [a-c, [[]-b, [[e, []]]]].

*/

rhetoric_merge_trees(T1,T2,T3) :-
 T1=[Text1|Branches1],
 atom(Text1),
 T2=[],
 T3=[Text1-[]|Branches1].

rhetoric_merge_trees(T1,T2,T3) :-
 T1=[],
 T2=[Text1|Branches1],
 atom(Text1),
 T3=[[]-Text1|Branches1].
 
/*
rhetoric_merge_trees(T1,T2,T3) :-
 T1=[Text1|Branches1],
 T2=[Text2|Branches2],
 merge_branches(Branches1,Branches2,Branches3),
 T3=[Text1-Text2,Branches3].
*/

rhetoric_merge_trees(T1,T2,T3) :-
 T1=[Text1,Branches1],
 atom(Text1),
 T2=[Text2,Branches2],
 atom(Text2),
 merge_branches(Branches1,Branches2,Branches3),
 T3=[Text1-Text2,Branches3].
 
merge_branches(Branches1,Branches2,Branches3) :-
 Branches1=[[Text1a,Branches1a],[Text1b,Branches1b]],
 atom(Text1a),atom(Text1b),
 Branches2=[[Text2a,Branches2a],[Text2b,Branches2b]],
 atom(Text2a),atom(Text2b),
 merge_branches(Branches1a,Branches2a,Branches3a),
 merge_branches(Branches1b,Branches2b,Branches3b),
 Branches3=[[Text1a-Text2a|Branches3a],[Text1b-Text2b|Branches3b]].

merge_branches([],[],[]) :- !.
merge_branches(Branches1,Branches2,Branches3) :-
 length(Branches1,L1),
 length(Branches2,L2),
 (L1=<L2->merge_branch(L2,Branches1,Branches2,Branches3);
 merge_branch(L1,Branches2,Branches1,Branches3)).
 
merge_branch(L2,Branches1,Branches2,Branches3) :-
 length(Branches21,L2),
 append(Branches21,Branches22,Branches2),
 rhetoric_merge_trees(Branches1,Branches21,Branches4),
 Branches4=[A,Br],
 append([Br],Branches22,Br2),
 Branches3=[A,Br2].
 
 