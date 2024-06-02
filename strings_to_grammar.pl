/*

Decision tree, with recurring parts

strings_to_grammar(["[aaa]"],G).
G = [[1,>,[]],
	 [1,>,a,1]
	]

strings_to_grammar(["[ab]","[ac]"],G).
G = [[1,>,a,1]
	 [1,>,b],
	 [1,>,c]
	]

*/

:-include('../listprologinterpreter/listprolog.pl').
%:-include('../luciancicd/find_dependencies2-cgpt1.pl').
:-include('sub_term_with_address.pl').
%:-include('test15.pl').
:-include('find_lists3.pl').

:-dynamic var_num/1.

get_var_num(N) :-
	var_num(N),
	N1 is N+1,
	retractall(var_num(_)),
	assertz(var_num(N1)),!.
	
strings_to_grammar(L,G) :-
	retractall(var_num(_)),
	assertz(var_num(1)),
	
	findall(%[r,1,
	T41%]
	,(member(S,L),%string_strings(S,L2),
	term_to_atom(T1,S),
	%grammar1(L2,T1),
	group_non_lists1(T1,T4),
	process_terms(T4,[],T41,[],_R)
	%,get_var_num(N)
	),Ts),
	
	
	%trace,
	findall(B,(member(B1,Ts),find_g(B1,[],B)),G1),
	foldr(append,G1,G).
	/*
	%sub_term_types_wa([all([string])],Ts,In1), % find terminal lists
	%sub_term_types_wa([all_resolution_level([string])],Ts,In2),
	sub_term_types_wa([all([string])],Ts,In1),
	%append(In1,In2,In3),
	
	%findall(A,member([_,A],In1),A1),
	
	find_repeating_structures(In1,A11),
	find_recursive_structures,
	% find f>=2 of list l 2.. 
	
	% find and flatten length 2,3...
	% 
	
	

	sort(A1,A2),
	findall(%[A6L,
	[Ad,A4]%]
	,(member(A4,A2),findall(A5,member([Ad,A4],In),A6),length(A6,A6L),not(A6L=1)),A3),
	findall(A7,(member([Ad,A8],A3),)
	get_var_num).

	%find_g(Ts,[],G).
*/
process_terms([],T,T,R,R) :- !.
process_terms(T1,T2,T3,R1,R2) :-
	T1=[T4|T51],
	(T4=["[",T6,"]"]->
	(process_terms(T6,[],T5,[],R3),R6=R3%get_var_num(N),T5=[r,N],foldr(append,[R1,R5,[T52]],R6)
	);
	(find_lists3a(T4,T5)->true;T4=T5),R1=R6),
	append(T2,[T5],T6),
	process_terms(T51,T6,T3,R6,R2),!.

	/*
	))
	findall(T6,(member(T7,T1),)

break_on_list(T1,T2,T3) :-!.
	T1=[T4|T5],
	(is_list(T4)->
	append([T2],);
	T5=
	append(T2,T4,T6).
	*/
	
% group_non_lists1([a,[b],c,d,[f],g,h],D).
% D = [[a], ["[", [b], "]"], [c, d], ["[", [f], "]"], [g, h]].

group_non_lists1(Xs, Ys) :-
	group_non_lists([['&item']|Xs], Ys).
group_non_lists([['&item'|A]], [A]) :-!.
group_non_lists([A], [A]) :-!.
group_non_lists([], []) :-!.
group_non_lists([X11, C|Xs], Ys) :-
	%catch(number_string(_C1,C),_,false),
	not(is_list(C)),
	%X11="-",
	X11=['&item'|X12],
	(not(is_list(X12))->X13=[X12];X13=X12),
	append(X13,[C],X3),
	X31=['&item'|X3],
    group_non_lists([X31|Xs], Ys),!.
group_non_lists([X11,C|Xs], [X13|Ys]) :-
	(X11=['&item'|X12]->
	(X13=X12,C1=C);
	(%X11=[l|X12],
	X13=["[",X11,"]"],
	C1=['&item'|C])),
	%is_list(X11),%)%(catch(number_string(X1,X11),_,false)
	%->
	%X12=X1;X12=X11),
	
    group_non_lists([C1|Xs], Ys),!.

longest_to_shortest_substrings1(A,B) :-
	findall(C,longest_to_shortest_substrings(A,C),D),
	sort(D,B1),
	reverse(B1,B),!.
