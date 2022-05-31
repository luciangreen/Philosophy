% ["Creating and Helping Pedagogues","CREATE AND HELP PEDAGOGUES by Lucian Green Pedagogy Helper - Write on Breasoning - Computer Science 4 of 4.txt",0,algorithms,"    61.    I knew about or."]

% data to alg - with recursion

% finds all in format, () or recog subformat

:-include('data_to_alg.pl').

% test1(off,1,A).

% data_to_alg2([[[a,b],[[b],a]],[[a1,b1,c1],[b1,a1,c1]]],[[c,d],[e,f,g]],A2).

% A2=[[[d],c],[f,e,g]]

data_to_alg2(Examples,Data,Out) :-
 findall([Alg3,Alg4],(member([Data1,Data2],Examples),
 data_to_alg3(Data1,Data2,Alg3,Alg4)),Algs),
 findall(Alg2,(member(Data1,Data),member([Alg3,Alg4],Algs),
 data_to_alg4(Alg3,Alg4,Data1,Alg2)),Out).


data_to_alg3(Data1,Data2,Alg3,Alg4) :-
 % finds A=a, etc. and [A,B]
 data_to_alg1(Data1,[],_Vars1,[],Alg3),
 data_to_alg1(Data2,[],_Vars3,[],Alg4).

data_to_alg4(Alg3,Alg4,Alg1,Alg2) :-

 % finds [[B],A] from A=a etc. and [[b],a]
 %                    [A,B],[c,d]
 interpretpart(match4,Alg3,Alg1,[],Vars2,_),
 %                    [[B],A]
 interpretpart(match4,Alg4,[v,sys1],Vars2,Vars4,_),
 
 % finds [[d],c] from [A,B], [[B],A] and [c,d]
 getvalue([v,sys1],Alg2,Vars4).
