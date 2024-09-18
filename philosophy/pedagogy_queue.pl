% Read luciangreen's Text to Breasonings Github repository about preparing to use text to breasonings before running this algorithm.

% ["Fundamentals of Pedagogy and Pedagogy Indicators","FUNDAMENTALS OF PEDAGOGY by Lucian Green God Algorithm 3 of 4.txt",0,algorithms,"21.   *I prepared to make lots of money.  I did this by selling mirth (laughter).  First, I found the depressed person to help her recover.  Second, I laughed with her.  Third, I made many good rounds of it.  In this way, I prepared to make lots of money by selling mirth (laughter)."]

% detect and prepare for sales.

%%use_module(library(pio)).

:- use_module(library(date)).
:-include('../../mindreader/texttobr2qb').
:-include('../../mindreader/mindreadtestshared').
:-include('../../listprologinterpreter/la_strings.pl').
:-include('../../listprologinterpreter/la_strings_string.pl').

pedagogy_queue :-

	% check what's ahead
	% during the next day
	
	number_of_custs(Number_of_custs),
	
	% add to queue
	get_custs(Custs1),
											get_time(TS),stamp_date_time(TS,date(Year,Month,Day,_Hour2,_Minute2,_Seconda,_A,_TZ,_False),local),
	Day1 is Day+1,
	append(Custs1,[[Number_of_custs,Year,Month,Day1]],Custs2),
	
	term_to_atom(Custs2,String02a_b),
	string_atom(String02a_c,String02a_b),

	(open_s("custs.txt",write,Stream1),
	write(Stream1,String02a_c),
	close(Stream1)),!.

	
process_pedagogy_queue :-

	% process queue - 250 br per person giving a copy of the 250 br
	% later: up to 4000 words of combophil gramm log
	
	get_custs(Custs1),
	

get_time(TS),stamp_date_time(TS,date(Year,Month,Day,_Hour2,_Minute2,_Seconda,_A,_TZ,_False),local),

((member([Number_of_custs,Year,Month,Day],Custs1),

N is Number_of_custs*3, % As, detect when needed, graciously give
texttobr2(N))->true;true),

delete(Custs1,[Number_of_custs,Year,Month,Day],Custs2),

	term_to_atom(Custs2,String02a_b),
	string_atom(String02a_c,String02a_b),

	(open_s("custs.txt",write,Stream1),
	write(Stream1,String02a_c),
	close(Stream1)),!.


number_of_custs(Threats1):-
	%find_time(H,M,S),
	number_of_custs(0,Threats1).
	% no_death(0,Threats2), % medits for life
	%writeln([Person,H,M,S,Threats1,politeness]).%,Threats2,no_death]).
	

number_of_custs(Threats1,Threats2):-
	%% "Given that we are interested in friendliness in primary school, secondary school and university, is there anything else?"
	trialy2_6("Yes",R1),
	trialy2_6("No",R2),
		R=[R1,R2/**,R3,R4,R5,R6,R7,R8,R9,R10**,R11,R12,R13,R14,R15,R16,R17,R18,R19,R20,R21,R22,R23,R24,R25,R26,R27**/
		],
	sort(R,RA),
	reverse(RA,RB),
	RB=[[_,Answer]|_Rest],
	
	(Answer="No"->Threats2=Threats1;(Threats3 is Threats1+1,number_of_custs(Threats3,Threats2))).


get_custs(String02a) :-
		phrase_from_file_s(string(String00a), "custs.txt"),
		string_codes(String02b,String00a),
		atom_to_term(String02b,String02a,[]).
