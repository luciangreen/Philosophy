% 10 2 23.pl

% Need 11 more algs

% ["Computational English","COMPUTATIONAL ENGLISH by Lucian Green Perspectives 1 of 4.txt",0,algorithms,"6.    I prepared to verify the definition of the word.  I did this by writing the third technique algorithm in meaning.  First, I entered the query.  Second, I followed the algorithm find the relevant definition of the query.  Third, I read the returned definition.  In this way, I prepared to verify the definition of the word by writing the third technique algorithm in meaning."]

:-include('../listprologinterpreter/listprolog.pl').
%:-include('../listprologinterpreter/la_maths.pl').

ruler1(A) :- length(A).
ruler2(A) :- string_length(A).
fan(T1,T2) :- T2 is T1-5.
pen(A,A) :- writeln(A).
bag(A,A) :- findall(_,(member(B,A),writeln(B)),_).

feed(dog,A,B) :- B=stomach(A).
walk(dog,X1,Y1,X2,Y2,V) :- X3 is X2-X1, Y3 is Y2-Y1, V = i*X3+j*Y3.
magnitude(X1,Y1,X2,Y2,M) :- M is sqrt((X2-X1)^2+(Y2-Y1)^2).

phone([X1,Y1,M],[X2,Y2,M]):-writeln([[X1,Y1,M],[X2,Y2,M]]).
email([A1,B1,C1,D1,E],[A2,B2,C2,D2,E]):-writeln([[A1,B1,C1,D1,E],[A2,B2,C2,D2,E]]).

% printer("a b c de",20,J).
% J = "a     b     c     de".

printer(S,Width,%A,B,CL%
Justified_line
) :-
 string_length(S,L),B is Width div L,A is Width mod L,
 atomic_list_concat(C,' ',S),
 foldr(string_concat,C,CC),
 string_length(CC,CCL),
 length(C,CL),
 append(C1,[C2],C),
 string_length(C2,C2L),
 A1 is (Width-CCL%+C2L
 ) div (CL-1),
 %A2 is (10-L%+C2L
 %) mod (CL-1),
 (B>=1->(numbers(A1,1,[],N),findall(' ',member(_,N),D),foldr(string_concat,D,'',E),
 append(C1,[''],C3),
 atomic_list_concat(C3,E,Justified_line1),

 string_length(Justified_line1,JL),
 A3 is Width-JL-C2L,

 numbers(A3,1,[],N1),findall(' ',member(_,N1),D2),%append(D1,[E],D2),
 foldr(string_concat,D2,'',E1),
 foldr(string_concat,[Justified_line1,E1,C2],Justified_line)
 );
 Justified_line=S),!.
 