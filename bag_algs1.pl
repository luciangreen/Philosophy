#!/usr/bin/swipl --stack-limit=80G -f -q

:-include('bag_algs.pl').
:- initialization(catch(main, Err, handle_error(Err))).

handle_error(_Err):-
  halt(1).
main :-
    (bag_algs(6000,Br)->true;Br=0),
    write(Br),
 	nl,
    halt.
main :- halt(1).