%longest_to_shortest_substrings([],A,A) :-!.
longest_to_shortest_substrings(A0,C) :-
	length(A0,L),L1 is L-3,(L1<3->L11=3;L11=L1),
	%append(D,E,A),
	%not(D=[]),
	append1(L11,A0,[],A01),
	delete(A01,[],C).
	%longest_to_shortest_substrings(E1,[],F),
	%flatten(D,D2),(D2=[]->D21=[];D21=[D2]),
	%flatten(D1,D3),(D3=[]->D31=[];D31=[D3]),
	%flatten(F,F2),(F2=[]->F21=[];F21=[F2]),
	%subtract()
	%foldr(append,[%B,
	%D21,D31,F21],C).
	%C=[A0,A,C,A1,C1,D1].

append1(0,A0,A01,A02) :- append(A01,[A0],A02),!.
/*append1(L1,A0,A01,A02) :-
	append(A,B,A0),
	append(C,D,B),
	append(A01,[A,C,D],A02).
	%append(A1,B1,D),
	%append(C1,D1,B1).
	*/
%/*
append1(L1,A0,A01,A02) :-
	%append(A2,B2,A0),
	%append(C2,D,B2),
	append(A1,B1,A0),
	append(C1,D1,B1),
	append(A01,[A1,C1],A03),
	L2 is L1-1,
	append1(L2,D1,A03,A02).
%*/
/*(find_repeating_structures(List,A11) :-
	findall(A,member([_,A],List),A1),
	maximum_length(A1,Maximum_length),
	%numbers(Maximum_length,1,[],Ns),
	append(Nm1,[_],Ns),
	Position2 is ceiling((Maximum_length/2)-1),
	find_repeating_structures1(1,Position2,2,Nm1,List,[],List2).
	
	% test for f>=2
	% mark items' places with * x can include existing results
	% flatten r structs xx where always same (no different dbcs compared with abcs) x if there is no d in the group of as

% L=[r,1,["a","b",[r,2,["c","d"]]]]
% r means recursive struct, i.e. 1-->3,4, referred to elsewhere as [r,1]
% L=[r,1,["a","b","c","d","e","f"]]
% to L=[r,1,["a","b",[r,2,["c","d"]],"e","f"]]]]

% eg2. L=[r,1,["a","b",[r,2,["c","d"]]]]
% to L=[r,1,["a","b",[r,3,["e",[r,2,["c","d"]]]]]]
% later [r,1,["a","b",[r,3,["e","c","d"]]]] if no non 7s before 3,4s

find_sl(List,Find,Result) :-
	sub_term_types_wa([string],List,Inst1),
	findall(X,member([_,X],Inst1),X1),
	
	%List=[L|Ls],
	%flatten(List,List1),
	%findall(A1,(member(A1,List1),not(A1=r),not(number(A1))),B).
	append(C,D,X1),
	append(Find,E,D),
	length(C,L),
	length(Find,FL),
	%L1 is L+1,
	%L2 is L1+FL,
	%numbers(L2,L1,[],Ns),
	%findall(Y,(member(Y1,Ns),get_item_n(X1,Y1,[Ad,X])),Y2),
	get_item_n(Inst1,L,[Ad,X]),
	append(Ad1,[N2],Ad),
	get_sub_term_wa(List,Ad1,It2),
	%N21 is N2,
	length(Before_list,N2),
	length(Sub_list,FL),
	append(Before_list,L1,It2),
	append(Sub_list,After_list,L1),
	get_var_num(N),
	foldr(append,[Before_list,[[r,N,Sub_list]],After_list],It3),
	put_sub_term_wa(It3,Ad1,List,Result),!.
	% check not cut off
	% add r
	
% find_g([r,1,["a","b",[r,2,["c","d"]]]],G).

% G = [[[n,1],"-->",[]],[[n,1],"-->",[["a"],["b"],[n,2],[n,1]]],[[n,2],"-->",[]],[[n,2],"-->",[["c"],["d"],[n,2]]]]


do outer level, then contained levels until end
- do as predicate
*/

find_g([],G,G) :-!.
find_g(T,G1,G2) :-

%T=[T1|T2],
not(T=[r,N,T3]),
T3=T,
get_var_num(N),
Name=[n,N],
Arrow="->",
Empty=[[]],
%trace,
find_g1(T3,[],G3,[],Rest),
%append(G3,[[Name]],G5),
G4=[%[Name,Arrow,Empty],
[Name,Arrow,G3]|Rest],
append(G1,G4,G2),
%foldr(append,G2,G21),
!.
find_g(T,G1,G2) :-

%T=[T1|T2],
T=[r,N,T3],

Name=[n,N],
Arrow="->",
Empty=[[]],
find_g1(T3,[],G3,[],Rest),
append(G3,[[Name]],G5),
G4=[[Name,Arrow,Empty],[Name,Arrow,G5]|Rest],
append(G1,G4,G2),
%foldr(append,G2,G21),
!.
find_g1([],G,G,R,R):-
 !.
find_g1(T,G1,G2,R1,R2) :-

