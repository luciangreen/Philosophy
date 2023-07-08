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

day_loop(In_a_day),

 	nl,
    halt.
main :- halt(1).


day_loop(In_a_day) :-

get_time(TS1),
(TS1>In_a_day->true;
(
foldr(string_concat,["./day.sh"],S3)%,
,catch(bash_command(S3,_), _, (foldr(string_concat,["Warning."%%"Error: Can't clone ",User3,"/",Repository3," repository on GitHub."
	],_Text4),%writeln1(Text4),
	fail%abort
 	)),


%atom_concat('echo "" | mutt -s "BAG Day Test" luciangreen@lucianacademy.com','',A1),

%shell1(A1)

 	day_loop(In_a_day)
 	
 	)),!.

 