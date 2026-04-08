main:-mist.
% mist_interactive.pl
% Mist - interactive ASCII text adventure for pl2js.js style Prolog
%
% Features:
% - Continuous loop: no repeated manual start/stop commands
% - Clear instructions at each point
% - read_string(Prompt, InString) style input
% - Pure state passing, no assertz/retract
%
% Main entry:
%   ?- mist.
%
% If your environment does not already provide read_string/2,
% replace the fallback predicate near the bottom.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Entry
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mist :-
    intro,
    InitialState = state(jetty_jetty, [], []),
    game_loop(InitialState).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Main loop
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

game_loop(State) :-
    won(State),
    !,
    nl,
    write('All five gates are clear.'), nl,
    write('The mist thins into deliberate light.'), nl,
    write('What was missed has been captured, stacked, and checksummed.'), nl,
    write('You have clocked Mist.'), nl.

game_loop(State) :-
    nl,
    show_location(State),
    show_goal_progress(State),
    room_options(State, Options),
    show_options(Options),
    prompt_for_option(Options, Choice),
    apply_choice(Choice, State, NewState),
    game_loop(NewState).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Intro
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

intro :-
    nl,
    write('Mist'), nl,
    write('----'), nl,
    write('An ASCII adventure in the spirit of Myst.'), nl,
    write('You must clear five maze gates:'), nl,
    write('  1. jetty'), nl,
    write('  2. headquarters'), nl,
    write('  3. vineyard'), nl,
    write('  4. thinmaze'), nl,
    write('  5. alienmaze'), nl,
    nl,
    write('To clear a gate:'), nl,
    write('  - explore the area'), nl,
    write('  - collect its three missed pieces'), nl,
    write('  - reach its gate room'), nl,
    write('  - choose the correct stack action'), nl,
    nl,
    write('The puzzle theme is "missed":'), nl,
    write('  a missed projectile, a missed opportunity, or a missed pl2js feature.'), nl,
    write('Each successful stack also proves the puzzle is runnable within'), nl,
    write('23*250 breasonings.'), nl.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% State display
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

show_location(state(Room, Inv, Cleared)) :-
    nl,
    room_text(Room, Text),
    write(Text), nl,
    show_visible_items(Room, Inv),
    show_inventory(Inv),
    show_cleared(Cleared).

show_goal_progress(state(_, _, Cleared)) :-
    nl,
    write('Goal: clear all five gates.'), nl,
    write('Remaining gates: '),
    remaining_gates(Cleared, Remaining),
    write(Remaining), nl.

show_visible_items(Room, Inv) :-
    room_items(Room, Items),
    subtract_seen(Items, Inv, Visible),
    ( Visible = [] ->
        write('Visible here: none.'), nl
    ;
        write('Visible here: '), write(Visible), nl
    ).

show_inventory(Inv) :-
    write('Inventory: '), write(Inv), nl.

show_cleared(Cleared) :-
    write('Cleared gates: '), write(Cleared), nl.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Options per room
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

room_options(state(Room, Inv, _Cleared), Options) :-
    movement_options(Room, MoveOptions),
    take_options(Room, Inv, TakeOptions),
    stack_options(Room, StackOptions),
    append_list([MoveOptions, TakeOptions, StackOptions, [inventory, goal]], Options).

movement_options(Room, Options) :-
    exits(Room, Exits),
    movement_terms(Exits, Options).

movement_terms([], []).
movement_terms([Dir|T], [go(Dir)|T2]) :-
    movement_terms(T, T2).

take_options(Room, Inv, Options) :-
    room_items(Room, Items),
    subtract_seen(Items, Inv, Visible),
    take_terms(Visible, Options).

take_terms([], []).
take_terms([Item|T], [take(Item)|T2]) :-
    take_terms(T, T2).

stack_options(Room, [stack(Level)]) :-
    gate_room(Level, Room),
    !.
stack_options(_, []).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Input
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

