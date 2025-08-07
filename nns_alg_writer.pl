/* nns alg writer - Neural Network Style Algorithm Writer

MAIN PREDICATES:
- induct/4: induct(Input, Output, CommandsIn, CommandsOut)
  Primary induction predicate that transforms input to output using learned patterns
  
- type/3: type(Command, InputPattern, OutputPattern)  
  Defines transformation patterns for various operations

- train_network/1 & train_network/2: Neural network style training from examples

KEY FEATURES:
- learns types of commands
- 2+ commands together
- non-nn connects types
- finds path through maze of commands

USAGE:
To use induct/4 and other predicates from another file:
  :- ensure_loaded('nns_alg_writer.pl').
  
  ?- induct([c,d], Output, [], Commands).
  Output = c:d,
  Commands = [[append,[c,d],c:d]].

EXAMPLES:
append list any a + list any b = list any a:b

any xxx, list xx
"" not []

other modes

x examples x

*/
:- dynamic var1/1.
:- discontiguous simple_pattern_match/5.

:-include('minimal_listprolog.pl').
% *** test1(off,1,A).

% data_to_alg5(a:b,a,c:d,A).

% A=[c]

type(append,[a,b],a:b).
type(append1,[a,a:b],b).
type(member,[[a,b]],b).
type(member,[[a,b]],a).

% Additional neural network style type patterns
type(reverse,[a:b],b:a).
type(length,[[a:b]],n).
type(head,[a:b],a).
type(tail,[a:b],b).
type(concat,[a,b:c],a:b:c).
type(split,[a:b:c],[a,b:c]).
type(map,[f,a:b],f(a):f(b)).
type(filter,[p,a:b],subset(a:b)).
type(fold,[f,acc,a:b],result).
type(sum,[n:m],total).
type(product,[n:m],product).
type(max,[n:m],maximum).
type(min,[n:m],minimum).
type(sort,[a:b],sorted(a:b)).
type(unique,[a:b],unique(a:b)).
type(zip,[[a:b],[c:d]],[(a,c):(b,d)]).
type(unzip,[[(a,c):(b,d)]],[[a:b],[c:d]]).
type(flatten,[nested_list],flat_list).
type(transpose,[matrix],transposed_matrix).

% induct([c,d],c:d,[],C).
% C = [[append, [c, d], c:d]].

%induct([c:d,e],(c:d):e,[],C).                                       
% C = [[append, [c:d, e],  (c:d):e], [append, [(c:d):e, f],  ((c:d):e):f]].




/*
                                                              induct01([[[c,d],e],f],_,[],C).
C = [[append, [(c:d):e, f],  ((c:d):e):f], [append, [c:d, e],  (c:d):e], [append, [c, d], c:d]].

*/

induct01(A,_,C1,C2) :- 
 test1(off,1,_),
 induct0(A,_,C1,C2),!.

induct0([A,B],_,C1,C2) :- 
 atom(A),atom(B),
 induct([A,B],_Out,[],Commands2),
 append(C1,Commands2,C2),
 !.

induct0(I,O,C1,C2) :-
 %induct0(I1,O,C1,C4),
 induct(I,_Out,[],Commands2),
 append(C1,Commands2,C3),
 I=[I1|_I2],
 induct0(I1,O,C3,C2).

induct(In,Out,Commands1,Commands2) :-
 %retractall(var1(_)),
 %assertz(var1(0)),
 type(Command,_In1,_Out1),
 interpret_induct(Command,In,Out,Alg14),
 append(Commands1,[[Command,Alg14,Out]],Commands2).

