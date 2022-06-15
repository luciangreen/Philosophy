% simple_caw.pl

% simple_caw0(reverse,[[[n,head],1,1],[[n,tail],1,1],[[n,wrap],1,1],[[append],2,1],[[n,reverse],2,1]],[[[n,reverse,[[],[v,a],[v,a]]]]],[[[v,a],[1,2,3]],[[v,b],[]]],[[[v,c],[3,2,1]]],[],P).

% simple_caw0(plus,[[[n,+],2,1]],[],[[[v,a],1],[[v,b],1]],[[[v,c],2]],[],P),writeln1(P).

% P = [[[n,plus],[[v,a],[v,b],[v,c]],":-",[[[n,+],[[v,a],[v,a],[v,c]]]]]]

:-include('../listprologinterpreter/listprolog.pl').

simple_caw0(F,Rules,Initial_rules,In,Out,Start_of_predicate,Predicate) :-
 retractall(new_var1(_)),
 assertz(new_var1(0)),
 
 findall(Val,member([_V,Val],In),Val1),
 Out=[[V,_Val2]],
 
 append(Val1,[V],Query1),
 Query=[[n,F],Query1],
 Result=[Out],
 simple_caw(F,Query,Result,Rules,Initial_rules,In,Out,Start_of_predicate,Predicate).
 
 
simple_caw(F,Query,Result,Rules,Initial_rules,In,Out,Rules1,Predicate) :- 

length(Rules1,L),not(L>=6),
%trace,
% Don't repeat a command
member([P,I,_O],Rules),
(Rules1=[]->true;(%trace,
member([P00,_],Rules1),
not(P=P00))),
%trace,

get_last_arg(In,Rules1,Last_arg),

%trace,
Out=[[Var1,_]],
new_var(Var),

(I=2->
(%(member([_P10,Args0],Rules1)->true;(member([Args000,_],In),[Args000]=Args0)),append(_,[Last_arg0],Args0),(member([_P20,Args20],Rules1)->true;member([Args20,_],In)),not(member(Last_arg0,Args20)),
get_last_arg(In,Rules1,Last_arg0),


append(Rules1,[[P,[Last_arg,Last_arg0,Var1]]],Rules2))

;

(%trace,
append(Rules1,[[P,[Last_arg,Var1]]],Rules2)%,notrace
)),


%trace,
 findall(V,member([V,_Val],In),V1),
 Out=[[V2,_Val2]],
 
 %append(Val1,[V],Query),
 %Result=[Out],
 %trace,

 	append(V1,[V2],Vars2),
	Program22=[
        [[n,F],Vars2,":-",
                Rules2
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
      
      (((%trace,
      I=2)->
append(Rules1,[[P,[Last_arg,Last_arg0,[v,Var]]]],Rules2)

;

(%trace,
append(Rules1,[[P,[Last_arg,[v,Var]]]],Rules3))),

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
 
 findall(Args00,member([Args00,_],In),Args02),append(Args02,L,Args01),
 %trace,
 member(Last_arg,Args01).
 
 /*
(member([_P1,Args],Rules1)->true;Args=[]),%append([Args00],Args,Args01),
 member(Last_arg,Args),
 %member([Args20,_],In),
 (member([_P2,Args2],Rules1)->true;Args2=[]),%append([Args20],Args2,Args02),
 not(member(Last_arg,Args2))
 */