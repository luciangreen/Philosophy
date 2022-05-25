% ["Short Arguments","God Algorithm.txt",0,algorithms,"5. I prepared to ask why why was.  I did this by stating that I knew the result of the God algorithm was why.  First, I noticed the occurrence of the event.  Second, I read the result of the God algorithm.  Third, I worked out that the result explained the occurrence."]

% * Third, I worked out that the result explained the occurrence.

:-include('../listprologinterpreter/listprolog.pl').

% as [A,B] is to [[B],A], [c,d] is to X


% data_to_alg([a,b],[[b],a],[c,d],A2).
% A2=[[d],c]

data_to_alg(Data1,Data2,Alg1,Alg2) :-
 % finds A=a, etc. and [A,B]
 data_to_alg1(Data1,[],_Vars1,[],Alg3),
 data_to_alg1(Data2,[],_Vars3,[],Alg4),

 % finds [[B],A] from A=a etc. and [[b],a]
 %                    [A,B],[c,d]
 interpretpart(match4,Alg3,Alg1,[],Vars2,_),
 %                    [[B],A]
 interpretpart(match4,Alg4,[v,sys1],Vars2,Vars4,_),
 
 % finds [[d],c] from [A,B], [[B],A] and [c,d]
 getvalue([v,sys1],Alg2,Vars4).


data_to_alg1([],Vars,Vars,Alg,Alg) :- !.
data_to_alg1(Data1,Vars1,Vars2,Alg1,Alg2) :-
 Data1=[Data2|Data3],
 (is_list(Data2)->%List=true;List=false),
 (data_to_alg1(Data2,Vars1,Vars3,[],Alg4),
 Alg5=Alg4,append(Alg1,[Alg5],Alg3));
 (append(Vars1,[[[v,Data2],Data2]],Vars3),
 append(Alg1,[[v,Data2]],Alg3))),
 data_to_alg1(Data3,Vars3,Vars2,Alg3,Alg2),!.
 
% if data2 is list, wrap its alg in []
