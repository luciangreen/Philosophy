:-include('../listprologinterpreter/listprolog.pl').

bell(Spoken_notification) :-
 %alarm_clock(H,M),
 /*
 string_codes(S,[101, 99, 104, 111, 32, %022, %86,
  007%, 71
  ]),*/
 foldr(string_concat,["afplay /System/Library/Sounds/Funk.aiff\nsay \""%done"%"echo "
 ,%""%
 Spoken_notification,
 "\""],S1),
 shell1_s(S1).
