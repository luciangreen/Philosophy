:-include('strings_to_grammar.pl').
:-include('spec_to_algorithm_test.pl').
:-include('rs_and_data_to_term.pl').
%:-include('process_terms_s2a.pl').
:-include('term_to_list.pl').
:-include('auxiliary_s2a.pl').

:-dynamic num_s2a/1.
:-dynamic vars_s2a/1.
:-dynamic vars_base_s2a/1.
:-dynamic vars_table_s2a/1.
%:-dynamic ampersand_var_n_s2a/1.

% spec_to_algorithm([[['A',[1,3]]],[['B',[1,2]]]],A)
% A = 

spec_to_algorithm(S,Alg) :-

	retractall(num_s2a(_)),
	assertz(num_s2a(1)),

	retractall(vars_s2a(_)),
	assertz(vars_s2a([])),

	retractall(vars_base_s2a(_)),
	assertz(vars_base_s2a('A')),
	
	
	retractall(vars_table_s2a(_)),
	assertz(vars_table_s2a([])),

	%retractall(ampersand_var_n_s2a(_)),
	%assertz(ampersand_var_n_s2a(1)),
	
	% find recursive structures in each spec
	% find constants, unique variables across specs
	% - at same time as finding recursive structures
	%   because need to check whether are constants,
	%   unique variables x uv before, c after
	%   (same value across specs)

	% * change input term - leave as is
	%trace,	
	%findall(RS2,(member(S1,S),
	
	%find_unique_variables(S1,UV),
	findall([[input,Input1],[output,Output1]],(member([[input,Input],[output,Output]],S),
	findall([S10,RS],(member([S10,S11],Input),
	(string(S11)->string_strings(S11,S12);S11=S12),
	find_lists3b(S12,RS)
	),Input1),
	findall([S10,RS],(member([S10,S11],Output),
	(string(S11)->string_strings(S11,S12);S11=S12),
	find_lists3b(S12,RS)
	),Output1)	
	%change_var_base
	%),RS2)
	),RS10),
	
	/*findall(RS2,(member(S1,OS),
	
	%find_unique_variables(S1,UV),
	findall([S10,RS],(member([S10,S11],S1),
	(string(S11)->string_strings(S11,S12);S11=S12),
	find_lists3b(S12,RS)
	),RS2)
	%change_var_base
	),ORS10),*/

	%findall(RS2,(member(S1,S),
	
	%find_unique_variables(S1,UV),
	findall([[input,Input1],[output,Output1]],(member([[input,Input],[output,Output]],S),
		
	find_unique_variables(Input,UV),
	findall([UV1,RS],(member([UV1,UV2],UV),
	(string(UV2)->string_strings(UV2,UV3);UV2=UV3),
	find_lists3b(UV3,RS)
	),Input1),
	find_unique_variables(Output,UVo),
	findall([UV1,RS],(member([UV1,UV2],UVo),
	(string(UV2)->string_strings(UV2,UV3);UV2=UV3),
	find_lists3b(UV3,RS)
	),Output1)
	%change_var_base
	%),RS2),
	),RS1),
	
	/*findall(RS2,(member(S1,OS),
	
	
	find_unique_variables(S1,UV),
	findall([UV1,RS],(member([UV1,UV2],UV),
	(string(UV2)->string_string(UV2,UV3);UV2=UV3),
	find_lists3b(UV3,RS)
	),RS2)
	%change_var_base
	),ORS1),*/	
%trace,

	% * match specs with same shape x
	% - with same non ro addresses
	% find c, 
	% then dec tree xxx
	% x:
	% nd i - collects if this format
	% nd o - x, det by i format x
	
	length(RS10,RS10L),
	numbers(RS10L,1,[],Ns),
	
	findall([IOa,IOb]%[[input,Input_c],[output,Output_d]]
	,(member(N,Ns),get_item_n(RS10,N,[[input,Input_a],[output,Output_a]]),
	get_item_n(RS1,N,[[input,Input_b],[output,Output_b]]),
	%member([[input,Input],[output,Output]],S),
	%length(Input_a,Input_a_L),
	%length(Input_c,Input_a_L),
	
append(Input_a,Output_a,IOa),
append(Input_b,Output_b,IOb)),IOaIOb),

findall(A,member([A,_],IOaIOb),Data),
findall(A,member([_,A],IOaIOb),Vars3),
find_constants(Data,Vars3,RSC_a),

