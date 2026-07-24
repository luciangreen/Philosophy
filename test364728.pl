#!/usr/bin/swipl -g main -q

:-include('../Text-to-Breasonings/text_to_breasonings.pl').
handle_error(_Err):-
  halt(1).
main :-
    catch(call_with_time_limit(2000,(N=u,M=u,texttobr2(N,u,"_1176",M,[auto,on]),texttobr(N,u,"_1176",M))), Err, handle_error(Err)), nl,
    halt.
main :- halt(1).
