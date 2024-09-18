% 28 5 23.pl

% ["Medicine","MEDICINE by Lucian Green Go to Bed at 9-30 PM 1 of 4.txt",0,algorithms,"8. I prepared to state that essent in Heidegger, from das Seiende, {n} meant that which has being.  I did this by maintaining motivation.  First, I wrote down the effervent's (sic) heading.  Second, I wrote down 'you'.  Third, I reduced essential enthusiasm to essent (sic).  In this way, I prepared to state that essent in Heidegger, from das Seiende, {n} meant that which has being by maintaining motivation."]

% I did this by maintaining motivation.

% I rendered the 3D grid

% Later: shadows, different keyboard controls (side and zoom), textures and modelling

:-include('stack_shapes.pl').
:-include('../listprologinterpreter/listprolog.pl').

/*
A - the 3D position of a point A that is to be projected.
C - the 3D position of a point C representing the camera.
theta - The orientation of the camera (represented by Tait-Bryan angles). TX is yaw, TY is pitch and TZ is roll angle (https://commons.wikimedia.org/wiki/Tait-Bryan_angles)
E - the display surface's position relative to the camera pinhole C.
https://en.wikipedia.org/wiki/3D_projection#Perspective_projection



three_dimensions_to_two_dimensions(AX,AY,AZ,CX,CY,CZ,TX,TY,TZ,EX,EY,EZ,BX,BY).
*/
plot :-
 
/*
findall(_,(member([CX,CY,CZ],[[0,5,0]%,[0,-5,0],[5,0,0],[-5,0,0]
]),
member(TX,[0%,90,180,275
]),
member(TY,[0%,90,180,275
]),
member(TZ,[0%,90,180,275
]),
member([EX,EY,EZ],[[0,2.5,0],[0,5,0],[0,25,0]]),
*/
%[0,2.5,0],[0,-2.5,0],[2.5,0,0],[-2.5,0,0],
%[0,10,0],[0,-10,0],[10,0,0],[-10,0,0]]),

[CX,CY,CZ, TX,TY,TZ, EX,EY,EZ]=
[0,0,0,0,0,0,0,0,0],
%[0,0,0,0,0,0,0,0,0],
%[-1,0,0, 180,0,0, 0,10,10],
%[0.5,0.5,-1,0,5,0,0,0,0,0,2.5,0,_67206,_67212]
Points=[
[0,0,0,r],
%[0.005,0.005,0.005,q],
[0,1,0,y],
[1,0,0,g],
[1,1,0,b],
[0.5,0.5,1,p],
[0.5,0.5,-1,o]
],
findall([BX,BY,C],(member([AX,AY,AZ,C],Points),
three_dimensions_to_two_dimensions(AX,AY,AZ,CX,CY,CZ,TX,TY,TZ,EX,EY,EZ,BX,BY)),Image),%writeln(Image),
tty_size(R,C),
numbers(C,0,[],CN),
numbers(R,0,[],RN),
findall(_,(member(RN1,RN),
findall(_,(member(CN1,CN),%writeln([cn1,CN1,rn1,RN1]),
member([CN2,RN2,Colour],Image),((CN1=CN2,RN1=RN2)->%abort%
write(Colour)
;write(%""%
" "
)),!
),_),nl
%),_)

),_).



three_dimensions_to_two_dimensions(AX,AY,AZ,CXX,CYY,CZZ,TX,TY,TZ,EX,EY,EZ,BX,BY) :-
 degrees_to_radians(TX,TXR),
 degrees_to_radians(TY,TYR),
 degrees_to_radians(TZ,TZR),
 X is AX-CXX,
 Y is AY-CYY,
 Z is AZ-CZZ,
 cos(TXR,CX),
 cos(TYR,CY),
 cos(TZR,CZ),
 sin(TXR,SX),
 sin(TYR,SY),
 sin(TZR,SZ),
 
 DX is CY*(SZ*Y+CZ*X)-SY*Z,
 DY is SX*(SY*Z+SY*(SZ*Y+CZ*X))+CX*(CZ*Y-SZ*X),
 DZ is CX*(CY*Z+SY*(SZ*Y+CZ*X))+SX*(CZ*Y-SZ*X),
 %trace,
 (-0.00000000000001<DZ,DZ<0.00000000000001
 %DZ is 0
 ->DZ1=0.00000000000001;DZ1=DZ),
 
 BXX is (EZ/DZ1)*DX+EX,
 BYY is (EZ/DZ1)*DY+EY,
 
 floor(BXX,BX),
 floor(BYY,BY)
 ,writeln([AX,AY,AZ,CXX,CYY,CZZ,TX,TY,TZ,EX,EY,EZ,BX,BY])

 .
 %,writeln([BX,BY]).
 

