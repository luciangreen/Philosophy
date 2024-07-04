% multiple outputs x, internal types, Prolog
% cycle s2a, caw
% add recursion if types permit (anyway)
% dict from Prolog files via p2lp
% rec parts (list decomp, nested recn) as caw dicts
% s2a variant x caw can recog spec with subset of vars leading to recn, whether list (append a b c or foldr), list of lists (a [b] c) with types, caw works base up, through working s2a parts
% insert foldr, maplist in caw lib

% simple_caw.pl

% simple_caw0(reverse,[[[n,head],1,1],[[n,tail],1,1],[[n,wrap],1,1],[[append],2,1],[[n,reverse],2,1]],[[[n,reverse,[[],[v,a],[v,a]]]]],[[[v,a],[1,2,3]],[[v,b],[]]],[[[v,c],[3,2,1]]],[],P).

% simple_caw0(reverse,[[[n,reverse],2,1]],[[[n,reverse],[[],[v,a],[v,a]]]],[[[v,c],[2,3]],[[v,f],[1]]],[[[v,g],[3,2,1]]],[[[n,head],[[v,a],[v,b]]],[[n,tail],[[v,a],[v,c]]],[[n,wrap],[[v,b],[v,d]]],[[n,append],[[v,d],[v,e],[v,f]]]],P). x

% simple_caw0(reverse,[[[n,reverse],4,1]],[[[n,reverse],[[],[v,a],[v,c],[v,b],[v,a]]]],[[[v,a],[1,2,3]],[[v,b],[]],[[v,c],[2,3]] x only has 1 output,[[v,f],[1]]],[[[v,g],[3,2,1]]],[[[n,head],[[v,a],[v,b]]],[[n,tail],[[v,a],[v,c]]],[[n,wrap],[[v,b],[v,d]]],[[n,append],[[v,d],[v,e],[v,f]]]],P).

% simple_caw0(plus,[[[n,+],2,1]],[],[[[v,a],1],[[v,b],1]],[[[v,c],2]],[],P),writeln1(P).

% P = [[[n,plus],[[v,a],[v,b],[v,c]],":-",[[[n,+],[[v,a],[v,a],[v,c]]]]]]

:-include('../listprologinterpreter/listprolog.pl').

simple_caw0(F,Rules,Initial_rules,In,Out,Start_of_predicate,Predicate) :-
 retractall(new_var1(_)),
 assertz(new_var1(0)),
 
 findall(Val,member([_V,Val],In),Val1),
 %findall(Val,member([_V,Val],Out),Val1o),
 %findall(V,member([V,_Val],Out),Val1o1),
 Out=[[V,_Val2]],
 
 append(Val1,[V],Query1),
 %append(Val1,Val1o1,Query1),
 Query=[[n,F],Query1],
 Result=[Out], % change in Prolog
 simple_caw(F,Query,Result,Rules,Initial_rules,In,Out,Start_of_predicate,Predicate).
 
 
simple_caw(F,Query,Result,Rules,Initial_rules,In,Out,Rules1,Predicate) :- 

length(Rules1,L),not(L>=5),
%trace,
%trace,

% Don't repeat a command
member([P,I,_O],Rules),
/*(Rules1=[]->true;(%trace,
member([P00,_],Rules1),
not(P=P00))),
*/

%trace,

%get_last_arg(In,Rules1,Last_arg),

%trace,
Out=[[Var1,_]],
new_var(Var),

% choose n l args 
%trace,
findall(Last_arg010,get_last_arg(In,Rules1,Last_arg010),Last_arg0),
%numbers(I,1,[],N),
each_combo_last_args1(I,Last_arg0,[],Last_arg1),
%findall(Last_arg,(member(_,N),member(Last_arg,Last_arg0)),Last_arg1),

foldr(append,[Last_arg1,[Var1]],Last_args),

append(Rules1,[[P,Last_args]],Rules21),
remove_dups(Rules21,Rules2),

/*
(I=2->
(%(member([_P10,Args0],Rules1)->true;(member([Args000,_],In),[Args000]=Args0)),append(_,[Last_arg0],Args0),(member([_P20,Args20],Rules1)->true;member([Args20,_],In)),not(member(Last_arg0,Args20)),
get_last_arg(In,Rules1,Last_arg0),
*/


%;

%(%trace,
%append(Rules1,[[P,[Last_arg,Var1]]],Rules2)%,notrace
%)),


