:-include('../listprologinterpreter/listprolog.pl').
main:-catch((shell1_s("swipl --stack-limit=80G --goal=main --stand_alone=true -o cat_arg_files -c cat_arg_files1.pl"),
shell1_s("./cat_arg_files")),Err,handle_error(Err)),halt.

handle_error(_Err):-
  halt(1).
main :- halt(1).