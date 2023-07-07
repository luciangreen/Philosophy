#!/usr/bin/swipl -f -q

:-include('bag_algs.pl').
:- initialization(catch(main, Err, handle_error(Err))).

handle_error(_Err):-
  halt(1).
main :-
    bag_algs(6000),
    bag_algs(6000),
    bag_algs(6000),
    bag_algs(6000),
    bag_algs(6000),
    bag_algs(6000),
    bag_algs(6000),
    bag_algs(6000),
    bag_algs(6000),
    bag_algs(6000),

    bag_algs(6000),
    bag_algs(6000),
    bag_algs(6000),
    bag_algs(6000),
    bag_algs(6000),
    bag_algs(6000),
 	nl,
    halt.
main :- halt(1).