%trace,
 findall(V,member([V,_Val],In),V1),
 Out=[[V2,_Val2]],
 
 %append(Val1,[V],Query),
 %Result=[Out],

 	append(V1,[V2],Vars2),
 %trace,
	no_singletons(Vars2,Rules2,Var1,Rules22),
	Program22=[
        [[n,F],Vars2,":-",
                Rules22
        ]
        ],
        
        	append(Initial_rules,Program22,Program2),

        (debug(on)->Debug=on;Debug=off),

writeln1([*,Debug,Query,Program2,Result]),
%trace,
	((catch(call_with_time_limit(0.05, 
		interpret(Debug,Query,Program2,Result)),
      time_limit_exceeded,
      fail)
      %writeln1(Debug,Query,Program2,Result)
      )%->true;(length(Rules1,7)->fail;true))
      ->Predicate=Program2;
      
      (
      
      /*((%trace,
      I=2)->
append(Rules1,[[P,[Last_arg,Last_arg0,[v,Var]]]],Rules2)

;

(%trace,
append(Rules1,[[P,[Last_arg,[v,Var]]]],Rules3))),
*/
%trace,
findall(Last_arg010,get_last_arg(In,Rules1,Last_arg010),Last_arg01),

%numbers(I,1,[],N1),
%findall(Last_arg02,(member(_,N1),member(Last_arg02,Last_arg01)),Last_arg2),

each_combo_last_args1(I,Last_arg01,[],Last_arg2),

foldr(append,[Last_arg2,[[v,Var]]],Last_args2),

append(Rules1,[[P,Last_args2]],Rules3),

%trace,

% include in if then:
simple_caw(F,Query,Result,Rules,Initial_rules,In,Out,Rules3,Predicate))).




new_var(B) :- new_var1(A),B is A+1,
 retractall(new_var1(_)),
 assertz(new_var1(B)).

% New commands can only have inputs that occur in the header or once only in the body

get_last_arg(In,Rules1,Last_arg) :-
 %trace,
 %member([Args00,_],[]),
 
 % find args that occur once
 findall(Args,member([_P1,Args],Rules1),Args3),
 foldr(append,Args3,Args4),
 sort(Args4,Args7),
 
 	findall(G,(member(G,Args7),findall(G,member(G,Args4),H),length(H,J),J=1),L),

 
 %subtract(Args4,Args5,Args6),
 %sort(Args6,Args7),
 
 findall(Args00,(member([Args00,_],In),not(var(Args00))),Args02),append(Args02,L,Args01),
 %trace,
 member(Last_arg,Args01).
 
 /*
(member([_P1,Args],Rules1)->true;Args=[]),%append([Args00],Args,Args01),
 member(Last_arg,Args),
 %member([Args20,_],In),
 (member([_P2,Args2],Rules1)->true;Args2=[]),%append([Args20],Args2,Args02),
 not(member(Last_arg,Args2))
 */
 
 /*
each_combo_last_args(0,_,_) :- !.
each_combo_last_args(N,Last_arg0,Last_arg2) :-
 length(Last_arg0,L),
 each_combo_last_args1(L,Last_arg0,[],Last_arg3),
 member(Last_arg2,Last_arg3),
 N1 is N-1,
 each_combo_last_args(N1,Last_arg0,Last_arg2).
*/
each_combo_last_args1(0,_,Last_arg,Last_arg) :- !.
each_combo_last_args1(L,Last_arg0,Last_arg1,Last_arg2) :-
 member(Last_arg3,Last_arg0),
 %delete(Last_arg0,Last_arg3,Last_arg5),
 append(Last_arg1,[Last_arg3],Last_arg4),
 L2 is L-1,
 each_combo_last_args1(L2,Last_arg0,Last_arg4,Last_arg2).
 

no_singletons(Vars1,Program,Out,Rules2):-
	((findall([C,DA],(member(C,Program),C=[_E,D],member(DA,D)),Vars2),
	%%append_list(Vars2,Vars2A),
	findall(A,member([_,A],Vars2),Vars21),
	append(Vars1,Vars21,Vars3),
	%subtract(Vars31,Out,Vars3),
	findall(Item,(member(Item,Vars3),(member(Item,Out)->true;(aggregate_all(count,(member(Item,Vars3)),Count1),
	not(Count1=1)))),Rules21),sort(Rules21,Rules22),
	%member(B1,Rules22),
	findall(B,(member([B,_B1],Vars2),%trace,
	B=[_,A],forall((member(A,B),member(A1,A)),member(A1,Rules22))),Rules23),remove_dups(Rules23,Rules2)%,G=[])->true;(writeln(no_singletons(Vars1,Program)),fail)).
	)).
