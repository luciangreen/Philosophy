%:- initialization(main).

test_s2gn :-

findall(_,(member([N,L,G2],
[

[1,["AA,AB,AC,AB,AC,AA,AB,AC,AB,AC"
],
[[[n,a1],"->",[[]]],
[[n,a1],"->",[['AA'],[[n,a2]],[[n,a1]]]],
[[n,a2],"->",[[]]],
[[n,a2],"->",[['AB'],['AC'],[[n,a2]]]]]],

[2,["AA,AB,AB,AA,AB"],
[[[n,a1],"->",[[]]],
[[n,a1],"->",[['AA'],[[n,a2]],[[n,a1]]]],
[[n,a2],"->",[[]]],
[[n,a2],"->",[['AB'],[[n,a2]]]]]],

[3,["AA,AB,AA,AC,AB"],
[[[n,a1],"->",[[]]],
[[n,a1],"->",[['AA'],[[n,a2]],['AB'],[[n,a1]]]],
[[n,a2],"->",[[]]],
[[n,a2],"->",[['AC']]]]],

[4,["AA,AB,AC,AA,AC"],
[[[n,a1],"->",[[]]],
[[n,a1],"->",[['AA'],[[n,a2]],['AC'],[[n,a1]]]],
[[n,a2],"->",[[]]],
[[n,a2],"->",[['AB']]]]],

[5,["AA,AB,AC,AB,AC,AD,AE,AA,AB,AC,AD,AE"],
[[[n, a1], "->", [['AA'], ['AB'], [[n, a2]], ['AC'], ['AD'], ['AE']]], 
[[n, a2], "->", [[]]], 
[[n, a2], "->", [['AC'], [[n, a3]], ['AB'], [[n, a2]]]], 
[[n, a3], "->", [[]]], 
[[n, a3], "->", [['AD'], ['AE'], ['AA']]]]],

[6,["AA,AB,AC,AB,AC,AD,AE,AA,AB,AC,AD,AE,AA,AB,AC,AB,AC,AD,AE,AA,AB,AC,AD,AE"],
[[[n,a1],"->",[[]]],
[[n,a1],"->",[['AA'],['AB'],[[n,a2]],['AC'],['AD'],['AE'],[[n,a1]]]],
[[n,a2],"->",[[]]],
[[n,a2],"->",[['AC'],[[n,a3]],['AB'],[[n,a2]]]],
[[n,a3],"->",[[]]],
[[n,a3],"->",[['AD'],['AE'],['AA']]]]],

[7,["AZ,AZ,AA,AZ,AZ"],
[[[n, a1], "->", [[[n, a2]], ['AA'], [[n, a2]]]], 
[[n, a2], "->", [[]]], 
[[n, a2], "->", [['AZ'], [[n, a2]]]]]],

[8,["[a,b]", "[a,c]"], 
[[[n, a1], "->", [[a], [[n, a2]]]], 
[[n, a2], "->", [[b]]], 
[[n, a2], "->", [[c]]]]],

[9,["[a,b]", "[a,d,e]", "[a,d,f]"], 
[[[n, a1], "->", [[a], [[n, a2]]]], 
[[n, a2], "->", [[b]]], 
[[n, a2], "->", [[d], [[n, a4]]]], 
[[n, a4], "->", [[e]]], 
[[n, a4], "->", [[f]]]]],

[10,["[a,b]", "[a,d,d,e]", "[a,d,d,f]"], 
[[[n, a1], "->", [[a], [[n, a2]]]], 
[[n, a2], "->", [[b]]], 
[[n, a2], "->", [[[n, a4]], [[n, a5]]]], 
[[n, a4], "->", [[]]], 
[[n, a4], "->", [[d], [[n, a4]]]], 
[[n, a5], "->", [[e]]], 
[[n, a5], "->", [[f]]]]],

[11,["[a]", "[[a]]", "[[[a]]]"], 
[[[n,a1],"->",[["["],["["],[a],["]"],["]"]]],
[[n,a1],"->",[["["],[a],["]"]]],
[[n,a1],"->",[[a]]]]],

[12,["[a]", "[[a]]", "[[[a]]]", "[[[[a]]]]"], 
[[[n,a1],"->",[["["],["["],["["],[a],["]"],["]"],["]"]]],
[[n,a1],"->",[["["],["["],[a],["]"],["]"]]],
[[n,a1],"->",[["["],[a],["]"]]],
[[n,a1],"->",[[a]]]]],

[13,["[a]", "[[a]]", "[[[a]]]", "[[[[a]]]]", "[[[[[a]]]]]"], 
[[[n,a1],"->",[["["],["["],["["],["["],[a],["]"],["]"],["]"],["]"]]],
[[n,a1],"->",[["["],["["],["["],[a],["]"],["]"],["]"]]],
[[n,a1],"->",[["["],["["],[a],["]"],["]"]]],
[[n,a1],"->",[["["],[a],["]"]]],
[[n,a1],"->",[[a]]]]],

[14,["[[[f,g]]]"],
[[[n,a1],"->",[["["],["["],[f],[g],["]"],["]"]]]]],

[15,["[[[[],g],[]],[],a]"],
[[[n,a1],"->",[[[n,a2]],[a]]],
[[n,a2],"->",[[]]],
[[n,a2],"->",[["["],[[n,a4]],["]"],[[n,a2]]]],
[[n,a4],"->",[[]]],
[[n,a4],"->",[["["],[[n,a5]],["]"],[[n,a4]]]],
[[n,a5],"->",[[]]],
[[n,a5],"->",[["["],["]"],[g]]]]],

[16,["[[a],',',[a],',',[a]]"],
[[[n,a1],"->",[["["],[a],["]"],[[n,a2]]]],
[[n,a2],"->",[[]]],
[[n,a2],"->",[[','],["["],[a],["]"],[[n,a2]]]]]],

[17,["[a,',',a,',',a]"],
[[[n,a1],"->",[[a],[[n,a2]]]],
[[n,a2],"->",[[]]],
[[n,a2],"->",[[','],[a],[[n,a2]]]]]]

]),

 strings_to_symbols(L, L1, Lw),
 strings_to_grammar(L1,G5),
 decode_grammar(G5,G1),
 writeln1(G1),
 ((G1=G2)->R=success;R=fail
 ),
 writeln([R,N,strings_to_grammar,test]),
 
 (check_grammar(Lw,G1)->R1=success;R1=fail),
  writeln([R1,N,strings_to_grammar,check_grammar,test]),
  nl) 
 ,_),!.
 
 
