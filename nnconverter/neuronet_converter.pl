:- module(neuronet_converter, [
    convert_algorithm/2,
    complexity_finder/2,
    type_finder/2,
    inductive_transform/2,
    pattern_unfold/2,
    grammar_generate/2,
    inductive_insert/3
]).

/** <module> Prolog Algorithm → Manual Neuronet Converter
 *
 *  Converts Prolog algorithms into neuronet-like inductive representations.
 *  
 *  This system transforms Prolog algorithms into neuronet-style architectures by:
 *  - Detecting recursive structures
 *  - Applying inductive transformations (n → n+1 steps)
 *  - Using pattern unfolding to propagate inputs/outputs
 *  - Generating grammars for lists, atoms, and strings
 *  - Optimizing by replacing complex non-pattern-matching segments with inductive equivalents
 *
 *  Version: 1.0
 *  Compatible with: SWI-Prolog 8.4+
 *
 *  Steps:
 *   1. Complexity analysis
 *   2. Type inference
 *   3. Inductive transformation
 *   4. Pattern unfolding
 *   5. Grammar generation
 *   6. Inductive insertion
 */

%% convert_algorithm(+Algorithm, -Neuronet)
%  High-level driver: Converts an input algorithm (list of clauses)
%  into a neuronet representation.
%
%  @param Algorithm List of Prolog clauses representing the algorithm
%  @param Neuronet  Structured representation containing all transformation stages
convert_algorithm(Algorithm, Neuronet) :-
    % Step 1: Analyze computational complexity
    complexity_finder(Algorithm, ComplexityInfo),
    
    % Step 2: Infer types of arguments
    type_finder(Algorithm, TypeInfo),
    
    % Step 3: Transform recursive predicates into inductive form
    inductive_transform(Algorithm, InductiveForm),
    
    % Step 4: Expand all predicate calls (pattern unfolding)
    pattern_unfold(InductiveForm, UnfoldedForm),
    
    % Step 5: Generate grammars from unfolded form
    grammar_generate(UnfoldedForm, Grammar),
    
    % Step 6: Replace non-pattern-matching code with inductive steps
    inductive_insert(UnfoldedForm, Grammar, OptimisedForm),
    
    % Construct final neuronet representation
    Neuronet = neuronet{
        complexity: ComplexityInfo,
        types: TypeInfo,
        inductive_form: InductiveForm,
        unfolded_form: UnfoldedForm,
        grammar: Grammar,
        optimised: OptimisedForm
    }.

%% complexity_finder(+Algorithm, -ComplexityInfo)
%  Analyse recursion depth, branching factor, and classify complexity.
%
%  Features:
%  - Detect tail recursion vs non-tail recursion
%  - Identify branching factor in recursive calls  
%  - Tag each predicate with complexity category (O(1), O(n), O(n²), etc.)
%
%  @param Algorithm     List of clauses to analyze
%  @param ComplexityInfo List of complexity metadata for each predicate
complexity_finder(Algorithm, ComplexityInfo) :-
    findall(predicate(Name, Complexity), 
            (member(Clause, Algorithm),
             extract_predicate_name(Clause, Name),
             analyze_complexity(Clause, Algorithm, Complexity)),
            ComplexityInfo).

% Helper: Extract predicate name from clause
extract_predicate_name((Head :- _), Name) :- !,
    functor(Head, Name, _).
extract_predicate_name(Head, Name) :-
    functor(Head, Name, _).

% Helper: Analyze complexity of a single clause
analyze_complexity(Clause, Algorithm, Complexity) :-
    (   has_recursion(Clause, Algorithm) ->
        (   is_tail_recursive(Clause, Algorithm) ->
            Complexity = o_n
        ;   has_multiple_recursive_calls(Clause) ->
            Complexity = o_n2
        ;   Complexity = o_n
        )
    ;   Complexity = o_1
    ).

% Helper: Check if clause has recursion
has_recursion((Head :- Body), Algorithm) :- !,
    functor(Head, Name, _),
    contains_call_to(Body, Name).
has_recursion(_, _) :- fail.

% Helper: Check if body contains call to predicate Name
contains_call_to((Goal, Rest), Name) :- !,
    (   functor(Goal, Name, _) 
    ;   contains_call_to(Rest, Name)
    ).
contains_call_to(Goal, Name) :-
    functor(Goal, Name, _).

% Helper: Check if recursion is tail recursive  
is_tail_recursive((Head :- Body), _) :-
    functor(Head, Name, _),
    last_goal_in_body(Body, LastGoal),
    functor(LastGoal, Name, _).

% Helper: Extract last goal from body
last_goal_in_body((_, Rest), LastGoal) :- !,
    last_goal_in_body(Rest, LastGoal).
last_goal_in_body(Goal, Goal).

% Helper: Check for multiple recursive calls
has_multiple_recursive_calls((Head :- Body)) :-
    functor(Head, Name, _),
    count_calls_to(Body, Name, Count),
    Count > 1.

% Helper: Count calls to predicate Name in Body
count_calls_to((Goal, Rest), Name, Count) :- !,
    count_calls_to(Goal, Name, Count1),
    count_calls_to(Rest, Name, Count2),
    Count is Count1 + Count2.
count_calls_to(Goal, Name, 1) :-
    functor(Goal, Name, _), !.
count_calls_to(_, _, 0).