RS10=[[[input,Input_a],[output,Output_a]]|_],
	length(Input_a,Input_a_L),
	length(Input_c,Input_a_L),

	append(Input_c,Output_d,%RSC_a)),
	RSC_a),
	
	RSC=[[[input,Input_c],[output,Output_d]]],

	%find_constants(RS10,RS1,RSC),
	%find_constants(ORS10,ORS1,ORSC),
	
	/*
	length(RSC,RSCL),
	numbers(RSCL,1,[],Ns),
	trace,
	
	findall([X1,T22],(member(N,Ns),
	
	get_item_n(RSC,N,[X1,X2]),
	findall(T2,(member(X3,RS10),
	member([X1,X21],X3),
	rs_and_data_to_term(X2,X21,_,[],T2)),T21),
	
	
	decision_tree(T21,T22)),T3),
	*/
	%trace,
	RSC=[[[input,In1],[output,Out1]]|_],
	length(In1,In1L),
	numbers(In1L,1,[],In1_Ns),
	length(Out1,Out1L),
	numbers(Out1L,1,[],Out1_Ns),
	
	findall(A,member([A,_],In1),In1VNs),
	findall(A,member([A,_],Out1),Out1VNs),

	findall(In222,(member(N,In1_Ns),
	findall(In21,(member([[input,In2],_],RSC),
	get_item_n(In2,N,[VN,In21])),In22),
	decision_tree(In22,In223),
	foldr(append,In223,In222)
	),In23),

	findall(Out222,(member(N,Out1_Ns),
	findall(Out21,(member([_,[output,Out2]],RSC),
	get_item_n(Out2,N,[VN,Out21])),Out22),
	decision_tree(Out22,Out223),
	foldr(append,Out223,Out222)
	),Out23),

	findall([VN,DT],(member(N,In1_Ns),get_item_n(In1VNs,N,VN),get_item_n(In23,N,DT)),_In_DTs),

	findall([VN,DT],(member(N,Out1_Ns),get_item_n(Out1VNs,N,VN),get_item_n(Out23,N,DT)),_Out_DTs),
	
	%T3=[[input,In_DTs],[output,Out_DTs]],

	%findall([Input,Output],(member([[input,Input],[output,Output]],RSC),
	%T3=RS10,
	term_to_atom(In23,T31),
	%term_to_atom(T3,T31),
	term_to_atom(Out23,ORSC1),
	%term_to_atom(In_DTs,T31),
	%term_to_atom(ORSC,ORSC1),
	
	
find_mapping(In23,Out23,Map),
	term_to_atom(Map,Map1),

%find_mapping(T3,ORSC,Map),

	%writeln1([rSC,RSC,"\n",oRSC,ORSC,"\n",rS10,RS10,"\n",oRS10,ORS10,"\n",t3,T3]),
% take input and mapping and produce output
foldr(string_concat,[":-include('auxiliary_s2a.pl').
algorithm(In_vars,
Out_var) :-
%In_vars=",T31,",
findall(Var1,(member(Var,In_vars),
(string(Var)->string_strings(Var,Var1);Var=Var1)),In_vars1),
%findall(Var1,(member(Var,Out_vars),
%(string(Var)->string_string(Var,Var1);Var=Var1)),Out_vars1),
T1_old=",T31,",T2_old=",ORSC1,",

	length(T1_old,RSCL),
	numbers(RSCL,1,[],Ns),
	%trace,
	
	findall(%[X1,
	T22,(member(N,Ns),
	
	get_item_n(T1_old,N,%[X1,
	X2%]
	),
	get_item_n(In_vars1,N,X21),
	%findall(T2,(member(X3,In_vars1),
	%member([X1,X21],X3),
	rs_and_data_to_term(X2,X21,_,[],T22)),In_vars2),

move_vars(",Map1,",In_vars2,T2_old,[],Out_var2),
term_to_list(Out_var2,Out_var)."],Alg),


save_file_s("algorithm.pl",Alg),

%trace,

consult('algorithm.pl'),


findall(_,%(member(Spec,S),
%findall([A1,","]
(member([[input,In4],[output,Out4]],S),

	retractall(vars_table_s2a(_)),
	assertz(vars_table_s2a([])),

findall(A1,(member([_,A],In4),%term_to_atom
(A=A1)),A3),%foldr(append,A2,A3a),append(A3,[_],A3a),
term_to_atom(A3,A4),%
findall(A1,(member([_,A],Out4),%term_to_atom
(A=A1)),A31),%foldr(append,A21,A31a),append(A31,[_],A31a),
term_to_atom(A31,A41),

%foldr(string_concat,A3,A4b),
foldr(string_concat,["algorithm(",A4,",Out),Out=",A41,"."],Str2),

term_to_atom(Term2,Str2),%trace,
(Term2->writeln(success);writeln(fail))),_).


	% * convert term to a string after x before find_lists3b="try", c [before very start if string or leave as list] xx x (x unless run an earlier s2g pred, x for the moment x: can change non single char items to strings, run try on them)
	% find from sublists, substrings
	% use grammars not alg and appends lists to save big term containing input using brackets
	% s2l ... with constants x check specific patterns
	% dec trees contain ["["..."]"] x earlier, turn grammar input into term (big s2l)
	% x use alg not grammar so can more easily make a term - gen alg
	% convert input rec struct to alg with 'AN' variables marked
	
	%* rs and data on self recursively
	
	% use stwa to get variables, try different orders of i vars first, then one part at a time
	
	%* searches o term top down for parts
	% It doesn't matter about brackets
	
	% 1 item that is a list or list with r,o xx [], brackets x
	% do bottom level first, find fns to give result
	
	% use format model to transform data
	% - identifies a format used
	% transforms an i item to an o item
	% - neighbours - 1->2
	% - col_ns_to_action - makes change
	% * try a format, assume it is correct
	
	%test_formats(Vs,O,F).

	% use stwa to put variables
	% if list items are in order, 
	% up to where are not, get list 
	% (checks o for parts of i)
	% test
	
	% * input into one big term
	% convert dec tree to alg, like gen alg
	% take input needed from preds for output
	% form of relative stwa x, takes from a pos in rec struct (smooth), output rec struct
	
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

/*
get_ampersand_var_s2a(N) :-
	ampersand_var_n_s2a(N),
	N1 is N+1,
	retractall(ampersand_var_n_s2a(_)),
	assertz(ampersand_var_n_s2a(N1)).
*/

change_var_base :-
	vars_base_s2a(A),
	char_code(A,A2),
	A3 is A2+1,char_code(A1,A3),

	retractall(vars_base_s2a(_)),
	assertz(vars_base_s2a(A1)).




find_lists3b(UV2,RS) :-
	try(UV2,RS).

find_unique_variables(S,UV) :-

	findall([S0,S2],(member([S0,S1],S),
sub_term_types_wa([string,atom,number],S1,In1),
	findall(Q,member([_,Q],In1),Q2),
	%remove_dups(Q1,Q2),
	findall([Add,AN],(member(Q3,Q2),
	member([Add,Q3],In1),%trace,
	vars_s2a(Vars),
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

	
	
	