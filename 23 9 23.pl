% 23 9 23

% 35-26=9 algs left v

% 24 9 23

% 35-24=11

% luciancicd/find deps 2

% ["Medicine","MEDICINE by Lucian Green Pedagogy Course Plan 3 of 4.txt",0,algorithms,"23. I prepared to use my knowledge from my Pedagogy course plan to perform will in subjects that were part of my current course plan.  I did this by writing the First Class Degrees song argument.  First, I noticed the first class degree holders standing in line.  Second, I introduced myself to each of them in turn.  Third, I maintained my sanity.  In this way, I prepared to use my knowledge from my Pedagogy course plan to perform will in subjects that were part of my current course plan by writing the First Class Degrees song argument."]

:-include('../listprologinterpreter/la_maths.pl').

%sum_marks([50,60,70,80],A).
%A = 260.
sum_marks(A,B) :-
 sum(A,B).
%average_marks([50,60,70,80],A).
%A = 65.
average_marks(A,B) :-
 sum(A,C),
 length(A,D),
 B is C/D.

%high_distinction([[a,50],[b,60],[c,70],[d,80]],A).
%A = [d].
high_distinction(A,B) :-
 findall(C,(member([C,D],A),D>=80),B).
%h2a([[a,50],[b,60],[c,70],[d,80]],A).
%A = [].
h2a(A,B) :-
 findall(C,(member([C,D],A),D>=75,D<80),B).
%h2b([[a,50],[b,60],[c,70],[d,80]],A).
%A = [c].
h2b(A,B) :-
 findall(C,(member([C,D],A),D>=70,D<75),B).
%h3([[a,50],[b,60],[c,70],[d,80]],A).
%A = [].
h3(A,B) :-
 findall(C,(member([C,D],A),D>=65,D<70),B).
%p([[a,50],[b,60],[c,70],[d,80]],A).
%A = [a,b].
p(A,B) :-
 findall(C,(member([C,D],A),D>=50,D<65),B).
%n([[a,50],[b,60],[c,70],[d,80]],A).
%A = [].
n(A,B) :-
 findall(C,(member([C,D],A),D<50),B). 

%all_marks([[a,50],[b,60],[c,70],[d,80]],A).
/*
[high_distinction,[d]]
[h2a,[]]
[h2b,[c]]
[h3,[]]
[p,[a,b]]
[n,[]]
A = [d].
*/
all_marks(A,B) :-
 high_distinction(A,B),writeln([high_distinction,B]),
 h2a(A,C),writeln([h2a,C]),
 h2b(A,D),writeln([h2b,D]),
 h3(A,E),writeln([h3,E]),
 p(A,F),writeln([p,F]),
 n(A,G),writeln([n,G]).
