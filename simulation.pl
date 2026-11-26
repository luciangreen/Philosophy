% ["Computational English","COMPUTATIONAL ENGLISH by Lucian Green The Science of Crossing Over 3 of 4.txt",0,algorithms,"27.   I prepared to determine that the crossing over of characters was induction.  I did this by determining the crossing over of characters by induction of physical simulation.  First, I observed the first character facing east in a business suit.  Second, I observed the second character touching the first character's hand, facing west in a business suit.  Third, I induced that the two characters were making a business agreement by shaking hands.  In this way, I prepared to determine that the crossing over of characters was induction by determining the crossing over of characters by induction of physical simulation."]

% * I prepared to determine that the crossing over of characters was induction.

% - Logs meetings and tests whether two people have met through others.

% simulation(20,20,5,20,Simulation,Meetings,1,2).
% la_maths.pl

%% numbers(5,1,[],N).
%% N=[1,2,3,4,5]

numbers(N2,N1,Numbers2) :-
	(N2>=N1->
	numbers(N2,N1,[],Numbers2);
	numbers(N1,N2,[],Numbers2)),!.

numbers(N2,N1,Numbers1,Numbers2):-
numbers1(N2,N1,Numbers1,Numbers2),!.
numbers1(N2,N1,Numbers,Numbers) :-
	N2 is N1-1,!.
numbers1(N2,N1,Numbers1,Numbers2) :-
	N3 is N1+1,
	append(Numbers1,[N1],Numbers3),
	numbers1(N2,N3,Numbers3,Numbers2),!.

%% get_item_n([a,b,c],3,Item).
%% Item = c

get_item_n(A,B,C) :-
	catch(get_item_n1(A,B,C),_,fail),!.

get_item_n1([],_,[]) :-!.%,fail.
get_item_n1(Exposition,Number1,Item) :-
	Number2 is Number1-1,
	length(List,Number2),
	append(List,[Item|_],Exposition),!.

put_item_n(Exposition,Number1,Item2,Exposition2) :-
	Number2 is Number1-1,
	length(List,Number2),
	append(List,[_Item1|Rest],Exposition),
	append(List,[Item2|Rest],Exposition2),!.

% put_item_ns([a,b,c,b],[[2,d],[4,e]],F).
% F = [a, d, c, e].

put_item_ns(A,[],A) :- !.
put_item_ns(A,BCs,D) :-
 BCs=[[B,C]|BCs2],
 put_item_n(A,B,C,E),
 put_item_ns(E,BCs2,D).


% get_n_item([4,6,7],6,L).
% L = 2

get_n_item(A,C,L2) :-
	append(B,[C|_],A),length(B,L),L2 is L+1.

% delete_item_n([4,5,6],2,D).
% D = [4,6]
delete_item_n(A,N,D) :-
	N1 is N-1,length(B,N1),append(B,[_|C],A),append(B,C,D),!.


sum(A,S) :-
	sum(A,0,S), !.
sum([],S,S):-!.
sum(S0,S1,S2) :-
	S0=[S3|S4],
	S5 is S1+S3,
	sum(S4,S5,S2),!.

% number_order(1000,M).
% M = 3

number_order(N1,M) :-
	log(N1,N),log(10,P),M is ceiling(N/P),!.

foldr(plus,A,B) :-
	foldr(plus,A,0,B).

maximum_length(List,Maximum_length) :-
	findall(L,(member(A2,List),length(A2,L)),L2),
	sort(L2,L3),
	append(_,[Maximum_length],L3),!.

sub_list(List,Before_list,Sub_list,After_list) :-
	append(Before_list,L1,List),
	append(Sub_list,After_list,L1).
	
sub_list_reverse(List,Before_list,Sub_list,After_list) :-
	reverse(List,L2),
	append(To_after_list,L1,L2),
	reverse(To_after_list,After_list),
	reverse(L1,L11),
	append(Before_list,Sub_list,L11).
	
all_distinct1(A) :- sort(A,B),msort(A,B).

