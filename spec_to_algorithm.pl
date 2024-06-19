:-include('strings_to_grammar.pl').
:-include('spec_to_algorithm_test.pl').

:-dynamic num_s2a/1.
:-dynamic vars_s2a/1.
:-dynamic vars_base_s2a/1.

% spec_to_algorithm([[['A',[1,3]]],[['B',[1,2]]]],A)
% A = 

spec_to_algorithm(S,A) :-

	retractall(num_s2a(_)),
	assertz(num_s2a(1)),

	retractall(vars_s2a(_)),
	assertz(vars_s2a([])),

	retractall(vars_base_s2a(_)),
	assertz(vars_base_s2a('A')),
	% find recursive structures in each spec
	% find constants, unique variables across specs
	% - at same time as finding recursive structures
	%   because need to check whether are constants,
	%   unique variables x uv before, c after
	%   (same value across specs)

	findall(RS2,(member(S1,S),
	
	/*
	retractall(num_s2a(_)),
	assertz(num_s2a(1)),
	retractall(vars_s2a(_)),
	assertz(vars_s2a([])),
	*/
	
	find_unique_variables(S1,UV),
	findall([UV1,RS],(member([UV1,UV2],UV),
	find_lists3b(UV2,RS)
	),RS2)
	%change_var_base
	),RS1),
%trace,
	find_constants(S,RS1,C),
	
	% use stwa to get variables, try different orders of i vars first, then one part at a time
	
	% use format model to transform data
	% - identifies a format used
	% transforms an i item to an o item
	% - neighbours - 1->2
	% - col_ns_to_action - makes change
	% * try a format, assume it is correct
	test_formats(Vs,O,F).

	% use stwa to put variables
	% if list items are in order, 
	% up to where are not, get list 
	% (checks o for parts of i)
	% test
	
	
	% changes rec structs to algs
	% generate code for i,p,(o x) where
	% p = rel bw i,o
	% depends on if part of a term or smooth
	% - get stwa smooth needs sublist or substring
	
	
	% test
	
	% given input, tests
	
	

% formats

% teach neighbours, col_ns_to_action (extract, change - stwa)

% 

get_num_s2a(N) :-
	num_s2a(N),
	N1 is N+1,
	retractall(num_s2a(_)),
	assertz(num_s2a(N1)).

change_var_base :-
	vars_base_s2a(A),
	char_code(A,A2),
	A3 is A2+1,char_code(A1,A3),

	retractall(vars_base_s2a(_)),
	assertz(vars_base_s2a(A1)).




find_lists3b(UV2,RS) :-
	(find_lists3a(UV2,RS)->true;
	UV2=RS).
	
find_unique_variables(S,UV) :-

	findall([S0,S2],(member([S0,S1],S),
sub_term_types_wa([string,atom,number],S1,In1),
	findall(Q,member([_,Q],In1),Q2),
	%remove_dups(Q1,Q2),
	
	findall([Add,AN],(member(Q3,Q2),
	vars_s2a(Vars),
	member([Add,Q3],In1),
	(member([Q3,Q4],Vars)->AN=Q4;
	(get_num_s2a(N),vars_base_s2a(Letter),
	atom_concat(Letter,N,AN),
	retractall(vars_s2a(_)),
	append(Vars,[[Q3,AN]],Vars2),
	assertz(vars_s2a(Vars2))
	%change_var_base
	))
	),In2),
	
	foldr(put_sub_term_wa_ae,In2,S1,S2)
	%change_var_base
	),UV).
		
	%findall([Add,X4],(member([Add,Z1],In2),member([Z1,X2],UV2),Z1=[X1,X3],replace_term([X1,X3],X1,X2,X4)),UV).
	
	
find_constants(S,RS2,C) :-

	retractall(num_s2a(_)),
	assertz(num_s2a(1)),

	retractall(vars_s2a(_)),
	assertz(vars_s2a([])),

	retractall(vars_base_s2a(_)),
	assertz(vars_base_s2a('B')),
	%* keep same var name
	%change_var_base,
