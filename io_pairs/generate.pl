/*  generate.pl -- 200 input/output pairs for S2GN (s2g/normalise.pl), each produced by
    running the code. From the repository root:
        swipl -q -g main -t halt io_pairs/generate.pl
    writes io_pairs/pairs.jsonl and io_pairs/io_pairs.md. */
:- prolog_load_context(directory, D), assertz(user:io_dir(D)).
:- use_module(harness).
:- use_module(to_markdown).
:- style_check(-singleton).
:- io_dir(D), atom_concat(D, '/../s2g/strings_to_grammar.pl', F), consult(F).

% vocabularies of different kinds of word
vocab(caps, ['AA','AB','AC','AD','AE','AF']).
vocab(colours, [red, green, blue, gold, grey]).
vocab(code, [n1, l2, s1, v3, k9]).
vocab(numbers, ['1', '2', '3', '7', '12', '99']).
vocab(names, ['Ann', 'Bo', 'Cy', 'Dee', 'Eli']).
vocab(mixed, ['AA', red, n1, '7', 'Bo']).

pick(L, X) :- length(L, N), I is random(N), nth0(I, L, X).
words(V, N, Ws) :- vocab(V, L), length(Ws, N), maplist({L}/[W]>>pick(L, W), Ws).
str(Ws, S) :- atomic_list_concat(Ws, ',', A), atom_string(A, S).
q(S) :- format(string(S0), "~q", [S]), S = S0.

% a string with structure: prefix, a block repeated K times, suffix
patterned(V, S, Desc) :-
    vocab(V, L), random_between(0, 1, NP), random_between(1, 3, NB), random_between(1, 4, K), random_between(0, 1, NS),
    length(P, NP), maplist({L}/[W]>>pick(L, W), P), length(B, NB), maplist({L}/[W]>>pick(L, W), B),
    length(Sf, NS), maplist({L}/[W]>>pick(L, W), Sf),
    findall(B, between(1, K, _), Bs), append(Bs, BB), append([P, BB, Sf], Ws), str(Ws, S),
    str(B, BS), format(string(Desc), "block [~w] repeated ~w time(s)", [BS, K]).

lit(Strings, Lit) :- maplist([S, Q]>>format(string(Q), "\"~s\"", [S]), Strings, Qs), atomic_list_concat(Qs, ', ', A), format(string(Lit), "[~w]", [A]).

main :-
    set_random(seed(2026)), set_limit(30),
    io_dir(Dir), atom_concat(Dir, '/pairs.jsonl', PF), open_pairs(PF),
    Vs = [caps, colours, code, numbers, names, mixed],
    % 50 symbol tables
    forall(between(1, 50, I), ( nth1(J, Vs, V), J =:= (I - 1) mod 6 + 1, random_between(1, 3, NStr),
                                length(Ss, NStr), maplist({V}/[S]>>( random_between(2, 6, N), words(V, N, W), str(W, S) ), Ss),
                                lit(Ss, Lit), format(string(Q), "strings_to_symbols(~s, Symbols, Words)", [Lit]),
                                format(string(T), "Symbol table for ~w string(s) of ~w words", [NStr, V]),
                                pair('s2g/symbols', T, Q) )),
    % 80 grammars from one patterned string
    forall(between(1, 70, I), ( nth1(J, Vs, V), J =:= (I - 1) mod 6 + 1, patterned(V, S, D),
                                lit([S], Lit), format(string(Q), "strings_to_grammar_words(~s, Grammar)", [Lit]),
                                format(string(T), "Grammar for ~w words: ~s", [V, D]), pair('s2g/grammar', T, Q) )),
    % 20 grammars from two strings with a shared prefix
    forall(between(1, 20, I), ( nth1(J, Vs, V), J =:= (I - 1) mod 6 + 1, words(V, 2, P), words(V, 1, [A]), words(V, 1, [B]),
                                append(P, [A], W1), append(P, [B], W2), str(W1, S1), str(W2, S2), lit([S1, S2], Lit),
                                format(string(Q), "strings_to_grammar_words(~s, Grammar)", [Lit]),
                                format(string(T), "Grammar for two ~w strings with a shared prefix", [V]), pair('s2g/grammar', T, Q) )),
    % 40 covering grammars: a string, the same without its last word, and a repeat of its first word
    forall(between(1, 40, I), ( nth1(J, Vs, V), J =:= (I - 1) mod 6 + 1, random_between(3, 5, N), words(V, N, W),
                                append(Short, [_], W), W = [F|_], str(W, S1), str(Short, S2), str([F|W], S3),
                                lit([S1, S2, S3], Lit), format(string(Q), "strings_to_grammar_words_covering(~s, Grammar, Added)", [Lit]),
                                format(string(T), "Covering grammar for ~w words: full, shortened and with a repeated first word", [V]),
                                pair('s2g/covering', T, Q) )),
    % 10 parse checks: does the plain grammar parse every input?
    forall(between(1, 10, I), ( nth1(J, Vs, V), J =:= (I - 1) mod 6 + 1, random_between(3, 4, N), words(V, N, W),
                                append(Short, [_], W), str(W, S1), str(Short, S2), lit([S1, S2], Lit),
                                format(string(Q), "_L = ~s, strings_to_symbols(_L, _, _W), strings_to_grammar_words(_L, _G), findall(X, ( member(X, _W), \\+ catch(check_grammar([X], _G), _, fail) ), NotParsed), strings_to_grammar_words_covering(_L, _G2, _), ( check_grammar(_W, _G2) -> CoveringParsesAll = yes ; CoveringParsesAll = no )", [Lit]),
                                format(string(T), "Which ~w inputs the plain grammar misses, and the covering grammar", [V]),
                                pair('s2g/covering', T, Q) )),
    % symbol capacity
    forall(member(Case-Off-D, [upper-0-"the first symbol for a capitalised word", lower-0-"the first symbol for a lower-case word",
                               upper-27519-"the last capitalised symbol before the surrogates", upper-27520-"a capitalised symbol at the surrogates",
                               lower-27519-"a lower-case symbol at the surrogates", upper-100000-"a capitalised symbol far above the surrogates",
                               lower-100000-"a lower-case symbol far above the surrogates", upper-556927-"the last capitalised symbol",
                               upper-556928-"one capitalised word too many", lower-556928-"one lower-case word too many"]),
           ( ( Case == upper -> St = st(26, Off, 0) ; St = st(26, 0, Off) ),
             format(string(Q), "ws_fresh(~w, ~q, [], _Code, State), format(\"U+~~16r~~n\", [_Code])", [Case, St]),
             format(string(T), "Symbol capacity: ~s", [D]), pair('s2g/symbol-capacity', T, Q) )),
    close_pairs,
    atom_concat(Dir, '/io_pairs.md', MF),
    to_markdown(PF, MF, "S2GN (s2g/normalise.pl)",
        "Each pair is a query to S2GN, which turns strings of words into grammars. Every output was produced by running this repository's code with `io_pairs/generate.pl` (inputs are generated from a fixed random seed, so the file is reproducible); nothing was written by hand. The output is what the query printed, then its variable bindings. A query that takes longer than 30 seconds is recorded as such.").