split_list_on_item(A,Item,Lists) :-
	(is_list(Item)->Item1=Item;Item1=[Item]),
 	findall(BID,(((append(B,C,A),append(Item1,F,C),
 	split_list_on_item(F,Item1,D),delete([B,Item1],[],BI),%foldr(append,[B,Item1],BI),
 	foldr(append,[BI,D],BID))->true;(A=[]->BID=[];BID=[A]))),Lists1),foldr(append,Lists1,Lists).




% With apologies to swipl 8.3.17+

clumped1(Items, Counts) :-
    clump1(Items, Counts).

clump1([], []).
clump1([H|T0], [H-C|T]) :-
    ccount1(T0, H, T1, 1, C),
    clump1(T1, T).

ccount1([H|T0], E, T, C0, C) :-
    E == H,
    !,
    C1 is C0+1,
    ccount1(T0, E, T, C1, C).

ccount1(List, _, List, C, C).

repeat(N,C) :-
	numbers(N,1,[],Ns),findall(_,(member(_,Ns),C),_),!.

%:-include('../listprologinterpreter/la_maths.pl').

simulation(X,Y,N_people,N_frames,Simulation,Meetings,Person1,Person2) :-
 Spaces is X*Y,(N_people>Spaces->(writeln(["Error: N_people",N_people,">Spaces",X*Y]),abort);true),
% size, number of people, number of frames
% random starting positions
 random_starting_positions(X,Y,N_people,Frame1),
% random movements
 random_movements(X,Y,Frame1,1,N_frames,[Frame1],Simulation),
% log_meetings
 log_meetings(Simulation,Simulation,[],Meetings),
% met_a_chain_member 
 met_a_chain_member(Meetings,Person1,Person1,Person2).

random_starting_positions(X,Y,N_people,Frame1) :-
 random_starting_positions1(X,Y,1,N_people,[],Frame1).

random_starting_positions1(_X,_Y,N_people,N_people1,Frame1,Frame1) :- 
 N_people1 is N_people-1,!.
random_starting_positions1(X,Y,N_people1,N_people2,Frame1,Frame2) :-
 random_starting_positions2(X,Y,X1,Y1,Frame1),%,Frame3),
 append(Frame1,[[N_people1,[X1,Y1]]],Frame4),
 N_people3 is N_people1+1,
 random_starting_positions1(X,Y,N_people3,N_people2,Frame4,Frame2).

random_starting_positions2(X,Y,X1,Y1,Frame1) :-%,Frame2) :-
 random_starting_positions3(X,Y,X2,Y2),
 (member([_,[X2,Y2]],Frame1)->
 fail%random_starting_positions2(X,Y,X1,Y1,Frame1)
 ;%,Frame2);
 (X1=X2,Y1=Y2)).%Frame2=[X2,Y2]).

random_starting_positions3(X,Y,X1,Y1) :-
	%random(X2),X1 is ceiling(X*X2),
	%random(Y2),Y1 is ceiling(Y*Y2).
%repeat,
numbers(X,1,[],X2),
numbers(Y,1,[],Y2),
member(X1,X2),
member(Y1,Y2).
% finds list of new positions, retries if deadlocked

% need to move from old pos, check in curr frame

random_movements(_X_bounds,_Y_bounds,_Frame1,N_frames,N_frames,Simulation,Simulation) :- !.
random_movements(X_bounds,Y_bounds,Frame1,N_frames1,N_frames2,Simulation1,Simulation2) :-
 random_movements1(X_bounds,Y_bounds,Frame1,Frame1,[],Frame2),
 append(Simulation1,[Frame2],Simulation3),
 N_frames3 is N_frames1+1,
 random_movements(X_bounds,Y_bounds,Frame2,N_frames3,N_frames2,Simulation3,Simulation2).

% if it fails, retry () *

random_movements1(_,_,_,[],Frame,Frame) :- !.
random_movements1(X_bounds,Y_bounds,_,Frame1,Frame11,Frame2) :-
 Frame1=[[N,[X,Y]]|Rest],
 random_starting_positions3(X_bounds,Y_bounds,X,Y,X1,Y1,Frame11),
 append(Frame11,[[N,[X1,Y1]]],Frame3),
 random_movements1(X_bounds,Y_bounds,_,Rest,Frame3,Frame2).