% 3

% Second, I wrote down 'you'.
you:- me(Properties1),you(Properties2),sort(Properties1,Properties1b),
sort(Properties2,Properties2b),length(Properties1b,L),length(Properties2b,L),numbers(L,1,[],Ns),findall([Label,"\t",A,"\t",B,"\n"],(member(N,Ns),get_item_n(Properties1b,N,[Label,A]),get_item_n(Properties2b,N,[_,B])),C),append(["\t","me","\t","you","\n"],C,C0),flatten(C0,C1),foldr(string_concat,C1,C2),writeln(C2).

me([["Height","180 cm"],["Weight","80 kg"],["Age","42 y"]]).
you([["Height","175 cm"],["Weight","83 kg"],["Age","40 y"]]).

% Third, I reduced essential enthusiasm to essent (sic).

% abbreviate to first two syllables

% abbreviate(2,"abbreviation",O).
% O = "abbrev".

% abbreviate(2,"aardvark",O).
% O = "aardvar".

consonants("BCDFGHJKLMNPQRSTVWXYZ").
vowels("AEIOUYW").

abbreviate(N_syll,I,O2) :-
 downcase_atom(I,I2),
 string_strings(I2,I3),
 consonants(C2),
 downcase_atom(C2,C21),
 string_strings(C21,C3),
 vowels(V2),
 downcase_atom(V2,V21),
 string_strings(V21,V3),
 abbreviate1(N_syll,I3,C3,V3,[],O),
 foldr(string_concat,O,O2).

abbreviate1(0,_I,_,_,O,O) :- !.
abbreviate1(N_syll,I,C,V,O1,O2) :-
 N_syll2 is N_syll-1,
 append(A1,A2,I),
 append([A3],A4,A2),
 member(A3,V),
 append(A5,A6,A4),
 append([A7],A8,A6),
 member(A7,C),
 foldr(append,[O1,A1,[A3],A5,[A7]],O3),
 abbreviate1(N_syll2,A8,C,V,O3,O2),!.

% 13
 
% ["Medicine","MEDICINE by Lucian Green Go to Bed at 9-30 PM 4 of 4.txt",0,algorithms,"Go to Bed at 9:30 PM 4 of 4"]

:-include('philosophy/alarm_clock.pl').

% bell(18,56,"Lucian's alarm").

bell(H,M,Spoken_notification) :-
 alarm_clock(H,M),
 /*
 string_codes(S,[101, 99, 104, 111, 32, %022, %86,
  007%, 71
  ]),*/
 foldr(string_concat,["afplay /System/Library/Sounds/Funk.aiff\nsay \""%done"%"echo "
 ,%""%
 Spoken_notification,
 "\""],S1),
 shell1_s(S1).
 
% 15

:-include('../Prolog-to-List-Prolog/p2lpconverter.pl').

% mr for philosophy and algorithm writing

/*
?- mr2pp("tabs",[[[n,a],":-",[[[n,true]]]]],A).
A = "[\n[[n,a],\":-\",\n[\n\t[[n,true]]\n]]\n]".

[debug]  ?- mr2pp("tabs",[[[n,a],":-",[[[n,true]]]]],A),writeln(A).
[
[[n,a],":-",
[
	[[n,true]]
]]
]

?- mr2pp("spaces",[[[n,a],":-",[[[n,true]]]]],A),writeln(A).
[
[[n,a],":-",
[
 [[n,true]]
]]
]

*/

mr2pp(Tabs_or_spaces,Alg,Alg3) :-
 pp0(Alg,Alg2),
 (Tabs_or_spaces="spaces"->
 (atomic_list_concat(Alg4,"\t",Alg2),
 atomic_list_concat(Alg4," ",Alg3));
 Alg2=Alg3),!.

% 19

