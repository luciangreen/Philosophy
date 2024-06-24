% rs_and_data_to_term([[r,['A1','A2']]],[2,3,2,3],[],T).

% T = [[r, [['A1', 'A2'], [[2, 3]]]]]


% rs_and_data_to_term([[r,['A1','A2']],[r,['A3','A4']]],[2,3,2,3,3,5],[],T).

% T = [[r, [['A1', 'A2'], [[2, 3]]]], [r, [['A3', 'A4'], [[3, 5]]]]]


%rs_and_data_to_term([[o,['A1']],1,[o,['A1']]],[2,1,2],[],T).
%T = [[o, [['A1'], [2]]], 1, [o, [['A1'], [2]]]].

%rs_and_data_to_term([[o,['A1']],1,[o,['A1']]],[1],[],T).
%T = [[o, [['A1'], []]], 1, [o, [['A1'], []]]].


% rs_and_data_to_term([[o,['A1']],[r,['A3','A4']]],[2,3,2,3],[],T).

% use var values from elsewhere

% check that recurring vars don't have conflicting vals

rs_and_data_to_term([],_,_,%RSa,RSa,
T,T) :- !.
rs_and_data_to_term(RS,D1,D3,%RSa1,RSa2,
T1,T2) :-

	%get_ampersand_var_s2a(N),
	%atom_concat('&',N,AN),
	
	RS=[RS1|RS2],
	(RS1=[r,RS3]->
	(%look ahead to char following r x if undefined, try repeating or going on
	%(ro(RS3),rs_and_data_to_term(RS3,D1,D2,%RSa1,RSa2,
%[],T3))->true;
	try_r(RS3,D1,D2,[],T3),%),
	
	append(T1,[[r,T3%[RS3,T3]
	]],T31)
	%append(RSa1,[['&',N,r,,T3]]],T31)
	);
	
	(RS1=[o,RS3]->
	(
	%(ro(RS3),rs_and_data_to_term(RS3,D1,D2,%RSa1,RSa2,
%[],T3))->true;
	try_o(RS3,D1,D2,[],T3),%),
	
	append(T1,[[o,T3%[RS3,T3]
	]],T31));
	
	(only_item1(RS1)->
	(get_token(RS1,D1,D2,[],T3),
	%->true;rs_and_data_to_term([RS1],D1,D2,%RSa1,RSa2,
%[],T3)),
	
	append(T1,T3,T31)%;
	
	%rs_and_data_to_term(RS1,D1,%RSa1,RSa2,
%T1,T2),
	%append(T1,[[r,[RS3,T3]]],T31)
	)%;
	%rs_and_data_to_term(RS1,D1,D2,%RSa1,RSa2,
%T1,T31)
	)))
	,
	
	rs_and_data_to_term(RS2,D2,D3,T31,T2),!.


ro([r,_]).
ro([o,_]).

try_r(RS3,D1,D2,T1,T2) :-

	try_r1(RS3,D1,D3,[],T3),
	(T3=[]->
	(D2=D3,T1=T2);
	((T1=[]->(T3=T31,%[T31|_],
	append(T1,T31,T4));T4=T1),
	try_r(RS3,D3,D2,T4,T2))).

try_r1([],D,D,T,T) :- !.

try_r1(RS3,D1,D3,T1,T2) :-

	RS3=[RS4|RS5],
	D1=[D4|D5],
	ro(RS4),rs_and_data_to_term([RS4],D1,D4,%RSa1,RSa2,
[],T31),
	append(T1,T31,T3),
	%D5=D3,T3=T2.
	try_r1(RS5,D5,D3,T3,T2).


try_r1(RS3,D1,D3,T1,T2) :-

	RS3=[RS4|RS5],
	D1=[D4|D5],
	get_val_s2a(RS4,D4),
	append(T1,[D4],T3),
	%D5=D3,T3=T2.
	try_r1(RS5,D5,D3,T3,T2).

try_r1(_,D,D,T,T) :- !.

try_o(RS3,D1,D3,T1,T3) :-
	(try_r1(RS3,D1,D3,T1,T3);
	(D1=D3,T1=T3)).

get_token(RS1,D1,D2,T1,T3) :-
	D1=[D4|D2],
	get_val_s2a(RS1,D4),
	append(T1,[D4],T3).	

get_val_s2a(Var,Val) :-
%trace,
	(is_var_s2a(Var)->
	(vars_table_s2a(Vars),
	(member([Var,Val1],Vars)->
	(Val=Val1->true;fail);
	(append(Vars,[[Var,Val]],Vars2),
	retractall(vars_table_s2a(_)),
	assertz(vars_table_s2a(Vars2)))));
	Var=Val
	).
	
is_var_s2a(Item) :-
	atom(Item),atom_concat(It,Em,Item),
	atom_length(It,1),
	is_upper(It),
	atom_string(Em,Em1),
	number_string(_N,Em1).
	
only_item1(A):-only_item(A).
only_item1([]).


