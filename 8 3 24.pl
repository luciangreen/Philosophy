% 8 3 24.pl

% Computational English: COMPUTATIONAL ENGLISH by Lucian Green Computational English Argument 1 of 4.txt",0,algorithms,"1a.    I prepared to program the robot to deliver the speech.  I did this by writing the text-to-speech algorithm.  First, I wrote down the text.  Second, I recorded the speech for this text.  Third, I converted the text into the speech using a grammar.  In this way, I prepared to program the robot to deliver the speech by writing the text-to-speech algorithm.

% write a speech
% convert a sentence to a spec


% sent2spec([sort,[2,3,1],giving,[1,2,3]],I,O).
% I=[[2,3,1],[v,a]],O=[[[v,a],[1,2,3]]].

sent2spec(Sent,I,O) :-
 Sent=[_,IL,giving,OL],I=[IL,[v,a]],O=[[[v,a],OL]].


% sent2spec([check,2,is,a,number],I,O).
% I=[2],O=[true].

sent2spec(Sent,I,O) :-
 Sent=[check,N,is,_,_T],I=[N],O=[true].


% sent2spec([check,3,is,greater,than,2],I,O).
% I=[3,2],O=[true].

sent2spec(Sent,I,O) :-
 Sent=[check,N1,is,greater,than,N2],I=[N1,N2],O=[true].


% sent2spec([false,is,not,true],I,O).
% I=[false,true],O=[true].

sent2spec(Sent,I,O) :-
 Sent=[A,is,not,B],I=[A,B],O=[true].
 

% convert a sentence to an algorithm


% sent2alg([sort,[2,3,1],giving,[1,2,3]],I,O).
% I=[[sort,[2,3,1]],[v,a]],O=[[[v,a],[1,2,3]]].

sent2alg(Sent,I,O) :-
 Sent=[sort,IL,giving,OL],I=[[sort,IL],[v,a]],O=[[[v,a],OL]].


% sent2alg([check,2,is,a,number],I,O).
% I=[[number,2]],O=[true].

sent2alg(Sent,I,O) :-
 Sent=[check,N,is,_,number],I=[[number,N]],O=[true].


% sent2alg([check,3,is,greater,than,2],I,O).
% I=[[3,>,2]],O=[true].

sent2alg(Sent,I,O) :-
 Sent=[check,N1,is,greater,than,N2],I=[[N1,>,N2]],O=[true].


% sent2alg([false,is,not,true],I,O).
% I=[[false,not_equals,true]],O=[true].

sent2alg(Sent,I,O) :-
 Sent=[A,is,not,B],I=[[A,not_equals,B]],O=[true].
 

% I wrote the text.
% I found the algorithm from the trace.

sort3(A,B) :- sort4(A,[],B).
sort4([],A,A) :- !.
sort4([A|B],G,F) :-
 sort5(A,G,D),
 sort4(B,D,F).
sort5(A,[],[A]) :- !.
sort5(A,[B|C],D) :-
 (A>B->(sort5(A,C,E),D=[B|E]);
 D=[A,B|C]).

:-include('decision_tree.pl').
:-include('../listprologinterpreter/listprolog.pl').

%s([[1,2,3],[1,2,4]]).
s([[1,2,3,4,5],[1,2,6]]).
% [[1,2,[[2,2,[[3,1,[[4,1,[[5,1,[]]]]]],[6,1,[]]]]]]]
% T = [[1, 2], [2, 3], [2, 6], [3, 4], [4, 5]].

s1(A) :-
 s(S),decision_tree(S,T),
 deps(T,A).
deps([[_,_,[]]],[]) :-!.
deps([[N1,_,[[N2,_,T]]]],[[N1,N2]|A1]) :-
 deps([[N2,_,T]],A), (A=[[[_,_]|_]|_]->foldr(append,A,A1);A=A1).%,(forall(member([_,_],A))->).
deps([[N1,_,[[N2,_,T1],[N3,_,T2]]]],[[[N1,N2],[N1,N3]|A1]|A2]) :-
 deps([[N2,_,T1]],A1),
 deps([[N3,_,T2]],A2).
 
% 27 algs so far

% s11([[1], [2, 3, 4, 5], [2, 6]]).

s11(A) :-
 s1(A1), s12(A1,A2),findall(A3,(member(A4,A2),sort(A4,A3)),A).
s12([],[]).
s12([[A1,A2]|A],A5) :- ((member([A2,_],A),(findall([A2,A21],member([A2,A21],A),AAA),length(AAA,L),L>=2)->(findall(A6,(member([A2,A21],AAA),delete(A,[A2,_],AA),s12([[A2,A21]|AA],A6)),A7)->append([[A1]],A7,A5))%
;((not(member([A2,_],A))->A5=[A1,A2];(%member([A2,A4],A),
s12(A%[A2,A4]
,A6),append([A1,A2],A6,A5)))))).

% 31
