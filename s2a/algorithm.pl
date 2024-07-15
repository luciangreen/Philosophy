:-include('auxiliary_s2a.pl').
algorithm(In_vars,
Out_var) :-
retractall(single_results(_)),
assertz(single_results([])),
retractall(san_no_rs(_)),
assertz(san_no_rs(true)),
length(In_vars,In_vars_L),
numbers(In_vars_L,1,[],Ns),
findall(Var1,(member(N,Ns),get_item_n(In_vars,N,Var),
term_to_brackets(Var,Var3),
characterise1(Var3,Var2),
strings_atoms_numbers(Var2,Var21),
term_to_brackets(Var21,Var1)
),In_vars1),
T1_old=[[[string,[[r,["1",[r,['C1',"3"]]]]]],[output,[[string,['C1']]]]]],
append(In_vars1,[[output,_]],In_vars3),
findall(In_vars22,rs_and_data_to_term(T1_old,In_vars3,_,[],In_vars22,_T2_old,true),In_vars23),
member(In_vars2,In_vars23),
sub_term_wa([output,_],In_vars2,In1),
In1=[[_,[output,Output]]],
length(Output,Output_L),
numbers(Output_L,1,[],ONs),
findall(ON,(member(ON,ONs),get_item_n(Output,ON,Output1),
Output1=[Word,_Args],type_s2a1(Word)),SR3),
retractall(single_results(_)),
assertz(single_results(SR3)),
sub_term_wa([output,_],T1_old,In2),
get_n_item(In2,[_,[output,Output]],Map_n),
double_to_single_brackets(In_vars2,In_vars21),
append(In_vars41,[[output,T2_old]],In_vars21),
double_to_single_brackets(In_vars41,In_vars4),
get_item_n([[[[1,2,2,2,2,1],[[1,2,1]]]]],Map_n,Map2),
double_to_single_brackets(T2_old,T2_old3),
move_vars(Map2,In_vars4,T2_old3,[],Out_var2),
findall(Out_var3,remove_nd(Out_var2,Out_var3),Out_var4),
member(Out_var5,Out_var4),
term_to_list(Out_var5,Out_var6),
single_results(SR),
(member(1,SR)->
Out_var6=Out_var;
[Out_var6]=Out_var).