% ---------------------------------------------------------------- words <-> symbols
%
% strings_to_grammar works on single symbols, so before it runs, every
% word (a maximal run of letters and digits, e.g. AA, a1, 12) is replaced by
% one symbol, and afterwards the symbols in the grammar's terminals are
% turned back into the words.
%
%   symbols: a, b, ... z for every word, in order of first appearance;
%            after z, EVEN non-ASCII code points (0x100, 0x102, ...) for words
%            starting with a capital, ODD ones (0x101, 0x103, ...) otherwise.
%   One table is shared by all the strings, so a word has the same symbol
%   in every string. It is stored as ws_symbol_word(SymbolAtom, WordString).
%
% A string that does not start with "[" is wrapped in [ ]:
%   "AA,AB,AC"   -> "[a,b,c]"
%   "[a,d,e]"    -> "[a,b,c]"   (with "[a,b]" seen first: a, b, then d->c ...)
%
% Usage:
%   ?- strings_to_grammar_words(["AA,AB,AC,AB,AC"], G).

:- dynamic ws_symbol_word/2.

strings_to_grammar_words(L, G) :-
    strings_to_symbols(L, L1, Lw),
    strings_to_grammar_safe(L1, Lw, G5),
    decode_grammar(G5, G).

% strings_to_grammar_words_covering(+Strings, -Grammar, -Added)
%   As strings_to_grammar_words/2, but the grammar always parses every input.
%   strings_to_grammar can leave out a case that is optional in the data, e.g.
%     ["n1,l2,s1", "n1,l2", "n1,n1,l2,s1", "s1,n1,l2"]
%   gives a grammar that requires the trailing s1, so it does not parse "n1,l2".
%   Each input that check_grammar/2 rejects is added as an alternative of the
%   start symbol; Added lists those inputs (as word strings), [] if none.
strings_to_grammar_words_covering(L, G, Added) :-
    strings_to_symbols(L, L1, Lw),
    strings_to_grammar_safe(L1, Lw, G5),
    decode_grammar(G5, G0),
    findall(W, ( member(W, Lw), \+ catch(check_grammar([W], G0), _, fail) ), Added),
    ( G0 = [[Start, Arrow, _]|_] -> true ; Start = [n, a1], Arrow = "->" ),
    findall([Start, Arrow, Items],
            ( member(W, Added), term_string(T, W), maplist(ws_item, T, Items) ), Extra),
    append(G0, Extra, G).

ws_item(X, [X]).

