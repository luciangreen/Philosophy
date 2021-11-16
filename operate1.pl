% ["Computational English","COMPUTATIONAL ENGLISH by Lucian Green *How can the program cope with real variation? 1 of 4.txt",0,algorithms,"2.    I prepared to direct students to enroll in another subject.  I did this by writing that the intensive part of the verb was given by the example, 'The subject is full'.  First, I enrolled in the subject.  Second, I noticed that others prepared to enroll in the subject as well.  Third, I noticed that they repeated this until the subject was full.  In this way, I prepared to direct students to enroll in another subject by writing that the intensive part of the verb was given by the example, 'The subject is full'."]

/*

?- ['operate1.pl'].
true.

?- operate1([+,2,1],Outputs),writeln(Outputs).
[[+,1,1,2],[+,1,2,3],[+,1,3,4],[+,1,4,5],[+,1,5,6],[+,1,1,2],[+,1,2,3],[+,1,3,4],[+,1,4,5],[+,1,5,6],[+,2,1,3],[+,2,2,4],[+,2,3,5],[+,2,4,6],[+,2,5,7],[+,2,1,3],[+,2,2,4],[+,2,3,5],[+,2,4,6],[+,2,5,7],[+,3,1,4],[+,3,2,5],[+,3,3,6],[+,3,4,7],[+,3,5,8],[+,3,1,4],[+,3,2,5],[+,3,3,6],[+,3,4,7],[+,3,5,8],[+,4,1,5],[+,4,2,6],[+,4,3,7],[+,4,4,8],[+,4,5,9],[+,4,1,5],[+,4,2,6],[+,4,3,7],[+,4,4,8],[+,4,5,9],[+,5,1,6],[+,5,2,7],[+,5,3,8],[+,5,4,9],[+,5,5,10],[+,5,1,6],[+,5,2,7],[+,5,3,8],[+,5,4,9],[+,5,5,10],[+,1,1,2],[+,1,2,3],[+,1,3,4],[+,1,4,5],[+,1,5,6],[+,1,1,2],[+,1,2,3],[+,1,3,4],[+,1,4,5],[+,1,5,6],[+,2,1,3],[+,2,2,4],[+,2,3,5],[+,2,4,6],[+,2,5,7],[+,2,1,3],[+,2,2,4],[+,2,3,5],[+,2,4,6],[+,2,5,7],[+,3,1,4],[+,3,2,5],[+,3,3,6],[+,3,4,7],[+,3,5,8],[+,3,1,4],[+,3,2,5],[+,3,3,6],[+,3,4,7],[+,3,5,8],[+,4,1,5],[+,4,2,6],[+,4,3,7],[+,4,4,8],[+,4,5,9],[+,4,1,5],[+,4,2,6],[+,4,3,7],[+,4,4,8],[+,4,5,9],[+,5,1,6],[+,5,2,7],[+,5,3,8],[+,5,4,9],[+,5,5,10],[+,5,1,6],[+,5,2,7],[+,5,3,8],[+,5,4,9],[+,5,5,10]]
Outputs = [[+, 1, 1, 2], [+, 1, 2, 3], [+, 1, 3, 4], [+, 1, 4, 5], [+, 1, 5, 6], [+, 1, 1|...], [+, 1|...], [+|...], [...|...]|...].

?- operate1([*,2,1],Outputs),writeln(Outputs).
[[*,1,1,1],[*,1,2,2],[*,1,3,3],[*,1,4,4],[*,1,5,5],[*,1,1,1],[*,1,2,2],[*,1,3,3],[*,1,4,4],[*,1,5,5],[*,2,1,2],[*,2,2,4],[*,2,3,6],[*,2,4,8],[*,2,5,10],[*,2,1,2],[*,2,2,4],[*,2,3,6],[*,2,4,8],[*,2,5,10],[*,3,1,3],[*,3,2,6],[*,3,3,9],[*,3,4,12],[*,3,5,15],[*,3,1,3],[*,3,2,6],[*,3,3,9],[*,3,4,12],[*,3,5,15],[*,4,1,4],[*,4,2,8],[*,4,3,12],[*,4,4,16],[*,4,5,20],[*,4,1,4],[*,4,2,8],[*,4,3,12],[*,4,4,16],[*,4,5,20],[*,5,1,5],[*,5,2,10],[*,5,3,15],[*,5,4,20],[*,5,5,25],[*,5,1,5],[*,5,2,10],[*,5,3,15],[*,5,4,20],[*,5,5,25],[*,1,1,1],[*,1,2,2],[*,1,3,3],[*,1,4,4],[*,1,5,5],[*,1,1,1],[*,1,2,2],[*,1,3,3],[*,1,4,4],[*,1,5,5],[*,2,1,2],[*,2,2,4],[*,2,3,6],[*,2,4,8],[*,2,5,10],[*,2,1,2],[*,2,2,4],[*,2,3,6],[*,2,4,8],[*,2,5,10],[*,3,1,3],[*,3,2,6],[*,3,3,9],[*,3,4,12],[*,3,5,15],[*,3,1,3],[*,3,2,6],[*,3,3,9],[*,3,4,12],[*,3,5,15],[*,4,1,4],[*,4,2,8],[*,4,3,12],[*,4,4,16],[*,4,5,20],[*,4,1,4],[*,4,2,8],[*,4,3,12],[*,4,4,16],[*,4,5,20],[*,5,1,5],[*,5,2,10],[*,5,3,15],[*,5,4,20],[*,5,5,25],[*,5,1,5],[*,5,2,10],[*,5,3,15],[*,5,4,20],[*,5,5,25]]
Outputs = [[*, 1, 1, 1], [*, 1, 2, 2], [*, 1, 3, 3], [*, 1, 4, 4], [*, 1, 5, 5], [*, 1, 1|...], [*, 1|...], [*|...], [...|...]|...].

?- operate1([-,2,1],Outputs),writeln(Outputs).
[[-,1,1,0],[-,1,2,-1],[-,1,3,-2],[-,1,4,-3],[-,1,5,-4],[-,1,1,0],[-,1,2,-1],[-,1,3,-2],[-,1,4,-3],[-,1,5,-4],[-,2,1,1],[-,2,2,0],[-,2,3,-1],[-,2,4,-2],[-,2,5,-3],[-,2,1,1],[-,2,2,0],[-,2,3,-1],[-,2,4,-2],[-,2,5,-3],[-,3,1,2],[-,3,2,1],[-,3,3,0],[-,3,4,-1],[-,3,5,-2],[-,3,1,2],[-,3,2,1],[-,3,3,0],[-,3,4,-1],[-,3,5,-2],[-,4,1,3],[-,4,2,2],[-,4,3,1],[-,4,4,0],[-,4,5,-1],[-,4,1,3],[-,4,2,2],[-,4,3,1],[-,4,4,0],[-,4,5,-1],[-,5,1,4],[-,5,2,3],[-,5,3,2],[-,5,4,1],[-,5,5,0],[-,5,1,4],[-,5,2,3],[-,5,3,2],[-,5,4,1],[-,5,5,0],[-,1,1,0],[-,1,2,-1],[-,1,3,-2],[-,1,4,-3],[-,1,5,-4],[-,1,1,0],[-,1,2,-1],[-,1,3,-2],[-,1,4,-3],[-,1,5,-4],[-,2,1,1],[-,2,2,0],[-,2,3,-1],[-,2,4,-2],[-,2,5,-3],[-,2,1,1],[-,2,2,0],[-,2,3,-1],[-,2,4,-2],[-,2,5,-3],[-,3,1,2],[-,3,2,1],[-,3,3,0],[-,3,4,-1],[-,3,5,-2],[-,3,1,2],[-,3,2,1],[-,3,3,0],[-,3,4,-1],[-,3,5,-2],[-,4,1,3],[-,4,2,2],[-,4,3,1],[-,4,4,0],[-,4,5,-1],[-,4,1,3],[-,4,2,2],[-,4,3,1],[-,4,4,0],[-,4,5,-1],[-,5,1,4],[-,5,2,3],[-,5,3,2],[-,5,4,1],[-,5,5,0],[-,5,1,4],[-,5,2,3],[-,5,3,2],[-,5,4,1],[-,5,5,0]]
Outputs = [[-, 1, 1, 0], [-, 1, 2, -1], [-, 1, 3, -2], [-, 1, 4, -3], [-, 1, 5, -4], [-, 1, 1|...], [-, 1|...], [-|...], [...|...]|...].

?- operate1([/,2,1],Outputs),writeln(Outputs).
[[/,1,1,1],[/,1,2,0.5],[/,1,3,0.3333333333333333],[/,1,4,0.25],[/,1,5,0.2],[/,1,1,1],[/,1,2,0.5],[/,1,3,0.3333333333333333],[/,1,4,0.25],[/,1,5,0.2],[/,2,1,2],[/,2,2,1],[/,2,3,0.6666666666666666],[/,2,4,0.5],[/,2,5,0.4],[/,2,1,2],[/,2,2,1],[/,2,3,0.6666666666666666],[/,2,4,0.5],[/,2,5,0.4],[/,3,1,3],[/,3,2,1.5],[/,3,3,1],[/,3,4,0.75],[/,3,5,0.6],[/,3,1,3],[/,3,2,1.5],[/,3,3,1],[/,3,4,0.75],[/,3,5,0.6],[/,4,1,4],[/,4,2,2],[/,4,3,1.3333333333333333],[/,4,4,1],[/,4,5,0.8],[/,4,1,4],[/,4,2,2],[/,4,3,1.3333333333333333],[/,4,4,1],[/,4,5,0.8],[/,5,1,5],[/,5,2,2.5],[/,5,3,1.6666666666666667],[/,5,4,1.25],[/,5,5,1],[/,5,1,5],[/,5,2,2.5],[/,5,3,1.6666666666666667],[/,5,4,1.25],[/,5,5,1],[/,1,1,1],[/,1,2,0.5],[/,1,3,0.3333333333333333],[/,1,4,0.25],[/,1,5,0.2],[/,1,1,1],[/,1,2,0.5],[/,1,3,0.3333333333333333],[/,1,4,0.25],[/,1,5,0.2],[/,2,1,2],[/,2,2,1],[/,2,3,0.6666666666666666],[/,2,4,0.5],[/,2,5,0.4],[/,2,1,2],[/,2,2,1],[/,2,3,0.6666666666666666],[/,2,4,0.5],[/,2,5,0.4],[/,3,1,3],[/,3,2,1.5],[/,3,3,1],[/,3,4,0.75],[/,3,5,0.6],[/,3,1,3],[/,3,2,1.5],[/,3,3,1],[/,3,4,0.75],[/,3,5,0.6],[/,4,1,4],[/,4,2,2],[/,4,3,1.3333333333333333],[/,4,4,1],[/,4,5,0.8],[/,4,1,4],[/,4,2,2],[/,4,3,1.3333333333333333],[/,4,4,1],[/,4,5,0.8],[/,5,1,5],[/,5,2,2.5],[/,5,3,1.6666666666666667],[/,5,4,1.25],[/,5,5,1],[/,5,1,5],[/,5,2,2.5],[/,5,3,1.6666666666666667],[/,5,4,1.25],[/,5,5,1]]
Outputs = [[/, 1, 1, 1], [/, 1, 2, 0.5], [/, 1, 3, 0.3333333333333333], [/, 1, 4, 0.25], [/, 1, 5, 0.2], [/, 1, 1|...], [/, 1|...], [/|...], [...|...]|...].

*/

