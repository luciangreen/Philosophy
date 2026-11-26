% ["Fundamentals of Pedagogy and Pedagogy Indicators","FUNDAMENTALS OF PEDAGOGY by Lucian Green Two Uses 22 of 30.txt",0,algorithms,"218.	DION: The subject should do something during the hour (where the subject examined the new hour, finding that it was empty)."]

% present_algorithm_report.pl

% Present algorithm name, query, Result and algorithm

% Optionally, includes limitations, possible future developments and how it can be automated

:-include('../listprologinterpreter/listprolog.pl').
:-include('../Prolog-to-List-Prolog/pretty_print.pl').

present_algorithm_report(Query,Algorithm0,Result,Report) :-

(Query=[[n,Name]|_]->true;
(Query=[[[n,Name]|_]|_])),

pretty_print(Algorithm0,Algorithm),

atomic_list_concat(Algorithm2,"\"\"",Algorithm),
atomic_list_concat(Algorithm2,"\"",Algorithm1),

term_to_atom(Result,Result1),
term_to_atom(Query,Query1),

Optional_questions=true,

(Optional_questions=true->

(
ask("What limitations does the algorithm have?",Limitations),

ask("What possible future developments does the algorithm have?",Future_developments),

ask("How can the algorithm be automated?",Automated),

concat_list(['Report on algorithm: ',Name,'\n\n',
'Query:','\n',Query1,'\n\n',
'Result:','\n',Result1,'\n\n',
'Algorithm:','\n',Algorithm1,'\n\n',
'Limitations:','\n',Limitations,'\n\n',
'Future developments:','\n',Future_developments,'\n\n',
'Automated:','\n',Automated,'\n\n'],Report));

(concat_list(['Report on algorithm: ',Name,'\n\n',
'Query:','\n',Query1,'\n\n',
'Result:','\n',Result1,'\n\n',
'Algorithm:','\n',Algorithm1,'\n\n'],Report))),

writeln(Report),!.

ask(Question,Answer) :-
 writeln(Question),
 read_string(user_input, "\n", "\r", _, Answer).
