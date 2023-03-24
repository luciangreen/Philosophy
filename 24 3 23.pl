% 24 3 23.pl

% 42 algs
:-include('../listprologinterpreter/listprolog.pl').

% 1. I started the web business in the future and the present.  There were a set number of places.  *SSI in C was needed for more places.  I had fifty As, or at least 50 breasonings for each conclusion.

% ?- ssi_in_c(S).
% S = 60.

ssi_in_c(Sum) :-
 X_max is 3,
 Y_max is 4,
 Z_max is 5,
 numbers(X_max,1,[],Xs),
 numbers(Y_max,1,[],Ys),
 numbers(Z_max,1,[],Zs),
 
 % define array int a[X][Y][Z]
 
 findall(Ys1,(member(_Z,Zs),
 findall(Xs1,(member(_Y,Ys),
 findall(Xn,(member(_X,Xs), Xn=1),Xs1)),Ys1)),Zs1),
 
 % count all values in array
 
 flatten(Zs1,Zs2),sum(Zs2,0,Sum).

% 1. The bot transcribed the text.

% ocr1(T).
% T = [l, -, *].
ocr1(Text):-ocr([l-[['*','-'],['*','*']],i-[['*','-'],['*','-']],v-[['*','*'],['*','-']],'bs'-[['*','-'],['-','*']],'/'-[['-','*'],['*','-']],'.'-[['-','-'],['*','-']],'-'-[['*','*'],['-','-']],'_'-[['-','-'],['*','*']],','-[['-','*'],['*','*']],'\''-[['-','*'],['-','-']],'*'-[['*','*'],['*','*']]],[[['*','-'],['*','*']],[['*','*'],['-','-']],[['*','*'],['*','*']]],Text).

ocr(Characters,Graphics,Text) :-
 findall(C,(member(G,Graphics),member(C-G,Characters)),Text).

% 1. The symbols for all, there exists, ->, <->, ^, v and ~ (not) need to be updated to account for language's semantic properties. *For example, there exist 3 (the symbol there exists! means there exists 1). The symbol ~avb could represent a although b because 'a although' implies ~a and 'although b' implies b, hence ~avb.

a1(A):-a(A),!.
a(1).
a(2).
a(3).

% 11.    I prepared to reduce psychiatric costs.  I did this by preventing etiological phenomena (the virus AIDS, in fact maintaining human happiness by using a condom, in fact abstaining from sex).  *First, I stood at the start of the path.  Second, I started walking along the path.  Third, I walked along the path until the end of it.  In this way, I prepared to reduce psychiatric costs by preventing etiological phenomena (the disease AIDS, in fact maintaining human happiness by using a condom, in fact abstaining from sex).

% p("* **  ** ",PS).                                                  % PS = [1, 3, 7].

p(String,PS) :-
 string_codes(String,String2),
 split_on_substring117(String2,` `,[],List1),
 p2(List1,1,[],PS).
p2([],_,L,L) :- !.
p2(List,N1,L1,L2) :-
 List=[L|Ls],
 (L=" "->
 (N3 is N1+1,
 p2(Ls,N3,L1,L2))),!.
p2(List,N1,L1,L2) :- 
 List=[L|Ls],
 (string_length(L,LN),
 append(L1,[N1],L3),
 N3 is N1+LN,
 p2(Ls,N3,L3,L2)).
 
% 21.   I prepared to eat the tofu nuggets.  I did this by preventing animal products from being produced (I cooked the tofu).  First, I placed the tofu in the wok.  Second, I started to cook it.  Third, I stopped cooking it after 4 minutes.  In this way, I prepared to eat the tofu nuggets by preventing animal products from being produced (I cooked the tofu).

%bar_with_time(0,10).
bar_with_time(F,F) :- !.
bar_with_time(Now,F) :-
 sleep(1),
 bar_n(Now,F),
 Now1 is Now+1,
 bar_with_time(Now1,F).
bar_n(N,M) :-
 P is round((N/M)*10),
 P1 is round((N/M)*100),
 numbers(P,1,[],N1),
 findall("*",member(_,N1),B),
 write(B),write(" "),write(P1),writeln("%").

% 31.    I prepared to become a web fan.  *I did this by running a viral algorithm.  First, I breasoned out 5 As.  Second, I performed 45 brain thoughts after meditating using 80 lucian mantras (drawing an illustration).  Third, I dotted on a grid, making, doing, having, time to prepare for the video web site counter, a large cloud to protect oneself from the wires being felt, a non-famous wire and a famous wire.  In this way, I prepared to become a web fan by running a viral algorithm.
 
