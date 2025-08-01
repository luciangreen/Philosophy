% Simple test file for neuronet converter
% Run with: swipl -q -t "test_neuronet, halt" test_neuronet.pl

:- use_module(neuronet_converter).

% Test the neuronet converter with a simple example
test_neuronet :-
    writeln('Testing Neuronet Converter...'),
    
    % Simple sum_list algorithm
    Algorithm = [
        (sum_list([], 0) :- true),
        (sum_list([H|T], S) :- sum_list(T, S1), S is H + S1)
    ],
    
    writeln('Input Algorithm:'),
    maplist(writeln, Algorithm),
    nl,
    
    % Test individual components
    writeln('--- Complexity Analysis ---'),
    complexity_finder(Algorithm, Complexity),
    maplist(writeln, Complexity),
    nl,
    
    writeln('--- Type Inference ---'),
    type_finder(Algorithm, Types),
    maplist(writeln, Types),
    nl,
    
    writeln('--- Inductive Transformation ---'),
    inductive_transform(Algorithm, Inductive),
    maplist(writeln, Inductive),
    nl,
    
    writeln('--- Full Conversion ---'),
    convert_algorithm(Algorithm, Neuronet),
    writeln('Conversion completed successfully!'),
    nl,
    
    writeln('Neuronet structure:'),
    writeln(Neuronet),
    
    writeln('Test completed successfully!').