%trace,
	%length(RS1,RS1L),
	% find constants that recur in same place across spec
	findall(%[%C21L,
	%U1,U2,
	C1%C2%C21%C3
	%]
	,%U2,
	%In1],
	(member(RS1,RS2),
	%RS2=[RS1|_],
	findall([U1,%U2,
	In1]
	,(member([U1,U2],RS1),
	
	sub_term_types_wa([heuristic((only_item(O),%(string(O)->true;(atom(O)->true;number(O))),
	not(O=r),not(O=o)),O)],U2,In1)),C1)
	
	%foldr(append,C1,C10),
	%findall([C21,%C22,
	%C23],(member([C21,%C22,
	%C23],C10),
	%findall(C4,(member([Add,C5],C23),
	%trace,
	/*
	findall(L,(member(C12,C1),
	findall(A1%C11
	,(member(A1,C12)%,%=[_,A1]
	%member([C11,_],A1)
	),E),

	%frequency list
	sort(E,K),
	
	findall([G,J],(member(G,K),findall(G,member(G,E),H),length(H,J)),L)),L1),
	*/
	%trace,
	
	%findall(M,(member(M2,L1),
	%C1=[M2|M3],
	%findall(M6,(member(M6,M2),member(M9,M3),member(M6,M9)%=[M6|M8],
	%forall(member(M6,M3),member(M6,M7))
	%),C2)
	),Specs),
	%trace,
	
	% find whether each item number of each variable is constant across specs; if not, give a new var.
	% x 
	% don't need to change to 'Bx'
	
	findall(_,(member(Spec1,Specs),
	length(Spec1,Spec_length),
	(forall(member(Spec2a,Specs),length(Spec2a,Spec_length))->true;(writeln("Error: Specs not same length."),abort))),_),
	
	Specs=[Spec2|_],

	length(Spec2,Spec2_length),
	numbers(Spec2_length,1,[],Var_nums),
%trace,
	findall(Item3d,(member(Var_num,Var_nums),

	%Specs=[[[_Varname0,Items]|_]|_],
	get_item_n(Spec2,Var_num,[Varname,Items]),
	
	length(Items,Items_length),
	numbers(Items_length,1,[],Item_nums),

	findall(Items1,(member(Item_num,Item_nums),

	findall([Varname,Item],(member(Spec2b,Specs),
	%Spec2=[[Var_name,Items]|_],
	%length(Spec2,Spec2_length),
	%*numbers(Spec2_length,1,[],Var_nums),
%trace,
	%*findall([Varname,Item],(member(Var_num,Var_nums),
	%trace,
	%Spec2=[_Var_name,Spec21],
	get_item_n(Spec2b,Var_num,[Varname,Items6]),
	get_item_n(Items6,Item_num,Item)),Items1)
	
	%Items1=[[Varname,_]|_],
	
	),Items21),
	%foldr(append,Items21,Items2),%1)),Items4),

	%trace,
	%Items2=[[Varname,_]|_],
	findall(Item3c,(member(Items2,Items21),
	findall(A,member([_,[_Ad,A]],Items2),A1),
	%trace,
	(maplist(=(_),A1)->Item3c=[];%
	%Item3a=Item3;
	
	%**
	%Item3c=Items2;
	
	
	%trace,
	findall(Item3,(member([Varname3,[Ad,Item3b]],Items2),vars_s2a(Vars),

%Item3=[Varname3,[Ad,Item3b]]
	((member([Item3b,Q4],Vars))->Item3=[Varname3,[Ad,Q4]];
	(get_num_s2a(N),vars_base_s2a(Letter),
	atom_concat(Letter,N,AN),Item3=[Varname3,[Ad,AN
	]],
	retractall(vars_s2a(_)),
	append(Vars,[[Item3b,AN]],Vars2),
	assertz(vars_s2a(Vars2))))
	
	),Item3c))),Item3d)

	
	),Items3),
	foldr(append,Items3,Items42),%1)),Items4),
	foldr(append,Items42,Items4),
	%trace,
	findall([A,B],member([A,[B,C]],Items4),AB),
	remove_dups(AB,AB1),
	


	retractall(num_s2a(_)),
	assertz(num_s2a(1)),

	retractall(vars_s2a(_)),
	assertz(vars_s2a([])),

	retractall(vars_base_s2a(_)),
	assertz(vars_base_s2a('C')),



	%trace,
	findall([A,[B,Item3]],(member([A,B],AB1),findall(C,(member([A,[B,C]],Items4)),C1),
	sort(C1,C2),
	(
	
	%findall(Item3c,(member(Items2,C2),
	%findall(A,member([_Ad,A],Items2),A1),
	%trace,
	%(%maplist(=(_),A1)->Item3c=[];%Item3a=Item3;
	
	
	%trace,
	%findall(Item3,(member([Varname3,[Ad,Item3b]],Items2),
	vars_s2a(Vars1),

%Item3=[Varname3,[Ad,Item3b]]
	((%trace,
	member([C2,Q4],Vars1))->Item3=Q4;
	(get_num_s2a(N),vars_base_s2a(Letter),
	atom_concat(Letter,N,AN),Item3=AN,
	retractall(vars_s2a(_)),
	append(Vars1,[[C2,AN]],Vars21),
	assertz(vars_s2a(Vars21))))
	
	%,writeln1(Item3)
	%),Item3c))),Item3d)	
	
	)),Items43),

	findall(A,member([A,_],Items43),A11),
	remove_dups(A11,A1),

	findall([Var_name1,Items5],(member(Var_name1,A1),findall(A4,(member([Var_name1,A4],Items43)),Items5)),C2),
	%sort(C20,C2),
	RS2=[RS3|_],
	%writeln(U2),
	
	findall(U31,member([U31,U32],RS3),RS4),
	remove_dups(RS4,RS5),

	%S=[[[U12,U21]|_]|_],
	S=[S3|_],
	%findall([Y1,In31],(member([Y1,Y2],U21),
	
%U21=Y2,%[_Y1,Y2],

findall([U31,In3],(member([U31,U32],S3),
sub_term_types_wa([heuristic((only_item(O),%(string(O)->true;(atom(O)->true;number(O))),
	not(O=r),not(O=o)),O)],U32,In3)),In31),%),In3),

%trace,

findall(XX2,(choose_vars(RS5,C2,Var,Ad1,_U5,In31,XX2)%([Ad2,XX21]=XX2)%*(member([Ad1,XX2],U5)->true;(member([Var,U4],In31),member([Ad1,XX2],U4)))
),C211),%length(C21,C21L)
	%,
	%*),C31),
	foldr(append,C211,C21),