% ["Medicine","MEDICINE by Lucian Green Less Depression 4 of 4.txt",0,algorithms,"36. I prepared to ask, 'What about managers, song producers and the scriptwriter whose work my songs are based on?'.  I did this by calculating the breasonings currency takings to be proportional to the percent of the time, rather than the percentage of the value of the total takings.  First, I collected the takings.  Second, I calculated the time to be the physiological time (the time the cognito-physiological product took to complete in comfortable conditions).  Third, I calculated that the two employees with the same cognito-physiological times earned 1 and 2 As for 1 and 2 hours respectively, and the the lazy worker earned 1 A for 2 hour of work.  In this way, I prepared to ask, 'What about managers, song producers and the scriptwriter whose work my songs are based on?' by calculating the breasonings currency takings to be proportional to the percent of the time, rather than the percentage of the value of the total takings."]

% 36. I prepared to ask, 'What about managers, song producers and the scriptwriter whose work my songs are based on?'.

% song_writer(Lyrics),writeln(Lyrics).

/*
[Neon Visor writes on I because Neon Visor doubting sleeps Neon Visor.
,Mine arrives at a home negating Mine creating goes home.
,Dr. Archipelago arrives at a Mine negating Neon Visor doubting goes home.
,I goes home negating Neon Visor agreeing with writes on Neon Visor.
,Dr. Archipelago writes on Dr. Archipelago although Mine creating arrives at a Mine.
,Mine goes home negating Mine creating goes Mine.
,Dr. Archipelago writes on Mine because Mine doubting writes on Mine.
,Dr. Archipelago goes home negating I agreeing with arrives at a Dr. Archipelago.
,I arrives at a I because Dr. Archipelago creating sleeps I.
,Neon Visor writes on Mine because Dr. Archipelago agreeing with goes I.
,Neon Visor sleeps I because I agreeing with writes on Neon Visor.
,Neon Visor writes on I negating Mine doubting arrives at a Mine.
,I arrives at a I negating Mine arriving at arrives at a home.
,Dr. Archipelago writes on I negating I agreeing with sleeps home.
,Neon Visor writes on Dr. Archipelago negating Mine doubting writes on Dr. Archipelago.
,Dr. Archipelago sleeps Dr. Archipelago negating Mine doubting arrives at a Neon Visor.
]
*/
song_writer(Lyrics) :-
 length(A,16),
 findall(L,(member(_,A),sentence(L)),Lyrics).

sentence(L) :-
get(subject,S),get(verb,V),get(object,S1),get(connector,C),get(subject,S2),get(connector2,C1),get(verb,V1),get(object,S3),
foldr(string_concat,[S," ",V," ",S1," ",C," ",S2," ",C1," ",V1," ",S3,".\n"],L),!.

get(POS,Item1) :- findall(Item,get1(POS,Item),Items),random_member(Item1,Items).

% 23

get1(subject,"I").
get1(subject,"Mine").
get1(subject,"Dr. Archipelago").
get1(subject,"Neon Visor").
get1(verb,"goes").
get1(verb,"writes on").
get1(verb,"arrives at a").
get1(verb,"sleeps").
get1(object,S1):-get1(subject,S1).
get1(object,"home").
get1(connector,"although").
get1(connector,"because").
get1(connector,"negating").
get1(connector2,"arriving at").
get1(connector2,"doubting").
get1(connector2,"agreeing with").
get1(connector2,"creating").

% 40

% I did this by calculating the breasonings currency takings to be proportional to the percent of the time, rather than the percentage of the value of the total takings.

/*
?- trace,                                                              time_proportion(0,0,0,1,0,0,1,0,0,P).
P = 1.0.

?- trace,                                                              time_proportion(0,0,0,1,0,0,1,30,0,P).
P = 0.6666666666666666.
*/

time_proportion(H1,M1,S1,H2,M2,S2,HT,MT,ST,Proportion) :-

date_time_stamp(date(2023,1,1,H1,M1,S1,_,_,_),TS1),
date_time_stamp(date(2023,1,1,H2,M2,S2,_,_,_),TS2),
date_time_stamp(date(2023,1,1,HT,MT,ST,_,_,_),TST),

Proportion is (TS2-TS1)/(TST-TS1).

% First, I collected the takings.

:-include('26 5 23.pl').

/*
ss([[[200,2000],[2,20]],[[100,1000],[1,10]]],X,Y,Z).                               

X = [2200, 22, 1100, 11],
Y = [202, 2020, 101, 1010],
Z = [300, 3, 3000, 30].
*/

