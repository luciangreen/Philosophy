/* nns alg writer

- learns types of commands
- 2+ commands together

non-nn
- connects types
:

append list any a + list any b = list any a:b

any xxx, list xx
"" not []

other modes

x examples x


finds path through maze of commands

*/
:- dynamic var1/1.

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
 type(Command,In1,Out1),
 interpret_induct(Command,In,Out,Alg14),
 append(Commands1,[[Command,Alg14,Out]],Commands2).

% Enhanced multi-step induction with chain learning
induct_chain(In, Out, Commands1, Commands2, MaxDepth) :-
    MaxDepth > 0,
    induct(In, Intermediate, Commands1, Commands3),
    NextDepth is MaxDepth - 1,
    (Intermediate = Out ->
        Commands2 = Commands3
    ;
        induct_chain(Intermediate, Out, Commands3, Commands2, NextDepth)
    ).

induct_chain(In, Out, Commands1, Commands2, 0) :-
    % Base case: try direct match
    induct(In, Out, Commands1, Commands2).

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
% interpret_induct(Command,[c,d],O).

interpret_induct(Command,In,O,Alg14) :-
 type(Command,In1,O1),
 data_to_alg5(In1,O1,In,O2,Alg14),
 flatten(O2,O21),
 list_to_compound(O21,[],O).

% Neural network style weight learning for command selection
:- dynamic command_weight/3.

% Initialize weights for commands
init_weights :-
    findall(type(Cmd,In,Out), type(Cmd,In,Out), Types),
    maplist(init_command_weight, Types).

init_command_weight(type(Cmd,In,Out)) :-
    (command_weight(Cmd,In,Out) -> true ; assertz(command_weight(Cmd,In,Out,0.5))).

% Update weights based on success/failure
update_weight(Command, Input, Output, Success) :-
    (Success = true ->
        Delta = 0.1
    ;
        Delta = -0.05
    ),
    (retract(command_weight(Command, Input, Output, OldWeight)) ->
        NewWeight is max(0.0, min(1.0, OldWeight + Delta)),
        assertz(command_weight(Command, Input, Output, NewWeight))
    ;
        init_command_weight(type(Command, Input, Output))
    ).

% Neural network style command selection using weights
select_best_command(Input, Output, Commands, BestCommand) :-
    findall(Weight-Command-Alg,
            (member([Command, Alg, Output], Commands),
             (command_weight(Command, Input, Output, Weight) ->
                 true
             ;
                 Weight = 0.5
             )),
            WeightedCommands),
    sort(WeightedCommands, SortedCommands),
    reverse(SortedCommands, [_-BestCommand-_|_]).

% Training function that learns from examples
train_network(Examples) :-
    init_weights,
    maplist(train_example, Examples).

train_example([Input, Output]) :-
    (induct(Input, ActualOutput, [], Commands) ->
        (ActualOutput = Output ->
            % Success: reinforce successful commands
            maplist(reinforce_success(Input, Output), Commands)
        ;
            % Failure: penalize unsuccessful commands  
            maplist(penalize_failure(Input, Output), Commands)
        )
    ;
        true  % No commands found
    ).

reinforce_success(Input, Output, [Command, _, _]) :-
    update_weight(Command, Input, Output, true).

penalize_failure(Input, Output, [Command, _, _]) :-
    update_weight(Command, Input, Output, false).
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

% Ensemble learning - combine multiple approaches
ensemble_induct(Input, Output, Commands) :-
    findall(Cmds, 
            (induct_method(Method),
             call(Method, Input, Output, [], Cmds)),
            AllCommands),
    flatten(AllCommands, FlatCommands),
    vote_on_commands(FlatCommands, Commands).

induct_method(induct).
induct_method(induct_enhanced).

vote_on_commands(AllCommands, BestCommands) :-
    count_occurrences(AllCommands, Counts),
    sort(Counts, SortedCounts),
    reverse(SortedCounts, [_-BestCommands|_]).

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