:-include('auxiliary_s2a.pl').
algorithm(In_vars,
Out_var) :-
findall(Var1,(member(Var,In_vars),
characterise1(Var,Var2),
strings_atoms_numbers(Var2,Var21),
term_to_brackets(Var21,Var1)
),In_vars1),
T1_old=[[[[string,['C1'," ","i","s"," ",'C2',"+",'C3',",",'C4'," ","i","s"," ",'C1',"+","3","."]]],[output,[["[","[",[atom,["+"]],"[",[number,['C2']],[number,['C3']],"[",[atom,["l","o","w","e","r"]],"[",[string,['C1']],"]","]","]","]","[",[atom,["+"]],"[","[",[atom,["l","o","w","e","r"]],"[",[string,['C1']],"]","]",[number,["3"]],"[",[atom,["l","o","w","e","r"]],"[",[string,['C4']],"]","]","]","]","]"]]]]],
append(In_vars1,[[output,_]],In_vars3),
rs_and_data_to_term(T1_old,In_vars3,_,[],In_vars2,_T2_old,true),
double_to_single_brackets(In_vars2,In_vars21),
append(In_vars41,[[output,T2_old]],In_vars21),
double_to_single_brackets(In_vars41,In_vars4),
member(Map2,[[[[1,2,1],[[1,10,2,1],[1,21,2,1]]],[[1,2,6],[[1,5,2,1]]],[[1,2,8],[[1,6,2,1]]],[[1,2,10],[[1,28,2,1]]],[[1,2,15],[[1,10,2,1],[1,21,2,1]]]]]),
double_to_single_brackets(T2_old,T2_old3),
move_vars(Map2,In_vars4,T2_old3,[],Out_var2),
findall(Out_var3,remove_nd(Out_var2,Out_var3),Out_var4),
member(Out_var5,Out_var4),
term_to_list(Out_var5,Out_var6),
[Out_var6]=Out_var.