T=[T1|T2],
(T1=[r,N,
_T4]->
(find_g(T1,[],R3),
%get_var_num(N),
append(R1,R3,R4),T1a=[[n,N]]);
(%string(T1),
(T1a=[T1],
R1=R4))),
append(G1,[T1a],G3),
find_g1(T2,G3,G2,R4,R2).





/*
find_g(T,G%,G2]
)	:-
	T=[r,N0,T1],
	sub_term_wa([r,_,_],T1,In),
	findall([X3,[Ad,X]],
	(member([Ad,X1],In),
	X1=[r,N,A],
	sub_term_wa([r,_,_],A,In1),
	findall([Ad1,N1],(member([Ad1,Y1],In1),Y1=[r,N1,A1]),Y2),
	foldr(put_sub_term_wa_ae,Y2,A,X21),
	X1=[_,_,X31],
	%trace,
	(In=[]->X=[];
	find_g(X31,X)),
	X3=[[N0,"-->"%][X21,"-->"
	,[]],[N0,"-->",X],[X21,"-->",[]],[X21,"-->",X]]),X2),
	findall(Z,member([_,Z],X2),Z1),
	foldr(put_sub_term_wa_ae,Z1,T1,G2),
	findall(Z,member([Z,_],X2),G1),
	foldr(append,G1,G),
	!.
	*/

/*
find_n_length_sublists(A1,SLs) :-
	findall([Ad,A],(member([Ad,A2],A1)
	
	)).

find_repeating_structures1(_Position1,_Position2,_Length1,_Length2,[],List,List) :- !.
find_repeating_structures1(Position1,Position2,Length1,Length2,List,List1,List2) :-
	List=[List3|List4],
	length(List3,L),
	truncate_l(L,Position2,Position22),
	truncate_l(L,Length2,Length22),
	find_repeating_structures2(Position1,Position22,Length1,Length22,List3,List5),
	
	append(List1,[List5],List6),
find_repeating_structures1(Position1,Position2,Length1,Length2,List4,List6,List2).

	find_repeating_structures2(Position2,Position2,Length1,_Length2,List,List) :- !.
	find_repeating_structures2(Position1,Position2,Length1,Length2,List,List2) :-
	
	find_repeating_structures3(Position1,Position2,Length1,Length2,[],List3) ,
	append(List,[List3],List4),
	Position11 is Position1+1,
	find_repeating_structures2(Position11,Position2,Length1,Length2,List4,List2).


	find_repeating_structures3(_Position1,_Position2,Length1,Length1,List,List) :- !.
	find_repeating_structures3(Position1,Position2,Length1,Length2,List,List2) :-
	split11(List,Length1,[],SLs),
	% find n length sublists up to n/2-1 items into list
	find_n_length_sublists(A1,SLs),
	append(List,[SLs],List3),
	Length11 is Length1+1,
	find_repeating_structures3(Position11,Position2,Length11,Length2,List3,List2).
	*/
split11([]%
%List
,_L16,%N,N,
 A,A) :- %L2 is L16*2,length(List,L3),L3=<L2,
 !.
split11(Q2,L16,%N1,N2,
 L20,L17) :-
	%get_items_summing_to_l(Q2,L16,N1,N3,[],L2),
	length(L18,L16),
	append(L18,L19,Q2),
	append(L20,[L18],L21),
	split11(L19,L16,L21,L17),!.
split11(_A,_B,C,C) :-!.
	
truncate_l(N,Max,N2) :-
 (N>Max->N2=Max;N2=N),!.
 
is_t(H,A,First0,First) :-
	((%trace,
	First0=true,First=true,member(all_resolution_level(K),H),%trace,
	%trace,%forall(%member(J,H),
	%member(K1,K)),
	is_list(A),
	%writeln1(A),
	%(A=["e", [r, 1, ["a"]]]->trace;true),
	member([r,_N,_A],A),
	sub_term_wa([r,_N,_A],A,Inst2),
	findall([Ad,A3],(member([Ad,_A4],Inst2),A3=0),Inst3),
	foldr(put_sub_term_wa_ae,Inst3,A,A2),
	%trace,
	%A2=A,
	forall(member(A1,A2),is_t([number|K],A1,First0,false))
	
	)),!.
	%*/

%find_g([],G,G) :-!.
%find_g(Ts,G1,G2) :-
%	Ts=[T1|Ts2].
	