:-include('../listprologinterpreter/la_maths.pl').
:-include('../listprologinterpreter/la_strings.pl').

number_generator(Min,Max,N) :-
	numbers(Max,Min,[],Ns),
	member(N,Ns).
	
operations([[+,2,1],[-,2,1],[*,2,1],[/,2,1]]).

% operate1([+,2,1],Outputs).

operate1([Operator,Input_number,Output_number],Outputs) :-
	numbers(Input_number,1,[],Input_numbers),
	findall([Input1,Input2],(member(_Input_number1,Input_numbers),
	number_generator(1,5,Input1),
	member(_Input_number2,Input_numbers),
	number_generator(1,5,Input2)),Inputs),
	operate2([Operator,_,Output_number],Inputs,Outputs).
	
operate2([Operator,_Input_number,Output_number],Inputs,Outputs) :-
	%length(List,Input_number),
	findall([Operator,A,B,Outputs1],(member([A,B],Inputs),
	operate3(Operator,[A,B],Output_number,Outputs1)),Outputs).
	
operate3(+,[A,B],1,Output) :-
	Output is A+B.
operate3(-,[A,B],1,Output) :-
	Output is A-B.
operate3(*,[A,B],1,Output) :-
	Output is A*B.
operate3(/,[A,B],1,Output) :-
	Output is A/B.
	
