% 19 3 23.pl

% 28 algs needed

% ["Computational English","COMPUTATIONAL ENGLISH by Lucian Green Derivability 3 of 4.txt",0,algorithms,"23.   I prepared to be perfectly healthy.  I did this by writing 10 80-breasoning subjects to be with-it in a Medicine degree.  First, I wrote the organ subjects.  Second, I wrote the theological surgery subjects.  Third, I wrote the organ sutra subjects.  In this way, I prepared to be perfectly healthy by writing 10 80-breasoning subjects to be with-it in a Medicine degree."]

:-include('../Text-to-Breasonings/text_to_breasonings.pl').

healthy(circulatory_system_and_cardiovascular_system):-random(X),X1 is round(10*X),texttobr2(X1).%if nothing else is wrong, is there anything wrong?
healthy(digestive_system_and_excretory_system):-random(X),X1 is round(10*X),texttobr2(X1).%if nothing else is wrong, is there anything wrong?
healthy(endocrine_system):-random(X),X1 is round(10*X),texttobr2(X1).%if nothing else is wrong, is there anything wrong?
healthy(integumentary_system_and_exocrine_system):-random(X),X1 is round(10*X),texttobr2(X1).%if nothing else is wrong, is there anything wrong?
healthy(immune_system_and_lymphatic_system):-random(X),X1 is round(10*X),texttobr2(X1).%if nothing else is wrong, is there anything wrong?
healthy(muscular_system):-random(X),X1 is round(10*X),texttobr2(X1).%if nothing else is wrong, is there anything wrong?
healthy(nervous_system):-random(X),X1 is round(10*X),texttobr2(X1).%if nothing else is wrong, is there anything wrong?
healthy(renal_system_and_urinary_system):-random(X),X1 is round(10*X),texttobr2(X1).%if nothing else is wrong, is there anything wrong?
healthy(reproductive_system):-random(X),X1 is round(10*X),texttobr2(X1).%if nothing else is wrong, is there anything wrong?
healthy(respiratory_system):-random(X),X1 is round(10*X),texttobr2(X1).%if nothing else is wrong, is there anything wrong?
healthy(skeletal_system):-random(X),X1 is round(10*X),texttobr2(X1).%if nothing else is wrong, is there anything wrong?

% run daily

run_daily:-findall(_,(healthy(A),writeln1([A,"healthy"])),_).

run_for_each_place(N):-numbers(N,1,[],Ns),findall(_,(member(N1,Ns),writeln([place,N1]),run_daily,nl),_).

br_n_calculator(Text,Br_n_required,Gl_br_n_required) :-
 SepandPad="#@~%`$?-+*^,()|.:;=_/[]<>{}\n\r\s\t\\!'\"0123456789",
 split_string(Text,"\n\r.","\n\r.",Text2),
 length(Text2,L2),
 writeln(["Number of lines and sentences:",L2]),
 split_string(Text,SepandPad,SepandPad,Text3),
 length(Text3,L3),
 writeln(["Number of words:",L3]),
 Gl_br_n_required is round(125*Br_n_required-L2),
 writeln(["Number of GL breasonings required for",Br_n_required,"breasonings:",Gl_br_n_required]).
 
find1(Text,String,List) :- find11(Text,String,[],List).
find11(Text,String,List1,List2):-not(sub_string(Text,_A,_B,_C,String)),append(List1,[Text],List2),!.
find11(Text,String,List1,List2):-sub_string(Text,A,_B,C,String),!,sub_string(Text,0,A,_,String2),
sub_string(Text,_,C,0,String3),append(List1,[String2,String],List3),find11(String3,String,List3,List2).

%replace within words
% 19 algs done

organ_sutra :- findall(_,(healthy(Organ),texttobr2(1),writeln(["Organ sutra for:",Organ])),_).

theological_surgery :- findall(_,(healthy(Organ),texttobr2(1),writeln(["I am happy with my",Organ,"organ"])),_).

%["Short Arguments","Part_of_Room.txt",0,algorithms,"10. I prepared to admit that it was this planet and that the sky was 1 metre above the ground.  I did this by stating that where the planetary outpost was a building, the space station was itself.  First, I noticed the building on a planet.  Second, I noticed the space station in the sky.  Third, I went from Earth, to the space station, to the planetary outpost."]

% go1("Earth","planetary outpost").                                            

go1(A,A):-!.
go1(A,B) :- link1(A,C),go1(C,B),!.
link1("Earth","space station").
link1("space station","planetary outpost").

% 26 done

% ["Time Travel","Interesting histories to visit 2.txt",0,algorithms,"43. The character from history wanted an optimised algorithm."]

%minimise_dfa([[a,b],[a,c],[b,d],[c,d],[d,a]],Min_dfa).
%Min_dfa=[[a,b],[b,d],[d,a]]
minimise_dfa(T,DFA) :-
 minimise_dfa(T,T,DFA),!.

minimise_dfa([],DFA,DFA) :- !.
minimise_dfa(Transitions,DFA1,DFA2) :-
 Transitions=[T2|T3],
 %append(DFA1,[T2],DFA4),
 DFA1=DFA4,
 minimise_dfa2(T2,T3,DFA4,DFA3),
 minimise_dfa(T3,DFA3,DFA2).

minimise_dfa2(T2,T3,DFA1,DFA2) :-
 T2=[From,To],
 ((minimise_dfa3(From,To,T3,[],DFA3),
 %append(DFA3,[T2],DFA2),
 subtract(T3,DFA3,DFA4),
 append([T2],DFA4,DFA2)
 )->true;
 DFA1=DFA2),!.
 
minimise_dfa3(From,To,T3,DFA1,DFA3) :-
 T3=[T4|_T5],
 T4=[From,To2],
 member([From,To],T3),
 %not(To2=To),
 %DFA1=DFA3,
 append(DFA1,[[From,To]],DFA3),
 %minimise_dfa3(To1,To2,T5,DFA3,DFA2),
 !.
minimise_dfa3(From,To,T3,DFA1,DFA2) :-
 T3=[T4|T5],
 T4=[From,To1],
 member([To,To2],T3),
 append(DFA1,[T4],DFA3),
 %DFA1=DFA3,
 minimise_dfa3(To1,To2,T5,DFA3,DFA2),!.
minimise_dfa3(From,To,T3,DFA1,DFA2) :-
 T3=[T4|T5],
 not(T4=[From,_To1]),
 %member([To,To2],T3),
 %append(DFA1,[T4],DFA3),
 minimise_dfa3(From,To,T5,DFA1,DFA2),!.
 
%% 33 algs
