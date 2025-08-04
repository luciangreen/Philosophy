% Test file for enhanced nnconverter functionality
% Run with: swipl -g "consult('nns_alg_writer.pl'), consult('test_nnconverter.pl'), run_all_tests."

% Test basic functionality
test_basic_induction :-
    writeln('Testing basic induction...'),
    induct([c,d], Output, [], Commands),
    writeln('Input: [c,d]'),
    write('Output: '), writeln(Output),
    write('Commands: '), writeln(Commands),
    nl.

% Test enhanced multi-step induction  
test_chain_induction :-
    writeln('Testing chain induction...'),
    induct_chain([a,b], Output, [], Commands, 2),
    writeln('Input: [a,b]'),
    write('Output: '), writeln(Output),
    write('Commands: '), writeln(Commands),
    nl.

% Test pattern discovery
test_pattern_discovery :-
    writeln('Testing pattern discovery...'),
    Examples = [[[a,b,c], [c,b,a]], [[1,2,3], [3,2,1]], [[x,y], [y,x]]],
    discover_patterns(Examples, Patterns),
    write('Examples: '), writeln(Examples),
    write('Discovered patterns: '), writeln(Patterns),
    nl.

% Test fuzzy matching
test_fuzzy_matching :-
    writeln('Testing fuzzy type matching...'),
    fuzzy_match_types([a,b], [b,a], SimilarTypes),
    write('Input: [a,b], Output: [b,a]'), nl,
    write('Similar types: '), writeln(SimilarTypes),
    nl.

% Test neural network training
test_neural_training :-
    writeln('Testing neural network training...'),
    TrainingExamples = [[[a,b], [b,a]], [[c,d], [d,c]], [[1,2], [2,1]]],
    train_network(TrainingExamples),
    writeln('Training completed.'),
    % Show learned weights
    findall(weight(Cmd,In,Out,W), command_weight(Cmd,In,Out,W), Weights),
    write('Learned weights: '), writeln(Weights),
    nl.

% Test ensemble learning
test_ensemble_learning :-
    writeln('Testing ensemble learning...'),
    ensemble_induct([x,y], Output, Commands),
    writeln('Input: [x,y]'),
    write('Output: '), writeln(Output),
    write('Commands: '), writeln(Commands),
    nl.

% Test new type definitions
test_new_types :-
    writeln('Testing new type definitions...'),
    findall(type(Cmd,In,Out), type(Cmd,In,Out), AllTypes),
    length(AllTypes, NumTypes),
    write('Total type definitions: '), writeln(NumTypes),
    writeln('Sample types:'),
    take(5, AllTypes, SampleTypes),
    maplist(writeln, SampleTypes),
    nl.

% Helper predicate to take first N elements
take(0, _, []) :- !.
take(_, [], []) :- !.
take(N, [H|T], [H|Rest]) :-
    N > 0,
    N1 is N - 1,
    take(N1, T, Rest).

% Run all tests
run_all_tests :-
    writeln('Starting nnconverter tests...'),
    nl,
    test_new_types,
    test_basic_induction,
    test_chain_induction,
    test_pattern_discovery,
    test_fuzzy_matching,
    test_neural_training,
    test_ensemble_learning,
    writeln('All tests completed!').

% Interactive test menu
test_menu :-
    writeln('nnconverter Test Menu:'),
    writeln('1. Basic induction test'),
    writeln('2. Chain induction test'),
    writeln('3. Pattern discovery test'),
    writeln('4. Fuzzy matching test'),
    writeln('5. Neural network training test'),
    writeln('6. Ensemble learning test'),
    writeln('7. Type definitions test'),
    writeln('8. Run all tests'),
    writeln('9. Exit'),
    write('Enter choice (1-9): '),
    read(Choice),
    handle_choice(Choice).

handle_choice(1) :- test_basic_induction, test_menu.
handle_choice(2) :- test_chain_induction, test_menu.
handle_choice(3) :- test_pattern_discovery, test_menu.
handle_choice(4) :- test_fuzzy_matching, test_menu.
handle_choice(5) :- test_neural_training, test_menu.
handle_choice(6) :- test_ensemble_learning, test_menu.
handle_choice(7) :- test_new_types, test_menu.
handle_choice(8) :- run_all_tests, test_menu.
handle_choice(9) :- writeln('Goodbye!').
handle_choice(_) :- writeln('Invalid choice. Try again.'), test_menu.