#!/usr/bin/swipl -f -q

:-include('../listprologinterpreter/listprolog.pl').
:- use_module(library(date)).

%:-include('../listprologinterpreter/la_files.pl').

%:- initialization(catch(main, Err, handle_error(Err))).

handle_error(_Err):-
  halt(1).
main :-

/*
date_time_stamp(date(2023,1,1,1,0,0,_,_,_),TS0),
date_time_stamp(date(2023,1,2,1,0,0,_,_,_),TS01),
TSD is TS01-TS0,

get_time(TS1),
In_a_day is TS1+TSD,


Hours=[9,12,15],

get_time(TS),stamp_date_time(TS,date(Year,Month,Day,Hour1,Minute1,Seconda,_A,_TZ,_False),local),

findall(TSA0,(member(H,Hours),date_time_stamp(date(Year,Month,Day,H,0,0,_,_,_),TSA0)),TSAA),

*/
BL is 5*16000*8,
day_loop(BL,0%,In_a_day,TSAA
),

 	nl,
    halt.
main :- halt(1).


day_loop(Br_lim,Br%NB,In_a_day,TSA
) :-

%get_time(TS1),
(Br>Br_lim->true;
(
foldr(string_concat,["swipl -f -q ./bag_args21.pl"],S3)%,
,catch(bash_command(S3,_), _, (foldr(string_concat,["Warning."%%"Error: Can't clone ",User3,"/",Repository3," repository on GitHub."
	],_Text4),%writeln1(Text4),
	true%fail%abort
 	)),

foldr(string_concat,["swipl -f -q ./bag_algs1.pl"],S31)%,
,catch(bash_command(S31,_), _, (foldr(string_concat,["Warning."%%"Error: Can't clone ",User3,"/",Repository3," repository on GitHub."
	],_Text4),%writeln1(Text4),
	true%fail%abort
 	)),

%get_time(TS1),
Br1 is Br+6000,

/*
findall(TS2,(member(TS2,TSA),TS1>TS2,

%foldr(atom_concat,['echo "" | mutt -s "Alarm ',NB1,' Breasonings" luciangreen@lucianacademy.com',''],A1),

%shell1(A1)

 foldr(string_concat,["afplay /System/Library/Sounds/Funk.aiff\nsay \" Alarm "%done"%"echo "
 ,%""%
 NB1,
 "\" Breasonings"],S1),
 shell1_s(S1)
 
),TS3),
subtract(TSA,TS3),

*/
%atom_concat('echo "" | mutt -s "BAG Day Test" luciangreen@lucianacademy.com','',A1),

%shell1(A1)

 	day_loop(Br_lim,Br1%NB1,In_a_day,TS3
 	)
 	
 	)),!.

 