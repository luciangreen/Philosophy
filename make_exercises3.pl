:-include('make_exercises2.pl').
:-include('make_exercises.pl').

% make_exercises3.pl
% practise layout
% convert to prolog, display using ssi
% finds answers from text

% make_exercises3() :- % get exercises for file

% make_exercises("a b c. d e f.\ng h i. j k l.m n o. p q r.\ns t u. v w x.",2,S1),practise_layout(S1,S),writeln(S).

practise_layout(Sheet,Sheet1) :-
 findall([String2,"\n"],(member([Number,Type,_Number_of_gap_questions,List1,Number_of_gap_answers,Answers3],Sheet),
 %String1=Number,
 (Type=fill_the_gap->
 (List1=[[Q,A]|_],
 concat_list([Number,". ",Q," (",A,")\n"],String2));
 
 (Type=multi_choice_fill_the_gap->
 (List1=[[Q,A]|_],
 concat_list([Number,". ",Q," (",A,")"%,"\n(a). ",A
 ,"\n"],String3),
 numbers(Number_of_gap_answers,1,[],Numbers),
 findall([String5,String4,"\n"],(member(Number1,Numbers),
 get_item_n(Answers3,Number1,String4),
 number_letter(Number_letter),
 member([Number1,String5],Number_letter)),String4),
 append([String3],String4,String2));
 
 (Type=multi_choice_matching->
 (%trace,
 List1=[[Q,A]|_],
 %append(List1,[Answers3],List2),
 List1=List2,
 length(List2,Length),
 Length1 is Length-1,
 numbers(Length1,0,[],N),
 findall(List31,(
 member(N1,N),
 length(L1,N1),
 append(L1,L2,List2),
 append(L2,L1,List31)),List321),
 random_permutation(List321,List32),
 %trace,
 findall(List35,(member(List34,List32),
 findall(List33,member([_,List33],List34),List35)),List3),
 length(List2,L31),
 concat_list([Number,". "],L3),
 numbers(L31,1,[],Numbers2),
 %trace,
 findall([String5,Item1," (",A1,")\n"],(member(N2,Numbers2),
 get_item_n(List2,N2,[Item1,A1]),
 number_letter2(Number_letter),
 member([N2,String5],Number_letter)),L4),
 %trace,
 findall([String5,Item1,"\n"],(member(N2,Numbers2),
 get_item_n(List3,N2,Item2),
%trace,
 findall([String51,Item10," "],(member(N21,Numbers2),
 get_item_n(Item2,N21,Item10),
 number_letter2(Number_letter),
 member([N21,String51],Number_letter)),Item1),

 number_letter(Number_letter),
 member([N2,String5],Number_letter)),L5),
 append_list([L3,L4,L5],String2)))))),String6),
 
 flatten(String6,List4),
 concat_list(List4,Sheet1),!.

number_letter([[1,"(a). "],[2,"(b). "],[3,"(c). "],[4,"(d). "],[5,"(e). "]]).
number_letter2([[1,"(i). "],[2,"(ii). "],[3,"(iii). "],[4,"(iv). "],[5,"(v). "]]).