#!/usr/bin/swipl -f -q

:-include('../listprologinterpreter/listprolog.pl').
:- use_module(library(date)).

%:-include('../listprologinterpreter/la_files.pl').
:- initialization(catch(main, Err, handle_error(Err))).

handle_error(_Err):-
  halt(1).
main :-

date_time_stamp(date(2023,1,1,1,0,0,_,_,_),TS0),
date_time_stamp(date(2023,1,2,1,0,0,_,_,_),TS01),
TSD is TS01-TS0,

get_time(TS1),
In_a_day is TS1+TSD,


Hours=[9,12,15],

get_time(TS),stamp_date_time(TS,date(Year,Month,Day,Hour1,Minute1,Seconda,_A,_TZ,_False),local),

findall(TSA0,(member(H,Hours),date_time_stamp(date(Year,Month,Day,H,0,0,_,_,_),TSA0)),TSAA),


day_loop(0,In_a_day,TSAA),

 	nl,
    halt.
main :- halt(1).


day_loop(NB,In_a_day,TSA) :-

get_time(TS1),
(TS1>In_a_day->true;
(
foldr(string_concat,["./day.sh"],S3)%,
,catch(bash_command(S3,_), _, (foldr(string_concat,["Warning."%%"Error: Can't clone ",User3,"/",Repository3," repository on GitHub."
	],_Text4),%writeln1(Text4),
	fail%abort
 	)),

%get_time(TS1),
NB1 is NB+6000,

findall(TS2,(member(TS2,TSA),TS1>TS2,

foldr(atom_concat,['echo "" | mutt -s "Alarm ',NB1,' Breasonings" luciangreen@lucianacademy.com',''],A1),

shell1(A1)

),TS3),
subtract(TSA,TS3),


%atom_concat('echo "" | mutt -s "BAG Day Test" luciangreen@lucianacademy.com','',A1),

%shell1(A1)

 	day_loop(NB1,In_a_day,TS3)
 	
 	)),!.

 