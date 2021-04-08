% ["Medicine","MEDICINE by Lucian Green Prevent Headaches on Train and a Bent Spine 3 of 4.txt",0,algorithms,"25.  I prepared to examine the parliamentarians help the families.  I did this by providing Accounting and Business Information Systems service as breasonings currency.  First, I wrote about Accounting's details.  Second, I helped.  Third, I amazed the audience.  In this way, I prepared to examine the parliamentarians help the families by providing Accounting and Business Information Systems service as breasonings."]

:-include('../../listprologinterpreter/la_strings.pl').
:-include('../../listprologinterpreter/la_strings_string.pl').
:-include('../../listprologinterpreter/la_maths.pl').

% jan,feb,mar,apr
data([[1,1,2,1], % web
      [1,1,3,1], % training
      [2,1,1,1]]).% development
    
% 1.

total_months(T) :-
	data(D),D=[D1|_],length(D,L1),length(D1,L2),
	numbers(L1,1,[],N1),numbers(L2,1,[],N2),
	findall(I3,(member(N22,N2),
	findall(I2,(member(N12,N1),
	get_item_n(D,N12,I),
	get_item_n(I,N22,I2)),I3)),I4),
	findall(I6,(member(I5,I4),sum(I5,0,I6)),T).
 
% 2.

total_categories(T) :-
	data(D),D=[D1|_],length(D,L1),length(D1,L2),
	numbers(L1,1,[],N1),numbers(L2,1,[],N2),
	findall(I3,(member(N12,N1),
	get_item_n(D,N12,I),
	findall(I2,(member(N22,N2),get_item_n(I,N22,I2)),I3)),I4),
	findall(I6,(member(I5,I4),sum(I5,0,I6)),T).
      
% ["Computational English","COMPUTATIONAL ENGLISH by Lucian Green Intertextuality 2 of 4.txt",0,algorithms,"12. I prepared to eat the popcorn at a certain time.  *I did this by writing the sentences about the Big Ben clock tower in a hierarchy.  First, I wrote 'The tower stood on the ground'.  Second, I wrote 'The clock was attached to the tower'.  Third, I wrote 'It was good to read the clock'.  In this way, I prepared to eat the popcorn at a certain time by writing the sentences about the Big Ben clock tower in a hierarchy."]

% 3.

address :- clock.
clock :- hour_hand, minute_hand.
hour_hand.
minute_hand.

% ["Fundamentals of Pedagogy and Pedagogy Indicators","PEDAGOGY INDICATORS by Lucian Green Higher Grades 2 of 3.txt",0,algorithms,"27. I prepared to be a renegade surfer.  *I did this by agreeing with someone about my life.  First, I found the agreeable part in my life.  Second, I found someone to agree about it with me.  Third, I observed him agree with it.  In this way, I prepared to be a renegade surfer by agreeing with someone about my life."]

% 4.

agree(with_person_a,about_me).

% ["Fundamentals of Pedagogy and Pedagogy Indicators","FUNDAMENTALS OF PEDAGOGY by Lucian Green Two Uses 13 of 30.txt",0,algorithms,"125.	DION: The subject should allow the breasoning to leave her lips because the subject should indicate that she wants the warm space. The subject should state the correct meaning of the breasoning (e.g. that she desires the warm space) at the time."]

% 5.

volume(L,W,H,V) :- V is L*W*H.