prompt_for_option(Options, Choice) :-
    nl,
    write('Choose one of the above options exactly.'), nl,
    read_string('> ', InString),
    parse_choice(InString, Parsed),
    ( member_eq(Parsed, Options) ->
        Choice = Parsed
    ;
        nl,
        write('That was not one of the listed options.'), nl,
        write('Please type one of the options exactly as shown.'), nl,
        prompt_for_option(Options, Choice)
    ).

parse_choice(InString, Term) :-
    atom_string(Atom, InString),
    atom_to_term(Atom, Term,[]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Apply choices
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

apply_choice(inventory, State, State) :-
    State = state(_, Inv, _),
    nl,
    write('Inventory: '), write(Inv), nl.

apply_choice(goal, State, State) :-
    remaining_gates_from_state(State, Remaining),
    nl,
    write('Still to clear: '), write(Remaining), nl.

apply_choice(go(Direction), state(Room, Inv, Cleared), state(Next, Inv, Cleared)) :-
    exit(Room, Direction, Next),
    access_allowed(Next, Cleared),
    nl,
    write('You move '), write(Direction), write('.'), nl.

apply_choice(take(Item), state(Room, Inv, Cleared), state(Room, Inv2, Cleared)) :-
    item_at(Room, Item),
    \+ member_eq(Item, Inv),
    add_unique(Item, Inv, Inv2),
    nl,
    write('Captured: '), write(Item), nl.

apply_choice(stack(Level), state(Room, Inv, Cleared), state(Room, Inv, Cleared2)) :-
    gate_room(Level, Room),
    required_stack(Level, Stack),
    inventory_has_all(Stack, Inv),
    checksum(Stack, Sum),
    target_checksum(Level, Sum),
    complexity_ok(Stack),
    add_unique(Level, Cleared, Cleared2),
    nl,
    write('Correct stack for '), write(Level), write(': '), write(Stack), nl,
    write('Checksum accepted: '), write(Sum), nl,
    write('The gate unlocks.'), nl.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Remaining gates
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

all_gates([jetty, headquarters, vineyard, thinmaze, alienmaze]).

remaining_gates(Cleared, Remaining) :-
    all_gates(All),
    remove_members(All, Cleared, Remaining).

remaining_gates_from_state(state(_, _, Cleared), Remaining) :-
    remaining_gates(Cleared, Remaining).

remove_members([], _, []).
remove_members([H|T], Seen, Out) :-
    member_eq(H, Seen),
    !,
    remove_members(T, Seen, Out).
remove_members([H|T], Seen, [H|Out]) :-
    remove_members(T, Seen, Out).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Access logic
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

access_allowed(Room, _Cleared) :-
    \+ locked_room(Room),
    !.

access_allowed(Room, Cleared) :-
    room_gate(Room, Gate),
    member_eq(Gate, Cleared).

locked_room(jetty_gate).
locked_room(hq_gate).
locked_room(vineyard_gate).
locked_room(thin_gate).
locked_room(alien_gate).

room_gate(jetty_gate, jetty).
room_gate(hq_gate, headquarters).
room_gate(vineyard_gate, vineyard).
room_gate(thin_gate, thinmaze).
room_gate(alien_gate, alienmaze).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Win logic
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

won(state(_, _, Cleared)) :-
    member_eq(jetty, Cleared),
    member_eq(headquarters, Cleared),
    member_eq(vineyard, Cleared),
    member_eq(thinmaze, Cleared),
    member_eq(alienmaze, Cleared).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% World
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

room_text(jetty_jetty,
'You stand on the jetty hub. Sea mist drifts over black water. Five routes branch into dreamlike mazes.').

room_text(jetty_store,
'This rope shed leans over the water. Something once flew wide here and was never recovered.').

room_text(jetty_gate,
'A wet timber gate waits for the jetty stack. The final sea path lies beyond it.').

room_text(hq_lobby,
'The headquarters lobby hums faintly. Old consoles blink like half-finished thoughts.').

room_text(hq_archive,
'The archive stores dry notebooks, punched cards, and nearly-implemented features.').

room_text(hq_gate,
'A steel iris gate seals headquarters. It will only open for the correct stack.').

room_text(vineyard_low,
'Rows of vines rise vertically like a green wall. The mission goes upward, not forward.').

room_text(vineyard_mid,
'You are halfway up the vertical vineyard. Wind moves between the leaves.').

room_text(vineyard_gate,
'A glass gate hangs impossibly among the vines. It waits for the vineyard stack.').

room_text(thin_1,
'A long thin corridor stretches through the mist. This maze thinks linearly.').

room_text(thin_2,
'The corridor continues. A faded formula mentions 23*250 breasonings.').

room_text(thin_gate,
'A narrow gate stands at the corridor end with a checksum dial.').

room_text(alien_outer,
'A maze shaped like an alien symbol curves around you in ritual geometry.').

room_text(alien_inner,
'Luminous marks pulse at the inner node like a forgotten checksum language.').

room_text(alien_gate,
'A stone gate shaped like the final stroke of the symbol blocks the way.').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Exits
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

exit(jetty_jetty, east, jetty_store).
exit(jetty_jetty, north, hq_lobby).
exit(jetty_jetty, south, vineyard_low).
exit(jetty_jetty, west, thin_1).
exit(jetty_jetty, in, alien_outer).

exit(jetty_store, west, jetty_jetty).
exit(jetty_store, east, jetty_gate).
exit(jetty_gate, west, jetty_store).

exit(hq_lobby, south, jetty_jetty).
exit(hq_lobby, east, hq_archive).
exit(hq_archive, west, hq_lobby).
exit(hq_archive, north, hq_gate).
exit(hq_gate, south, hq_archive).

exit(vineyard_low, north, jetty_jetty).
exit(vineyard_low, up, vineyard_mid).
exit(vineyard_mid, down, vineyard_low).
exit(vineyard_mid, up, vineyard_gate).
exit(vineyard_gate, down, vineyard_mid).

exit(thin_1, east, jetty_jetty).
exit(thin_1, west, thin_2).
exit(thin_2, east, thin_1).
exit(thin_2, west, thin_gate).
exit(thin_gate, east, thin_2).

exit(alien_outer, out, jetty_jetty).
exit(alien_outer, clockwise, alien_inner).
exit(alien_inner, anticlockwise, alien_outer).
exit(alien_inner, inward, alien_gate).
exit(alien_gate, outward, alien_inner).

exits(Room, Directions) :-
    collect_exits(Room, Directions).

collect_exits(Room, Directions) :-
    findall_simple(Direction, exit(Room, Direction, _), Directions).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Gate rooms
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

gate_room(jetty, jetty_gate).
gate_room(headquarters, hq_gate).
gate_room(vineyard, vineyard_gate).
gate_room(thinmaze, thin_gate).
gate_room(alienmaze, alien_gate).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Items
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

item_at(jetty_store, missed_projectile).
item_at(jetty_store, jetty_rune).
item_at(jetty_gate, salt_checksum).

item_at(hq_lobby, missed_feature).
item_at(hq_archive, pl2js_note).
item_at(hq_archive, steel_checksum).

item_at(vineyard_low, missed_opportunity).
item_at(vineyard_mid, vine_rune).
item_at(vineyard_mid, glass_checksum).

item_at(thin_1, breasoning_counter).
item_at(thin_2, linear_rune).
item_at(thin_2, thin_checksum).

item_at(alien_outer, symbol_shard).
item_at(alien_inner, spiral_rune).
item_at(alien_inner, alien_checksum).

room_items(Room, Items) :-
    findall_simple(Item, item_at(Room, Item), Items).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Correct stacks
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

required_stack(jetty, [missed_projectile, jetty_rune, salt_checksum]).
required_stack(headquarters, [missed_feature, pl2js_note, steel_checksum]).
required_stack(vineyard, [missed_opportunity, vine_rune, glass_checksum]).
required_stack(thinmaze, [breasoning_counter, linear_rune, thin_checksum]).
required_stack(alienmaze, [symbol_shard, spiral_rune, alien_checksum]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Checksums and complexity
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

target_checksum(jetty, 611).
target_checksum(headquarters, 967).
target_checksum(vineyard, 821).
target_checksum(thinmaze, 575).
target_checksum(alienmaze, 733).

checksum_value(missed_projectile, 101).
checksum_value(jetty_rune, 203).
checksum_value(salt_checksum, 307).

checksum_value(missed_feature, 211).
checksum_value(pl2js_note, 313).
checksum_value(steel_checksum, 443).

checksum_value(missed_opportunity, 109).
checksum_value(vine_rune, 211).
checksum_value(glass_checksum, 501).

checksum_value(breasoning_counter, 125).
checksum_value(linear_rune, 175).
checksum_value(thin_checksum, 275).

checksum_value(symbol_shard, 131).
checksum_value(spiral_rune, 251).
checksum_value(alien_checksum, 351).

checksum([A,B,C], Sum) :-
    checksum_value(A, VA),
    checksum_value(B, VB),
    checksum_value(C, VC),
    Sum is VA + VB + VC.

breasoning_limit(5750).

complexity_cost(missed_projectile, 1400).
complexity_cost(jetty_rune, 2100).
complexity_cost(salt_checksum, 900).

complexity_cost(missed_feature, 1300).
complexity_cost(pl2js_note, 1900).
complexity_cost(steel_checksum, 700).

complexity_cost(missed_opportunity, 1500).
complexity_cost(vine_rune, 1700).
complexity_cost(glass_checksum, 800).

complexity_cost(breasoning_counter, 2200).
complexity_cost(linear_rune, 1800).
complexity_cost(thin_checksum, 700).

complexity_cost(symbol_shard, 1600).
complexity_cost(spiral_rune, 2000).
complexity_cost(alien_checksum, 900).

complexity_ok(Stack) :-
    total_complexity(Stack, Total),
    breasoning_limit(Limit),
    Total =< Limit.

total_complexity([], 0).
total_complexity([H|T], Total) :-
    complexity_cost(H, C1),
    total_complexity(T, C2),
    Total is C1 + C2.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Helpers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

inventory_has_all([], _).
inventory_has_all([H|T], Inv) :-
    member_eq(H, Inv),
    inventory_has_all(T, Inv).

subtract_seen([], _, []).
subtract_seen([H|T], Inv, Out) :-
    member_eq(H, Inv),
    !,
    subtract_seen(T, Inv, Out).
subtract_seen([H|T], Inv, [H|Out]) :-
    subtract_seen(T, Inv, Out).

add_unique(X, L, L) :-
    member_eq(X, L),
    !.
add_unique(X, L, [X|L]).

member_eq(X, [Y|_]) :-
    X == Y,
    !.
member_eq(X, [_|T]) :-
    member_eq(X, T).

append_list([], []).
append_list([L], L) :-
    !.
append_list([A,B|T], Out) :-
    append(A, B, AB),
    append_list([AB|T], Out).

findall_simple(X, Goal, List) :-
    bagof(X, Goal, List),
    !.
findall_simple(_, _, []).

show_options(Options) :-
    nl,
    write('Options:'), nl,
    show_options_2(Options).

show_options_2([]).
show_options_2([H|T]) :-
    write('  '), write(H), nl,
    show_options_2(T).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% read_string/2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% If pl2js.js already provides read_string/2, use that.
% Otherwise this fallback lets you test in SWI-like systems.
%
% Expected input examples:
%   go(east).
%   take(missed_projectile).
%   stack(jetty).
%   inventory.
%   goal.
%
% You can remove this fallback if your runtime already defines read_string/2.

read_string(Prompt, InString) :-
    write(Prompt),
    read(InTerm),
    term_to_atom(InTerm, Atom),
    atom_string(Atom, InString).