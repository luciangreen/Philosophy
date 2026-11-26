% 13 5 21

% 1.  Two Uses
% Moreover, the subject should write logically connected program lines to ensure that the program is functional.

/**
?- combination(A,B,C).
A = C, C = hat,
B = write ;
A = hat,
B = write,
C = flask ;
A = hat,
B = write,
C = bottle ;
A = hat,
B = write,
C = book .
**/

combination(A,B,C) :-
	nouns(A1),member(A,A1),
	verbs(B1),member(B,B1),
	member(C,A1).
nouns([hat,flask,bottle,book,pen]).
verbs([write,count,distribute,verify,draw]).

% 2. Also, the subject should state that the program that loads different icons each day is functional.

% Login and record day's tasks

:- use_module(library(date)).
:-include('../../listprologinterpreter/la_strings.pl').
:-include('../../listprologinterpreter/la_strings_string.pl').

login :-
	get_time(TS1),
	stamp_date_time(TS1,date(Year,Month,Day,_,_,
		_Second1,_,_,_),local),
	writeln("How many algorithms have you written?"),
   read_string(user_input, "\n", "\r", _, Alg_n1),
   number_string(Alg_n,Alg_n1),
	writeln("How many philosophy ideas have you expanded?"),
   read_string(user_input, "\n", "\r", _, Phil_exp_n1),
   number_string(Phil_exp_n,Phil_exp_n1),
	writeln("How many philosophy ideas have you written?"),
   read_string(user_input, "\n", "\r", _, Phil_n1),
   number_string(Phil_n,Phil_n1),
	writeln("What work have you done?"),
   read_string(user_input, "\n", "\r", _, Work),
   
   	phrase_from_file_s(string(String1), "work_log.txt"),
	string_codes(String02b,String1),
	atom_to_term(String02b,String02a,[]),
	
	append(String02a,[[Year,Month,Day,Alg_n,Phil_exp_n,Phil_n,Work]],String02c),
	
	term_to_atom(String02c,String02a_b),
	string_atom(String02a_c,String02a_b),

	(open_s("work_log.txt",write,Stream1),
	write(Stream1,String02a_c),
	close(Stream1)),!.

% 3. Finally, the subject should logically connect records of breasonings.

login_graph(Option) :-
	phrase_from_file_s(string(String1), "work_log.txt"),
	string_codes(String02b,String1),
	atom_to_term(String02b,String02a,[]),
	(Option=alg->
	(findall(_,(member([Year,Month,Day,Alg_n,_Phil_exp_n,_Phil_n,_Work],String02a),writeln([Year,Month,Day,Alg_n])),_));
	(Option=phil_exp->
	(findall(_,(member([Year,Month,Day,_Alg_n,Phil_exp_n,_Phil_n,_Work],String02a),writeln([Year,Month,Day,Phil_exp_n])),_));
	(Option=phil->
	(findall(_,(member([Year,Month,Day,_Alg_n,_Phil_exp_n,Phil_n,_Work],String02a),writeln([Year,Month,Day,Phil_n])),_));
	(Option=work->
	(findall(_,(member([Year,Month,Day,_Alg_n,_Phil_exp_n,_Phil_n,Work],String02a),writeln([Year,Month,Day,Work])),_)))))).
	

