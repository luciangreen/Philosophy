% Final comprehensive demo of nnconverter functionality

demo_nnconverter :-
    writeln('====================================================='),
    writeln('      Neural Network Converter (nnconverter) Demo'),
    writeln('====================================================='),
    nl,
    
    % Demo 1: Basic Pattern Matching
    writeln('1. BASIC PATTERN MATCHING'),
    writeln('   Converting lists to compound terms:'),
    induct([c,d], Out1, [], Cmd1),
    write('   [c,d] -> '), write(Out1), write(' using '), writeln(Cmd1),
    
    induct([hello,world], Out2, [], Cmd2), 
    write('   [hello,world] -> '), write(Out2), write(' using '), writeln(Cmd2),
    nl,
    
    % Demo 2: List Transformations
    writeln('2. LIST TRANSFORMATIONS'),
    writeln('   Reversing lists:'),
    induct([a,b,c,d], Out3, [], Cmd3),
    write('   [a,b,c,d] -> '), write(Out3), write(' using '), writeln(Cmd3),
    
    induct([1,2,3], Out4, [], Cmd4),
    write('   [1,2,3] -> '), write(Out4), write(' using '), writeln(Cmd4),
    nl,
    
    % Demo 3: Element Extraction
    writeln('3. ELEMENT EXTRACTION'),
    writeln('   Getting head and tail elements:'),
    findall(Out-Cmd, (induct([x,y,z], Out, [], Cmd), member([Op,_,_], Cmd), member(Op, [head,tail])), HeadTailResults),
    forall(member(Out-Cmd, HeadTailResults), 
           (write('   [x,y,z] -> '), write(Out), write(' using '), writeln(Cmd))),
    nl,
    
    % Demo 4: Pattern Discovery
    writeln('4. PATTERN DISCOVERY'),
    writeln('   Learning from examples:'),
    Examples = [[[cat,dog], [dog,cat]], [[red,blue], [blue,red]], [[1,2], [2,1]]],
    write('   Examples: '), writeln(Examples),
    discover_patterns(Examples, Patterns),
    write('   Discovered patterns: '), writeln(Patterns),
    nl,
    
    % Demo 5: Neural Network Training
    writeln('5. NEURAL NETWORK LEARNING'),
    writeln('   Training on transformation examples:'),
    TrainingData = [[[p,q], p:q], [[r,s], r:s], [[alpha,beta], alpha:beta]],
    write('   Training data: '), writeln(TrainingData),
    train_network(TrainingData, 2),
    writeln('   Training completed!'),
    
    % Show learned weights
    findall(W-Cmd, 
            (command_weight(Cmd,_In,_Out,W), W > 0.6), 
            HighWeights),
    writeln('   High-confidence patterns learned:'),
    forall(member(W-Cmd, HighWeights),
           (write('     '), write(Cmd), write(' (confidence: '), write(W), writeln(')'))),
    nl,
    
    % Demo 6: Smart Induction
    writeln('6. SMART INDUCTION'),
    writeln('   Testing trained system on new data:'),
    TestInputs = [[new,data], [test,case]],
    forall(member(Input, TestInputs),
           (write('   '), write(Input), write(' -> '),
            (induct(Input, TestOut, [], TestCmd) ->
                (write(TestOut), write(' via '), writeln(TestCmd))
            ;
                writeln('no pattern found')))),
    nl,
    
    % Demo 7: Fuzzy Matching
    writeln('7. FUZZY TYPE MATCHING'),
    writeln('   Finding similar transformation patterns:'),
    fuzzy_match_types([foo,bar], [bar,foo], SimilarTypes),
    write('   For [foo,bar] -> [bar,foo], similar types:'), nl,
    take_first_n(3, SimilarTypes, TopMatches),
    forall(member(Sim-Type, TopMatches),
           (write('     '), write(Type), write(' (similarity: '), write(Sim), writeln(')'))),
    
    nl,
    writeln('====================================================='),
    writeln('           Demo completed successfully!'),
    writeln('The nnconverter can learn patterns, make inferences,'),
    writeln('and apply transformations to new data.'),
    writeln('=====================================================').

take_first_n(0, _, []) :- !.
take_first_n(_, [], []) :- !.
take_first_n(N, [H|T], [H|Rest]) :-
    N > 0,
    N1 is N - 1,
    take_first_n(N1, T, Rest).

% Run the demo
run_demo :-
    consult('nns_alg_writer.pl'),
    demo_nnconverter.