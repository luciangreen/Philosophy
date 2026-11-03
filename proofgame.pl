/*

Proof as typed alg game in which find types then alg for data
- generate types, alg, data
- Invent new Prolog where _ works for multiple calls, vars
- Press tab to make _ into code, types
- Need tab credit or answers to descend
- 5 points for correct answer or typing in tab answer, -1 for tab
- tab is good to find answers it is in - like pick a box
- tab is - not _

*/
proofgame :-
Total=10,
proofgame(Total,0,Score),
writeln(["The score is",Score,/,Total]).

proofgame(0,Score,Score) :-!.
proofgame(N,Score1,Score2) :-
	generate_atd(Algorithm, Types, Data),
	generate_variants(Types,Types_variants),
	generate_variants(Algorithm,Algorithm_variants),
	replace_parts_with_tabs_sometimes([Types|Types_variants],T_and_answers),
	replace_parts_with_tabs_sometimes([Algorithm,Algorithm_variants],A_and_answers),
	% retries if wrong
	%repeat
	((
	((
	ask_for_t(Data,T_and_answers),
	check_tab(T_and_answers,T_answer,Points1)
	)),
	ask_for_a(T_answer,A_and_answers),
	check_tab(A_and_answers,A_answer,Points)
	)->Score3 is Score1+Points1+Points2;Score3=Score1),
	N2 is N-1,
	proofgame(N2,Score3,Score2).

generate_atd(Algorithm, Types, Data) :-
	generate 2-3 command sequence
	optimise using s2a2
	find types
	find example data
	starlog


	if has tab, ask for answer, or give hint costing a point
	randomise order
	true if answer

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