% Enhanced multi-step induction with chain learning
induct_chain(In, Out, Commands1, Commands2, MaxDepth) :-
    MaxDepth > 0,
    % Try to find a command that gets us closer to the goal
    findall(Cost-Command-Alg-Intermediate,
            (induct(In, Intermediate, Commands1, TempCommands),
             member([Command, Alg, Intermediate], TempCommands),
             estimate_distance(Intermediate, Out, Cost)),
            Possibilities),
    
    % Sort by cost (distance to goal) and try the best options
    sort(Possibilities, SortedPossibilities),
    member(_Cost-Command-Alg-Intermediate, SortedPossibilities),
    
    append(Commands1, [[Command, Alg, Intermediate]], Commands3),
    NextDepth is MaxDepth - 1,
    
    (Intermediate = Out ->
        Commands2 = Commands3
    ;
        induct_chain(Intermediate, Out, Commands3, Commands2, NextDepth)
    ).

induct_chain(In, Out, Commands1, Commands2, 0) :-
    % Base case: try direct match
    induct(In, Out, Commands1, Commands2).

% Estimate distance between current state and goal
estimate_distance(Current, Goal, Distance) :-
    (Current = Goal ->
        Distance = 0
    ; (is_list(Current), is_list(Goal)) ->
        list_distance(Current, Goal, Distance)
    ; (compound(Current), compound(Goal)) ->
        compound_distance(Current, Goal, Distance)
    ;
        Distance = 1  % Different types
    ).

list_distance([], [], 0) :- !.
list_distance([], L, Dist) :- length(L, Dist), !.
list_distance(L, [], Dist) :- length(L, Dist), !.
list_distance([H1|T1], [H2|T2], Distance) :-
    (H1 = H2 -> HeadDist = 0 ; HeadDist = 1),
    list_distance(T1, T2, TailDist),
    Distance is HeadDist + TailDist.

compound_distance(Term1, Term2, Distance) :-
    Term1 =.. [F1|Args1],
    Term2 =.. [F2|Args2],
    (F1 = F2 -> FuncDist = 0 ; FuncDist = 1),
    list_distance(Args1, Args2, ArgsDist),
    Distance is FuncDist + ArgsDist.

% Smart chain induction that uses heuristics
smart_chain_induct(Input, TargetOutput, Commands) :-
    smart_chain_induct(Input, TargetOutput, [], Commands, 3).

smart_chain_induct(Current, Target, CommandsAcc, FinalCommands, MaxDepth) :-
    MaxDepth > 0,
    
    % Find all possible next steps
    findall(Heuristic-Command-Alg-NextState,
            (induct(Current, NextState, [], [[Command, Alg, NextState]]),
             calculate_heuristic(Current, NextState, Target, Heuristic)),
            Options),
    
    % Sort by heuristic value and try best first
    sort(Options, SortedOptions),
    member(_H-Command-Alg-NextState, SortedOptions),
    
    append(CommandsAcc, [[Command, Alg, NextState]], NewCommands),
    NextDepth is MaxDepth - 1,
    
    (NextState = Target ->
        FinalCommands = NewCommands
    ; 
        smart_chain_induct(NextState, Target, NewCommands, FinalCommands, NextDepth)
    ).

smart_chain_induct(Current, Current, Commands, Commands, _).

% Calculate heuristic for how promising a transformation is
calculate_heuristic(Current, Next, Target, Heuristic) :-
    estimate_distance(Current, Target, CurrentDist),
    estimate_distance(Next, Target, NextDist),
    Progress is CurrentDist - NextDist,
    % Prefer transformations that get us closer to target
    Heuristic is -Progress.  % Negative because we want to sort ascending

% Enhanced induction with better pattern matching
induct_enhanced(In, Out, Commands1, Commands2) :-
    findall(Command-Alg14-IntermediateOut, 
            (type(Command, _In1, IntermediateOut),
             interpret_induct(Command, In, IntermediateOut, Alg14)),
            PossibleCommands),
    member(Command-Alg14-Out, PossibleCommands),
    append(Commands1, [[Command, Alg14, Out]], Commands2).

% Pattern discovery for neural network style learning
discover_patterns(Examples, Patterns) :-
    findall(Pattern,
            (member([Input,Output], Examples),
             analyze_transformation(Input, Output, Pattern)),
            RawPatterns),
    remove_duplicates(RawPatterns, Patterns).

