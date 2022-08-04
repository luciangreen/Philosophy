% ["Computational English","COMPUTATIONAL ENGLISH by Lucian Green Dereconstruction 2 of 4.txt",0,algorithms,"14.   *I prepared to be equitable.  I did this by liking you because I shared the apple with you.  First, I shared the apple with you.  Second, I observed you like me.  Third, I liked you.  In this way, I prepared to be equitable by liking you because I shared the apple with you."]

% 1. I prepared to be equitable.

% equity(1,A).
equity(B,A) :- A is 2*B.

% 2. I did this by liking you because I shared the apple with you.
 
a_because_b(B,C,E) :-
	B=[ate_with,D],
	append(C,[[like,D]],E).

% 3. First, I shared the apple with you.

% a_because_b(B,[[ate_with,D]],E).

% 4. Second, I observed you like me.  

observations(like).

% 5. Third, I liked you.

% observations_to_reality(like,A).
observations_to_reality(A,A).

% 6. In this way, I prepared to be equitable by liking you because I shared the apple with you.

% equity1(1,How_much_i_like_you).
equity1(How_much_i_ate_with_you,How_much_i_like_you):- How_much_i_like_you is 2*How_much_i_ate_with_you.

% 7. I found the time traveller linking the two people.

% ?- A=[[1,2],[1,3],[1,4]],B=[[3,5],[6,5],[7,5]],member([1,C],A),member([C,5],B).
% A = [[1, 2], [1, 3], [1, 4]],
% B = [[3, 5], [6, 5], [7, 5]],
% C = 3 ;

% 8. I prepared to eat caviar (durum wheat semolina).

steps(black_currant_juice,[durum_wheat_semolina]).

% 9. I did this by writing vegan arguments.

member(_Vegetarian_meal_day,[m,t,w,th,f,sa,su]).

% 10. First, I wrote about capricorn, or co-operativity (sic).

% ?- A=[0,0,1,1,1],member(B,A),member(C,A),2 is B+C.
% A = [0, 0, 1, 1, 1],
% B = C, C = 1 .

% 11. Second, I wrote about the fact that not all like that.

% ?- A=[-1,-1,1,1,1],not(forall(member(B,A),B=1)).
% A = [-1, -1, 1, 1, 1].

% ?- A=[1,1,1,1,1],not(forall(member(B,A),B=1)).
% false.

% 12. ?- writeln("What is the breasoning?"),read_string(user_input,"\n","\r",_,S),A=[1,2,3],findall(B,member(B,A),C).
% What is the breasoning?
% |: a
% S = "a",
% A = C, C = [1, 2, 3].

% 13. Line 10 returns whether the first line has one long (two or more) h's (one long handle) or two h's (two short handles).

% ?- A=[h,h],(A=[h,h]->true;A=[hh]).
% A = [h, h].

% ?- A=[hh],(A=[h,h]->true;A=[hh]).
% A = [hh].

% 14. I swapped the values. 

swap(A,B,B,A).

% 15. B=<A

a(B,A):-B=<A.
