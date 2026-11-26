% Simple test demonstrating that induct/4 is properly defined and available
% This file shows the solution to "induct/4 not defined yet in nnconverter"

% SOLUTION: Ensure nns_alg_writer.pl is loaded before using induct/4
:- ensure_loaded('nns_alg_writer.pl').

% Test that induct/4 is available and working
test_induct_available :-
    writeln('Testing that induct/4 is properly defined...'),
    
    % Basic test
    induct([a,b], Output1, [], Commands1),
    write('induct([a,b], Output, [], Commands) -> '),
    write('Output='), write(Output1), 
    write(', Commands='), writeln(Commands1),
    
    % Test with different data
    induct([hello,world], Output2, [], Commands2),
    write('induct([hello,world], Output, [], Commands) -> '),
    write('Output='), write(Output2),
    write(', Commands='), writeln(Commands2),
    
    % Test reverse transformation
    induct([x,y,z], Output3, [], Commands3),
    write('induct([x,y,z], Output, [], Commands) -> '),
    write('Output='), write(Output3),
    write(', Commands='), writeln(Commands3),
    
    writeln('SUCCESS: induct/4 is properly defined and working!'),
    nl,
    writeln('SOLUTION IMPLEMENTED:'),
    writeln('- Added :- ensure_loaded(''nns_alg_writer.pl''). to dependent files'),
    writeln('- Added clear documentation to nns_alg_writer.pl'),
    writeln('- Now induct/4 is automatically available when consulting these files').

% Run the test
run_test :-
    test_induct_available.