analyze_transformation(Input, Output, pattern(Type, Params)) :-
    (is_list(Input), is_list(Output) ->
        analyze_list_transformation(Input, Output, Type, Params)
    ;
        analyze_atom_transformation(Input, Output, Type, Params)
    ).

analyze_list_transformation(Input, Output, reverse, []) :-
    reverse(Input, Output).

analyze_list_transformation(Input, Output, append, [Suffix]) :-
    append(Input, Suffix, Output).

analyze_list_transformation(Input, Output, head, []) :-
    Input = [Output|_].

analyze_list_transformation(Input, Output, tail, []) :-
    Input = [_|Output].

analyze_atom_transformation(Input, Output, identity, []) :-
    Input = Output.

analyze_atom_transformation(Input, Output, constant, [Output]) :-
    Input \= Output.

remove_duplicates([], []).
remove_duplicates([H|T], [H|T2]) :-
    \+ member(H, T),
    remove_duplicates(T, T2).
remove_duplicates([H|T], T2) :-
    member(H, T),
    remove_duplicates(T, T2).
% Simplified interpret_induct that actually works
interpret_induct(Command,In,Out,Alg14) :-
 type(Command,In1,Out1),
 simple_pattern_match(In1, Out1, In, Out, Alg14).

% Simple pattern matching for basic transformations
simple_pattern_match([a,b], a:b, [X,Y], X:Y, [X,Y]) :-
    atom(X), atom(Y).

simple_pattern_match([a,a:b], b, [X,X:Y], Y, [X,X:Y]) :-
    atom(X).

simple_pattern_match([[a,b]], b, [[H|T]], H, [[H|T]]) :-
    is_list(T).

simple_pattern_match([[a,b]], a, [[H|T]], H, [[H|T]]) :-
    is_list(T).

simple_pattern_match([a:b], b:a, [H:T], T:H, [H:T]) :-
    atom(H), atom(T).

simple_pattern_match([a:b], b:a, List, Reversed, List) :-
    is_list(List),
    List \= [_:_],  % Not a compound term
    reverse(List, Reversed).

% Handle length patterns
simple_pattern_match([[a:b]], n, [List], Length, [List]) :-
    is_list(List),
    length(List, Length).

% Handle head/tail patterns  
simple_pattern_match([a:b], a, [H|_], H, [H|_]).

simple_pattern_match([a:b], b, [_|T], T, [_|T]).

% Handle some functional programming patterns
simple_pattern_match([f,a:b], f(a):f(b), [Func, List], Result, [Func, List]) :-
    is_list(List),
    maplist(apply_func(Func), List, Result).

apply_func(Func, Element, FuncElement) :-
    FuncElement =.. [Func, Element].

% Handle mathematical operations
simple_pattern_match([n:m], total, Numbers, Sum, Numbers) :-
    is_list(Numbers),
    maplist(number, Numbers),
    sumlist(Numbers, Sum).

simple_pattern_match([n:m], product, Numbers, Product, Numbers) :-
    is_list(Numbers),
    maplist(number, Numbers),
    product_list(Numbers, Product).

simple_pattern_match([n:m], maximum, Numbers, Max, Numbers) :-
    is_list(Numbers),
    maplist(number, Numbers),
    max_list(Numbers, Max).

simple_pattern_match([n:m], minimum, Numbers, Min, Numbers) :-
    is_list(Numbers),
    maplist(number, Numbers),
    min_list(Numbers, Min).

% Helper predicates
product_list([], 1).
product_list([H|T], Product) :-
    product_list(T, RestProduct),
    Product is H * RestProduct.

% Neural network style weight learning for command selection
:- dynamic command_weight/4.

% Initialize weights for commands with better defaults
init_weights :-
    findall(type(Cmd,In,Out), type(Cmd,In,Out), Types),
    maplist(init_command_weight, Types).

init_command_weight(type(Cmd,In,Out)) :-
    (command_weight(Cmd,In,Out,_) -> 
        true 
    ; 
        (compute_initial_weight(Cmd, In, Out, InitialWeight),
         assertz(command_weight(Cmd,In,Out,InitialWeight)))
    ).

