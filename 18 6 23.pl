% 18 6 23.pl

% 80 algs needed

% ["Fundamentals of Pedagogy and Pedagogy Indicators","FUNDAMENTALS OF PEDAGOGY by Lucian Green Rebreathsonings 2 of 4.txt",0,algorithms,"17. The Asperger patient showed his mastery of sports statistics by remembering the match with the top score. He did this by driving someone up to the door in a tricycle. First, he started at the edge of the courtyard. Second, he drove through the courtyard. Third, he stopped at the door. In this way, the Asperger patient prepared to demonstrate his mastery of sports statistics by remembering the match with the top score by driving someone up to the door in a tricycle."]

% Third, he stopped at the door.

% update verifiers - notifies if an update is available

%:- use_module(library(date)).

% update_verifier("luciangreen","a").
% update_verifier("luciangreen","b").

update_verifier(User,Repository) :-

	get_time(TS),%stamp_date_time(TS,date(Year,Month,Day,Hour,Minute,_Seconda,_A,_TZ,_False),local),
	repositories(List),
	findall(TS1,(member([User,Repository,Date|_],List),
	Date=[Year1,Month1,Day1,Hour1,Minute1],
	date_time_stamp(date(Year1,Month1,Day1,Hour1,Minute1,0,_,_,_),TS1)),TS2),
	sort(TS2,TS3),
	append(_,[TS4],TS3),
	(TS>=TS4->
	writeln([User,Repository,"is up to date."]);
	writeln([User,Repository,"is not up to date."])),!.
	
repositories(
[
["luciangreen","a",[2023,6,1,0,0]],
["luciangreen","b",[2024,6,1,0,0]]
]).

:-include('version.pl').

% version adder - given new lines, asks for version info and updates version

% version_adder(["a","b"],"version.txt","version2.txt").

version_adder(Changes,File1,File2) :-
	findall([Type1,Label],(member(Change,Changes),
	%repeat,
	writeln(["For change:",Change]),
	writeln("Is the change an API change (a), a new feature (f) or a bug fix (b)?"),
	read_string(user_input,"\n\r","\n\r",_,Type),atom_string(Type1,Type),(Type1=a->true;(Type1=f->true;Type1=b)),
	writeln("Please enter a description of the change: "),
	read_string(user_input,"\n\r","\n\r",_,Label)
	),Log),
	
	open_file_s(File1,File_term1),
	append(File_term1,Log,File_term2),
	version1(File_term2,0,0,0,A,F,B),
	writeln(["Version",A,F,B]),
	save_file_s(File2,File_term2).

% 8 done

% ["Short Arguments","Medicine - Quantum Box of Circulatory System 2.txt",0,algorithms,"4. I felt clear.  I knew it was there, and moved it on.  I meditated, giving my voluntary control over involuntary processes.  I detected a piece of food in my blood vessel.  It wasn't there later."]

:-include('../listprologinterpreter/listprolog.pl').

% Medicine - Quantum Box of Circulatory System 

% accident_preventer_game.

accident_preventer_game :-
	%tty_size(R,_C),
	R=8,
	numbers(R,1,[],Rs),
	numbers(8,1,[],Ns),
	random_permutation(Ns,Ns2),
	findall(" ",member(_,Rs),L),
	append([9],L,L1),
	accident_preventer_game2(Ns2,L1).

