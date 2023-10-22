% 22 10 23

% 35 algs v over

/*
algs
medicine prob and sol
sim's medit, medic, tt have enough As
*/

:- include('../listprologinterpreter/listprolog.pl').
:- include('../Text-to-Breasonings/text_to_breasonings.pl').
%:-include('21 10 23.pl').

/*
?- qa_tt3(1).
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
true.
*/

qa_tt([*,meditation_As],_).
qa_tt("Have you meditated before time travel?","You may now time travel.").
qa_tt([*,meditation_As],_).
qa_tt([*,time_travel_As],_).
qa_tt("Have you time travelled?","You may now meditate.").
qa_tt("Have you meditated?","Good").
qa_tt([*,medicine_problems_and_solutions],_).
qa_tt([*,immortality_medicine],_).

qa_tt1 :-
findall(_,(qa_tt(Q,A),(Q=[*,P]->P;(writeln(Q),writeln("(y/n)?"),read_string(user_input,"\n\r","\n\r",_,S),
(S="y"->writeln(A);abort)))),_),!.

qa_tt3(Journeys) :-
 numbers(Journeys,1,[],JN),
 %length(JL,Journeys),
 findall(_,(member(JN1,JN),write("*** Journey "),write(JN1),writeln(" ***"),qa_tt1),_),!.
 
four_by_fifty_As :-
	texttobr2_1(64),!.
 
meditation_As :-
	four_by_fifty_As,!.
	
time_travel_As :-
	four_by_fifty_As,!.

immortality_medicine :-
	findall(_,(medicine(_),four_by_fifty_As),_),!.

medicine_problems_and_solutions :-
	findall(_,(medicine(_),(problem->four_by_fifty_As;true)),_),!.

problem :-
	random(X),X1 is floor(X*2),X1=0.
	
medicine("A").
medicine("B").
medicine("B to B").
medicine("Immortality").
medicine("Body replacement").
medicine("Anti-ageing medicine").
medicine("memory").
medicine("thinking").
medicine("stopping dementia").
medicine("seeing clearly").
medicine("muscle relaxation").
medicine("Circulatory system / Cardiovascular system").
medicine("Digestive system and Excretory system").
medicine("Endocrine system").
medicine("Integumentary system / Exocrine system").
medicine("Immune system and lymphatic system:").
medicine("Muscular system").
medicine("Nervous system").
medicine("Renal system and Urinary system").
medicine("Reproductive system").
medicine("Respiratory system").
medicine("Skeletal System").
medicine("antidepressant").
medicine("antipsychotic").
medicine("Other medicines for the body").
