% 10 4 23.pl

% 19 algs done

:-include('../listprologinterpreter/listprolog.pl').

% 11.    I prepared to test a philosophy over time.  I did this by writing the philosophy that there are three parts of a philosophy.  First, I read the introduction to Melchior.  Second, I enjoyed the mid-section on the set of Excelsior.  Third, I mercurially concluded the endgame.  In this way, I prepared to test a philosophy over time by writing the philosophy that there are three parts of a philosophy.

% beginnings_middles_ends(10,5,BME).
% [[1,[1,2,3,4,5]],[2,[1,2,3,4,5]],[3,[1,2,3,4,5]],[4,[1,2,3,4,5]],[5,[1,2,3,4,5]],[6,[1,2,3,4,5]],[7,[1,2,3,4,5]],[8,[1,2,3,4,5]],[9,[1,2,3,4,5]],[10,[1,2,3,4,5]]]

beginnings_middles_ends(Number_of_lines1,Max_line_length,BME) :-
 generate_lines(Number_of_lines1,Max_line_length,[],L1),
 foldr(append,L1,L2),
 permutation(L2,L3),
 findall(Item,member([Item,_],L3),Items1),
 sort(Items1,Items2),
 findall([Item2,Items4],(member(Item2,Items2),
 findall(Item3,member([Item2,Item3],L3),Items3),
 sort(Items3,Items4)),BME),!.

generate_lines(0,_Max_line_length,L,L) :- !.
generate_lines(Number_of_lines1,Max_line_length,L1,L2) :-
 numbers(Max_line_length,1,[],L3),
 findall([Number_of_lines1,Item],member(Item,L3),L4),
 append(L1,[L4],L5),
 Number_of_lines2 is Number_of_lines1-1,
 generate_lines(Number_of_lines2,Max_line_length,L5,L2).

% 21.   I prepared to breason out the seen-as object, for each sentence of a VET course I wrote, with 5 breasonings.  I did this by writing 20 breasonings (an 80 breasoning-long A) per sentence.  First, I wrote the question's A.  Second, I wrote the answer's A.  Third, I wrote a connection A between the question A and answer A.  In this way, I prepared to breason out the seen-as object, for each sentence of a VET course I wrote, with 5 breasonings by writing 20 breasonings (an 80 breasoning-long A) per sentence.

% key word in sentence

% phrase(sentence(A),[the,john,read,to,sera]).

sentence(_)-->subject(_),verb_phrase(_).
verb_phrase(_)-->verb(_),person(_).
subject(_)-->determiner(_),person(_).
verb(_)-->[walked,to].
verb(_)-->[saw].
verb(_)-->[talked,to].
verb(_)-->[read,to].
verb(_)-->[wrote,to].
determiner(_)-->[the].
determiner(_)-->[a].
person(_)-->[john].
person(_)-->[peter].
person(_)-->[eshan].
person(_)-->[mary].
person(_)-->[james].
person(_)-->[jonno].
person(_)-->[jonny].
person(_)-->[richard].
person(_)-->[sera].
