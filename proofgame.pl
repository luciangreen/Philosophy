/*

Proof as typed alg game in which find types then alg for data
- generate types, alg, data
- Invent new Prolog where _ works for multiple calls, vars
- Press tab to make _ into code, types
- Need tab credit or answers to descend
- 5 points for correct answer or typing in tab answer, -1 for tab
- tab is good to find answers it is in - like pick a box
- tab is - not _

How to play

?- proofgame.        % 5 rounds
?- proofgame(3).     % 3 rounds

Each round has two 5 point stages:
1. Types: given the input and output data, fill in the _ blanks in the
   type chain (e.g. list -> _ -> number).
2. Algorithm: given your types, fill in the _ blanks in the Starlog-style
   algorithm (e.g. B is _(A)).

For each blank, type an answer, or type - (the tab) to pick from a
multiple choice menu (costs 1 point), or q to give up the stage.
Wrong answers can be retried until the stage is finished.
Any answer that fits the types and data is accepted.
A stage is worth 5 points minus the tabs used in it.
You need to finish the types stage to descend to the algorithm stage.

*/

:- use_module(library(random)).
:- use_module(library(lists)).
:- use_module(library(apply)).
:- use_module(library(yall)).

proofgame :-
	Rounds=5,
	proofgame(Rounds).

proofgame(Rounds) :-
	Total is Rounds*10,
	proofgame(Rounds,1,0,Score),
	nl,
	format("The score is ~w/~w~n",[Score,Total]).

proofgame(0,_,Score,Score) :- !.
proofgame(N,Round,Score1,Score2) :-
	generate_atd(Algorithm,Types,Data),
	nl,
	format("=== Round ~w ===~n",[Round]),
	replace_parts_with_tabs_sometimes(Types,T_template),
	% retries if wrong
	(stage(types,Data,[],T_template,T_answer,Points1)->
	(algorithm_for_types(T_answer,Data,Algorithm,Algorithm2),
	replace_parts_with_tabs_sometimes(Algorithm2,A_template),
	(stage(algorithm,Data,T_answer,A_template,_A_answer,Points2)->
	true;Points2=0));
	(Points1=0,Points2=0)),
	Points is Points1+Points2,
	Score3 is Score1+Points,
	format("Round ~w score: ~w/10, total so far: ~w~n",
		[Round,Points,Score3]),
	N2 is N-1,
	Round2 is Round+1,
	proofgame(N2,Round2,Score3,Score2).

/*
Commands that algorithms are made of:
cmd(Name,Input_type,Output_type)
*/

cmd(reverse,list,list).
cmd(sort,list,list).
cmd(msort,list,list).
cmd(double_all,list,list).
cmd(sum_list,list,number).
cmd(max_list,list,number).
cmd(min_list,list,number).
cmd(length,list,number).
cmd(plus_one,number,number).
cmd(square,number,number).
cmd(count_to,number,list).
cmd(number_string,number,string).
cmd(string_length,string,number).
cmd(string_double,string,string).

types([list,number,string]).

commands(Commands) :-
	findall(Command,cmd(Command,_,_),Commands).

cmd_goal(reverse,A,B) :- is_list(A),reverse(A,B).
cmd_goal(sort,A,B) :- is_list(A),sort(A,B).
cmd_goal(msort,A,B) :- is_list(A),msort(A,B).
cmd_goal(double_all,A,B) :- is_list(A),maplist([X,Y]>>(Y is X*2),A,B).
cmd_goal(sum_list,A,B) :- is_list(A),sum_list(A,B).
cmd_goal(max_list,A,B) :- is_list(A),max_list(A,B).
cmd_goal(min_list,A,B) :- is_list(A),min_list(A,B).
cmd_goal(length,A,B) :- is_list(A),length(A,B).
cmd_goal(plus_one,A,B) :- number(A),B is A+1.
cmd_goal(square,A,B) :- number(A),B is A*A.
cmd_goal(count_to,A,B) :- integer(A),A>=1,A=<10,numlist(1,A,B).
cmd_goal(number_string,A,B) :- number(A),number_string(A,B).
cmd_goal(string_length,A,B) :- string(A),string_length(A,B).
cmd_goal(string_double,A,B) :- string(A),string_concat(A,A,B).

apply_cmd(Command,A,B) :-
	catch(cmd_goal(Command,A,B),_,fail).

% run(+Algorithm,+Input,-Output)
run(Algorithm,Input,Output) :-
	foldl(apply_cmd,Algorithm,Input,Output1),
	Output1==Output.

run1(Algorithm,Input,Output) :-
	(foldl(apply_cmd,Algorithm,Input,Output1)->
	Output=Output1;Output=fail).

% chain_types(+Start_type,+Algorithm,-Types)
chain_types(Start,Algorithm,[Start|Types]) :-
	chain_types1(Algorithm,Start,Types).
chain_types1([],_,[]).
chain_types1([Command|Commands],T1,[T2|Types]) :-
	cmd(Command,T1,T2),
	chain_types1(Commands,T2,Types).

