% replace_vars1([[n,function],[[v,a],[v,c]],":-",[[[n,+],[[v,b],[v,d]]]]],A,1,C,[],B),writeln1(A).
% [[n,function],[[v,1],[v,2]],":-",[[n,+],[[v,3],[v,4]]]]

replace_vars1(Algorithm1,Algorithm3,Var_index1,Var_index2,Var_table1,Var_table2) :-

get_lang_word("n",Dbw_n),
get_lang_word("true",Dbw_true),

Algorithm1=[F|Rest],
(Rest=[Args,":-",Lines]->true;
(Rest=[Args]->Lines=[[[Dbw_n,Dbw_true]]];
(Rest=[":-",Lines];
(Rest=[],Lines=[[[Dbw_n,Dbw_true]]])))),

%trace,
	recursive_replace_vars(Args,[],Arguments3,Var_index1,Var_index2,Var_table1,Var_table3),
		replace_vars(Lines,[],Algorithm4,Var_index2,_,Var_table3,Var_table2),

(Arguments3=[]->Algorithm3=[F,":-",Algorithm4];		
Algorithm3=[F,Arguments3,":-",Algorithm4])		.

%Algorithm1=[[[Dbw_n,N],Args,]]

replace_vars([],N,N,Var_index,Var_index,Var_table,Var_table):-!.%%,Body3


%%replace_vars([],Body,Body) :- !.
replace_vars(Body1,Body2,Body3,Var_index1,Var_index2,Var_table1,Var_table2) :-
        Body1=[[Statements1|Statements1a]|Statements2
        ],
	
		not(predicate_or_rule_name(Statements1)),
			  %Number1a is Number1+1,
replace_vars([Statements1],Body2,Body4,Var_index1,Var_index3,Var_table1,Var_table3), %% 2->1

	replace_vars(Statements1a,Body4,Body5,Var_index3,Var_index4,Var_table3,Var_table4),
        replace_vars(Statements2,Body5,Body3,Var_index4,Var_index2,Var_table4,Var_table2),
    	!.



        
replace_vars(Body1,Body2,Body3,Var_index1,Var_index2,Var_table1,Var_table2) :-
get_lang_word("n",Dbw_n),
get_lang_word("not",Dbw_not),

        Body1=[[[Dbw_n,Dbw_not],Statement]|Statements2 %% [] removed from Statement
        ],
		  %Number1a is Number1+1,
        replace_vars([Statement],[],Body4,Var_index1,Var_index3,Var_table1,Var_table3),
        replace_vars(Statements2,[],Body3a,Var_index3,Var_index2,Var_table3,Var_table2),
		  append(Body2,[[[[Dbw_n,Dbw_not]],Body4]|Body3a],Body3),
		 
	!.
	
	


replace_vars(Body1,Body2,Body3,Var_index1,Var_index2,Var_table1,Var_table2) :-
get_lang_word("n",Dbw_n),
get_lang_word("or",Dbw_or),
        Body1=[[[Dbw_n,Dbw_or],[Statements1,Statements2]]|Statements3],
		  %Number1a is Number1+1,
        replace_vars([Statements1],[],Body4,Var_index1,Var_index3,Var_table1,Var_table3),
        replace_vars([Statements2],[],Body5,Var_index3,Var_index4,Var_table3,Var_table4),
        replace_vars(Statements3,[],Body3a,Var_index4,Var_index2,Var_table4,Var_table2),
        
        		  append(Body2,[[[[Dbw_n,Dbw_or]],Body4,Body5]|Body3a],Body3),

        %append(Body3,Body4,Body34),
        %Body6=[Number1,[n,or],Body34
        %],
        %append([Body6],Body5,Body2),
        !.