% Compute better initial weights based on command complexity
compute_initial_weight(append, [_,_], _:_, 0.8) :- !.  % Common operation
compute_initial_weight(reverse, [_], _, 0.7) :- !.     % Useful transformation
compute_initial_weight(head, [_:_], _, 0.6) :- !.      % Basic accessor
compute_initial_weight(tail, [_:_], _, 0.6) :- !.      % Basic accessor  
compute_initial_weight(member, [[_]], _, 0.5) :- !.    % Membership test
compute_initial_weight(_, _, _, 0.4).                  % Default lower weight

% Enhanced weight update with momentum and learning rate
:- dynamic momentum/4.
:- dynamic learning_rate/1.

learning_rate(0.1).

update_weight(Command, Input, Output, Success) :-
    learning_rate(LR),
    (Success = true -> 
        Delta = LR
    ; 
        Delta is -LR * 0.5
    ),
    
    % Apply momentum if available
    (retract(momentum(Command, Input, Output, OldMomentum)) ->
        NewMomentum is 0.9 * OldMomentum + 0.1 * Delta
    ;
        NewMomentum = Delta
    ),
    assertz(momentum(Command, Input, Output, NewMomentum)),
    
    % Update weights with momentum
    (retract(command_weight(Command, Input, Output, OldWeight)) ->
        NewWeight is max(0.01, min(0.99, OldWeight + NewMomentum)),
        assertz(command_weight(Command, Input, Output, NewWeight))
    ;
        init_command_weight(type(Command, Input, Output))
    ).

% Enhanced command selection using probabilistic selection
select_best_command(Input, Commands, BestCommand) :-
    findall(Weight-Command-Alg-Output,
            (member([Command, Alg, Output], Commands),
             get_command_weight(Command, Input, Output, Weight)),
            WeightedCommands),
    probabilistic_select(WeightedCommands, BestCommand).

get_command_weight(Command, Input, Output, Weight) :-
    (command_weight(Command, Input, Output, Weight) ->
        true
    ;
        compute_initial_weight(Command, Input, Output, Weight)
    ).

% Probabilistic selection instead of always picking the highest
probabilistic_select(WeightedCommands, Command-Alg-Output) :-
    WeightedCommands \= [],
    maplist(extract_weight, WeightedCommands, Weights),
    sum_list(Weights, TotalWeight),
    TotalWeight > 0,
    random(R),
    Threshold is R * TotalWeight,
    select_by_threshold(WeightedCommands, Threshold, 0, Command-Alg-Output).

extract_weight(Weight-_-_-_, Weight).

select_by_threshold([Weight-Cmd-Alg-Out|_], Threshold, Acc, Cmd-Alg-Out) :-
    NewAcc is Acc + Weight,
    NewAcc >= Threshold, !.
    
select_by_threshold([Weight-_-_-_|Rest], Threshold, Acc, Result) :-
    NewAcc is Acc + Weight,
    select_by_threshold(Rest, Threshold, NewAcc, Result).

% Enhanced training with validation and epochs
train_network(Examples) :-
    train_network(Examples, 10).  % Default 10 epochs

train_network(Examples, Epochs) :-
    init_weights,
    train_epochs(Examples, Epochs, 1).

train_epochs(_, MaxEpochs, Current) :-
    Current > MaxEpochs, !.
    
train_epochs(Examples, MaxEpochs, Current) :-
    writeln(['Epoch ', Current, '/', MaxEpochs]),
    maplist(train_example, Examples),
    evaluate_performance(Examples, Accuracy),
    writeln(['Accuracy: ', Accuracy]),
    Next is Current + 1,
    train_epochs(Examples, MaxEpochs, Next).

evaluate_performance(Examples, Accuracy) :-
    length(Examples, Total),
    findall(1, 
            (member([Input, ExpectedOutput], Examples),
             induct(Input, ActualOutput, [], _),
             ActualOutput = ExpectedOutput),
            Successes),
    length(Successes, Correct),
    Accuracy is Correct / Total.

