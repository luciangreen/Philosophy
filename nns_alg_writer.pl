/* nns alg writer

- learns types of commands
- 2+ commands together

non-nn
- connects types
:

append list any a + list any b = list any a:b

any xxx, list xx
"" not []

other modes

x examples x


finds path through maze of commands

*/
:- dynamic var1/1.

:-include('../listprologinterpreter/listprolog.pl').
% *** test1(off,1,A).

% data_to_alg5(a:b,a,c:d,A).

% A=[c]

type(append,[a,b],a:b).
%type(append1,[a,a:b],b).
%type(member,[[a,b]],b).
%type(member,[[a,b]],a).

% induct([c,d],c:d,[],C).
% C = [[append, [c, d], c:d]].

%induct([c:d,e],(c:d):e,[],C).                                       
% C = [[append, [c:d, e],  (c:d):e]].


induct(In,Out,Commands1,Commands2) :-
 %retractall(var1(_)),
 %assertz(var1(0)),
 %type(Command,In1,Out1),
 interpret_induct(Command,In,Out,Alg14),
 append(Commands1,[[Command,Alg14,Out]],Commands2),!.

induct(In,Out,Commands1,Commands2) :-
 %type(Command,In1,Out1),
 interpret_induct(Command,In,Out1,Alg14),
 append(Commands1,[[Command,Alg14,Out1]],Commands3),
 induct(Out1,Out2,Commands3,Commands2),
 
 %data_to_alg41(Out2,[],_,[],O31),
 %data_to_alg41(Out,[],_,[],O11),
 %append(O31,O32,O11),

 %(O32=[]->Commands4=Commands2;
 %induct(O32,Out2,Commands4,Commands2)),
 
 Out=Out2,
 !.

% interpret_induct(Command,[c,d],O).

interpret_induct(Command,In,O,Alg14) :-
 type(Command,In1,O1),
 %length(In1,L),
 %numbers(L,1,[],N),
 % c d, a b ->
 %findall(O2,(member(N1,N),
 %get_item_n(In1,N1,In2),
 %get_item_n(In,N1,In3),
 %member(In2,In1),
 %member(In3,In),
 data_to_alg5(In1,O1,In,O2,Alg14),%),O3),
 flatten(O2,O21),
 list_to_compound(O21,[],O).

get_var(V1) :-
 var1(V),
 retractall(var1(_)),
 V1 is V+1,
 assertz(var1(V1)).
% a:b c a:b:c 
 
%data_to_alg5(In,Alg1,Alg2) :-
 %In=[In2|In3],
 %data_to_alg4(In2,[],_Vars1,[],Alg3),
 
data_to_alg5(Data1,Data2,Alg1,Alg2,Alg17) :-
 % finds A=a, etc. and [A,B]
 data_to_alg4(Data1,[],_Vars1,[],Alg3),
 data_to_alg4(Data2,[],_Vars3,[],Alg4),

 data_to_alg41(Alg1,[],_Vars31,[],Alg11),

 % finds [[B],A] from A=a etc. and [[b],a]
 %                    [A,B],[c,d]
 member(Alg12,Alg11),
 member(Alg13,Alg11),
 %member(Alg15,Alg11),
 Alg14=[Alg12,Alg13],%,Alg15],
 
 %trace,
 list_to_compound(Alg12,[],Alg171),
 list_to_compound(Alg13,[],Alg172),
 Alg17=[Alg171,Alg172],%,Alg15],
 %flatten(Alg14,Alg16)
 
 interpretpart(match4,Alg3,Alg14,[],Vars2,_),
 %                    [[B],A]
 interpretpart(match4,Alg4,[v,sys1],Vars2,Vars4,_),
 
 % finds [[d],c] from [A,B], [[B],A] and [c,d]
 getvalue([v,sys1],Alg2,Vars4).

data_to_alg4([],Vars,Vars,Alg,Alg) :- !.
data_to_alg4(Data1,Vars1,Vars2,Alg1,Alg2) :-
 Data1=[Data2|Data3],
 ((is_list(Data2)->true;compound(Data2))->%List=true;List=false),
 (data_to_alg4(Data2,Vars1,Vars3,[],Alg4),
 Alg5=Alg4,append(Alg1,[Alg5],Alg3));
 (append(Vars1,[[[v,Data2],Data2]],Vars3),
 append(Alg1,[[v,Data2]],Alg3))),
 data_to_alg4(Data3,Vars3,Vars2,Alg3,Alg2),!.
