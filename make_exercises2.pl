% fill the gap v, multi choice fill the gap, ()matching, multi-choice matching
% multi-choice matching is 1 a, b 2, 3 c - 1d2ef3g

make_exercises(Text,Number_of_questions,Exercises1) :-
	phrase_from_file_s(string(Codes_cve), "../Text-to-Breasonings/connectives.txt"),
string_codes(String_cve,Codes_cve),
	atom_to_term(String_cve,Connectives,_),
	
numbers(Number_of_questions,1,[],Numbers),

findall([Number,Type,Number_of_gap_questions,Number_of_gap_answers],
(member(Number,Numbers),

random_member(Type,[fill_the_gap,
multi_choice_fill_the_gap,multi_choice_matching]),
%Type=multi_choice_matching,

(Type=fill_the_gap->
(Number_of_gap_questions=1,Number_of_gap_answers=1);

(Type=multi_choice_fill_the_gap->
(Number_of_gap_questions=1,random_member(Number_of_gap_answers,[3,4,5]));

(Type=multi_choice_matching->
(random_member(Number_of_gap_questions_and_answers,[3,4,5]),
Number_of_gap_questions=Number_of_gap_questions_and_answers,
Number_of_gap_answers=Number_of_gap_questions_and_answers))))),Worksheet_plan1),
%trace,

findall(Number_of_gap_questions,member([_,_,Number_of_gap_questions,_],Worksheet_plan1),Frequency_list_of_questions),

sum(Frequency_list_of_questions,0,Total_questions),

split_into_sentences(Text,Connectives,Total_questions,Exercises2),

/*
findall(Number_of_gap_answers,member([_,_,_,Number_of_gap_answers],Worksheet_plan),Frequency_list_of_answers),

sum(Frequency_list_of_answers,0,Total_answers),

Extra_answers1 is Total_answers - Total_questions,

extra_answers(Extra_answers1,Connectives,Extra_answers2),
*/
distribute_qa_into_plan(Worksheet_plan1,Exercises2,[],Worksheet_plan2),

get_extra_answers(Text,Worksheet_plan2,[],Worksheet_plan3),

Worksheet_plan3=Exercises1,!.


distribute_qa_into_plan([],_,Worksheet_plan,Worksheet_plan) :- !.
distribute_qa_into_plan(Worksheet_plan1,Exercises2,Worksheet_plan2,Worksheet_plan3) :-
 Worksheet_plan1=[[Number,Type,Number_of_gap_questions,Number_of_gap_answers]|Worksheet_plan4],
 length(List1,Number_of_gap_questions),
 append(List1,List2,Exercises2),
 append(Worksheet_plan2,[[Number,Type,Number_of_gap_questions,List1,Number_of_gap_answers]],Worksheet_plan5),
 
distribute_qa_into_plan(Worksheet_plan4,List2,Worksheet_plan5,Worksheet_plan3).

%get_extra_answers(Text,Worksheet_plan3,[],Worksheet_plan4),

%Worksheet_plan4=Exercises1.

%pretty_print_worksheet(Worksheet_plan4,Exercises1).


get_extra_answers(_,[],Worksheet_plan,Worksheet_plan) :- !.
get_extra_answers(Text,Worksheet_plan1,Worksheet_plan2,Worksheet_plan3) :-
 Worksheet_plan1=[[Number,Type,Number_of_gap_questions,List1,Number_of_gap_answers]|Worksheet_plan4],
 (Type=multi_choice_fill_the_gap->
 (Extra_answers1 is Number_of_gap_answers - Number_of_gap_questions,
 findall(Answers1,member([_,Answers1],List1),Answers2),
 get_extra_answers2(Text,Extra_answers1,Answers2,Answers31),
 random_permutation(Answers31,Answers3));Answers3=[]),
 append(Worksheet_plan2,[[Number,Type,Number_of_gap_questions,List1,Number_of_gap_answers,Answers3]],Worksheet_plan5),
get_extra_answers(Text,Worksheet_plan4,Worksheet_plan5,Worksheet_plan3).
 
get_extra_answers2(_,0,Answers,Answers) :- !.
get_extra_answers2(Text,Extra_answers1,Answers1,Answers2) :-
 Punct1='&#@~%`$?+*^,()|.:;=_/[]<>{}\s\t\\"!0123456789\n\r',

 split_string(Text,Punct1,Punct1,Text2),
 repeat,
 random_member(Answer,Text2),
 not(member(Answer,Answers1)),
 append(Answers1,[Answer],Answers3),
 Extra_answers2 is Extra_answers1 - 1,
 get_extra_answers2(Text,Extra_answers2,Answers3,Answers2).
 