accident_preventer_game2(Ns,L) :-
	%findall(_,(member(L3,L),writeln(L3),nl),_),
	writeln(L),
	append(_,[N1],L),
	(not(N1=" ")->
	writeln("Game Over - You Lost.");
	%(Ns=[]->
	((not((member(N,L),number(N))),Ns=[])->
	(trace,writeln("Game Over - You Won."));
	(move_down(Ns,Ns1,L,L1),
	accident_preventer_game2(Ns1,L1)))),!.
	
move_down(Ns,Ns1,L0,L2) :-
	keyboard_input(L0,L,T),
	T1 is 0.5-T,
	sleep(T1),
	random(1,3,N1),
	((N1=1,not(Ns=[]))->
	(append(L3,[_],L),
	Ns=[N|Ns1],
	append([N],L3,L2));
	(append(L3,[_],L),
	Ns=Ns1,
	append([" "],L3,L2))),!.

keyboard_input(L1,L2,T) :-
	get_time(T1),
	
(catch(call_with_time_limit(0.5,get_single_char(Code)),_,fail)->
	(%trace,
	get_time(T2),
	(catch(number_codes(Num,[Code]),_,fail)->true;Num=65),
	T is T2-T1,
	%trace,
	%get_single_char(Code),
	(member(Num,L1)->
	(get_n_item(L1,Num,N),
	put_item_n(L1,N," ",L2)
	);
	L1=L2
	));
	(L1=L2,T=0.5)),!.

% I felt clear.

% food_dissolver_game.

food_dissolver_game :-
	%tty_size(R,_C),
	R=8,
	numbers(R,1,[],Rs),
	numbers(3,1,[],Ns),
	random_permutation(Ns,Ns2),
	findall(" ",member(_,Rs),L),
	append([4],L,L1),	
	food_dissolver_game2(Ns2,L1).

food_dissolver_game2(Ns,L) :-
	%findall(_,(member(L3,L),writeln(L3),nl),_),
	writeln(L),
	append(_,[N1],L),
	(not(N1=" ")->
	writeln("Game Over - You Lost.");
	%(Ns=[]->
	((not((member(N,L),number(N))),Ns=[])->
	writeln("Game Over - You Won.");
	(move_down_fd(Ns,Ns1,L,L1),
	food_dissolver_game2(Ns1,L1)))),!.
	
move_down_fd(Ns,Ns1,L0,L2) :-
	keyboard_input_fd(L0,L,T),
	T1 is 1-T,
	sleep(T1),
	random(1,3,N1),
	((N1=1,not(Ns=[]))->
	(append(L3,[_],L),
	Ns=[N|Ns1],
	append([N],L3,L2));
	(append(L3,[_],L),
	Ns=Ns1,
	append([" "],L3,L2))),!.

keyboard_input_fd(L1,L2,T) :-
	get_time(T1),
	
(catch(call_with_time_limit(1,get_single_char(Code)),_,fail)->
	(%trace,
	get_time(T2),
	(catch(number_codes(Num,[Code]),_,fail)->true;Num=65),
	number_codes(Num,[Code]),
	T is T2-T1,
	%trace,
	%get_single_char(Code),
	(member(Num,L1)->
	(%trace,
	reverse(L1,L11),
	get_n_item(L11,Num,N0),
	length(L11,Le),
	N is Le-N0+1,
	N1 is Num-1,
	(N1= 0->
	put_item_n(L1,N," ",L2);
	put_item_n(L1,N,N1,L2))
	);
	L1=L2
	));
	(L1=L2,T=0.5)),!.

% 19 done

% I knew it was there, and moved it on.

higher_lower :-
	random(X),X1 is floor(X*100)/10,
	higher_lower(9,X1).
higher_lower(0,_X1) :- writeln("You lost."),!.
higher_lower(N,X1) :-
	guess(N1),
	(N1=X1->writeln("Correct.");
	((N1<X1->writeln("Higher.");
	writeln("Lower.")),
	N2 is N-1,
	higher_lower(N2,X1))),!.
guess(N) :-
	%repeat,
	writeln("Please guess the number between 0 and 10."),
	read_string(user_input,"\n\r","\n\r",_,N1),
	%number(N1),
	(number_string(N,N1)->true;guess(N)).

% 23 done

% I meditated, giving my voluntary control over involuntary processes.

% meditation_chain_letter(Sample,Branching_factor,Levels_taken_to_fill_sample).

% meditation_chain_letter(1,1,L).
% L=2.

% meditation_chain_letter(2,1,L).
% L=3.

% meditation_chain_letter(3,1,L).
% L=6.

meditation_chain_letter(S,N,L) :-
	numbers(S,1,[],Ss),
	findall((-),member(_,Ss),S1),
	%random(X),X1 is floor(X*S),
	S11 is S+2,
	random(1,S11,X1),
	meditation_chain_letter1(S,S1,N,X1,0,L).
meditation_chain_letter1(S,S1,N,X1,L1,L2) :-
	(forall(member(S0,S1),S0=(*))->L1=L2;
	(numbers(N,1,[],Ns),
	X11 is X1+2,
	findall(X2,(member(_,Ns),random(1,X11,X2)%random(X),X2 is ceiling((X1+0)*X)+1
	),S2),
	numbers(S,1,[],Ss),	
	findall(S5,(member(S3,Ss),get_item_n(S1,S3,S4),(member(S3,%S4,
	S2)->S5=(*);S5=S4)),S6),
	findall(_,member((*),S6),S7),
	length(S7,X3),
	L3 is L1+1,
	meditation_chain_letter1(S,S6,N,X3,L3,L2))),!.

% 29 done

% with 44 from nn.pl, 7 left

% I detected a piece of food in my blood vessel.  It wasn't there later.

:-include('11 6 23.pl').

% create_check_cube(3,3,3).
% create_check_cube(4,4,4).
% create_check_cube(5,5,5).

create_check_cube(Y_win,X_win,Z_win) :-
	create_rectangular_prism_in_space(Y_win,X_win,Z_win,G),detect_data(G),prettyprint_3d_1_e1(G,Y_win,X_win,Z_win),!.

create_rectangular_prism_in_space(X_min,Y_min,Z_min,Grid2) :-
	make_grid_3d(X_min,Y_min,Z_min,Grid1),
	random(1,3,N),
	(N=1->
	(random(1,X_min,X1),
	random(1,X_min,X2),
	random(1,Y_min,Y1),
	random(1,Y_min,Y2),
	random(1,Z_min,Z1),
	random(1,Z_min,Z2),
	draw_cube_edges_3d(X1,Y1,Z1,X2,Y2,Z2,Grid1,Grid2));
	Grid1=Grid2).
	
detect_data(Grid) :-
	member([_X,_Y,_Z,M],Grid),member(1,M).
	
	/*
	1 2 3 4, 5 6 7 8
	
	1 111
	2 211
	3 121
	4 221
	5 112
	6 212
	7 122
	8 222
	*/
	
draw_cube_edges_3d(X1,Y1,Z1,X2,Y2,Z2,Grid1,Grid13) :- 
 line1_3d(X1,Y1,Z1,X2,Y1,Z1,Grid1,Grid2,1),
 line1_3d(X2,Y1,Z1,X1,Y2,Z1,Grid2,Grid3,1),
 line1_3d(X1,Y2,Z1,X2,Y2,Z1,Grid3,Grid4,1),
 line1_3d(X2,Y2,Z1,X1,Y1,Z1,Grid4,Grid5,1),
 line1_3d(X1,Y1,Z2,X2,Y1,Z2,Grid5,Grid6,1),
 line1_3d(X2,Y1,Z2,X1,Y2,Z2,Grid6,Grid7,1),
 line1_3d(X1,Y2,Z2,X2,Y2,Z2,Grid7,Grid8,1),
 line1_3d(X2,Y2,Z2,X1,Y1,Z2,Grid8,Grid9,1),
 line1_3d(X1,Y1,Z1,X1,Y1,Z2,Grid9,Grid10,1),
 line1_3d(X2,Y1,Z1,X2,Y2,Z2,Grid10,Grid11,1),
 line1_3d(X1,Y2,Z1,X1,Y2,Z2,Grid11,Grid12,1),
 line1_3d(X2,Y2,Z1,X2,Y2,Z2,Grid12,Grid13,1).