% strings_to_grammar_safe(+SymbolStrings, +WordStrings, -Grammar)
%   strings_to_grammar returns an empty grammar (which parses nothing) for a single word,
%   e.g. ["[a]"], and for some sets of strings with repeated words, e.g.
%   ["[a,a,b,a]", "[a,a,b]", "[a,a,a,b,a]"]; on others it can run for a very long time,
%   e.g. "[a,a,a,a,a,a,a,a,b]". In those cases this falls back to one alternative of
%   the start symbol per distinct input, which parses every input. The time allowed is
%   the flag s2g_time_limit (seconds, default 20).
strings_to_grammar_safe(L1, Lw, G) :-
    ( current_prolog_flag(s2g_time_limit, T) -> true ; T = 20 ),
    (   catch(call_with_time_limit(T, strings_to_grammar(L1, G0)), _, fail), G0 \== []
    ->  G = G0
    ;   sort(L1, Distinct),
        findall([[n, a1], "->", Items], ( member(S, Distinct), term_string(Tm, S), maplist(ws_item, Tm, Items) ), G),
        ignore(Lw = Lw)
    ).
:- create_prolog_flag(s2g_time_limit, 20, [type(integer), keep(true)]).

% strings_to_symbols(+Strings, -SymbolStrings, -WordStrings)
%   SymbolStrings: input for strings_to_grammar   "AA,AB" -> "[a,b]"
%   WordStrings:   input for check_grammar        "AA,AB" -> "['AA','AB']"
strings_to_symbols([], [], []) :- !,
    retractall(ws_symbol_word(_, _)).
strings_to_symbols(L, L1, Lw) :-
    maplist(ws_string_tokens, L, Tss),
    ws_join_sep(Tss, Toks0),
    findall(C, member(char(C), Toks0), Pass),
    sort(Pass, Used),                       % symbols must not clash with these
    ws_assign(Toks0, Used, [], Map, st(0, 0, 0), _, Toks),
    retractall(ws_symbol_word(_, _)),
    reverse(Map, Ordered),                  % store in first-seen order
    forall(member(SC-WCs, Ordered),
           ( char_code(SAtom, SC),
             string_codes(WStr, WCs),
             assertz(ws_symbol_word(SAtom, WStr)) )),
    ws_split_sep(Toks, SymTss),
    maplist(ws_sym_text, SymTss, L1),
    maplist(ws_word_text, Tss, Lw).

ws_string_tokens(S, Toks) :-
    string_codes(S, Cs0),
    ws_wrap_list(Cs0, Cs),
    ws_tokens(Cs, Toks).

