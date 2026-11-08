% The predicates of proofgame.pl whose inputs and outputs are recorded in proofgame_io/ios.txt
% (see proofgame_io/ios_engine.pl). The game itself asks the player questions; these are the
% parts underneath it. The ones that use randomness get a seed from the example number.
:- ios_engine:consult_repo('proofgame.pl').
:- use_module(library(random)).

io_title('proofgame.pl').

io_cases([run1, chain_types, types_alg, consistent_types, consistent_algorithm, true_if_answer, generate_atd, optimise]).

starts([list, number]).
list_data(K, Salt, L) :- num(K, Salt, 3, 5, N), findall(X, (between(1, N, I), S is Salt + I, num(K, S, 1, 9, X)), L).
data(K, Salt, list, L) :- list_data(K, Salt, L).
data(K, Salt, number, N) :- num(K, Salt, 1, 9, N).
% an algorithm of 1 to 3 commands that fits its types, starting from Start
algorithm(K, Salt, Start, Alg) :-
    num(K, Salt, 1, 3, Len),
    alg_(Len, K, Salt, Start, Alg).
alg_(0, _, _, _, []) :- !.
alg_(N, K, Salt, T1, [C | Cs]) :-
    findall(C1-T2, cmd(C1, T1, T2), Pairs), S2 is Salt * 7 + N, pick(K, S2, Pairs, C-T2),
    N1 is N - 1, alg_(N1, K, Salt, T2, Cs).
blanked(K, Salt, Items, Template) :-
    length(Items, L), num(K, Salt, 1, L, B),
    findall(X, (nth1(I, Items, Y), (I =:= B -> X = '_' ; X = Y)), Template).

io_input(run1, K, [Alg, In]) :- starts(Ss), pick(K, 1, Ss, S), algorithm(K, 2, S, Alg), data(K, 3, S, In).
io_input(chain_types, K, [Start, Alg]) :- starts(Ss), pick(K, 4, Ss, Start), algorithm(K, 5, Start, Alg).
io_input(types_alg, K, [[First | Rest]]) :- types(Ts), num(K, 6, 1, 3, Len), findall(T, (between(1, Len, I), S is 7 + I, pick(K, S, Ts, T)), Rest), starts(Ss), pick(K, 12, Ss, First).
io_input(consistent_types, K, [[In, Out], Template]) :- starts(Ss), pick(K, 13, Ss, S), algorithm(K, 14, S, Alg), data(K, 15, S, In), run1(Alg, In, Out), chain_types(S, Alg, Types), blanked(K, 16, Types, Template).
io_input(consistent_algorithm, K, [[In, Out], Types, Template]) :- starts(Ss), pick(K, 17, Ss, S), algorithm(K, 18, S, Alg), data(K, 19, S, In), run1(Alg, In, Out), chain_types(S, Alg, Types), blanked(K, 20, Alg, Template).
io_input(true_if_answer, K, [Kind, [In, Out], Context, Template, I]) :-
    starts(Ss), pick(K, 21, Ss, S), algorithm(K, 22, S, Alg), data(K, 23, S, In), run1(Alg, In, Out), chain_types(S, Alg, Types),
    pick(K, 24, [types, algorithm], Kind),
    ( Kind == types -> Items = Types, Context = none ; Items = Alg, Context = Types ),
    blanked(K, 25, Items, Template), nth1(I, Template, '_').
io_input(generate_atd, K, [K]).
io_input(optimise, K, [Start, Alg, K]) :- starts(Ss), pick(K, 26, Ss, Start), algorithm(K, 27, Start, Alg).

io_run(run1, [Alg, In], Out) :- run1(Alg, In, Out).
io_run(chain_types, [Start, Alg], Types) :- chain_types(Start, Alg, Types).
% every algorithm that fits the types, first 12
io_run(types_alg, [Types], Algs) :- findall(A, limit(12, types_alg(Types, A)), Algs).
io_run(consistent_types, [Data, Template], yes) :- consistent(types, Data, none, Template).
io_run(consistent_algorithm, [Data, Types, Template], yes) :- consistent(algorithm, Data, Types, Template).
io_run(true_if_answer, [Kind, Data, Context, Template, I], Value) :- true_if_answer(Kind, Data, Context, Template, I, Value).
io_run(generate_atd, [Seed], [algorithm(A), types(T), data(D)]) :- set_random(seed(Seed)), generate_atd(A, T, D).
io_run(optimise, [Start, Alg, Seed], A) :- set_random(seed(Seed)), optimise(Start, Alg, A).