data_to_alg4(Data1,Vars1,Vars3,Alg1,Alg3) :-
 %Data1=[Data2|Data3],
 ((atom(Data1)->%true;compound(Data2))->%List=true;List=false),
 (%data_to_alg4(Data2,Vars1,Vars3,[],Alg4),
 %Alg5=Alg4,append(Alg1,[Alg5],Alg3));
 (append(Vars1,[[[v,Data1],Data1]],Vars3),
 append(Alg1,[[v,Data1]],Alg3))))),!.
 %data_to_alg4(Data3,Vars3,Vars2,Alg3,Alg2),!.
data_to_alg4(Data1,Vars1,Vars2,Alg1,Alg2) :-
 %Data1=[Data2|Data3],
 Data1=..[:, Data2, Data3],
 ((is_list(Data2)->true;compound(Data2))->%List=true;List=false),
 (data_to_alg4(Data2,Vars1,Vars3,[],Alg4),
 Alg5=Alg4,append(Alg1,[Alg5],Alg3));
 (append(Vars1,[[[v,Data2],Data2]],Vars3),
 (Alg1=[]->Alg3=[[v,Data2]];
 Alg3=..[:,Alg1,[v,Data2]])
 %append(Alg1,[[v,Data2]],Alg3)
 )),
 data_to_alg4(Data3,Vars3,Vars2,Alg3,Alg2),!.
 
data_to_alg41([],Vars,Vars,Alg,Alg) :- !.
data_to_alg41(Data1,Vars1,Vars2,Alg1,Alg2) :-
 Data1=[Data2|Data3],
 ((is_list(Data2)->true;compound(Data2))->%List=true;List=false),
 (data_to_alg41(Data2,Vars1,Vars3,[],Alg4),
 Alg5=Alg4,append(Alg1,[Alg5],Alg3));
 (append(Vars1,[[[v,Data2],Data2]],Vars3),
 append(Alg1,[Data2],Alg3))),
 data_to_alg41(Data3,Vars3,Vars2,Alg3,Alg2),!.
data_to_alg41(Data1,Vars1,Vars3,Alg1,Alg3) :-
 %Data1=[Data2|Data3],
 ((atom(Data1)->%true;compound(Data2))->%List=true;List=false),
 (%data_to_alg4(Data2,Vars1,Vars3,[],Alg4),
 %Alg5=Alg4,append(Alg1,[Alg5],Alg3));
 (append(Vars1,[[[v,Data1],Data1]],Vars3),
 append(Alg1,[Data1],Alg3))))),!.
 %data_to_alg4(Data3,Vars3,Vars2,Alg3,Alg2),!.
data_to_alg41(Data1,Vars1,Vars2,Alg1,Alg2) :-
 %Data1=[Data2|Data3],
 Data1=..[:, Data2, Data3],
 ((is_list(Data2)->true;compound(Data2))->%List=true;List=false),
 (data_to_alg41(Data2,Vars1,Vars3,[],Alg4),
 Alg5=Alg4,append(Alg1,[Alg5],Alg3));
 (append(Vars1,[[[v,Data2],Data2]],Vars3),
 %append(Alg1,[Data2],Alg3)
 (Alg1=[]->Alg3=[Data2];
 Alg3=..[:,Alg1,Data2]))),
 data_to_alg41(Data3,Vars3,Vars2,Alg3,Alg2),!.
 
list_to_compound([],Compound,Compound) :- !.
list_to_compound(Data1,Compound1,Compound2) :-
 Data1=Data3,atom(Data3),
 (Compound1=[]->Compound2=Data3;
 Compound2=..[:,Compound1,Data3]),!.
list_to_compound(Data1,Compound1,Compound2) :-
 Data1=[Data2|Data3],
 (Compound1=[]->Compound3=Data2;
 Compound3=..[:,Compound1,Data2]),
 list_to_compound(Data3,Compound3,Compound2),!.
/*
list_to_compound(Data1,Compound1,Compound2) :-
 Data1=[Data2|Data3],
 (Compound1=[]->Compound3=Data2;
 Compound3=..[:,Compound1,Data2]),
 list_to_compound(Data3,Compound3,Compound2),!.
*/