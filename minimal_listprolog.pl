% Minimal List Prolog interpreter stub for nns_alg_writer
% This provides the basic predicates needed by nns_alg_writer.pl

% Basic interpretation predicates
interpretpart(match4, Pattern, Value, VarsIn, VarsOut, _) :-
    match_pattern(Pattern, Value, VarsIn, VarsOut).

match_pattern([v,Var], Value, VarsIn, VarsOut) :-
    (member([[v,Var], Value], VarsIn) ->
        VarsOut = VarsIn
    ;
        append(VarsIn, [[[v,Var], Value]], VarsOut)
    ).

match_pattern(Pattern, Pattern, Vars, Vars) :-
    \+ compound(Pattern),
    \+ is_list(Pattern).

match_pattern([H1|T1], [H2|T2], VarsIn, VarsOut) :-
    match_pattern(H1, H2, VarsIn, VarsMid),
    match_pattern(T1, T2, VarsMid, VarsOut).

getvalue([v,Var], Value, Vars) :-
    member([[v,Var], Value], Vars).

% Test predicate stub
test1(off, 1, true).