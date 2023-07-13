#!/usr/bin/swipl --stack-limit=80G -f -q

:-include('bag_args2.pl').
:- initialization(catch(main, Err, handle_error(Err))).

handle_error(_Err):-
  halt(1).
main :-
    (bag_args(6000)->true;true),
    nl,
    halt.
main :- halt(1).
