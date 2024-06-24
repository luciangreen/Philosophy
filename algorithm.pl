:-include('auxiliary_s2a.pl').
algorithm(In_vars,
Out_var) :-
%In_vars=[['C1',3],['C2',3]],
findall(Var1,(member(Var,In_vars),
(string(Var)->string_strings(Var,Var1);Var=Var1)),In_vars1),
%findall(Var1,(member(Var,Out_vars),
%(string(Var)->string_string(Var,Var1);Var=Var1)),Out_vars1),
T1_old=[['C1',3],['C2',3]],T2_old=[[3]],

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

move_vars([[[1,1,1],[]],[[1,2,1],[]]],In_vars2,T2_old,[],Out_var2),
term_to_list(Out_var2,Out_var).