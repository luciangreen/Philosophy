% ["Fundamentals of Pedagogy and Pedagogy Indicators","FUNDAMENTALS OF PEDAGOGY by Lucian Green Part of Room 3 of 4.txt",0,algorithms,"22.     The Asperger patient prepared to carry out a dissertation by rote memory, by using his body as a basis for a mnemonic for the essay structure.  He did this by sitting on a pious seat of right.  First, he walked to the seat.  Second, he lowered it.  Third, he sat on it.  In this way, the Asperger patient prepared to carry out a dissertation by rote memory, by using his body as a basis for a mnemonic the for essay structure by sitting on a pious seat of right."]

% structure_to_body_metaphor([[1,2],[1,3],[2,4],[2,5],[2,6],[2,7],[2,8],[3,9],[3,10],[3,11],[3,12],[3,13]],Body_metaphor).

% Body_metaphor = [[1, chest], [2, hand], [3, hand]].

:-include('../listprologinterpreter/la_maths.pl').
:-include('../listprologinterpreter/la_strings.pl').

structure_to_body_metaphor(Structure,Body_metaphor) :-
	findall(First_node,(member([First_node,_],Structure)),First_nodes1),
	sort(First_nodes1,First_nodes2),
	findall([First_node,Structure_type],(member(First_node,First_nodes2),
	findall(Second_node,(member([First_node,Second_node],Structure)),Second_nodes1),length(Second_nodes1,Second_nodes_length),
	structure_to_body_metaphor2(Second_nodes_length,Structure_type)),Body_metaphor).
	
structure_to_body_metaphor2(Second_nodes_length,Structure_type) :-
	(Second_nodes_length=<2 ->Structure_type=chest;
	(Second_nodes_length=<5 ->Structure_type=hand;
	(Second_nodes_length>5 ->Structure_type=other))).
	
	
% sit_on_right([["left",[]],["right",[]]],"right","Andrew",Seats).
% Seats = [["left", []], ["right", "Andrew"]].

sit_on_right(Seats1,Side,Name,Seats2) :-
	member([Side,Seats3],Seats1),
	append(Seats3,[[Side,Name]],Seats4),
	delete(Seats1,[Side,Seats3],Seats5),
	append(Seats5,Seats4,Seats2).
	
% lower(50,-5,Height).
% Height = 45.

lower(Height1,Difference,Height2) :-
	Height2 is Height1+Difference.

% walk(1,[[1,2],[1,3],[2,4],[4,5]],T2).

walk(Start,Transitions1,Transitions2) :-
	member([Start,Next],Transitions1),
	walk2(Transitions1,[[Start,Next]],5,Transitions2),!.
	
walk2(_Transitions1,Transitions2,Destination,Transitions2) :-
	reverse(Transitions2,Transitions4),
	Transitions4=[[_Start,Destination]|_].
walk2(Transitions1,Transitions2,Destination,Transitions3) :-
	reverse(Transitions2,Transitions4),
	Transitions4=[[_Start,Next]|_],
	member([Next,Next1],Transitions1),
	append(Transitions2,[[Next,Next1]],Transitions5),
	walk2(Transitions1,Transitions5,Destination,Transitions3).
	
% 21. sit_in_rect([[0,0],[1,1]],[[0,0],[0.75,0.75]]).

sit_in_rect([[XA1,YA1],[XA2,YA2]],[[XB1,YB1],[XB2,YB2]]) :-
	XA1=<XB1,
	YA1=<YB1,
	XA2>=XB2,
	YA2>=YB2.

% ["Short Arguments","Competition 4.txt",0,algorithms,"35. I helped the other to follow the rules.  The other was helped.  The group on our side was a competitor.  The people in the group were competing with each other.  At least in the way of following the rules."]

add_n_to_population(P,N,PN) :-	
	PN is P+N.
	
population_density(_Number_in_place,Number_visible,Number_visible).

% groups_on_side([["a","happy"],["b","happy"],["c","happy"]]).

groups_on_side(People) :-
	maplist(happy,People).
happy([_,"happy"]).

% sides([["a",[["p",1],["q",0],["r",1]]],["b",[["p",1],["q",1],["r",1]]]],"p",Report),writeln(Report).
% Report = [["a", 1], ["b", 1]].

sides(Sides,Issue,Report) :-
	findall([Person,Side],(member([Person,Issues],Sides),member([Issue,Side],Issues)),Report).

% ["Short Arguments","Yoga to Prevent Bent Spine and Headache on Train.txt",0,algorithms,"1. I prepared to relax by washing my hands on the train.  I did this by putting liquid in the dispenser.  First, I opened the dispenser.  Second, I put liquid in it.  Third, I closed it."]

% wash(["finger1","finger2","finger3","finger4","finger5","finger6","finger7","finger8","finger9","finger10"],Washed).

wash(Items,Washed) :-
	findall([Item,"washed"],member(Item,Items),Washed).

% volumes_required([4,4,4],[1,1,1],V).
% V = 64.

