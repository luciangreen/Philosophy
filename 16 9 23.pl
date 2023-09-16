% 16 9 23

% 35-7=28 algs

% ["Fundamentals of Pedagogy and Pedagogy Indicators","FUNDAMENTALS OF PEDAGOGY by Lucian Green Two Uses 19 of 30.txt",0,algorithms,"186.	ALEXIS: The subject should include 50 As in each book."]

book1(book1,50).
book1(book2,60).
book1(book3,25).
book1(book4,0).
book1(book5,50).

% ?- all_fifty(D).
% D = [[book1, 50], [book2, 60], [book5, 50]].

all_fifty(Data):-findall([Name,Number],(book1(Name,Number),Number >=50),Data).

/*
?- pretty_print_table([[1,2,3],[4,5,6],[7,8,9]]).
1	2	3	
4	5	6	
7	8	9	
*/
pretty_print_table(Data) :-
findall(_,(member(Item,Data),
findall(_,(member(Item1,Item),write(Item1),write("\t")),_),
writeln("")),_).

% pretty_print_nd([[[1,2],[3,4]],[[1,2],[3,4]]]).
/*
1	2	
3	4	

1	2	
3	4	
 pretty_print_nd([[[[1,2],[3,4]],[[1,2],[3,4]]],[[[1,2],[3,4]],[[1,2],[3,4]]]]).
1	2	
3	4	

1	2	
3	4	

1	2	
3	4	

1	2	
3	4	

pretty_print_nd([[[[[1,2],[3,4]],[[1,2],[3,4]]],[[[1,2],[3,4]],[[1,2],[3,4]]]],[[[[1,2],[3,4]],[[1,2],[3,4]]],[[[1,2],[3,4]],[[1,2],[3,4]]]]]).

1	2	
3	4	

1	2	
3	4	

1	2	
3	4	

1	2	
3	4	

1	2	
3	4	

1	2	
3	4	

1	2	
3	4	

1	2	
3	4	

*/
pretty_print_nd(Data):-
findall(_,(member(Item,Data),
((is_list(Item),Item=[Item1|_],is_list(Item1),Item1=[Item2|_],
not(is_list(Item2)))->
(pretty_print_table(Item),nl);
pretty_print_nd(Item)
)
),_).
/*
?- pretty_print_all_fifty.
book1	50	
book2	60	
book5	50	
*/
pretty_print_all_fifty :-
all_fifty(Data),
pretty_print_table(Data).

% 28-14=14

% ["Delegate workloads, Lecturer, Recordings","Delegate Workloads 1.txt",0,algorithms,"	32.	I compared notes."]

:-include('../listprologinterpreter/la_maths.pl').

/*
find_complexity(n,C).
C = n.

find_complexity(sqrn, C).
C=sqrn.
*/
n(N,N1) :- n(N,[],N1).
n([],N,N) :- !.
n(N,N1,N2) :- N=[N31|N32],
append(N1,[N31],N4),
%N4 is N1+1,
n(N32,N4,N2).

sqrn(Ns,N1) :- %numbers(N,1,[],Ns),
findall([N2,N3],(member(N2,Ns),member(N3,Ns)),N1).
 
 find_complexity(Name,Complexity) :-
 N0=10,
 numbers(N0,1,[],N01),
 (Name=n->n(N01,N1);
 Name=sqrn->sqrn(N01,N1)),
 N2 is N0^2,
 numbers(N2,1,[],Ns2),
 (close1(N01,N1)->Complexity=n;
 close1(N1,Ns2)->Complexity=sqrn).
close1(N0,N1) :-
 length(N0,L0),
 length(N1,L1),
 L11 is L1-1,
 L12 is L1+1,
 L11<L0,L0=<L12.

%14-8=6 left

% complexity_from_findall([],C).
% C = n^0.

% complexity_from_findall([[m,a,b]],C).
% C = n^1.

% complexity_from_findall([[m,a,b],[m,c,b]],C).
% C = n^2.

% complexity_from_findall([[m,a,b],[m,c,b],[m,d,b]],C).
% C = n^3.

% complexity_from_findall([[m,a,b],[m,c,b],[m,d,b],[m,e,b]],C).
% C = n^4.

complexity_from_findall(L,n^C) :-
 length(L,C).