:-include('auxiliary_s2a.pl').
algorithm(In_vars,
Out_var) :-

findall(Var1,(member(Var,In_vars),
(string(Var)->string_strings(Var,Var2);Var=Var2),		strings_atoms_numbers(Var2,Var21),
term_to_brackets(Var21,Var1)
),In_vars1),
T1_old=[[nd,[]]],

	%append([T1_old2],[[output,T2_old]],T1_old),
	/*
	length(In_vars1,RSCL),
	numbers(RSCL,1,[],Ns),
%trace,
	findall(%[X1,
	T22,(member(N,Ns),
	
	get_item_n(T1_old2,N,%[X1,
	X2%]
	),
	get_item_n(In_vars1,N,X21),
	%findall(T2,(member(X3,In_vars1),
	%member([X1,X21],X3),
	*/
	%trace,
	append(In_vars1,[[output,_]],In_vars3),
	rs_and_data_to_term(T1_old,In_vars3,_,[],In_vars2,_T2_old,true),%),In_vars2),
	double_to_single_brackets(In_vars2,In_vars21),
	append(In_vars41,[[output,T2_old]],In_vars21),
	double_to_single_brackets(In_vars41,In_vars4),
%trace,
%double_to_single_brackets(T1_old,T1_old1),
%double_to_single_brackets(In_vars1,In_vars11),
%	rs_and_data_to_term(T1_old1,In_vars11,_,[],T22,T2_old),
%double_to_single_brackets(T22,T221),
%findall(In_vars3,remove_nd(In_vars2,In_vars3),In_vars4),
%member(T2_old4,T2_old3),
member(Map2,[]),
%member(In_vars5,In_vars4),
double_to_single_brackets(T2_old,T2_old3),
move_vars(Map2,In_vars4,T2_old3,[],Out_var2),
findall(Out_var3,remove_nd(Out_var2,Out_var3),Out_var4),
member(Out_var5,Out_var4),
test_n(Test_n),
term_to_list(Out_var5,Out_var,Test_n).