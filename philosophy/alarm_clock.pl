%% alarm_clock.pl - used to send a report at the same time each day

:- use_module(library(date)).

/**
main :-
	alarm_clock.
main :- halt(1).
**/

%% alarm_clock(21,30).

alarm_clock(Hour_a,Minute_a) :-
				get_time(TS1),stamp_date_time(TS1,date(Year1,Month1,Day1,_,_,Second1,_,_,_),local),

%writeln([timenow,[Year1,Month1,Day1,_,_,Second1,_,_,_]]),

date_time_stamp(date(Year1,Month1,Day1,Hour_a,Minute_a,Second1,_,_,_),TS2),

%writeln([try_alarm,[Year1,Month1,Day1,Hour_a,Minute_a,Second1,_,_,_]]),

%writeln([ts,TS,ts2,TS2]),
	(TS1>=TS2->(Day12 is Day1+1,
	date_time_stamp(date(Year1,Month1,Day12,Hour_a,Minute_a,Second1,_,_,_),TS3));
	(_Day12=Day1,TS3=TS2)),
	
	/**
	((Hour1=Hour_a,Minute1>=Minute_a)->
	(Hour12=Hour1,Day12 is Day);
	(%Hour11 is Hour1+1,
	Hour12 is mod(Hour1,24),
	Day12 is Day+1)),
	**/
	
%date_time_stamp(date(Year,Month,Day12,Hour12,Minute_a,Seconda,_,_,_),_TS2),
%writeln(date(year,Year1,month,Month1,day,Day12,hour,Hour_a,minute,Minute_a,second,Second1)),

DTS is TS3-TS1,
writeln([sleeping,DTS]),
sleep(DTS),
writeln(alarm).
	