random_starting_positions3(X_bounds,Y_bounds,X,Y,X1,Y1,Frame1) :-%,Frame2) :-
 random_starting_positions31(X_bounds,Y_bounds,X,Y,X2,Y2),
 (member([_,[X2,Y2]],Frame1)->
 fail%random_starting_positions3(X_bounds,Y_bounds,X,Y,X1,Y1,Frame1)
 ;%,Frame2);
 (X1=X2,Y1=Y2)).%Frame2=[X2,Y2]).

random_starting_positions31(X_bounds,Y_bounds,X,Y,X2,Y2) :-
 Choices=[stay,left,right,up,down],
 (X=1->delete(Choices,left,Choices2);Choices=Choices2),
 (Y=1->delete(Choices2,up,Choices3);Choices2=Choices3),
 (X=X_bounds->delete(Choices3,right,Choices4);Choices3=Choices4),
 (Y=Y_bounds->delete(Choices4,down,Choices5);Choices4=Choices5),
 %repeat,
 member(Direction,Choices5),
 random_starting_positions32(Direction,X,Y,X2,Y2).

random_starting_positions32(stay,X,Y,X,Y) :- !.
random_starting_positions32(left,X,Y,X1,Y) :-
 X1 is X-1,!.
random_starting_positions32(right,X,Y,X1,Y) :-
 X1 is X+1,!.
random_starting_positions32(up,X,Y,X,Y1) :-
 Y1 is Y-1,!.
random_starting_positions32(down,X,Y,X,Y1) :-
 Y1 is Y+1,!.

log_meetings(_,[],Meetings,Meetings) :- !.
log_meetings(_,Simulation,Meetings1,Meetings2) :-
 Simulation=[Simulation1|Simulation2],
 log_meetings1(Simulation1,Simulation1,[],Meetings3),
 append(Meetings1,[Meetings3],Meetings4),
 log_meetings(_,Simulation2,Meetings4,Meetings2).

log_meetings1(_,[],Meetings,Meetings) :- !.
log_meetings1(Simulation1,Simulation2,Meetings1,Meetings2) :-
 Simulation2=[[N,[X,Y]]|Rest],
 meetings(N,X,Y,Simulation1,[],Meetings3),
 append(Meetings1,Meetings3,Meetings4),
 log_meetings1(Simulation1,Rest,Meetings4,Meetings2).

meetings(N1,X,Y,Simulation1,Meetings1,Meetings2) :-
 X1 is X-1,
 X2 is X+1,
 Y1 is Y-1,
 Y2 is Y+1,
 meeting(N1,X1,Y,Simulation1,Meetings1,Meetings3),
 meeting(N1,X2,Y,Simulation1,Meetings3,Meetings4),
 meeting(N1,X,Y1,Simulation1,Meetings4,Meetings5),
 meeting(N1,X,Y2,Simulation1,Meetings5,Meetings2).

meeting(N1,X,Y,Simulation1,Meetings1,Meetings2) :-
 (member([N,[X,Y]],Simulation1)->
 append(Meetings1,[[N1,N]],Meetings2);
 Meetings1=Meetings2).

% tests whether person 1 has a link to person 2 over time
met_a_chain_member(_Meetings,Person0,Person,Person) :- 
 writeln(["Link between",Person0,"and",Person]),!.
met_a_chain_member([],Person0,Person1,Person2) :-
 (not(Person1=Person2)->(writeln(["No link between",Person0,"and",Person2]),!);true).
met_a_chain_member(Meetings,Person0,Person1,Person2) :-
 Meetings=[Meetings1|Meetings2],
 ((member([Person1,_Person3],Meetings1)->true;
 member([_Person3,Person1],Meetings1))->
 met_a_chain_member(_Meetings,Person0,Person2,Person2);
 met_a_chain_member(Meetings2,Person0,Person1,Person2)
 ).