%% type_finder(+Algorithm, -TypeInfo)
%  Infer types of arguments (list, atom, string, number, compound term).
%
%  Features:
%  - Type inference for list, atom, string, number, compound term
%  - Detects constants vs variables
%  - Generates type constraints for grammars
%
%  @param Algorithm List of clauses to analyze for types
%  @param TypeInfo  List of type signatures per predicate
type_finder(Algorithm, TypeInfo) :-
    findall(predicate(Name, Types),
            (member(Clause, Algorithm),
             extract_predicate_name(Clause, Name),
             infer_argument_types(Clause, Types)),
            TypeInfo).

% Helper: Infer types of arguments in a clause
infer_argument_types((Head :- _), Types) :- !,
    Head =.. [_|Args],
    maplist(infer_single_type, Args, Types).
infer_argument_types(Head, Types) :-
    Head =.. [_|Args],
    maplist(infer_single_type, Args, Types).

% Helper: Infer type of a single argument
infer_single_type([], list(var)) :- !.
infer_single_type([_|_], list(element)) :- !.
infer_single_type(Atom, atom) :- 
    atom(Atom), !.
infer_single_type(Number, number) :- 
    number(Number), !.
infer_single_type(String, string) :- 
    string(String), !.
infer_single_type(Compound, compound) :- 
    compound(Compound), !.
infer_single_type(_, var).

%% inductive_transform(+Algorithm, -InductiveForm)
%  Transform recursive predicates into base + inductive step representation.
%
%  Features:
%  - Identify base case (n=0 or empty list)
%  - Identify inductive step (n → n+1 or [H|T] recursion)
%  - Replace code with explicit induction template
%
%  @param Algorithm     Original algorithm clauses
%  @param InductiveForm List of base_case/1 and inductive_step/2 terms
inductive_transform(Algorithm, InductiveForm) :-
    findall(Form,
            (member(Clause, Algorithm),
             classify_clause(Clause, Algorithm, Form)),
            InductiveForm).

% Helper: Classify clause as base case or inductive step
classify_clause((Head :- Body), Algorithm, Form) :- !,
    (   is_base_case(Head, Body) ->
        Form = base_case(Head)
    ;   has_recursion((Head :- Body), Algorithm) ->
        Form = inductive_step(Head, Body)
    ;   Form = derived_rule(Head, Body)  % Non-recursive, non-base facts
    ).
classify_clause(Head, _Algorithm, base_case(Head)).

% Helper: Check if this is a base case
is_base_case(Head, Body) :-
    % Create a fresh copy to avoid variable binding issues
    copy_term((Head, Body), (HeadCopy, BodyCopy)),
    HeadCopy =.. [_|Args],
    (   exact_member([], Args) ->
        !
    ;   exact_member(0, Args) ->
        !  
    ;   BodyCopy = true ->
        !
    ;   fail
    ).

% Helper: Exact member check without unification
exact_member(X, [Y|_]) :- X == Y, !.
exact_member(X, [_|T]) :- exact_member(X, T).

%% pattern_unfold(+InductiveForm, -UnfoldedForm)
%  Expand all predicate calls to inline definitions (pattern unfolding).
%
%  Features:
%  - Replace each predicate call with its full definition
%  - Track variable bindings to maintain correctness
%  - Allow reconversion into optimized form
%
%  @param InductiveForm Original inductive form
%  @param UnfoldedForm  Expanded form with inlined definitions
pattern_unfold(InductiveForm, UnfoldedForm) :-
    % For now, keep the inductive form as-is
    % TODO: Implement full unfolding of predicate calls
    UnfoldedForm = InductiveForm.

%% grammar_generate(+UnfoldedForm, -Grammar)
%  Generate grammars for lists, atoms, strings with constants & variables.
%
%  Features:
%  - Generate CFG-like grammar for list operations
%  - Generate atom/string grammar with placeholders
%  - Associate grammar rules with recursive structure
%
%  @param UnfoldedForm Unfolded algorithm representation
%  @param Grammar      List of grammar rules
grammar_generate(UnfoldedForm, Grammar) :-
    findall(Rule,
            (member(Form, UnfoldedForm),
             extract_grammar_rule(Form, Rule)),
            GrammarRules),
    % Remove duplicates and add standard list grammar
    sort(GrammarRules, SortedRules),
    append([[list -> []], [list -> [element | list]]], SortedRules, Grammar).

% Helper: Extract grammar rule from inductive form
extract_grammar_rule(base_case(Head), Rule) :-
    Head =.. [Name|Args],
    (   member([], Args) ->
        atom_concat(Name, '_empty', NonTerminal),
        Rule = [NonTerminal -> []]
    ;   atom_concat(Name, '_base', NonTerminal),
        Rule = [NonTerminal -> Args]
    ).
extract_grammar_rule(inductive_step(Head, _Body), Rule) :-
    Head =.. [Name|Args],
    atom_concat(Name, '_step', NonTerminal),
    Rule = [NonTerminal -> Args].

%% inductive_insert(+UnfoldedForm, +Grammar, -OptimisedForm)
%  Replace non-pattern-matching code with inductive steps if possible.
%
%  Features:
%  - Detect code fragments that could be expressed as induction
%  - Retrieve saved inductive steps (library of proven patterns)
%  - Insert appropriate inductive patterns
%
%  @param UnfoldedForm  Unfolded algorithm representation
%  @param Grammar       Generated grammar rules
%  @param OptimisedForm Final optimized form with inductive patterns
inductive_insert(UnfoldedForm, _Grammar, OptimisedForm) :-
    % For now, return the unfolded form as-is
    % TODO: Implement optimization using inductive patterns
    OptimisedForm = UnfoldedForm.