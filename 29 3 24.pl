% 29 3 23.pl

% ["Creating and Helping Pedagogues","CREATE AND HELP PEDAGOGUES by Lucian Green Daily Professional Requirement of the Pedagogy Helper 3 of 5.txt",0,algorithms,"23.    The self examined that the work was finished on time.  The self knew that pedagogy Aigs helpers helped.  The self observed the helper help the self.  The self saw the second helper help.  The second helper also helped the self."]

% The self examined that the work was finished on time.
% The day's life accreditation and work breasonings were completed each day.

% calculates needed background helping breasonings according to one's time travel schedule and whether new breasonings will be written 

%:- use_module(library(date)).

:-include('../listprologinterpreter/listprolog.pl').

% (guess before 12PM x) br from now to tt (poss after walk, nap)
% continue using alg, ask whether in 2024 or 5689, if 2024 2*80 br, if 5689, now-11 AM next day

schedule :-

get_time(TS),stamp_date_time(TS,date(YearValue,MonthValue,DayValue,HourValue,MinuteValue,_SecondsValue1,_A,_TZ,_False),local),

 foldr(string_concat,["Scheduler\n\n","The time now is ",HourValue,":",MinuteValue,".\n\n"],B),
 writeln(B),

 writeln("Will you go for a walk (y/n)?"),
 read_string(user_input,"\n\r","\n\r",_,S1),
 (S1="y"->(writeln("How many minutes will it take (including preparations)?"),
 read_string(user_input,"\n\r","\n\r",_,S2),
 number_string(N2,S2));N2=0),
 
 writeln("Will you have a nap afterwards (y/n)?"),
 read_string(user_input,"\n\r","\n\r",_,S3),
 (S3="y"->(writeln("How many minutes will it take?"),
 read_string(user_input,"\n\r","\n\r",_,S4),
 number_string(N4,S4));N4=0),
 %trace,
 C is 60*(N2+N4),

 %date_time_stamp(date(YearValue,DayValue,HourValue,MinuteValue,0,0,-,-),Value1A),
 D is TS%Value1A
 +C,
 
 E is ceiling((N2+N4)/60),
 F is E*5,
 stamp_date_time(D,date(_,_,_,HourValue1,MinuteValue1,_SecondsValue,_A1,_TZ1,_False1),local),
foldr(string_concat,["I assume you will time travel after ",HourValue1,":",MinuteValue1,".\n\n","You will need ",E,"*5=",F," breasonings.\n\n","Press <Return> when you have time travelled."],G),
 writeln(G),
 get_single_char(_),
 writeln("You will need 160 breasonings at your first destination.\n\nPlease press <Return> when you have time travelled after this."),
 get_single_char(_),
 
 get_time(TS1),stamp_date_time(TS1,date(_,_,_,HourValue2,_MinuteValue2,_,_,_,_),local),
 
 H is 11+(24-HourValue2),
 J is H*5,

 foldr(string_concat,["\n\n","You will need ",H,"*5=",J," breasonings until 11 AM tomorrow.\n\n","Thank you."],K),
 writeln(K),
 !.

% 3 algs

% paraph mr

