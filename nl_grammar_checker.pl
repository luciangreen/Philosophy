:- module(nl_grammar_checker,
    [ check_sentence/1,      % +SentenceAtom
      check_sentence/2,      % +SentenceAtom, -ParseTree
      sentence//1            % DCG: sentence(-ParseTree)
    ]).

:- use_module(library(lists)).
:- use_module(library(apply)).
:- use_module(library(dcg/basics)).
:- use_module(library(readutil)).

%% check_sentence(+SentenceAtom) is semidet.
check_sentence(SentenceAtom) :-
    check_sentence(SentenceAtom, _ParseTree).

%% check_sentence(+SentenceAtom, -ParseTree) is semidet.
check_sentence(SentenceAtom, ParseTree) :-
    normalize_space(atom(Trimmed), SentenceAtom),
    (   Trimmed == ''
    ->  format('✗ Empty sentence.~n'),
        !, fail
    ;   true
    ),
    tokenize_atom(Trimmed, RawTokens),
    maplist(downcase_atom, RawTokens, Tokens),
    (   phrase(sentence(ParseTree), Tokens)
    ->  format('✓ Grammatically valid (in this grammar).~n'),
        format('   Tokens: ~w~n', [Tokens]),
        format('   Parse : ~q~n', [ParseTree])
    ;   format('✗ Sentence not grammatical (in this toy grammar).~n'),
        format('   Tokens: ~w~n', [Tokens]),
        suggest_fix(Tokens),
        fail
    ).

%% suggest_fix(+Tokens)
suggest_fix([Subj,Verb|_]) :-
    pronoun_lex(Subj, Person, Num),
    \+ verb_lex(Verb, Person, Num),
    !,
    findall(V, verb_lex(V, Person, Num), Vs0),
    sort(Vs0, Vs),
    format('   Hint: Subject "~w" is ~w/~w; try verbs like: ~w~n',
           [Subj, Person, Num, Vs]).
suggest_fix(_) :-
    format('   Hint: Try a simple pattern like "the cat eats" or "they eat fish".~n').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% DCG GRAMMAR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Allow optional final punctuation
sentence(S) -->
    core_sentence(S),
    opt_punct.

core_sentence(s(NP, VP)) -->
    np(Number, Person, NP),
    vp(Number, Person, VP).

opt_punct --> [].
opt_punct --> ['.'].
opt_punct --> ['?'].
opt_punct --> ['!'].

% Noun phrase: pronoun
np(Number, Person, np_pron(Pron)) -->
    pronoun(Pron, Person, Number).

% Noun phrase: determiner + noun (e.g. "the cat")
np(Number, Person, np_det(Det, N)) -->
    det(Det, Number),
    noun(N, Number),
    { Person = 3 }.

% Noun phrase: bare noun (e.g. "fish", "students")
np(Number, Person, np_bare(N)) -->
    noun(N, Number),
    { Person = 3 }.

% Verb phrase: intransitive verb
vp(Number, Person, vp_intrans(V)) -->
    verb(V, Person, Number).

% Verb phrase: transitive verb + object NP
vp(Number, Person, vp_trans(V, NP)) -->
    verb(V, Person, Number),
    np(_, _, NP).

% Verb phrase: copula + predicate adjective
vp(Number, Person, vp_cop_adj(Verb, Adj)) -->
    copula(Verb, Person, Number),
    adj(Adj).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LEXICON DCGs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

det(det(Word), Num) -->
    [Word],
    { det_lex(Word, Num) }.

noun(noun(Word), Num) -->
    [Word],
    { noun_lex(Word, Num) }.

pronoun(pron(Word), Person, Num) -->
    [Word],
    { pronoun_lex(Word, Person, Num) }.

verb(verb(Word), Person, Num) -->
    [Word],
    { verb_lex(Word, Person, Num) }.

copula(cop(Word), Person, Num) -->
    [Word],
    { copula_lex(Word, Person, Num) }.

adj(adj(Word)) -->
    [Word],
    { adj_lex(Word) }.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LEXICON FACTS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% determiners
det_lex(the,  _).
det_lex(a,    sing).
det_lex(an,   sing).
det_lex(some, plur).
det_lex(every, sing).

% nouns
noun_lex(cat,      sing).
noun_lex(dog,      sing).
noun_lex(ball,     sing).
noun_lex(fish,     sing).
noun_lex(student,  sing).
noun_lex(students, plur).
noun_lex(cats,     plur).
noun_lex(dogs,     plur).
noun_lex(books,    plur).

% pronouns
pronoun_lex(i,      1, sing).
pronoun_lex(you,    2, sing).
pronoun_lex(you,    2, plur).
pronoun_lex(he,     3, sing).
pronoun_lex(she,    3, sing).
pronoun_lex(it,     3, sing).
pronoun_lex(we,     1, plur).
pronoun_lex(they,   3, plur).

% main verbs (present simple)
verb_lex(eat,  1, sing).
verb_lex(eat,  2, sing).
verb_lex(eat,  _, plur).
verb_lex(eats, 3, sing).

verb_lex(read, 1, sing).
verb_lex(read, 2, sing).
verb_lex(read, _, plur).
verb_lex(reads, 3, sing).

verb_lex(sleep, 1, sing).
verb_lex(sleep, 2, sing).
verb_lex(sleep, _, plur).
verb_lex(sleeps, 3, sing).

% copula (to be)
copula_lex(am,   1, sing).
copula_lex(are,  2, sing).
copula_lex(is,   3, sing).
copula_lex(are,  _, plur).

% adjectives
adj_lex(happy).
adj_lex(sad).
adj_lex(big).
adj_lex(small).
adj_lex(young).
adj_lex(old).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Utility
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

downcase_atom(In, Out) :-
    atom(In),
    !,
    atom_string(In, S),
    string_lower(S, LS),
    atom_string(Out, LS).
downcase_atom(In, Out) :-
    string(In),
    string_lower(In, Out).