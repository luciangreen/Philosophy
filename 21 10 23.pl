% 21 10 23

% 23-1=22

% ["Medicine","MEDICINE by Lucian Green Grains, Nuts, Fruits and Vegetables 4 of 4.txt",0,algorithms,"Grains, Nuts, Fruits and Vegetables 4 of 4"]

% vegetables - iodine

qa("Do you feel tired, unable to work?","Buy potatoes for iodine.").
qa("Can't you sleep?","Remember to take your tablet.").
qa("Feeling flimsy?","Do a workout.").
qa("Do you have a headache?","Don't go in the sun without a hat.").
qa("Is it the morning?","Remember to take your morning tablet.").
qa("Is it a few weeks since your doctor's appointment?","Remember to make another appointment.").

/*
?- qa1.
Do you feel tired, unable to work?
(y/n)?
|: n
Can't you sleep?
(y/n)?
|: y
Remember to take your tablet.
Feeling flimsy?
(y/n)?
|: n
Do you have a headache?
(y/n)?
|: y
Don't go in the sun without a hat.
Is it the morning?
(y/n)?
|: n
Is it a few weeks since your doctor's appointment?
(y/n)?
|: n
true.

?- qa1.
Do you feel tired, unable to work?
(y/n)?
|: n
Can't you sleep?
(y/n)?
|: n
Feeling flimsy?
(y/n)?
|: n
Do you have a headache?
(y/n)?
|: n
Is it the morning?
(y/n)?
|: n
Is it a few weeks since your doctor's appointment?
(y/n)?
|: n
true.
*/

qa1 :-
findall(_,(qa(Q,A),writeln(Q),writeln("(y/n)?"),read_string(user_input,"\n\r","\n\r",_,S),
(S="y"->writeln(A);true)),_),!.

% ["Medicine","MEDICINE by Lucian Green Protector from Headache in Meditation Currant Bun 4 of 4.txt",0,algorithms,"Protector from Headache in Meditation Currant Bun 4 of 4"]

/*
?- headache_prevention
|    .
Do you get headaches? (y/n)?
|: y
Do you meditate? (y/n)?
|: n
I recommend meditation
Do you use anti-headache meditation? (y/n)?
|: n
I recommend Lucian Green's Headache Prevention App.
true.

?- headache_prevention.
Do you get headaches? (y/n)?
|: n
true.
*/

headache_prevention :-
 writeln("Do you get headaches? (y/n)?"),
 read_string(user_input,"\n\r","\n\r",_,S1),
 (S1="y"->
 (writeln("Do you meditate? (y/n)?"),
 read_string(user_input,"\n\r","\n\r",_,S2),
 (S2="n"->
 writeln("I recommend meditation");true),
 writeln("Do you use anti-headache meditation? (y/n)?"),
 read_string(user_input,"\n\r","\n\r",_,S3),
 (S3="n"->
 writeln("I recommend Lucian Green's Headache Prevention App.");true)
 );true),!.
 
% ["Short Arguments","No Radiation 4 of 25 (final).txt",0,algorithms,"3. I prepared to cover travelling in the time machine with meditation.  I did this by stating that the body returns to normal after time travelling like a beating flagella with meditation.  First, I meditated.  Second, I time travelled.  Third, I meditated again."]

qa_tt("Have you meditated before time travel?","You may now time travel.").
qa_tt("Have you time travelled?","You may now meditate.").
qa_tt("Have you meditated?","Good").

/*
?- qa_tt1.
Have you meditated before time travel?
(y/n)?
|: y
You may now time travel.
Have you time travelled?
(y/n)?
|: y
You may now meditate.
Have you meditated?
(y/n)?
|: y
Good
true.

?- qa_tt1.
Have you meditated before time travel?
(y/n)?
|: n
% Execution Aborted
*/

qa_tt1 :-
findall(_,(qa_tt(Q,A),writeln(Q),writeln("(y/n)?"),read_string(user_input,"\n\r","\n\r",_,S),
(S="y"->writeln(A);abort)),_),!.

:- include('../listprologinterpreter/listprolog.pl').

/*
?- qa_tt2(2).
*** Journey 1 ***
Have you meditated before time travel?
(y/n)?
|: y
You may now time travel.
Have you time travelled?
(y/n)?
|: y
You may now meditate.
Have you meditated?
(y/n)?
|: y
Good
*** Journey 2 ***
Have you meditated before time travel?
(y/n)?
|: y
You may now time travel.
Have you time travelled?
(y/n)?
|: y
You may now meditate.
Have you meditated?
(y/n)?
|: y
Good
true.

?- qa_tt2(2).
*** Journey 1 ***
Have you meditated before time travel?
(y/n)?
|: n
% Execution Aborted
*/

qa_tt2(Journeys) :-
 numbers(Journeys,1,[],JN),
 %length(JL,Journeys),
 findall(_,(member(JN1,JN),write("*** Journey "),write(JN1),writeln(" ***"),qa_tt1),_),!.

% 22-22=0