%trace,
	findall([Var,C4],(member(Var,RS5),
	findall([Ad1,XX2],member([Var,[Ad1,XX2]],C21),C23),
	member([Var,XX3],RS3),
	%sort(C31,[[_,U1,U2,C33]|_]),
	%trace,
	foldr(put_sub_term_wa_ae,%C33,%
	C23,%C21,
	XX3,C4)%U2,C3),
	/*
	length(RS5,RS5L),
	numbers(RS5L,1,[],Ns),

	findall([RS51,C31],(member(P2,Ns),get_item_n(RS5,P2,RS51),
	get_item_n(C3,P2,C31)),C4)
	*/
	),C42),
	%foldr(append,C41,C42),
	%C4=[U1,C3],
	%),C4),
	%sort(C4,C41),
	%findall([C42,C43],member([_,C42,C43],C41),C44),
	%C4=UV2,
	%findall(UV,(member(S1,C4),
	%find_unique_variables(S1,UV)),UV2),
	(true%maplist(=(_),UV2)
	->sort(C42,C);%C4=[C|_];
	(writeln("Error: Specs are incompatible."),abort)),!.


choose_vars(RS5,C2,Var,Ad1,U5,In31,XX24) :-
	%findall([Ad1,XX21],(
	findall([Var,XX2],(member([Var,U5],C2),member([Ad1,XX21],U5),XX2=[Ad1,XX21]),XX22),%not(XX2=[])
	%.
	
%choose_vars(C2,Var,Ad1,U5,In31,XX2) :-
	%findall([Ad1,XX21],(
	findall([Var,XX2],(member(Var,RS5),%member([Var,U5],C2),%trace,%
	
	member([Var,U4],In31),member([Ad1,XX21],U4),XX2=[Ad1,XX21],
	not(member([Var,[Ad1,_]],XX22))),XX23),%XX2),not(XX2=[]),
	append(XX22,XX23,XX24).
	
test_formats(Vs,O,F1) :-

	open_file_s("s2a_formats.txt",T),
	member([Vsi,Vso,F1],T),
	%findall(Vsi1,(member(Vsi2,Vsi),atom_string(Vsi1,Vsi2)),Vsi3),
		
	findall([Vsi1,","],member(Vsi1,Vsi),Vsi3),
	append(Vsi4,[_],Vsi3),
	%append(Vsi3,["O"],Vsi4),
	findall([Vs1,","],member(Vs1,Vs),Vs3),
	append(Vs4,[_],Vs3),
	%findall([Vso1,Vso2],(member(Vso1,Vso),%string_concat(Vso1,"_o1",Vso2)),Vso3),
	%loop_replace_s2a(Vso3,F1,F2),
	findall([Vso1,","],member(Vso1,Vso),Vso3),
	append(Vso4,[_],Vso3),
	flatten(["[",Vsi4,"]=[",Vs4,"],",F1,",[",Vso4,"]=",O],L),
	foldr(string_concat,L,S),
	term_to_atom(T1,S),
	catch(T1,_,fail).
	

	
%loop_replace_s2a([],F,F) :- !.
%loop_replace_s2a([[Vso1,Vso2]|Vso3],F1,F2) :-
%	replace2(F1,Vso1,Vso2,F3),
%	loop_replace_s2a(Vso3,F3,F2),!.

	
	
	