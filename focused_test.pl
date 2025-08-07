% Focused test for nnconverter core functionality

test_basic_functionality :-
    writeln('=== Testing Core Functionality ==='),
    
    % Test 1: Basic induction
    writeln('1. Testing basic induction:'),
    induct([c,d], Output1, [], Commands1),
    write('   [c,d] -> '), write(Output1), write(' via '), writeln(Commands1),
    
    % Test 2: Reverse pattern
    writeln('2. Testing reverse pattern:'),
    induct([a,b,c], Output2, [], Commands2),
    write('   [a,b,c] -> '), write(Output2), write(' via '), writeln(Commands2),
    
    % Test 3: Pattern discovery
    writeln('3. Testing pattern discovery:'),
    Examples = [[[a,b,c], [c,b,a]], [[1,2,3], [3,2,1]]],
    discover_patterns(Examples, Patterns),
    write('   Patterns found: '), writeln(Patterns),
    
    % Test 4: Neural network training
    writeln('4. Testing neural network training:'),
    TrainingData = [[[x,y], x:y], [[p,q], p:q]],
    train_network(TrainingData, 2),
    writeln('   Training completed successfully'),
    
    % Test 5: Show learned weights
    writeln('5. High-confidence weights:'),
    findall(W-Cmd-In-Out, 
            (command_weight(Cmd,In,Out,W), W > 0.7), 
            HighWeights),
    maplist(write_weight, HighWeights),
    
    % Test 6: Ensemble learning  
    writeln('6. Testing ensemble learning:'),
    ensemble_induct([m,n], EnsembleOutput, EnsembleCommands),
    write('   [m,n] -> '), write(EnsembleOutput), write(' via '), writeln(EnsembleCommands),
    
    writeln('=== All tests completed successfully ===').

write_weight(W-Cmd-In-Out) :-
    write('   '), write(Cmd), write(': '), write(In), write(' -> '), write(Out), 
    write(' (weight: '), write(W), writeln(')').

% Run focused test
run_focused_test :-
    consult('nns_alg_writer.pl'),
    test_basic_functionality.