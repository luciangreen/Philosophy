% 23 6 23.pl

% 42 done, need 80 in total

% ["Medicine","MEDICINE by Lucian Green Perpetual University Short Courses 4 of 4.txt",0,algorithms,"34. I prepared to be on about things.  I did this by stating that the sales were found out from a number one.  First, I stated that it was based on the product.  Second, I stated that it was the same for the image.  Third, I stated that the image meant, at least that the 50 breasonings were for high quality of life reasons.  In this way, I prepared to be on about things by stating that the sales were found out from a number one."]

% Perpetual University Short Courses 4 of 4.txt

:- dynamic n1/1.

/*
?- perpetual_motion(2,N).
N = 2358081.

?- perpetual_motion(1,N).
N = 1164123.

?- perpetual_motion(0.00001,N).
false.

?- perpetual_motion(0.01,N).
N = 3967.
*/

perpetual_motion(N,N1) :-
 retractall(n1(_)),
 assertz(n1(0)),

catch(call_with_time_limit(N,(%N2 is N1+1,
loop)),_,true),
 n1(N1).

loop :-
 n1(N),
 retractall(n1(_)),
 N1 is N+1,
 assertz(n1(N1)),
 loop.

:-include('../listprologinterpreter/listprolog.pl').

% I prepared to be on about things.

% education_research(1,[],D).

/*
?- education_research(1,[],D),writeln(D).
D = [[[[1-1-2]], [[1-1-2]], [[1-1-2]]]].

?- education_research(1,[],D),writeln(D).
D = [[[[1-1-2], [2, 71, 46], [2, 26, 51]]]].

?- education_research(1,[],D),writeln(D).
D = [[[[1-1-2], [2, 51, 59], [2, 2, 23]], [[1-1-2], [2, 87, 52]]]].

*/

education_research(0,D,D) :- !.
education_research(L,D1,D2) :-
 random1(10,X1),
 numbers(X1,1,[],Xs),
 findall(D3,(member(_,Xs),idea(D3)),D5),
 append(D1,[D5],D4),
 L1 is L-1, 
 education_research(L1,D4,D2).

random1(N,X1) :-
 random(X),X1 is ceiling(X*N).

idea(D) :-
 idea1([[1-1-2]],D).

idea1(D1,D3) :-
 random1(10,N),
 (N=1->D1=D3;fail),!.
idea1(D1,D3) :-
 random_member([_-_-E],D1),
 random1(100,X1),
 random1(100,X2),
 append(D1,[[E,X1,X2]],D4),
 idea1(D4,D3),!.

% I did this by stating that the sales were found out from a number one.

/*

?- product_name(N).
N = "KNYTUJM".

?- product_name(N).
N = "RCVFPOXKYU".

?- product_name(N).
N = "VLBJYNNY".

?- product_name(N).
N = "ERPV".

?- product_name(N).
N = "OBWUG".

?- product_name(N).
N = "P".

?- product_name(N).
N = "ZMV".

?- product_name(N).
N = "HSYOAP".
*/

product_name(N) :-
 random1(10,L),
 numbers(L,1,[],Ls),
 findall(N1,(member(_,Ls),random1(26,N2),N3 is N2+64,string_codes(N1,[N3])),N4),
 foldr(string_concat,N4,N).

% 29, 9 left

% First, I stated that it was based on the product.

% 3 left after shell_c

% 72 from p2lp