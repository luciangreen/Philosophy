% [debug]  ?- trace,                                                              data_to_alg5([[[t, list], [[t, atom, 9, b], [[t, brackets], [[t, atom, 10, c]]]]], [t, atom, 8, a]],[[t, atom, 8, a], [[t, list], [[[t, brackets], [[t, atom, 10, c]]], [t, atom, 9, b]]]],[[1,[2,3]],4],A).
% A = [4, [1, [3, 2]]].

% ["Short Arguments","God Algorithm.txt",0,algorithms,"5. I prepared to ask why why was.  I did this by stating that I knew the result of the God algorithm was why.  First, I noticed the occurrence of the event.  Second, I read the result of the God algorithm.  Third, I worked out that the result explained the occurrence."]

% * Third, I worked out that the result explained the occurrence.

%:-include('../listprologinterpreter/listprolog.pl').

% as [A,B] is to [[B],A], [c,d] is to X

% test1(off,1,A).

% data_to_alg5([a,b],[[b],a],[c,d],A2).
% A2=[[d],c]

data_to_alg5(Data1,Data2,Alg1,Alg2) :-
 % finds A=a, etc. and [A,B]
 data_to_alg51(Data1,[],_Vars1,[],Alg3),
 data_to_alg51(Data2,[],_Vars3,[],Alg4),

 % finds [[B],A] from A=a etc. and [[b],a]
 %                    [A,B],[c,d]
 interpretpart(match4,Alg3,Alg1,[],Vars2,_),
 %                    [[B],A]
 interpretpart(match4,Alg4,[v,sys1],Vars2,Vars4,_),
 
 % finds [[d],c] from [A,B], [[B],A] and [c,d]
 getvalue([v,sys1],Alg2,Vars4).


data_to_alg51([],Vars,Vars,Alg,Alg) :- !.
data_to_alg51(Data1,Vars1,Vars2,Alg1,Alg2) :-
 Data1=[Data2|Data3],
 (%false->%
 not(is_item4(Data2))->%List=true;List=false),
 (data_to_alg51(Data2,Vars1,Vars3,[],Alg4),
 Alg5=Alg4,append(Alg1,[Alg5],Alg3));
 (append(Vars1,[[[v,Data2],Data2]],Vars3),
 append(Alg1,[[v,Data2]],Alg3))),
 data_to_alg51(Data3,Vars3,Vars2,Alg3,Alg2),!.
 
% if data2 is list, wrap its alg in []

is_item4("*") :- !.
is_item4([T,_,_,_]) :-
 get_lang_word("t",T).
is_item4([[T,Dbw_brackets],_]) :-
 get_lang_word("t",T),
 get_lang_word("brackets",Dbw_brackets).
%is_item4([[T,Dbw_list],_]) :-
% get_lang_word("t",T),
% get_lang_word("list",Dbw_list).
is_item4([T,Dbw_list]) :-
 get_lang_word("t",T),
 get_lang_word("list",Dbw_list). 
%is_item4([T,Dbw_brackets]) :-
% get_lang_word("t",T),
% get_lang_word("brackets",Dbw_brackets). 