train_example([Input, ExpectedOutput]) :-
    (induct(Input, ActualOutput, [], Commands) ->
        (ActualOutput = ExpectedOutput ->
            % Success: reinforce all commands in successful path
            maplist(reinforce_success(Input, ExpectedOutput), Commands)
        ;
            % Partial success: reinforce good commands, penalize bad ones
            maplist(evaluate_command(Input, ExpectedOutput, ActualOutput), Commands)
        )
    ;
        % Complete failure: slightly penalize all possible commands
        findall(Cmd, type(Cmd, _, _), AllCommands),
        maplist(penalize_light(Input, ExpectedOutput), AllCommands)
    ).

evaluate_command(Input, Expected, Actual, [Command, _, _]) :-
    (command_contributes_to_solution(Command, Expected, Actual) ->
        update_weight(Command, Input, Expected, true)
    ;
        update_weight(Command, Input, Expected, false)
    ).

command_contributes_to_solution(reverse, Expected, Actual) :-
    is_list(Expected), is_list(Actual),
    reverse(Actual, Expected), !.
    
command_contributes_to_solution(append, Expected, _) :-
    compound(Expected),
    Expected = _:_, !.
    
command_contributes_to_solution(_, _, _).  % Default: assume contribution

reinforce_success(Input, Output, [Command, _, _]) :-
    update_weight(Command, Input, Output, true).

penalize_light(_Input, _Output, _Command) :-
    % Light penalization - could be enhanced with more sophisticated logic
    true.
% a:b c a:b:c 
 
%data_to_alg5(In,Alg1,Alg2) :-
 %In=[In2|In3],
 %data_to_alg4(In2,[],_Vars1,[],Alg3),
 
data_to_alg5(Data1,Data2,Alg1,Alg2,Alg17) :-
 % finds A=a, etc. and [A,B]
 data_to_alg4(Data1,[],_Vars1,[],Alg3),
 data_to_alg4(Data2,[],_Vars3,[],Alg4),

 data_to_alg41(Alg1,[],_Vars31,[],Alg11),

 % finds [[B],A] from A=a etc. and [[b],a]
 %                    [A,B],[c,d]
 %member(Alg12,Alg11),
 %member(Alg13,Alg11),
 %member(Alg15,Alg11),
 Alg11=[Alg12,Alg13],%,Alg15],
 Alg11=Alg14,
 
 %trace,
 list_to_compound(Alg12,[],Alg171),
 list_to_compound(Alg13,[],Alg172),
 Alg17=[Alg171,Alg172],%,Alg15],
 %flatten(Alg14,Alg16)
 
 interpretpart(match4,Alg3,Alg14,[],Vars2,_),
 %                    [[B],A]
 interpretpart(match4,Alg4,[v,sys1],Vars2,Vars4,_),
 
 % finds [[d],c] from [A,B], [[B],A] and [c,d]
 getvalue([v,sys1],Alg2,Vars4).

data_to_alg4([],Vars,Vars,Alg,Alg) :- !.
data_to_alg4(Data1,Vars1,Vars2,Alg1,Alg2) :-
 Data1=[Data2|Data3],
 ((is_list(Data2)->true;compound(Data2))->%List=true;List=false),
 (data_to_alg4(Data2,Vars1,Vars3,[],Alg4),
 Alg5=Alg4,append(Alg1,[Alg5],Alg3));
 (append(Vars1,[[[v,Data2],Data2]],Vars3),
 append(Alg1,[[v,Data2]],Alg3))),
 data_to_alg4(Data3,Vars3,Vars2,Alg3,Alg2),!.