% viral_poster_hands_train(It).
% It = [1,2,3]

viral_poster_hands_train(Itin4) :-
 Itin=[],
 point(1,Itin,Itin2),
 point(2,Itin2,Itin3),
 point(3,Itin3,Itin4).
 
point(A,I1,I2) :-
 append(I1,[A],I2).
 
% 1. After reading a page on Agnès van Rees, the Director of the project Characteristics of Argumentative Discourse found using the Yahoo! search criteria of 'narratology, contention and characteristics', I became interested in resolution of differences of opinion in everyday discussion.

% side_determiner([1,1,2,3,4,1],Ave).
% 1=agreeing, 10=disagreeing

side_determiner(Closer_to_agreeing_or_disagreeing,Ave) :-
 sum(Closer_to_agreeing_or_disagreeing,0,Sum),
 Ave is Sum/10.
 
% 11.    I prepared to be a meditation (philosophy) teacher.  I did this by virtuously running up the pole.  First, I stepped on the first rung of the stairs on the pole.  Second, I prepared to walk to the next step.  Third, I repeated this until I had ran up the pole.  In this way, I prepared to be a meditation (philosophy) teacher by virtuously running up the pole.

create_edu_pol(A,D):-
 writeln("Are there any more contentions? (y/n)"),
 read_string(user_input,"\n\r","\n\r",_,C),
 (C="y"->
 (writeln("What is the binary contention?"),
 read_string(user_input,"\n\r","\n\r",_,B),
 writeln("What is your opinion (1-strongly disagree, 5-strongly agree)?"),
 read_string(user_input,"\n\r","\n\r",_,O),
 append(A,[[B,O]],E),
 create_edu_pol(E,D));
 (A=D,
 writeln(D))),!.
 
% 21.   I prepared to observe the mouse man ascend the group of slopes.  *I did this by observing the mouse man run up the slope.  First, I observed the mouse man stand at the foot of the slope.  Second, I observed the mouse running up the slope.  Third, I observed the mouse stop at the top of the slope.  In this way, I prepared to observe the mouse man ascend the group of slopes by observing the mouse man run up the slope.

% find_peak_height(10,"ddd-uu-d-d",[],H).
find_peak_height(H1,S,H) :-
 string_codes(S,C),
 fph(H1,C,[],H2),
 sort(H2,H3),
 append(_,[H],H3),!.
fph(_,[],H,H) :- !.
fph(H1,C,H5,H6) :-
 C=[H2|H3],
 ([H2]=`-` ->
 H4=H1;
 ([H2]=`u` ->
 H4 is H1+1;
 ([H2]=`d` ->
 H4 is H1-1))),
 append(H5,[H4],H7),
 fph(H4,H3,H7,H6),!.

% COMPUTATIONAL ENGLISH by Lucian Green Analysing characteristics of arguments 4 of 4.txt

% 31.    I prepared to observe the volunteer vitiate the community.  I did this by observing the volunteer teach meditation (philosophy of music).  First, she gave a copy of the degree to her student.  Second, her student breasoned out the degree.  Third, the volunteer taught her student meditation (philosophy of music) as she had been taught.  In this way, I prepared to observe the volunteer vitiate the community by observing the volunteer teach meditation (philosophy of music).

% check_text_with_ontologies(A),writeln(A).                                          Call: (11) check_text_with_ontologies(A),writeln(A).
% A=[[The,person,was,good],[The,person,was,happy],[The,person,was,updated],[The,phone,was,good],[The,phone,was,updated],[The,dog,was,good],[The,dog,was,happy]]

check_text_with_ontologies(Texts) :-
 % find text
 findall(B1,subject(B1),B),
 findall(D1,object(D1),D),
 findall(["The",A,"was",C],(member(A,B),member(C,D)),E),
 % check text
 findall(J1,member(J1),J),
 findall([G3,G,G1,H],(member([G3,G,G1,H],E),member([G,H],J)),Texts).

subject(person).
subject(phone).
subject(dog).
object(good).
object(happy).
object(updated).
member([person,good]).
member([phone,good]).
member([dog,good]).
member([person,happy]).
member([dog,happy]).
member([person,updated]).
member([phone,updated]).