volumes_required(Large,Small,Volumes) :-
	Large=[X1,Y1,Z1],
	Large_volume=X1*Y1*Z1,
	Small=[X2,Y2,Z2],	
	Small_volume=X2*Y2*Z2,
	Volumes is Large_volume/Small_volume.

% open_not_between(1,6,5).
% open_not_between(1,4,5).
% false.
% open_not_between(1,1,5).
% false.

open_not_between(A,B,C) :-
	not((A=<B,B=<C)).

% mathematical_lock(1,A,5).

mathematical_lock(N1,N2,N3) :-
	numbers(N3,N1,[],N4),
	length(N4,L1),
	L2 is ceiling(L1/2)-1,
	length(List,L2),
	append(List,[N2|_],N4).

% 30. sit_in_rect_prism([[0,0,0],[1,1,1]],[[0,0,0],[0.75,0.75,0.75]]).

sit_in_rect_prism([[XA1,YA1,ZA1],[XA2,YA2,ZA2]],[[XB1,YB1,ZB1],[XB2,YB2,ZB2]]) :-
	XA1=<XB1,
	YA1=<YB1,
	ZA1=<ZB1,
	XA2>=XB2,
	YA2>=YB2,
	ZA2>=ZB2.

% ["Fundamentals of Meditation and Meditation Indicators","FUNDAMENTALS OF MEDITATION by Lucian Green Upasana Sutra 2 of 4.txt",0,algorithms,"15. I prepared to investigate the Loop of Henle metaphor. I did this by giving out the tulip. First, I fingered the side of the tulip. Second, I moved my finger down the tulip. Third, I moved my finger up the other side of the tulip. In this way, I prepared to investigate the Loop of Henle metaphor by giving out the tulip."]

/*

choice_points([[1,":-",2,3],[2],[3]],1,[],Flow).
Flow = [1, 2, '.', 3, '.'].

choice_points([[1,":-","!",3],[1],[3]],1,[],Flow).
Flow = [1, "!", 3, '.'].

choice_points([[1,":-","fail",3],[1],[3]],1,[],Flow).
Flow=[1, '.']

choice_points([[1,":-","repeat"]],1,[],Flow).
Repeats [1, "repeat"]

choice_points([[1,":-","repeat","fail"]],1,[],Flow).
Flow=[1, "repeat", 1, "repeat",1, "repeat"...]

*/

choice_points(Predicates,Query,Flow1,Flow2) :-
	(member([Query|Body],Predicates)->
	(
	(Body=[]->append(Flow1,[Query,'.'],Flow2);
	(Body=[":-"|Body2],
	append(Flow1,[Query],Flow3),
	body(Query,Predicates,Body2,Flow3,Flow2)))
	);
	((%trace,
	delete_back_until_repeat(Flow1,Flow3))->
	choice_points(Predicates,Query,Flow3,Flow2);
	Flow1=Flow2)),!.
body(Query,Predicates,[],Flow1,Flow2) :-
	append(Flow1,[],Flow3),
	(delete_curr_query_pred(Query,Predicates,Predicates1)->
	choice_points(Predicates1,Query,Flow3,Flow2);
	Flow3=Flow2).
body(Query,Predicates,Body2,Flow1,Flow2) :-
	Body2=[Command|Commands],
	(number(Command)->
	(choice_points(Predicates,Command,Flow1,Flow3),
	body(Query,Predicates,Commands,Flow3,Flow2));
	(Command="!"->(delete(Predicates,[Query|_],Predicates2),
	append(Flow1,[Command],Flow3),
	body(Query,Predicates2,Commands,Flow3,Flow2));
	(Command="fail"->((delete_back_until_period(Flow1,Flow3)->
	%append(Flow1,[Command],Flow3),
	choice_points(Predicates,Query,Flow3,Flow2);
	((%trace,
	delete_back_until_repeat(Flow1,Flow3))->
	choice_points(Predicates,Query,Flow3,Flow2);
	append(Flow1,['.'],Flow2))));
	(Command="repeat"->(%(delete_back_until_period(Flow1,Flow3)->
	append(Flow1,["repeat"],Flow3),
	body(Query,Predicates,Commands,Flow3,Flow2)
	%append(Flow1,[.],Flow2))
	))))).
	
delete_back_until_period(Flow1,Flow2) :-	
	reverse(Flow1,Flow3),
	append(_,['.'|Flow4],Flow3),
	reverse(Flow4,Flow2).

delete_back_until_repeat(Flow1,Flow2) :-
	reverse(Flow1,Flow3),
	append(_,["repeat"|Flow4],Flow3),
	reverse(["repeat"|Flow4],Flow2).
	
delete_curr_query_pred(Query,Predicates,Predicates1) :-
	%reverse(Predicates1,Predicates3),
	append(Predicates5,[[Query|_]|Predicates4],Predicates),
	Predicates2=[Predicates5|Predicates4],
	foldr(append,Predicates2,[],Predicates1).
	%reverse(Predicates4,Predicates2).
	

	