data_to_alg4(Data1,Vars1,Vars3,Alg1,Alg3) :-
 %Data1=[Data2|Data3],
 ((atom(Data1)->%true;compound(Data2))->%List=true;List=false),
 (%data_to_alg4(Data2,Vars1,Vars3,[],Alg4),
 %Alg5=Alg4,append(Alg1,[Alg5],Alg3));
 (append(Vars1,[[[v,Data1],Data1]],Vars3),
 append(Alg1,[[v,Data1]],Alg3))))),!.
 %data_to_alg4(Data3,Vars3,Vars2,Alg3,Alg2),!.
data_to_alg4(Data1,Vars1,Vars2,Alg1,Alg2) :-
 %Data1=[Data2|Data3],
 Data1=..[:, Data2, Data3],
 ((is_list(Data2)->true;compound(Data2))->%List=true;List=false),
 (data_to_alg4(Data2,Vars1,Vars3,[],Alg4),
 Alg5=Alg4,append(Alg1,[Alg5],Alg3));
 (append(Vars1,[[[v,Data2],Data2]],Vars3),
 (Alg1=[]->Alg3=[[v,Data2]];
 Alg3=..[:,Alg1,[v,Data2]])
 %append(Alg1,[[v,Data2]],Alg3)
 )),
 data_to_alg4(Data3,Vars3,Vars2,Alg3,Alg2),!.
 
data_to_alg41([],Vars,Vars,Alg,Alg) :- !.
data_to_alg41(Data1,Vars1,Vars2,Alg1,Alg2) :-
 Data1=[Data2|Data3],
 ((is_list(Data2)->true;compound(Data2))->%List=true;List=false),
 (data_to_alg41(Data2,Vars1,Vars3,[],Alg4),
 Alg5=Alg4,append(Alg1,[Alg5],Alg3));
 (append(Vars1,[[[v,Data2],Data2]],Vars3),
 append(Alg1,[Data2],Alg3))),
 data_to_alg41(Data3,Vars3,Vars2,Alg3,Alg2),!.
data_to_alg41(Data1,Vars1,Vars3,Alg1,Alg3) :-
 %Data1=[Data2|Data3],
 ((atom(Data1)->%true;compound(Data2))->%List=true;List=false),
 (%data_to_alg4(Data2,Vars1,Vars3,[],Alg4),
 %Alg5=Alg4,append(Alg1,[Alg5],Alg3));
 (append(Vars1,[[[v,Data1],Data1]],Vars3),
 append(Alg1,[Data1],Alg3))))),!.
 %data_to_alg4(Data3,Vars3,Vars2,Alg3,Alg2),!.
data_to_alg41(Data1,Vars1,Vars2,Alg1,Alg2) :-
 %Data1=[Data2|Data3],
 Data1=..[:, Data2, Data3],
 ((is_list(Data2)->true;compound(Data2))->%List=true;List=false),
 (data_to_alg41(Data2,Vars1,Vars3,[],Alg4),
 Alg5=Alg4,append(Alg1,[Alg5],Alg3));
 (append(Vars1,[[[v,Data2],Data2]],Vars3),
 %append(Alg1,[Data2],Alg3)
 (Alg1=[]->Alg3=[Data2];
 Alg3=..[:,Alg1,Data2]))),
 data_to_alg41(Data3,Vars3,Vars2,Alg3,Alg2),!.
 
list_to_compound([],Compound,Compound) :- !.
list_to_compound(Data1,Compound1,Compound2) :-
 Data1=Data3,atom(Data3),
 (Compound1=[]->Compound2=Data3;
 Compound2=..[:,Compound1,Data3]),!.
list_to_compound(Data1,Compound1,Compound2) :-
 Data1=[Data2|Data3],
 list_to_compound(Data2,[],Data4),
 (Compound1=[]->Compound3=Data4;
 Compound3=..[:,Compound1,Data4]),
 list_to_compound(Data3,Compound3,Compound2),!.
/*
list_to_compound(Data1,Compound1,Compound2) :-
 Data1=[Data2|Data3],
 (Compound1=[]->Compound3=Data2;
 Compound3=..[:,Compound1,Data2]),
 list_to_compound(Data3,Compound3,Compound2),!.
*/

