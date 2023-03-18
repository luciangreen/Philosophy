% 18 3 23.pl

% 20 algs needed

:-include('../listprologinterpreter/listprolog.pl').

%equispace_instruments([1,2,3,10],A).
%A = [0, 2.5, 5.0, 7.5, 10.0].

equispace_instruments(In,A):-
 length(In,L),
 sort(In,In2),
 append(_,[Max],In2),
 Interval is Max/L.
 add1(L,Interval,0,[],A).

add1(0,_,_C,B,B):-!.
add1(A,D,B,C1,C2):-A1 is A-1,H is B+D,append(C1,[H],C3),
 add1(A1,D,H,C3,C2).
 
% geometric_sequence(4,1,0,[],D).
% D = [1, 3, 7, 15].
geometric_sequence(0,_,_C,B,B):-!.
geometric_sequence(A,D,B,C1,C2):-A1 is A-1,H is B+D,D1 is D*2,append(C1,[H],C3),
 geometric_sequence(A1,D1,H,C3,C2).
 
%master([1,2,3,4,5],5,A).
master(Levels1,Level,Levels2) :-
 length(Levels1,Length),
 numbers(Length,1,[],Ns),
 findall(Level,member(_,Ns),Levels2).
 
brush_teeth(up-down):-!.
brush_teeth(left-right) :- fail.

% analytics_sum_columns([[1,2,3],[4,5,6]],Sums).
% Sums = [6, 15]

analytics_sum_columns(Cols,Sums) :-
 findall(Sums1,(member(Col,Cols),sum(Col,0,Sums1)),Sums).
 
analytics_abandoned_cart_auto_responder :-
 writeln("I see you have started a cart.  If you would like to resume it, here is the link.").

% ?- neuronetwork_values_ready_by_times([[2,1],[3,2],[4,2],[5,4],[6,2],[7,3],[8,7],[9,8]],G),writeln(G).
% [1,[2],[[3,4,6],[[7],[[8],[[9],[[]]]]],[[5],[[]]],[[]]]]

neuronetwork_values_ready_by_times(Values,Times_GAANT) :-
 nng(Values,%_,
 1,[1],Times_GAANT).


/*
nng([[A,B]],%V2,
 _,TG1,TG2) :- append(TG1,[[A,B]],TG2),%V2=[],
 !.
*/
 
nng(Values,%Values3,
 Index,TG1,TG1) :-
 findall(V,member([V,Index],Values),V2),
 delete(Values,[_,Index],[]),
 %append(TG1,[V2],TG2),
 !.
 %findall(V4,(member(V3,V2),nng(Values2,%Values3,
%V3,[],V4)),TG4),
 %append(TG1,[TG4],TG2).
 
nng(Values,%Values3,
 Index,TG1,TG2) :-
 findall(V,member([V,Index],Values),V2),
 delete(Values,[_,Index],Values2),
 append(TG1,[V2],TG3),
 findall(V4,(member(V3,V2),nng(Values2,%Values3,
V3,[],V4)),TG4),
 append(TG3,TG4,TG2).
 
