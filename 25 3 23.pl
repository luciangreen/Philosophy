% 25 3 23.pl

:-include('../listprologinterpreter/listprolog.pl').

% 42 algs

% 1. Computational English uses techniques to disseminate texts hermeneutically (interpret them).

% make_connection(Subject,Object,Meronym).

make_connection("computer","file","stored").
make_connection("screen","image","displayed").
make_connection("artist","diagram","drew").
make_connection("artist","diagram","modified").
make_connection("philosopher","connection","made").
make_connection("computer scientist","algorithm","wrote").
make_connection("computer scientist","algorithm","debugged").
make_connection("computer scientist","algorithm","saved").
make_connection("computer scientist","algorithm","loaded").
make_connection("computer scientist","algorithm","deleted").

% 11.I prepared to store the positive Computational English phenomena in a box.  I did this by finding the positive results in Computational English.  First, I wrote down the first leg of the path.  Second, I prepared to write down the next leg of the path.  Third, I repeated this until the correct result had been positively found.  In this way, I prepared to store the positive Computational English phenomena in a box by finding the positive results in Computational English.

negative_result(Subject,Object,Meronym) :-
 make_connection(Subject,Object,Meronym,(-)).

make_connection("computer","file","cooled",(-)).
make_connection("screen","image","produced a smell from",(-)).
make_connection("artist","diagram","wrote",(-)).
make_connection("artist","diagram","heated",(-)).
make_connection("philosopher","connection","wore",(-)).
make_connection("computer scientist","algorithm","tasted",(-)).
make_connection("computer scientist","algorithm","touched",(-)).
make_connection("computer scientist","algorithm","smelled",(-)).
make_connection("computer scientist","algorithm","ignored",(-)).
make_connection("computer scientist","algorithm","was blinded by the",(-)).

% 21.I prepared to write the book.  I did this by writing the text.  First, I thought of a topic.  Second, I wrote the reason.  Third, I wrote an inference between the reason and the conclusion.  In this way, I prepared to write the book by writing the text.

% popular_links([[1,2],[1,3],[1,4],[2,5],[3,5],[4,6],[5,7],[6,7]],Trail).
% Trail = [[1, 5, 7]]

popular_links(Transitions,Trail) :-
 N = 1,
 pl(N,Transitions,[N],Trail).
pl(N,Transitions,Trail1,Trail2) :- member([N,N1],Transitions),not(member([N1,_],Transitions)),append(Trail1,[N1],Trail2),!.
pl(N,Transitions,Trail1,Trail2) :-
 % find all linked to states
findall([C1,C],(member([N,C1],Transitions),member([C1,C],Transitions)),E),
 sort(E,K),

 % find frequency of occurrences of states
findall([J,G],(member([_,G],K),findall(G,member([_,G],E),H),length(H,J)),M4),
 sort(M4,M5),
 
 % find most popular links
 append(_,[[L1,_M6]],M5),
 findall(M7,member([L1,M7],M5),M8),
 
 % follow most popular links
 findall(Trail5,(member(M9,M8),
 append(Trail1,[M9],Trail3),
 pl(M9,Transitions,[],Trail4),
 append(Trail3,Trail4,Trail5)),Trail2).
 
% 27

% 31.I prepared to discover the protein code.  I did this by writing that Bioschemistry (sic) referred to computational biochemistry, the study of the computational nature of proteins.  First, I discovered the first biochemical reaction.  Second, I prepared to discover the next biochemical reaction.  Third, I repeated this until I had discover all the biochemical reactions and the desired result had been achieved.  In this way, I prepared to discover the protein code by writing that Bioschemistry (sic) referred to computational biochemistry, the study of the computational nature of proteins.

%maze([1,2],[1,3],[2,4],[2,5],[5,6],[5,7],1,7).

maze(_,F,F) :- !.
maze(Ts,I,F) :-
 member([I,N],Ts),maze(Ts,N,F).
 
% 1a. Will Computational English be like a calculator, as in people should understand the theory before relying on it? Advantages: will allow focus on more material, as more data can be analysed (information would have to be presented in such a way as to allow reviewing in the best way possible). User will be able to program using Conglish's (Computational English) features (write essay, fill out grammar to recognise sentences with the same meaning, compressing the program e.g. 2 identical conclusions compressed to 1 conclusion, with reasons from both attached to it, action to take based on arriving at a conclusion e.g. return a telephone call, cook a meal, clean up or write a poem).

%model_to_result(1,1,2,2,2,R).
% R = 4
model_to_result(A1,B1,R1,A2,B2,R2) :-
 ind(A1,B1,R1,Op),
 interpret(A2,B2,Op,R2).

%ind(1,1,2,Op).
ind(A,B,R,Op) :-
 R is A+B,
Op=(+).

interpret(A,B,Op,R) :- Op=(+),R is A+B.

% 34

% 11.   I prepared to write 'I ate the apple' and 'I ate the apple, therefore I gained energy', therefore 'I gained energy'.  I did this by writing that 'and' in Ball Prolog is represented by the ball travelling forwards.  First, I observed that the ball started at the position of the first proposition.  Second, I watched it roll along the track, representing the conjunction.  Third, I observed that the ball finished at the position of the second proposition.  In this way, I prepared to write 'I ate the apple' and 'I ate the apple, therefore I gained energy', therefore 'I gained energy' by writing that 'and' in Ball Prolog is represented by the ball travelling forwards.

% modus_ponens('I ate the apple', 'I ate the apple'-'I gained energy', B).
% B = 'I gained energy'.

modus_ponens(A,A-B,B).
 
% 21.   I prepared to perform computations on the ontology, step by step.  I did this by writing an ontology, in other words, the data structure, containing the arguments in order.  First, I wrote words, the arguments down in the ontology.  Second, I wrote the grammar, the order of the arguments under the words, the arguments.  Third, I wrote the words, the arguments, in the order of action in the ontology.  In this way, I prepared to perform computations on the ontology, step by step by writing an ontology, in other words, the data structure, containing the arguments in order.

% summarise_structure([a,[b,c,[d,[e]]]],[],[],R).
% R = [a, [b, c, [d, [e]]]].

% summarise_structure([a,[b,c,[d,[e]]]],[a,e],[],R).                  % R = [b, c, [d]]

% summarise_structure([a,[b,c,[d,[e]]]],[a,d],[],R).
% R = [b, c, [e]]

summarise_structure([],_D,R,R) :- !.
summarise_structure([A|B],D,R1,R2) :-
 not(length(B,1)),
 (member(A,D)->R1=R3;
 append(R1,[A],R3)),
 summarise_structure(B,D,R3,R2),!.
summarise_structure([A,B],D,R1,R2) :-
 (member(A,D)->
 (summarise_structure(B,D,R1,R2));
 (not(member(A,D))->
 (append(R1,[A],R3),
 summarise_structure(B,D,[],R4),
 (R4=[]->R2=R3;
 append([R3,[R4]],R2))))).
