% Writes proofgame_io/ios.txt and proofgame_io/ios.pl from proofgame_io/cases.pl: swipl proofgame_io/make_ios.pl
:- initialization(main, main).
:- prolog_load_context(directory, D), atom_concat(D, '/ios_engine.pl', E), use_module(E).
:- prolog_load_context(directory, D), atom_concat(D, '/cases.pl', C), consult(C).
main :- ios_engine:make_ios.
