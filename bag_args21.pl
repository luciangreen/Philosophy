#!/usr/bin/swipl -f -q

:-include('bag_args2.pl').
:- initialization(catch(main, Err, handle_error(Err))).

handle_error(_Err):-
  halt(1).
main :-
    bag_args(112000), nl,
    halt.
main :- halt(1).