% types_alg(?Types,?Algorithm) - algorithm fits the type chain
types_alg([_],[]).
types_alg([T1,T2|Types],[Command|Commands]) :-
	cmd(Command,T1,T2),
	types_alg([T2|Types],Commands).

/*
generate 2-3 command sequence
optimise using s2a2 (drop commands that don't change the result)
find types
find example data
starlog (shown as B is c(A) lines)
*/

generate_atd(Algorithm,Types,[Input,Output]) :-
	repeat,
	random_member(Start,[list,number]),
	random_between(2,3,Length),
	random_chain(Length,Start,Algorithm1),
	optimise(Start,Algorithm1,Algorithm),
	length(Algorithm,Length2),
	Length2>=2,
	chain_types(Start,Algorithm,Types),
	random_data(Start,Input),
	run1(Algorithm,Input,Output),
	Output\==fail,
	Output\==Input,
	!.

random_chain(0,_,[]) :- !.
random_chain(N,T1,[Command|Commands]) :-
	findall(Command1-T2,cmd(Command1,T1,T2),Pairs),
	random_member(Command-T3,Pairs),
	N1 is N-1,
	random_chain(N1,T3,Commands).

random_data(list,List) :-
	random_between(3,5,N),
	length(List,N),
	maplist(random_between(1,9),List).
random_data(number,Number) :-
	random_between(1,9,Number).

optimise(Start,Algorithm1,Algorithm2) :-
	findall(Data,(between(1,10,_),random_data(Start,Data)),Tests),
	optimise1(Start,Tests,Algorithm1,Algorithm2).

optimise1(Start,Tests,Algorithm1,Algorithm2) :-
	chain_types(Start,Algorithm1,Types1),
	last(Types1,End),
	append(Before,[_|After],Algorithm1),
	append(Before,After,Algorithm3),
	chain_types(Start,Algorithm3,Types3),
	last(Types3,End),
	forall(member(Test,Tests),
	(run1(Algorithm1,Test,O1),run1(Algorithm3,Test,O2),O1==O2)),
	!,
	optimise1(Start,Tests,Algorithm3,Algorithm2).
optimise1(_,_,Algorithm,Algorithm).

% Use the original algorithm if it fits the player's types,
% otherwise find one that fits the types and data.
algorithm_for_types(Types,_,Algorithm,Algorithm) :-
	types_alg(Types,Algorithm),!.
algorithm_for_types(Types,[Input,Output],_,Algorithm) :-
	findall(Algorithm1,(types_alg(Types,Algorithm1),
	run(Algorithm1,Input,Output)),Algorithms),
	random_member(Algorithm,Algorithms).

% Replace 1 or 2 parts with '_' blanks.
replace_parts_with_tabs_sometimes(Items,Template) :-
	length(Items,Length),
	Max_blanks is min(2,Length),
	random_between(1,Max_blanks,Blanks),
	numlist(1,Length,Ns),
	random_permutation(Ns,Ns2),
	length(Blank_ns,Blanks),
	append(Blank_ns,_,Ns2),
	findall(Item2,(nth1(N,Items,Item),
	(member(N,Blank_ns)->Item2='_';Item2=Item)),Template).

/*
Stages
*/

stage(Kind,Data,Context,Template,Answer,Points) :-
	nl,
	stage_title(Kind,Title),
	format("--- ~w stage (5 points) ---~n",[Title]),
	fill_blanks(Kind,Data,Context,Template,Answer,0,Tabs),
	Points is 5-Tabs,
	nl,
	show(Kind,Data,Context,Answer),
	format("Stage finished: ~w points.~n",[Points]).

stage_title(types,"Types").
stage_title(algorithm,"Algorithm").

fill_blanks(Kind,Data,Context,Template,Answer,Tabs1,Tabs2) :-
	(nth1(I,Template,'_')->
	(nl,
	show(Kind,Data,Context,Template),
	ask_blank(Kind,Data,Context,Template,I,Value,Tabs1,Tabs3),
	replace_nth1(I,Template,Value,Template2),
	fill_blanks(Kind,Data,Context,Template2,Answer,Tabs3,Tabs2));
	(Answer=Template,Tabs2=Tabs1)).

replace_nth1(I,List1,Value,List2) :-
	I1 is I-1,
	length(Before,I1),
	append(Before,[_|After],List1),
	append(Before,[Value|After],List2).

ask_blank(Kind,Data,Context,Template,I,Value,Tabs1,Tabs2) :-
	kind_noun(Kind,Noun),
	format("Enter the ~w for the first _, - for multiple choice (costs 1 point), or q to quit: ",[Noun]),
	flush_output,
	read_input(Input),
	(Input="q"->(writeln("Stage given up."),fail);
	Input="-"->(Tabs3 is Tabs1+1,
	multi_choice(Kind,Data,Context,Template,I,Value),
	Tabs2=Tabs3);
	(atom_string(Value1,Input),
	(true_if_answer(Kind,Data,Context,Template,I,Value1)->
	(writeln("Correct."),Value=Value1,Tabs2=Tabs1);
	(writeln("Incorrect, try again."),
	ask_blank(Kind,Data,Context,Template,I,Value,Tabs1,Tabs2))))).

