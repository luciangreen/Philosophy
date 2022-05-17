% ["Computational English","COMPUTATIONAL ENGLISH by Lucian Green The Science of Crossing Over 3 of 4.txt",0,algorithms,"27.   I prepared to determine that the crossing over of characters was induction.  I did this by determining the crossing over of characters by induction of physical simulation.  First, I observed the first character facing east in a business suit.  Second, I observed the second character touching the first character's hand, facing west in a business suit.  Third, I induced that the two characters were making a business agreement by shaking hands.  In this way, I prepared to determine that the crossing over of characters was induction by determining the crossing over of characters by induction of physical simulation."]

% * I prepared to determine that the crossing over of characters was induction.

% - Logs meetings and tests whether two people have met through others.

% simulation(20,20,5,20,Simulation,Meetings,1,2).

:-include('../listprologinterpreter/la_maths.pl').

simulation(X,Y,N_people,N_frames,Simulation,Meetings,Person1,Person2) :-
 Spaces is X*Y,(N_people>Spaces->(writeln(["Error: N_people",N_people,">",X*Y,"Spaces"]),abort);true),
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
