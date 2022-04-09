% replace_pred_names1([[n,function],[[v,a],[v,c]],":-",[[[n,+],[[v,b],[v,d]]]]],L,[+],sum),writeln1(L).
% [[n,function],[[v,a],[v,c]],":-",[[n,sum],[[v,b],[v,d]]]]

replace_pred_names1([],[],_,_) :- !.
replace_pred_names1(Algorithm1,Algorithm3,To_replace,Replace_with) :-

get_lang_word("n",Dbw_n),
get_lang_word("true",Dbw_true),

Algorithm1=[F|Rest],
(Rest=[Args,":-",Lines]->true;
(Rest=[Args]->Lines=[[[Dbw_n,Dbw_true]]];
(Rest=[":-",Lines];
(Rest=[],Lines=[[[Dbw_n,Dbw_true]]])))),

	%recursive_replace_pred_names(Args,_,Arguments3,To_replace,Replace_with),
		replace_pred_names(Lines,[],Algorithm4,To_replace,Replace_with),

(Args=[]->Algorithm3=[F,":-",Algorithm4];
Algorithm3=[F,Args,":-",Algorithm4])		.


replace_pred_names([],N,N,_,_):-!.%%,Body3


%%replace_pred_names([],Body,Body) :- !.
replace_pred_names(Body1,Body2,Body3,To_replace,Replace_with) :-
        Body1=[[Statements1|Statements1a]|Statements2
        ],
	
		not(predicate_or_rule_name(Statements1)),
			  %Number1a is Number1+1,
replace_pred_names([Statements1],[],Body4,To_replace,Replace_with), %% 2->1

	replace_pred_names(Statements1a,[],Body5,To_replace,Replace_with),
        
        append(Body4,Body5,Body6),
        replace_pred_names(Statements2,[],Body7,To_replace,Replace_with),
    	
    	foldr(append,[Body2,Body6],[],Body8),
    	Body3=[Body8|Body7],
    	!.



        
replace_pred_names(Body1,Body2,Body3,To_replace,Replace_with) :-
get_lang_word("n",Dbw_n),
get_lang_word("not",Dbw_not),

        Body1=[[[Dbw_n,Dbw_not],Statement]|Statements2 %% [] removed from Statement
        ],
		  %Number1a is Number1+1,
        replace_pred_names([Statement],[],Body4,To_replace,Replace_with),
        replace_pred_names(Statements2,[],Body3a,To_replace,Replace_with),

                		  append(Body2,[[[Dbw_n,Dbw_not]|Body4]|Body3a],Body3),
		  %append([Number1,%%*,
		  %[n,not]],Body3,Body5),
		  %append([Body5],Body4
     %   ,Body2),

	!.
	
	


replace_pred_names(Body1,Body2,Body3,To_replace,Replace_with) :-
get_lang_word("n",Dbw_n),
get_lang_word("or",Dbw_or),
        Body1=[[[Dbw_n,Dbw_or],[Statements1,Statements2]]|Statements3],
		  %Number1a is Number1+1,
        replace_pred_names([Statements1],[],Body4,To_replace,Replace_with),
        replace_pred_names([Statements2],[],Body5,To_replace,Replace_with),
        replace_pred_names(Statements3,[],Body3a,To_replace,Replace_with),
        
        append(Body4,Body5,Body6),
                        		  append(Body2,[[[Dbw_n,Dbw_or],Body6]|Body3a],Body3),

        %append(Body3,Body4,Body34),
        %Body6=[Number1,[n,or],Body34
        %],
        %append([Body6],Body5,Body2),
        !.


replace_pred_names(Body1,Body2,Body3,To_replace,Replace_with) :-
get_lang_word("n",Dbw_n),

        Body1=[[[Dbw_n,"->"],[Statements1,Statements2]]|Statements3],
		  %Number1a is Number1+1,
        replace_pred_names([Statements1],[],Body4,To_replace,Replace_with), 
    	  replace_pred_names([Statements2],[],Body5,To_replace,Replace_with),

        replace_pred_names(Statements3,[],Body3a,To_replace,Replace_with),

                append(Body4,Body5,Body6),

                        		  append(Body2,[[[[Dbw_n,"->"]],Body6]|Body3a],Body3),

        %append(Body3,Body4,Body34),
        %Body6=[Number1,[n,"->"],Body34
        %],
        %append([Body6],Body5,Body2),

        !.




replace_pred_names(Body1,Body2,Body3,To_replace,Replace_with) :-
get_lang_word("n",Dbw_n),
        Body1=[[[Dbw_n,"->"],[Statements1,Statements2,Statements2a]]|Statements3],
		  %Number1a is Number1+1,
        replace_pred_names([Statements1],[],Body4,To_replace,Replace_with),
        replace_pred_names([Statements2],[],Body5,To_replace,Replace_with),
                %%trace,
                replace_pred_names([Statements2a],[],Body6,To_replace,Replace_with),
        replace_pred_names(Statements3,[],Body3a,To_replace,Replace_with),
        
               foldr(append,[Body4,Body5,Body6],[],Body7),
                                		  append(Body2,[[[Dbw_n,"->"],Body7]|Body3a],Body3),

        %append_list2([Body3,Body4,Body5],Body345),
        %Body7=[Number1,[n,"->"],Body345],        
        %append([Body7],Body6,Body2),
        !.


replace_pred_names(Body1,Body2,Body3,To_replace,Replace_with) :-
	Body1=[Statement|Statements],
	not(predicate_or_rule_name(Statement)),
	replace_pred_names(Statement,Body2,Body4,To_replace,Replace_with),
	replace_pred_names(Statements,Body4,Body3,To_replace,Replace_with),
   %append_list2([Result1,Result2],Body2),
   !.
   
replace_pred_names(Statement,Arguments1,Arguments2,To_replace,Replace_with) :-
get_lang_word("n",Dbw_n),

	((Statement=[[Dbw_n,Name],Arguments],
	%trace,
	%recursive_replace_pred_names(Arguments,Arguments1,Arguments3,To_replace,Replace_with)
	
(member(Name,To_replace)->Name2=Replace_with;Name2=Name),
	append(Arguments1,[[[Dbw_n,Name2],Arguments]],Arguments2)

	)->true;
	(Statement=[[Dbw_n,Name]],
	
		
(member(Name,To_replace)->Name2=Replace_with;Name2=Name),

	append(Arguments1,[[[Dbw_n,Name2]]],Arguments2)%Arguments2,
	))
	

	.