ss(G,Xs2,Ys2,Zs2) :-
 length(G,Z),
 numbers(Z,1,[],ZZ),
 member(H,G),
 length(H,Y),
 numbers(Y,1,[],YY),
 member(J,H),
 length(J,X),
 numbers(X,1,[],XX),!,
 findall(Xs%[Xs1,Xs]
 ,(member(Z2,ZZ),member(Y2,YY),findall(N,(member(X2,XX),get_particle_image([X2,Y2,Z2,N],G)),Xs1),%Xs1=Xs%
 sum(Xs1,Xs)
 ),Xs2),
  findall(Ys%[Ys1,Ys]
  ,(member(Z2,ZZ),member(X2,XX),findall(N,(member(Y2,YY),get_particle_image([X2,Y2,Z2,N],G)),Ys1),%Ys1=Ys%
  sum(Ys1,Ys)
  ),Ys2),

findall(Zs%[Zs1,Zs]
,(member(X2,XX),member(Y2,YY),findall(N,(member(Z2,ZZ),get_particle_image([X2,Y2,Z2,N],G)),Zs1),%Zs1=Zs%
sum(Zs1,Zs)
),Zs2).

 %findall(N,(member(Y2,H),get_particle_image([X2,Y,Z2,N],G)),Ys),
 %findall(N,(member(X2,J),get_particle_image([X,Y2,Z2,N],G)),Xs),!.

% 45

% Second, I calculated the time to be the physiological time (the time the cognito-physiological product took to complete in comfortable conditions).

% physiological_time(T).
% T = 360.

physiological_time(T) :-
 findall(T1,physiological_time(_,T1),T2),sum(T2,T).
physiological_time("boil kettle",45).
physiological_time("make tea",15).
physiological_time("drink tea",300).

% 50

% Third, I calculated that the two employees with the same cognito-physiological times earned 1 and 2 As for 1 and 2 hours respectively, and the the lazy worker earned 1 A for 2 hour of work.

% note: not indicative

% ?- productivity(P,M).

% P = [a, b],
% M = [c].

productivity(Plus,Minus) :-
 findall(Name,productivity(Name,A,A),Plus),
 findall(Name,(productivity(Name,A,B),not(A=B)),Minus).

productivity(a,2,2).
productivity(b,1,1).
productivity(c,1,2).

% 55

% ["Fundamentals of Pedagogy and Pedagogy Indicators","FUNDAMENTALS OF PEDAGOGY by Lucian Green Y Dimension 4 of 4.txt",0,algorithms,"42.  I prepared to observe the couple help the child with school work.  I did this by observing the couple breason out the Anarchy argument to help ensure successful conception and prevent miscarriage.  First, I observed the one of the members of the couple breason out the Anarchy argument.  Second, I observed that the conception had been successful.  Third, I observed the couple meditate (see a doctor) before, during and after pregnancy.  In this way, I prepared to observe the couple help the child with school work by observing the couple breason out the Anarchy argument to help ensure successful conception and prevent miscarriage."]

% Y Dimension

type_climber :-
type_climber(5,3,0,N1),
writeln([score,N1]),
type_climber(5,2.6,0,N2),
writeln([score,N2]),
type_climber(5,2.2,0,N3),
writeln([score,N3]),
type_climber(5,1.8,0,N4),
writeln([score,N4]),
type_climber(5,1.2,0,N5),
writeln([score,N5]),
type_climber(5,0.8,0,N6),
writeln([score,N6]).

type_climber(0,_,N,N) :- !.
type_climber(A,Y,N1,N3) :-
 A2 is A-1,
 random(X), X1 is floor(X*10), 

 tty_size(_R,C),
 
 random(X2), X21 is ceiling(X2*C),
 length(A1,X21),
 findall(_,(member(_,A1),write(" ")),_),
 writeln(X1),
 %trace,
catch(call_with_time_limit(Y,get_single_char(A3)),_,A3=65),
 atom_number(X14,X1),
 char_code(X14,X13),
 (A3=X13->N2 is N1+1;N2=N1),
 type_climber(A2,Y,N2,N3).

% 58

% I prepared to observe the couple help the child with school work.

