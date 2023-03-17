% 17 3 23

:- include('../listprologinterpreter/listprolog.pl').
:- include('replace1.pl').

n_breasonings(N) :- N is 80.

n_breasonings_every_hours(N) :- N is 24.

today(Y,M,D) :- date(Y, M, D).

% set alarms from a date, recurring (every n minutes, hours, days, months or years), a number of times

set_alarm(["from",Y,Mo,D,H,Mi,S,SS],["recurring every",N,Units],[M,"times"],Alarms) :-
 date_time_stamp(date(Y,Mo,D,H,Mi,S,SS,-,-),From_date),
 M3 is M-1,
 numbers(M3,0,[],M1),
 (Units = "second" ->
 (N<1->
 (S2 is 0+N,
 date_time_stamp(date(Y,Mo,D,H,Mi,S,S2,-,-),From_date2)
 )
 ;
 (N>=1->
 (S2 is 0+S,
 date_time_stamp(date(Y,Mo,D,H,Mi,S2,SS,-,-),From_date2)
 )))
 ;
 (Units = "minute" ->
 (Mi3 is Mi+N,
 date_time_stamp(date(Y,Mo,D,H,Mi3,S,SS,-,-),From_date2)
 )
 ;
 (Units = "hour" ->
 (H3 is H+N,
 date_time_stamp(date(Y,Mo,D,H3,Mi,S,SS,-,-),From_date2)
 )
 ;
 (Units = "day" ->
 (D3 is D+N,
 date_time_stamp(date(Y,Mo,D3,H,Mi,S,SS,-,-),From_date2)
 )
 ;
 (Units = "month" ->
 (Mo3 is Mo+N,
 date_time_stamp(date(Y,Mo3,D,H,Mi,S,SS,-,-),From_date2)
 )
 ;
 (Units = "year" ->
 (Y3 is Y+N,
 date_time_stamp(date(Y3,Mo,D,H,Mi,S,SS,-,-),From_date2)
 )
 )))))),
 
 Stamp_d is From_date2-From_date,
 findall([Y2,Mo2,D2,H2,Mi2,S12,S22],(member(M2,M1),D is M2*Stamp_d,
 Stamp2 is From_date+D,
 stamp_date_time(Stamp2,date(Y2,Mo2,D2,H2,Mi2,S12,S22,_,_),local)
 ),Alarms).
 
% set an alarm to set the alarm

warn_set_alarm(Text) :- Text = "Please remember to set the new set of alarms for:".

% test whether an alarm is today (or now x) (if it after the alarm time)

test_alarm(["alarm",Y,Mo,D,H,Mi,S,SS]) :-
 get_time(Now),
 date_time_stamp(date(Y,Mo,D,H,Mi,S,SS,-,-),Alarm_stamp),
 (Alarm_stamp > Now -> writeln("Alarm has gone off.");true).
 
% perform an action on an alarm, such as sending an email

send_email(Title,From_email,FileName) :- 
(current_prolog_flag(arch,'arm64-darwin')->
writeln("Mac needs email to be configured.")
;
(
foldr(atom_concat,['echo "" | mutt -s "',Title,'" ',From_email,' -a ',FileName],A1),

shell1(A1))).


email_formatter(T,TE,FE,M) :-
 writeln("What is the title?"),read_string(user_input,"\n\r","\n\r",_,T),
 writeln("What is the to email?"),read_string(user_input,"\n\r","\n\r",_,TE),
 writeln("What is the from email?"),read_string(user_input,"\n\r","\n\r",_,FE),
 writeln("What is the message body?"),read_string(user_input,"\n\r","\n\r",_,M).

search_address_book(Book,Name,Number) :-
 member([Name1,Number],Book),
 sub_string(Name1,_,_,_,Name).
 
contact_or_delete(Person):-
 writeln(["Would you like to contact",Person,"again or delete their contact information? (y/n)"]),
 read_string(user_input,"\n\r","\n\r",_,R),
 (R="y"->writeln("Contact kept");writeln("Contact deleted")).
 
write_press_release(T,PR,D) :-
 writeln("What is the title of the press release?"),read_string(user_input,"\n\r","\n\r",_,T),
 writeln("What is the press release?"),read_string(user_input,"\n\r","\n\r",_,PR),
 writeln("What should the reader do?"),read_string(user_input,"\n\r","\n\r",_,D).
 
press_release_reminders :-
 write_5_as, copywriting, 
 write_5_as_education, copywriting_education,
 write_5_as_business, copywriting_business.

write_5_as.
copywriting.
copywriting_education.
copywriting_business.

organise_course :-
 press_release_reminders.
  
organise_lesson :-
 book_classroom,
 advertise,
 teach.
 
book_classroom.
advertise.
teach.

sale(Interested) :-
 (Interested="y"->reward;mistakes).
 
reward.
mistakes.

teach1 :-
 write_h1s,write_book,write_lecture.
 
write_h1s.
write_book.
write_lecture.