kind_noun(types,"type").
kind_noun(algorithm,"command").

read_input(Input) :-
	read_line_to_string(user_input,Input1),
	(Input1==end_of_file->Input="q";
	(split_string(Input1,""," \t\r",[Input2]),
	(Input2=""->read_input(Input);Input=Input2))).

% true if answer: some way of filling the other blanks fits the data
true_if_answer(Kind,Data,Context,Template,I,Value) :-
	domain(Kind,Domain),
	member(Value,Domain),
	replace_nth1(I,Template,Value,Template2),
	consistent(Kind,Data,Context,Template2),!.

domain(types,Domain) :- types(Domain).
domain(algorithm,Domain) :- commands(Domain).

consistent(types,[Input,Output],_,Template) :-
	types(Domain),
	maplist(fill_blank(Domain),Template,Types),
	types_alg(Types,Algorithm),
	run(Algorithm,Input,Output),!.
consistent(algorithm,[Input,Output],Types,Template) :-
	types_alg(Types,Algorithm),
	maplist(matches,Template,Algorithm),
	run(Algorithm,Input,Output),!.

fill_blank(Domain,'_',Item) :- !,member(Item,Domain).
fill_blank(_,Item,Item).

matches('_',_) :- !.
matches(Item,Item).

/*
Multiple choice (the tab): one answer that is in it, like pick a box,
and up to 3 answers that aren't, in random order.
*/

multi_choice(Kind,Data,Context,Template,I,Value) :-
	domain(Kind,Domain),
	findall(V,(member(V,Domain),
	true_if_answer(Kind,Data,Context,Template,I,V)),Correct),
	random_member(Answer,Correct),
	subtract(Domain,Correct,Wrong),
	random_permutation(Wrong,Wrong2),
	(length(Wrong3,3),append(Wrong3,_,Wrong2)->true;Wrong3=Wrong2),
	random_permutation([Answer|Wrong3],Menu_items),
	multi_choice1(Kind,Data,Context,Template,I,Menu_items,Value).

multi_choice1(Kind,Data,Context,Template,I,Menu_items,Value) :-
	nl,
	forall(nth1(N,Menu_items,Item),format("~w\t~w~n",[N,Item])),
	length(Menu_items,Length),
	format("Please choose from menu items 1-~w, or q to quit: ",[Length]),
	flush_output,
	read_input(Input),
	(Input="q"->(writeln("Stage given up."),fail);
	((number_string(N,Input),integer(N),N>=1,N=<Length,
	nth1(N,Menu_items,Value1),
	true_if_answer(Kind,Data,Context,Template,I,Value1))->
	(writeln("Correct."),Value=Value1);
	(writeln("Incorrect, try again."),
	multi_choice1(Kind,Data,Context,Template,I,Menu_items,Value)))).

/*
Display
*/

show(Kind,[Input,Output],Context,Template) :-
	format("Input:  ~q~nOutput: ~q~n",[Input,Output]),
	(Kind=types->
	(write_types(Template));
	(write_types(Context),
	write_algorithm(Template))).

write_types(Types) :-
	atomic_list_concat(Types,' -> ',Types_atom),
	format("Types:  ~w~n",[Types_atom]).

write_algorithm(Algorithm) :-
	writeln("Algorithm:"),
	length(Algorithm,Length),
	Length1 is Length+1,
	numlist(1,Length1,Ns),
	maplist(var_name,Ns,Vars),
	forall(nth1(N,Algorithm,Command),
	(nth1(N,Vars,In),N1 is N+1,nth1(N1,Vars,Out),
	format("  ~w is ~w(~w)~n",[Out,Command,In]))).

var_name(N,Name) :-
	Code is 0'A+N-1,
	char_code(Name,Code).

/*

enabled
contributes
sculptor
smp
salesperson
uphold
vars
subliminal
repo
stimulus
seat
joined
corporate
boundary
ships
glittering
receiving
manifesting
manifestation
inhabit
yourfolder
rec
regionalised
incorporated
ac
priori
wearing
hello
poppadum
orphanedobjectstoprepare
starscript
transmission
gardeners
funky
musicles
indonesian
lurking
paronomastically
arachnids
display
frailty
pallet
hallucinations
broadcasters
bullies
cheese
harley
disrespectful
scrutinise
gmail
sents
agents
geometrically
replacer
bimbo
twice
eye
jeopardy
reaction
longitudinal
swot
runs
specialized
dance
penny
unauthorised
identifywriters
cancel
improperly
month
bigger
stlp
medibank
unemployment
ses
deciphered
alphabetically
attaching
kerry

*/