% Original get_var predicate
get_var(V1) :-
 var1(V),
 retractall(var1(_)),
 V1 is V+1,
 assertz(var1(V1)).

% Advanced pattern matching with fuzzy matching
fuzzy_match_types(Input, Output, SimilarTypes) :-
    findall(Similarity-type(Cmd,In,Out),
            (type(Cmd,In,Out),
             calculate_similarity(Input, In, InSim),
             calculate_similarity(Output, Out, OutSim),
             Similarity is (InSim + OutSim) / 2),
            Matches),
    sort(Matches, SortedMatches),
    reverse(SortedMatches, SimilarTypes).

calculate_similarity(Term1, Term2, Similarity) :-
    (Term1 = Term2 ->
        Similarity = 1.0
    ; (is_list(Term1), is_list(Term2)) ->
        list_similarity(Term1, Term2, Similarity)
    ; (atom(Term1), atom(Term2)) ->
        atom_similarity(Term1, Term2, Similarity)  
    ;
        Similarity = 0.0
    ).

list_similarity([], [], 1.0) :- !.
list_similarity([], _, 0.0) :- !.
list_similarity(_, [], 0.0) :- !.
list_similarity([H1|T1], [H2|T2], Similarity) :-
    calculate_similarity(H1, H2, HSim),
    list_similarity(T1, T2, TSim),
    length([H1|T1], L1),
    length([H2|T2], L2),
    MaxLen is max(L1, L2),
    Similarity is (HSim + TSim) / MaxLen.

atom_similarity(A1, A2, Similarity) :-
    atom_codes(A1, C1),
    atom_codes(A2, C2),
    longest_common_subsequence(C1, C2, LCS),
    length(C1, L1),
    length(C2, L2),
    length(LCS, LLCS),
    MaxLen is max(L1, L2),
    Similarity is LLCS / MaxLen.

longest_common_subsequence([], _, []).
longest_common_subsequence(_, [], []).
longest_common_subsequence([H|T1], [H|T2], [H|LCS]) :-
    longest_common_subsequence(T1, T2, LCS).
longest_common_subsequence([H1|T1], [H2|T2], LCS) :-
    H1 \= H2,
    longest_common_subsequence([H1|T1], T2, LCS1),
    longest_common_subsequence(T1, [H2|T2], LCS2),
    (length(LCS1, L1), length(LCS2, L2) ->
        (L1 >= L2 -> LCS = LCS1 ; LCS = LCS2)
    ;
        LCS = LCS1
    ).

% Simplified ensemble learning to avoid backtracking issues
ensemble_induct(Input, Output, Commands) :-
    % Just use the basic induction for now, with a cut to prevent backtracking
    induct(Input, Output, [], Commands), !.

% If basic induction fails, try enhanced
ensemble_induct(Input, Output, Commands) :-
    induct_enhanced(Input, Output, [], Commands), !.

% Final fallback
ensemble_induct(Input, Input, []).

% Apply a series of commands to get the final output
apply_commands(Input, [], Input).
apply_commands(Input, [[Command, _, Output]|Rest], FinalOutput) :-
    apply_commands(Output, Rest, FinalOutput).

induct_method(induct).
induct_method(induct_enhanced).

vote_on_commands(AllCommands, BestCommands) :-
    AllCommands \= [],
    count_occurrences(AllCommands, Counts),
    (Counts \= [] ->
        (sort(Counts, SortedCounts),
         reverse(SortedCounts, [_Count-BestCommands|_]))
    ;
        BestCommands = []
    ).

vote_on_commands([], []).

count_occurrences([], []).
count_occurrences([H|T], [Count-H|Rest]) :-
    select_all(H, [H|T], Selected, Remaining),
    length(Selected, Count),
    count_occurrences(Remaining, Rest).

select_all(_, [], [], []).
select_all(X, [X|T], [X|Selected], Remaining) :-
    select_all(X, T, Selected, Remaining).
select_all(X, [Y|T], Selected, [Y|Remaining]) :-
    X \= Y,
    select_all(X, T, Selected, Remaining).