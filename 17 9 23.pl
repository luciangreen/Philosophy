% 17 9 23

% 35-7=28

:-include('../Text-to-Breasonings/text_to_breasonings.pl').

% ["Fundamentals of Meditation and Meditation Indicators","FUNDAMENTALS OF MEDITATION by Lucian Green Hours Prayer 2 of 4.txt",0,algorithms,"11.    I prepared to take care of the ducklings.

/*
?- keep_on_explaining_until_it_makes_sense.
That's good. Are there any areas of the idea you still don't understand? (y/n)
|: y
That's good. Are there any areas of the idea you still don't understand? (y/n)
|: n
*/

keep_on_explaining_until_it_makes_sense :-
 texttobr2_1(1),
 writeln("That's good. Are there any areas of the idea you still don't understand? (y/n)"),
 read_string(user_input,"\n\r","\n\r",_,S),
 (S="y"->keep_on_explaining_until_it_makes_sense;true),!.
 
/*
?- cycle_text("Good. Are there any further areas to mind map? (y/n)").
Good. Are there any further areas to mind map? (y/n)
|: y
Good. Are there any further areas to mind map? (y/n)
|: n

?- cycle_text("I see. Are there any other things you'd like to mention to me? (y/n)").
I see. Are there any other things you'd like to mention to me? (y/n)
|: y
I see. Are there any other things you'd like to mention to me? (y/n)
|: n

?- cycle_text("Well done. Are there any parts of language you are interested in? (y/n)").
Well done. Are there any parts of language you are interested in? (y/n)
|: y
Well done. Are there any parts of language you are interested in? (y/n)
|: n

?- cycle_text("Do you believe in duckling love? Do you love me too? (y/n)").
Do you believe in duckling love? Do you love me too? (y/n)
|: y

*/

cycle_text(Text) :-
 texttobr2_1(1),
 writeln(Text),
 read_string(user_input,"\n\r","\n\r",_,S),
 (S="y"->cycle_text(Text);true),!.

% 28-8=20

% ["Short Arguments","Professor Algorithm.txt",0,algorithms,"9. I prepared to say it encouragingly.  I did this by performing the verb.  First, I loved you.  Second, I loved it.  Third, I wanted it."]

/*
?- verb(Object,Adjective,Verb,Adverb,Room,Part_of_room,Direction,Time_to_do,Time_to_finish).
Object = book,
Adjective = intelligent,
Verb = read,
Adverb = studiously,
Room = library,
Part_of_room = (table),
Direction = n,
Time_to_do = [30, minutes],
Time_to_finish = [40, minutes] ;

Object = computer,
Adjective = amazing,
Verb = read,
Adverb = carefully,
Room = bedroom,
Part_of_room = (table),
Direction = n,
Time_to_do = [60, minutes],
Time_to_finish = [120, minutes] ;

Object = project,
Adjective = interesting,
Verb = complete,
Adverb = intricately,
Room = living_room,
Part_of_room = (table),
Direction = n,
Time_to_do = [120, minutes],
Time_to_finish = [5, minutes] ;

Object = model,
Adjective = well_designed,
Verb = construct,
Adverb = thoughtfully,
Room = kitchen,
Part_of_room = (table),
Direction = e,
Time_to_do = [40, minutes],
Time_to_finish = [10, minutes] ;

Object = chemistry_set,
Adjective = thought_provoking,
Verb = make_molecule,
Adverb = methodically,
Room = exam,
Part_of_room = (table),
Direction = n,
Time_to_do = [15, minutes],
Time_to_finish = [0, minutes].
*/

verb(book,intelligent,read,studiously,library,table,n,[30,minutes],[40,minutes]).
verb(computer,amazing,read,carefully,bedroom,table,n,[60,minutes],[120,minutes]).
verb(project,interesting,complete,intricately,living_room,table,n,[120,minutes],[5,minutes]).
verb(model,well_designed,construct,thoughtfully,kitchen,table,e,[40,minutes],[10,minutes]).
verb(chemistry_set,thought_provoking,make_molecule,methodically,exam,table,n,[15,minutes],[0,minutes]).

% 20 - 6  - 1 luciancicd = 13

% ["Medicine","MEDICINE by Lucian Green Less Depression 3 of 4.txt",0,algorithms,"22. I prepared to prevent bullying by teaching pedagogy, medicine and meditation to give skills to complete tasks with positive functionalism.  I did this by providing Brass service as breasonings currency.  First, I found the brass instrument.  Second, I pressed my lips next against the mouthpiece.  Third, I played a note.  In this way, I prepared to prevent bullying by teaching pedagogy, medicine and meditation to give skills to complete tasks with positive functionalism by providing Brass service as breasonings currency."]

/*
?- distance_greater(0,0,14,15,9).
false.

?- distance_greater(0,0,14,15,200).
true.
*/

distance_greater(X1,Y1,X2,Y2,D) :-
 D >= sqrt((Y2-Y1)^2 + (X2-X1)^2).

/*
?- distance_greater3d(0,0,0,14,15,0,9).
false.

?- distance_greater3d(0,0,0,14,15,0,200).
true.
*/

distance_greater3d(X1,Y1,Z1,X2,Y2,Z2,D) :-
 D >= sqrt((Y2-Y1)^2 + (X2-X1)^2 + (Z2-Z1)^2).
 
% lettering_spacing(10,3,S).
lettering_spacing(L,N,S) :-
 S is L/N.
 
% print_heading("Happy World",30,S).
% S = " H  a  p p  y     W o  r  l d ".

% print_heading("EXCELLENT!",40,S).
% S = "   E   X   C   E   L   L   E   N   T   !".

% print_heading("Lucian Green",18,S).
% S = "L uc ia n  Gr ee n".

% print_heading("1.. 2... 3...",15,S).
% S = "1.. 2. .. 3... ".

:-include('../listprologinterpreter/la_maths.pl').
:-include('../listprologinterpreter/la_strings_string.pl').

print_heading(String,L,S) :-
 string_length(String,SL1),
 lettering_spacing(L,SL1,S1),
 numbers(SL1,1,[],SLN),
 string_strings(String,Strings),
 findall([SLN1,S2],(member(SLN2,SLN),
 get_item_n(Strings,SLN2,S2),
 SLN1 is floor(SLN2*S1)),S3),
 numbers(L,1,[],LN),
 findall(S5,(member(LN1,LN),
 (member([LN1,S4],S3)->S5=S4;S5=" ")),S6),
 findall(S7,(member(S8,S6),atom_string(S7,S8)),S9),
 string_chars(S,S9),!.