% character_freq("abdashdfj",A).                                      
% A = [[2, "a"], [1, "b"], [2, "d"], [1, "f"], [1, "h"], [1, "j"], [1, "s"]].

% character_freq("Quoth said the raven.",A),writeln(A).
% A = [[3, ],[1,.],[1,Q],[2,a],[1,d],[2,e],[2,h],[1,i],[1,n],[1,o],[1,r],[1,s],[2,t],[1,u],[1,v]]

% character_freq("Lucian Green is Chubby Checkers.",A),writeln(A).
% A = [[4, ],[1,.],[2,C],[1,G],[1,L],[1,a],[2,b],[2,c],[4,e],[2,h],[2,i],[1,k],[2,n],[2,r],[2,s],[2,u],[1,y]]

character_freq(A3,B) :- string_strings(A3,String3),
	sort(String3,String4),
	findall([A2,A],(member(A,String4),findall(A,(member(A,String3)),A1),length(A1,A2)),B).

% 62

% I did this by observing the couple breason out the Anarchy argument to help ensure successful conception and prevent miscarriage.

% arguments(A).                                                       
% A = [a, d].

arguments(N2) :- findall(A,(argument1(A,quality,N),N>=80),N2).
argument1(a,quality,80).
argument1(b,poor,70).
argument1(c,quality,70).
argument1(d,quality,100).

% 68

% Third, I observed the couple meditate (see a doctor) before, during and after pregnancy.

% pregnancy_meditation(Result).
% Result = [[mother, before], [mother, during], [mother, after], [father, before], [father, during], [father, after]].

pregnancy_meditation(Result) :- findall([Person,Time],(member(Person,[mother,father]),member(Time,[before,during,after])),Result).

% 70

% ["Fundamentals of Pedagogy and Pedagogy Indicators","FUNDAMENTALS OF PEDAGOGY by Lucian Green Part of Room 3 of 4.txt",0,algorithms,"25. The brainworks participant wrote breasonings  (thought of X, Y and Z dimensions for objects) for a 'seen-as' essay based directly on secondary literature, and handed in an essay of his design.  He did this by moving the arch from his toes.  First, he bent down.  Second, he put the arch over his toes.  Third, he removed the arch.  In this way, the brainworks participant wrote breasonings  (thought of X, Y and Z dimensions for objects) for a 'seen-as' essay based directly on secondary literature, and handed in an essay of his design by moving the arch from his toes."]

% Room

% light_where_people_are([1,2,3],A).
% A = [1,2,3].

% light_where_people_are([],A).
% A = [].

% light_where_people_are([6,5,4,3,2,1],A).
% A = [6,5,4,3,2,1].

% light_where_people_are([1],A).
% A = [1].

light_where_people_are(A,A).

% 75

% 25. The brainworks participant wrote breasonings  (thought of X, Y and Z dimensions for objects) for a 'seen-as' essay based directly on secondary literature, and handed in an essay of his design.

:-include('word_frequency_count.pl').

% lower_freq_essay("a  a a aa  a b b c c d e f g",A),writeln(A).      
% A = [[aa,d],[aa,e],[aa,f],[aa,g],[d,aa],[d,e],[d,f],[d,g],[e,aa],[e,d],[e,f],[e,g],[f,aa],[f,d],[f,e],[f,g],[g,aa],[g,d],[g,e],[g,f]]

% higher_freq_essay("a  a a aa  a b b c c d e f g",A),writeln(A).
% A = [[f,g],[f,b],[f,c],[f,a],[g,f],[g,b],[g,c],[g,a],[b,f],[b,g],[b,c],[b,a],[c,f],[c,g],[c,b],[c,a],[a,f],[a,g],[a,b],[a,c]]

lower_freq_essay(E1,E2) :-
word_frequency_count(["string",E1],Freq),
sort(Freq,Freq1),
length(A,5),
length(Freq,L),(L<5->L2=Freq1;(append(A,_,Freq1),L2=A)),
findall([B,C],(member([_,B],L2),member([_,C],L2),not(B=C)),E2).

higher_freq_essay(E1,E2) :-
word_frequency_count(["string",E1],Freq),
sort(Freq,Freq1),
length(A,5),
length(Freq,L),(L<5->L2=Freq1;(append(_,A,Freq1),L2=A)),
findall([B,C],(member([_,B],L2),member([_,C],L2),not(B=C)),E2).

% 80