/*
	sub_term_wa(T1,[_,[]],Insts), % find terminals
* see stwa

	find_g1(T1,G1,G3),
	find_g(Ts2,G3,G2).

% 2nd time bbba has 2 bs req branching point
% 
find_g1([],G,G) :-
find_g1(Items,G1,G2) :-
	%Items=[Item1|Items2],
	%is_list()	
	* s2l, 
	ind gs (editing editing aa in baabaa), dt, 
	x dt, do ind gs on branch segments x too difficult to move parts up
	x: backwards: gs
	dt gs with only same first letter
	
	find gs first (loops)
	
	only if subtree exactly the same * use diff gs in diff terms unless same g x always use same gs
	
	train tracks: any config can be accounted for, 
	
	()* do dec trees from Ts at same time - before gs
	decision_tree(Items,T),

	%sub_term_wa(T,[_,[]],Insts), % find terminals
	
	* if rest of tree is same then can merge, otherwise stay separate
	
	try subtrees in case multiple subtrees
	
	* bottom up lists and trees, finished lists are gs
	
	dec tree on lists, backwards
	
	recn on lists
	
	* no quote types " or ' in quotes

	
	% find deps

	
*/

% string to list finds brackets, needs to refer to repeating parts already found

% * other types of brackets incl quotes

% after s2l, puts together g reusing simplest gs first
% dec trees

/*
query_box_2(T):-A="[[\"aa,]\",b,\"c\",[]],1]",string_chars(A,C),findall(G,(member(E,C),atom_string(E,G)),F),grammar1(F,T).
grammar1(U,T):-compound([],T,U,[]),!.
compound213(U,U,T,T).
compound(T,U)-->["["],["]"],compound213(T,U).
compound(T,U)-->["["],compound21(T,V),["]"],compound213(V,U).
compound212(U,U,T,T).
compound21(T,U)-->item(I),lookahead(["]"]),{wrap(I,Itemname1),append(T,Itemname1,V)},compound212(V,U).
compound21(T,U)-->item(I),[","],compound21([],Compound1name),{wrap(I,Itemname1),append(T,Itemname1,V),append(V,Compound1name,U)}.
item(T)-->["\""],word21("",T),["\""].
item(T)-->number21("",U),{stringtonumber(U,T)}.
item(T)-->word21_atom("",T1),{atom_string(T,T1)}.
item(T)-->compound([],T).
number212(U,U,T,T).
number21(T,U)-->[A],commaorrightbracketnext,{((stringtonumber(A,A1),number(A1))->(true);((equals4(A,".")->(true);(equals4(A,"-"))))),stringconcat(T,A,V)},number212(V,U).
number21(T,U)-->[A],{((stringtonumber(A,A1),number(A1))->(true);((equals4(A,".")->(true);(equals4(A,"-"))))),stringconcat(T,A,V)},number21("",Numberstring),{stringconcat(V,Numberstring,U)}.
word212(U,U,T,T).
word21(T,U)-->[A],quote_next,{not((=(A,"\""))),stringconcat(T,A,V)},word212(V,U).
word21(T,U)-->[A],{not((=(A,"\""))),stringconcat(T,A,V)},word21("",Wordstring),{stringconcat(V,Wordstring,U)}.
word212_atom(U,U,T,T).
word21_atom(T,U)-->[A],commaorrightbracketnext,{not((=(A,"\""))),not((=(A,"["))),not((=(A,"]"))),stringconcat(T,A,V)},word212_atom(V,U).
word21_atom(T,U)-->[A],{not((=(A,"\""))),not((=(A,"["))),not((=(A,"]"))),stringconcat(T,A,V)},word21_atom("",Wordstring),{stringconcat(V,Wordstring,U)}.
commaorrightbracketnext-->lookahead([","]).
commaorrightbracketnext-->lookahead(["]"]).
quote_next-->lookahead(["\""]).
lookahead(B,A,A):-append(B,_D,A).

%grammar_part(A,B,C):-string_concat(A,C,B),string_length(A,1).
stringconcat(A,B,C):-string_concat(A,B,C).
stringtonumber(A,B):-number_string(B,A).
equals4(A,B):-A=B.
wrap(A,B):-B=[A].
*/

% start with shortest string at end of strings, build dec tree bottom up
% turn recursion on way into new clauses eg abbbc
% matching brackets at same level

% only branches if 2nd instance needing it x

% turn tree into graph
% dfs post order - replaces same branches

% check simpler trees for recursive parts first, 	x

% decision_tree([[a,b,c],[a,d,e],[f,g,h]],A),writeln(A).

% [[a,[[b,[[c,[]]]],[d,[[e,[]]]]]],[f,[[g,[[h,[]]]]]]]


decision_tree([],[]) :- !.
decision_tree(A,B) :-
	findall(C,(member([C|_D],A)),E),
	sort(E,K),
	findall([G,J],(member(G,K),findall(G,member(G,E),H),length(H,J)),L),
	findall([G,%K1,
	P],(member([G,_K1],L),findall(D,member([G|D],A),D2),decision_tree(D2,P)),B).