% Wrap in [ ] unless it already starts with [ (after any spaces).
ws_wrap_list(Cs0, Cs) :-
    (   ws_skip_space(Cs0, [0'[|_])
    ->  Cs = Cs0
    ;   append([0'[|Cs0], [0']], Cs)
    ).

ws_skip_space([C|Cs], R) :- code_type(C, space), !, ws_skip_space(Cs, R).
ws_skip_space(R, R).

% One token list for all strings, separated by sep, so ws_assign shares
% one table; split again afterwards.
ws_join_sep([], []).
ws_join_sep([T], T) :- !.
ws_join_sep([T|Ts], J) :-
    ws_join_sep(Ts, J1),
    append(T, [sep|J1], J).

ws_split_sep(Ts, [P|Ps]) :-
    (   append(P, [sep|Rest], Ts)
    ->  ws_split_sep(Rest, Ps)
    ;   P = Ts, Ps = []
    ).

% Symbol string: a non-ASCII symbol is quoted ('Ā') so that it reads as an
% atom, not a variable, unless it already follows a quote.
ws_sym_text(Toks, Str) :-
    ws_emit_syms(Toks, none, Cs),
    string_codes(Str, Cs).

ws_emit_syms([], _, []).
ws_emit_syms([T|Ts], Prev, Cs) :-
    (   T = sym(S)
    ->  (   S > 127, Prev \== char(39)
        ->  C1 = [39, S, 39]
        ;   C1 = [S]
        )
    ;   T = char(C)
    ->  C1 = [C]
    ),
    ws_emit_syms(Ts, T, C2),
    append(C1, C2, Cs).

% Word string: each word written as a Prolog term (number, or quoted atom
% when needed: AA -> 'AA'), unless it already follows a quote.
ws_word_text(Toks, Str) :-
    ws_emit_words(Toks, none, Cs),
    string_codes(Str, Cs).

ws_emit_words([], _, []).
ws_emit_words([T|Ts], Prev, Cs) :-
    (   T = word(W)
    ->  (   Prev == char(39)
        ->  C1 = W
        ;   string_codes(WS, W),
            ws_word_term(WS, Term),
            format(codes(C1), "~q", [Term])
        )
    ;   T = char(C)
    ->  C1 = [C]
    ),
    ws_emit_words(Ts, T, C2),
    append(C1, C2, Cs).

% "12" -> 12, "AA" -> 'AA'
ws_word_term(W, T) :-
    (   catch(number_string(N, W), _, fail)
    ->  T = N
    ;   atom_string(T, W)
    ).

% decode_grammar(+SymbolGrammar, -WordGrammar)
% Only terminals ([X] items in rule bodies) are changed, so [n,a1] etc.
% are never touched.
decode_grammar(G0, G) :-
    maplist(ws_decode_rule, G0, G).

ws_decode_rule(R0, R) :-
    (   R0 = [H, Arrow, Body0], is_list(Body0)
    ->  maplist(ws_decode_item, Body0, Body),
        R = [H, Arrow, Body]
    ;   R = R0
    ).

ws_decode_item([X], [Y]) :-
    atom(X),
    ws_symbol_word(X, W), !,
    ws_word_term(W, Y).
ws_decode_item(I, I).

% ---------------------------------------------------------------- tokeniser

% ws_tokens(+Codes, -Tokens): word(Codes) for runs of letters/digits,
% char(C) for everything else.
ws_tokens([], []).
ws_tokens([C|Cs], [word([C|W])|Ts]) :-
    ws_word_char(C), !,
    ws_take_word(Cs, W, Rest),
    ws_tokens(Rest, Ts).
ws_tokens([C|Cs], [char(C)|Ts]) :-
    ws_tokens(Cs, Ts).

ws_take_word([C|Cs], [C|W], Rest) :-
    ws_word_char(C), !,
    ws_take_word(Cs, W, Rest).
ws_take_word(Rest, [], Rest).

ws_word_char(C) :-
    code_type(C, alnum),                    % letter or digit
    C =\= 95.                               % not underscore

% ws_assign(+Tokens, +Used, +Map0, -Map, +State0, -State, -Out)
% Map is a list of SymbolCode-WordCodes.
% State is st(N, U, L): N = next of a..z (shared by all words),
% U / L = next even / odd non-ASCII slot once a..z is used up.
ws_assign([], _, M, M, S, S, []).
ws_assign([sep|Ts], Used, M0, M, S0, S, [sep|Out]) :- !,
    ws_assign(Ts, Used, M0, M, S0, S, Out).
ws_assign([char(C)|Ts], Used, M0, M, S0, S, [char(C)|Out]) :- !,
    ws_assign(Ts, Used, M0, M, S0, S, Out).
ws_assign([word(W)|Ts], Used, M0, M, S0, S, [sym(Sym)|Out]) :-
    (   memberchk(Sym-W, M0)                % word seen before: reuse symbol
    ->  M1 = M0, S1 = S0
    ;   W = [First|_],
        ( code_type(First, upper) -> Case = upper ; Case = lower ),
        ws_fresh(Case, S0, Used, Sym, S1),
        M1 = [Sym-W|M0]
    ),
    ws_assign(Ts, Used, M1, M, S1, S, Out).

% ws_fresh(+Case, +State0, +Used, -SymbolCode, -State)
% a..z first, whatever the case; after z, even for upper, odd otherwise.
ws_fresh(Case, st(N0, U0, L0), Used, S, St) :-
    (   N0 < 26
    ->  C is 0'a + N0, N1 is N0 + 1, St1 = st(N1, U0, L0)
    ;   Case == upper
    ->  C is 0x100 + 2*U0, U1 is U0 + 1, St1 = st(N0, U1, L0)   % even
    ;   C is 0x101 + 2*L0, L1 is L0 + 1, St1 = st(N0, U0, L1)   % odd
    ),
    (   C > 0x10FFFF                    % no symbols left for this case:
    ->  throw(error(resource_error(s2g_symbols(Case)),     % stop, never loop
                    context(ws_fresh/5, 'more distinct words than Unicode symbols for this case (555,904 each)')))
    ;   ws_usable(C, Used)
    ->  S = C, St = St1
    ;   ws_fresh(Case, St1, Used, S, St)
    ).

ws_usable(C, Used) :-
    C =< 0x10FFFF,
    \+ between(0xD800, 0xDFFF, C),
    \+ memberchk(C, Used).

% test_s2gn_covering: the covering grammar parses every input, and running out of
% symbols raises an error instead of looping.
test_s2gn_covering :-
    L = ["n1,l2,s1", "n1,l2", "n1,n1,l2,s1", "s1,n1,l2"],
    strings_to_symbols(L, _, Lw),
    strings_to_grammar_words_covering(L, G, Added),
    ( (check_grammar(Lw, G), Added == ["[n1,l2]"]) -> R1 = success ; R1 = fail ),
    writeln([R1, 1, strings_to_grammar_words_covering, test]),
    strings_to_grammar_words_covering(["AA,AB,AC,AB,AC"], _, Added2),
    ( Added2 == [] -> R2 = success ; R2 = fail ),
    writeln([R2, 2, strings_to_grammar_words_covering, test]),
    catch(( ws_fresh(upper, st(26, 556930, 0), [], _, _), R3 = fail ),
          error(resource_error(s2g_symbols(upper)), _), R3 = success),
    writeln([R3, 3, ws_fresh_out_of_symbols, test]).
