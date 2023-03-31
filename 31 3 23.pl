% 31 3 23.pl

% 42 algs

:-include('../listprologinterpreter/listprolog.pl').

% 1. Dereconstruction, another variant of computational hermeneutics I thought of reconstructs a narrative in a representation for reasoning about and querying. The first technique can take a text, and after an interpretation has been prepared (this would be necessary to write as part of the program which would write an interpretation) would test whether the conclusion in response to a question with its reasons was supported by the text, and output the interpretation.

% evidence, construction, query, search

evidence(["apple","in","box"]).
evidence(["watermelon","in","box"]).
evidence(["avocado","in","cart"]).
evidence(["lettuce","in","cart"]).

query(["quantity","box"]).

% construct(F3).
% F3 = ["apple", "watermelon"]

construct(F3) :- findall([A,B],evidence([A,"in",B]),E),findall(C,member([_,C],E),C1),sort(C1,C2),findall([C3,F1],(member(C3,C2),findall(F,member([F,C3],E),F1)),F2),
query([Q,Container]),search(Q,Container,F2,F3),!.

search("quantity",Container,F2,F3) :- member([Container,F3],F2).

% 11.    I prepared to observe the students write to kings.  I did this by observing the philosopher monarch introduce creative philosophy.  First, I introduced the philosopher monarch.  Second, I observed the philosopher monarch introduce pedagogy.  Third, I observed the philosopher monarch introduce creative philosophy.  In this way, I prepared to observe the students write to kings by observing the philosopher monarch introduce creative philosophy.

letter(to,"Quentin Guache").
letter(address,"34 Thicket Place").
letter(suburb,"Thisby").
letter(postcode,"0000").
letter(date,"Friday, 31 March, 2023").
letter(message,"Could you please send the parcel code 001 to me by the end April?").
letter(dear,"Dear").
letter(yours_sincerely,"Yours Sincerely").
letter(from,"Harry Jones").
letter(from_address,"56 High Way").
letter(from_suburb,"Frontier").
letter(from_postcode,"0002").

%letter1(Letter),writeln(Letter).
/*
Harry Jones
56 High Way,
Frontier,
0002.

Friday, 31 March, 2023.

Quentin Guache
34 Thicket Place,
Thisby,
0000.

Dear Quentin Guache,

Could you please send the parcel code 001 to me by the end April?

Yours Sincerely,

Harry Jones
*/
letter1(Letter):-
letter(to,To),
letter(address,Address),
letter(suburb,Suburb),
letter(postcode,Postcode),
letter(date,Date),
letter(message,Message),
letter(dear,Dear),
letter(yours_sincerely,Yours_sincerely),
letter(from,From),
letter(from_address,From_address),
letter(from_suburb,From_suburb),
letter(from_postcode,From_postcode),


foldr(string_concat,[From,"\n",From_address,",\n",From_suburb,",\n",From_postcode,".\n\n",Date,".\n\n",To,"\n",Address,",\n",Suburb,",\n",Postcode,".\n\n",Dear," ",To,",\n\n",Message,"\n\n",Yours_sincerely,",\n\n",From],Letter).

% 23

% 21.   I prepared to be friendly.  I did this by teaching meditation.  First, I taught the meditation details.  Second, I taught medicine.  Third, I taught about seeing a psychiatrist when needed or seeing friends.  In this way, I prepared to be friendly by teaching pedagogy.

% meditation_reminder([1,[2,3,[4]]],R).
% R = [1,"R",2,"R",3,"R",4,"R"]

meditation_reminder(P,R) :-
 unpile(P,U), remind(U,R).

% unpile([1,[2,3,[4]]],U).
% U = [1,2,3,4]
unpile(P,U) :- flatten(P,U).
% remind([1,2,3,4],R).
% R = [1,"R",2,"R",3,"R",4,"R"]
remind(U,R) :- findall([U1,"R"],member(U1,U),R1),foldr(append,R1,R).

% 29

% 31.    I prepared to lead open-minded religious races.  I did this by becoming the open-minded religious leader.  First, I taught pedagogy for positive and negative medical reasons.  Second, I taught yoga for positive reasons.  Third, I taught yoga for negative positive reasons (in fact, another positive reason).  In this way, I prepared to lead open-minded religious races by becoming the open-minded religious leader.

reason(pedagogy,	positive_reason,	stay_healthy).
reason(pedagogy,	negative_reason,	avoid_breakdowns).
reason(yoga,		positive_reason,	stay_supple).
reason(yoga,		positive_reason,	positive_function).

% COMPUTATIONAL ENGLISH by Lucian Green Derivability 0 of 4

% 1. The first technique can handle two directions between term or sentence and definition. This allows meaning to be worked out from context.

% first_technique1(Term,"pome").
% Term=[apple","pear"]
first_technique1(Term,Definition) :- var(Term),not(var(Definition)),findall(T,first_technique(T,Definition),Term).
% first_technique1("apple",Definition).
% Definition=["pome"]
first_technique1(Term,Definition) :- not(var(Term)),var(Definition),findall(D,first_technique(Term,D),Definition).
first_technique("apple","pome").
first_technique("pear","pome").
first_technique("peach","drupe").
first_technique("plum","drupe").
first_technique("cherry","drupe").
first_technique("walnut","drupe").
first_technique("almond","drupe").
first_technique("pecan","drupe").
first_technique("raspberry","aggregate fruit").