replace_vars(Body1,Body2,Body3,Var_index1,Var_index2,Var_table1,Var_table2) :-
get_lang_word("n",Dbw_n),

        Body1=[[[Dbw_n,"->"],[Statements1,Statements2]]|Statements3],
		  %Number1a is Number1+1,
        replace_vars([Statements1],[],Body4,Var_index1,Var_index3,Var_table1,Var_table3), 
    	  replace_vars([Statements2],[],Body5,Var_index3,Var_index4,Var_table3,Var_table4),

        replace_vars(Statements3,[],Body3a,Var_index4,Var_index2,Var_table4,Var_table2),
        
                		  append(Body2,[[[[Dbw_n,"->"]],Body4,Body5]|Body3a],Body3),

        %append(Body3,Body4,Body34),
        %Body6=[Number1,[n,"->"],Body34
        %],
        %append([Body6],Body5,Body2),

        !.




replace_vars(Body1,Body2,Body3,Var_index1,Var_index2,Var_table1,Var_table2) :-
get_lang_word("n",Dbw_n),
        Body1=[[[Dbw_n,"->"],[Statements1,Statements2,Statements2a]]|Statements3],
		  %Number1a is Number1+1,
        replace_vars([Statements1],[],Body4,Var_index1,Var_index3,Var_table1,Var_table3),
        replace_vars([Statements2],[],Body5,Var_index3,Var_index3a,Var_table3,Var_table3a),
                %%trace,
                replace_vars([Statements2a],[],Body6,Var_index3a,Var_index4,Var_table3a,Var_table4),
        replace_vars(Statements3,[],Body3a,Var_index4,Var_index2,Var_table4,Var_table2),
        
                		  append(Body2,[[[[Dbw_n,"->"]],Body4,Body5,Body6]|Body3a],Body3),
        
        %append_list2([Body3,Body4,Body5],Body345),
        %Body7=[Number1,[n,"->"],Body345],        
        %append([Body7],Body6,Body2),
        !.


replace_vars(Body1,Body2,Body3,Var_index1,Var_index2,Var_table1,Var_table2) :-
	Body1=[Statement|Statements],
	not(predicate_or_rule_name(Statement)),
	replace_vars(Statement,Body2,Body4,Var_index1,Var_index3,Var_table1,Var_table3),
	replace_vars(Statements,Body4,Body3,Var_index3,Var_index2,Var_table3,Var_table2),
   %append_list2([Result1,Result2],Body2),
   !.
   
replace_vars(Statement,Arguments1,Arguments2,Var_index1,Var_index2,Var_table1,Var_table2) :-
get_lang_word("n",Dbw_n),

	((Statement=[[Dbw_n,Name],Arguments],
	%trace,
	recursive_replace_vars(Arguments,Arguments1,Arguments3,Var_index1,Var_index2,Var_table1,Var_table2),
	
	Arguments2=[[Dbw_n,Name],Arguments3]

	)->true;
	(Statement=[[Dbw_n,_Name]],
	Arguments2=Statement,%Arguments2,
	Var_index1=Var_index2,Var_table1=Var_table2)).
	
recursive_replace_vars([],Arguments,Arguments,Var_index1,Var_index1,Var_table1,Var_table1) :- !.

recursive_replace_vars(Statement,Arguments1,Arguments2,Var_index1,Var_index2,Var_table1,Var_table2) :-
	Statement=[Statement1|Statement2],
	(variable_name(Statement1)->((member([Statement1,V2],Var_table1)->(append(Arguments1,[V2],Arguments3),
Var_index1=Var_index3,Var_table1=Var_table3)	;
(	V=[v,Var_index1],append(Arguments1,[V],Arguments3),append(Var_table1,[[Statement1,V]],Var_table3),
Var_index1=Var_index3
)));(expression_not_var(Statement1)->(Arguments1=Arguments3,
Var_index1=Var_index3,Var_table1=Var_table3);
	recursive_replace_vars(Statement1,Arguments1,Arguments3,Var_index1,Var_index3,Var_table1,Var_table3))),
	Var_index4 is Var_index3+1,
	recursive_replace_vars(Statement2,Arguments3,Arguments2,Var_index4,Var_index2,Var_table3,Var_table2).
