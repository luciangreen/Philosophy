% 4 2 23

% need 17 algs today

% ["Medicine","MEDICINE by Lucian Green Brain II 3 of 4.txt",0,algorithms,"26.    She prepared to design the perfect smile. First, she drew the centre line. Second, she drew the teeth on either side of the centre line. Third, she calculated the position of a particular tooth would have. In this way, she prepared to design the perfect smile."]

:-include('../listprologinterpreter/la_maths.pl').

:- include('../listprologinterpreter/la_strings').
:- include('../Music-Composer/mindreadtestmusiccomposer-unusual-mr-tree.pl').

% remove_and_find_item_number([a,b,c],2,c,N2).
% N2 = 2
% remove_and_find_item_number([a,b,b,c],2,c,N2).
% N2 = 3.

remove_and_find_item_number(A,N1,B,N2) :-
 delete_item_n(A,N1,C),
 get_n_item(C,B,N2).
 
% ["Fundamentals of Meditation and Meditation Indicators","FUNDAMENTALS OF MEDITATION by Lucian Green Soma 2 of 4.txt",0,algorithms,"13.    I prepared to love God (the master).  I did this by writing the Press Release for Michel Onfray's probable comments on the Pedagogy indicators.  First, I wrote 'Oh that'.  Second, I wrote that it is good.  Third, I wrote that it is doubly good.  In this way, I prepared to love God (the master) by writing the Press Release for Michel Onfray's probable comments on the Pedagogy indicators."]

% * I prepared to love God (the master).

single_pointedness :-
 date(date(Y,M,D)),
 writeln(["Please love God",Y,M,D]),
 N is 60*60*24,sleep(N),single_pointedness.

god_miracle :-
 Ns=[john,betty,sue],
 Ms=[yes,no],
 findall(_,(member(N1,Ns),mind_read(M1,Ms),
 (M1=yes->writeln(['*',N1,M1]))),_).

meditation_reminder :-
 Ns=[john,betty,sue],
 Ms=[yes,no],
 findall(_,(member(N1,Ns),mind_read(M1,Ms),
 (M1=no->writeln(['*',N1,"Please meditate."]))),_).
 
% * I did this by writing the Press Release for Michel Onfray's probable comments on the Pedagogy indicators.

% passed(50,100,R).
% R = 'P'.

passed(Score,Total,Result) :-
 P is (Score/Total)*100,
 (P < 50 -> Result='N';
 (P < 65 -> Result='P';
 (P < 70 -> Result='H3';
 (P < 75 -> Result='H2B';
 (P < 80 -> Result='H2A';
 (P =< 100 -> Result='H1')))))).

% Gives what is left to do:
% extra_curricular([headache-medicine,music-number-one],B).
% B = [hollywood-actor, prestigious-professor, school-head].

extra_curricular(A,B) :-
 subtract([headache-medicine,music-number-one,hollywood-actor,prestigious-professor,school-head],A,B).

gradebook :-
 Ns=[john,betty,sue],
 Ms=[n,p,h3,h2b,h2a,h1],
 findall(_,(member(N1,Ns),mind_read(M1,Ms),
 writeln(['*',N1,M1])),_).

% * First, I wrote 'Oh that'.

quantum_entanglement :-
 Ns = [1,2,3,4,5,6,7,8,9,10],
 mind_read(N1,Ns),
 mind_read(N2,Ns),
 (N1=N2->writeln("* Quantum entanglement");true),
 mind_read(N3,Ns),
 sleep(N3),quantum_entanglement,!.

order_reducer :-
	writeln("Have you reduced [a,[b]] to [a,b] to reduce the number of instructions, please (y/n)?"),
	read_string(user_input,"\n","\r",_,"y").

% Calculate the number of additions and deletions

num_new_num_del(A,B,N,D) :-
	subtract(B,A,N),
	subtract(A,B,D).
	
% * Second, I wrote that it is good.

life_check_list(A,B) :-
 subtract([meditation,university,pedagogy,honours,masters,phd,professor,immortality],A,B).

books_written(A,B) :-
 subtract([spirituality,computationalism,business],A,B).
 
% * Third, I wrote that it is doubly good.

pedagogy_possibilities(A,B) :-
subtract([pilot,jobs,parent,pedagogue],A,B).

% use(business,B).
% B = business_person.

use(A,B) :-
 member(A-B,[pedagogy-teacher,meditation-meditation_teacher,medicine-doctor,computationalism-computer_scientist,philosophy-philosopher,business-business_person]).
