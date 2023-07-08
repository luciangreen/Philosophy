#!/usr/bin/swipl -f -q

:-include('text_to_breasonings.pl').
:- initialization(catch(main, Err, handle_error(Err))).

handle_error(_Err):-
  halt(1).
main :-
	texttobr2(u,u,"square",u),
    nl,
    halt.
main :- halt(1).