/*

% 2.    I prepared to direct students to enroll in another subject.

?- enroll("Joan","Clemens","Mathematics",[["Mathematics",[]]],E2),writeln(E2).
[[Mathematics,[[Joan,Clemens]]]]
E2 = [["Mathematics", [["Joan", "Clemens"]]]].

?- enroll("Anne","Mable","Mathematics",[["Mathematics", [["Joan", "Clemens"]]]],E2),writeln(E2).
[[Mathematics,[[Joan,Clemens],[Anne,Mable]]]]
E2 = [["Mathematics", [["Joan", "Clemens"], ["Anne", "Mable"]]]].

*/
	
enroll(First,Second,Subject,Enrollments1,Enrollments2) :-
	member([Subject,Enrollments3],Enrollments1),
	append(Enrollments3,[[First,Second]],Enrollments4),
	delete(Enrollments1,[Subject,Enrollments3],Enrollments5),
	append(Enrollments5,[[Subject,Enrollments4]],Enrollments2).

enroll2(First,Second,Subject,Enrollments1,Enrollments2) :-
	member([Subject,Q,Enrollments3],Enrollments1),
	append(Enrollments3,[[First,Second]],Enrollments4),
	delete(Enrollments1,[Subject,Q,Enrollments3],Enrollments5),
	append(Enrollments5,[[Subject,Q,Enrollments4]],Enrollments2).

