#!/usr/bin/swipl -f -q

:-set_prolog_stack(global, limit(80 000 000 000)).

:-include('bag_args2.pl').
:- initialization(catch(main, Err, handle_error(Err))).

handle_error(_Err):-
  halt(1).
main :-
    (bag_args(6000,Br)->true;Br=0),
    write(Br),
    nl,
    halt.
main :- halt(1).