% I did this by writing that the intensive part of the verb was given by the example, 'The subject is full'.

% v, o matched with base meanings
% alg found

% -
% alg: A equals/is 1 plus/summed with 1

% sentence_to_meaning(["a","is","1","summed with","1"],Meaning).
% Meaning = ["a", "equals", "1", "plus", "1"].

sentence_to_meaning(Sentence,Meaning) :-
	findall(Part1,(member(Part,Sentence),((meaning(Part1,Parts),
	member(Part,Parts))->true;Part1=Part)),Meaning).
	
meaning("equals",["is","is calculated to be"]).
meaning("plus",["summed with","added to"]).
	
% meaning_to_algorithm(["a", "equals", "1", "plus", "1"],A).
% A = ["a", "equals", 2].

meaning_to_algorithm([V, "equals", A, "plus", B],Algorithm) :-
	number_string(A1,A),
	number_string(B1,B),
	operate3(+,[A1,B1],1,Output),
	Algorithm=[V, "equals", Output].

/*
?- foldr(unenroll,[[a,b,m],[c,d,m]],[[m,[[e,f],[a,b]]]],A).
A = [[m, [[e, f]]]].
*/

unenroll(First,Second,Subject,Enrollments1,Enrollments2) :-
	member([Subject,Enrollments3],Enrollments1),
	delete(Enrollments3,[First,Second],Enrollments4),
	delete(Enrollments1,[Subject,Enrollments3],Enrollments5),
	append(Enrollments5,[[Subject,Enrollments4]],Enrollments2).

number_of_students(Subject,Enrollments,Number_of_students) :-
	member([Subject,Enrollments2],Enrollments),
	length(Enrollments2,Number_of_students).

% enroll_with_quota([[first1,last1,"Mathematics"],[first1,last1,"Mathematics"]],[["Mathematics",1, [["Joan", "Clemens"]]]],Enrollments2).

/*

enroll_with_quota([[a,b,m],[c,d,m]],[[m,1,[[e,f]]]],A).
A = [[m, 1, [[e, f]]]].

enroll_with_quota([[a,b,m],[c,d,m]],[[m,0,[]]],A).
A = [[m, 0, []]].

enroll_with_quota([[a,b,m],[c,d,m]],[[m,5,[[e,f]]]],A).
A = [[m, 5, [[e, f], [c, d], [a, b]]]].

enroll_with_quota([[a,b,m],[c,d,m]],[[m,2,[[e,f]]]],A).
A = [[m, 2, [[e, f], [a, b]]]].

*/

enroll_with_quota(Students_to_enroll,Enrollments1,Enrollments2) :-
	% find list of subjects in demand
	findall(Subject,(member([_,_,Subject],Students_to_enroll)),Subjects1),
	sort(Subjects1,Subjects2),
	
	% find list of quota limits for each subject, number of students currently in each subject and the number of places available
	findall([Subject,_Quota1,_Number_of_current_students1,Places_available],(member(Subject,Subjects2),member([Subject,Quota,Current_students],Enrollments1),length(Current_students,Number_of_current_students),Places_available is Quota-Number_of_current_students,Places_available>=1),Data),
	
	% find lists of new students for each subject
	findall(New_students2,(member([Subject,_Quota,_Number_of_current_students2,Places_available],Data),length(New_students,Places_available),
	findall([First,Last,Subject],member([First,Last,Subject],Students_to_enroll),Students_demanding_enrollment),
	
	%trace,
	length(Students_demanding_enrollment,Number_of_students_demanding_enrollment),
	(Places_available>Number_of_students_demanding_enrollment->
	New_students2=Students_demanding_enrollment;
	(append(New_students,_,Students_demanding_enrollment),
	New_students=New_students2))),New_students1),
	
	%trace,
	
	% add students
	foldl(append,New_students1,[],New_students3),
	
	%(New_students1=[]->Enrollments1=Enrollments2;
	%([New_students3]=New_students1,
	foldl(enroll2,New_students3,Enrollments1,Enrollments2).%%)).

enroll([First,Second,Subject],Enrollments1,Enrollments2) :-
	enroll(First,Second,Subject,Enrollments1,Enrollments2).

unenroll([First,Second,Subject],Enrollments1,Enrollments2) :-
	unenroll(First,Second,Subject,Enrollments1,Enrollments2).

enroll2([First,Second,Subject],Enrollments1,Enrollments2) :-
	enroll2(First,Second,Subject,Enrollments1,Enrollments2).

