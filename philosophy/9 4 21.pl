% 9 4 21

% ["Fundamentals of Pedagogy and Pedagogy Indicators","FUNDAMENTALS OF PEDAGOGY by Lucian Green X Dimension 1 of 4.txt",0,algorithms,"4.   I prepared to write a journal article.  I did this by repeating writing 15 As per Honours assignment chapter after doing it once in my first attempt in the professor's class.  First, I wrote the first set of 15 As.  Second, I wrote the second set of 15 As.  Third, I repeated this for each chapter of each assignment.  In this way, I prepared to write a journal article by repeating writing 15 As per Honours assignment chapter after doing it once in my first attempt in the professor's class."]

% 1. Completing the square

% ax2 + bx + c = 0	a(x+d)2 + e = 0
complete_square(A,B,C,D,E) :-
%	D is B/(2*A),
%	E is C - (B^2)/(4*A).
	D is B/(2*A),
	E is C-(B^2)/(4*A).
	
% https://www.mathsisfun.com/algebra/completing-square.html

% ["Short Arguments","Green_Sutra.txt",0,algorithms,"6. I prepared to stating that it is alright for each person to meditate if they want to.  I did this by thinking of all.  First, I remembered a category of people.  Second, I wrote their names down.  Third, I thought of them."]

% 2. think_of_all([1,2,3,4,5],[1,2,3,5,4]).

think_of_all(A,B) :-
	forall(member(C,A),member(C,B)).

% 3. playwright

% playwright([night,eventide,sea,island],[walking,trancing,tight-rope-walking,cartwheeling],[quadratic-formula-finder,logic-validity-finder,algebra_finder]).

playwright(A,B,C,D,E,F) :-
	random_member(D,A),
	random_member(E,B),
	random_member(F,C).
	
% 4.

% algebra_finder1(4*x+3,y,x,A).
% A =  (y-3)/4.

algebra_finder1(A,B,C,D) :-
	algebra_finder(A,B,C,D),!.
algebra_finder1(A,B,C,D) :-
	algebra_finder(A,B,E,F),
	algebra_finder1(E,F,C,D).

algebra_finder(A+B,C,B,C-A).
algebra_finder(A+B,C,A,C-B).
algebra_finder(A-B,C,B,A-C).
algebra_finder(A-B,C,A,C+B).
algebra_finder(A*B,C,B,C/A).
algebra_finder(A*B,C,A,C/B).
algebra_finder(A/B,C,B,A/C).
algebra_finder(A/B,C,A,C*B). 

% 5.log_finder2(log(3,(y^(1/3))/(2^3)),(1/3)*log(3,y)-3*log(3,2)).
% 6. log_finder2(log(10,(x^5)),5*log(10,x)).
% 7. log_finder2(2*log(e,2)+3*log(e,n),log(e, 4*n^3)).
% 8. log_finder1(log(3,27^(1/4)),x,B,A).
% 9. log_finder14(log(2,x)+log(2,y),1,y,A).
log_finder1(A,B,C,D) :-
	log_finder3(A,D,_,_).
log_finder1(A,B,C,D) :-
	log_finder(A,B,C,D),!.
log_finder1(A,B,C,D) :-
	log_finder(A,B,E,F),
	log_finder1(E,F,C,D).
log_finder14(A,B,C,D) :- % (log(2,X)+log(2,Y),1,x,A). 
	log_finder(_,_,A,E), % (_,_,log(2,X)+log(2,Y),log(2,X*Y))
	log_finder(E,B,F,H),
	log_finder3(F,G,_,_),
	algebra_finder1(H,G,C,D).
log_finder(log(B,A),X,B^X,A).

% log_finder(
%log_finder2(A,B,C,D) :-
%	log_finder(A,B,C,D),!.
%log_finder2(D,J) :-
%	log_finder3(_,_,J,D).
	%log_finder(_,_,K,J).
log_finder2(D,J) :-
	log_finder(_,_,D,K),
	log_finder3(_,_,J,K),!.
log_finder2(D,J) :-
	log_finder(_,_,D,J).
log_finder2(D,J) :-
	log_finder(_,_,J,D).
%log_finder2(D,J) :-
%	log_finder3(_,_,J,K),
%	log_finder(_,_,D,J).
log_finder2(D,J-K) :-
	log_finder(_,_,G-H,D),
	log_finder(_,_,J,G),
	log_finder(_,_,K,H).
log_finder2(D+E,H) :-
	log_finder2(D,F),
	log_finder2(E,G),
	log_finder2(F+G,H).
log_finder2(D,J) :-
	log_finder(_,_,G+H,D),
	log_finder(_,_,J,G+H).

log_finder(B^M*B^N,B^(M+N),log(B,M)+log(B,N),log(B,M*N)).
log_finder(B^M/B^N,B^(M-N),log(B,X)-log(B,Y),log(B,(X/Y))).
log_finder((B^M)^N,B^(M*N),N*log(B,X),log(B,X^N)).
log_finder(B^1,B,1,log(B,B)).
log_find6er(B^0,1,0,log(B,1)).
log_finder(log(B,A),X,B^X,A).
log_finder3(_,_,log(B,C),log(B,X^N)) :-
	number(X),number(N),C is X^N.
log_finder3((A^B)^C,D,_,_) :-
	number(A),number(B),number(C),D is (A^B)^C.
log_finder3(A^C,D,_,_) :-
	number(A),number(C),
	D is A^C.
log_finder3(A^(C/B),D,_,_) :-
	number(A),number(C),number(B),
	D is A^(C/B).
log_finder3(log(B,A),D,_,_) :-
	D is log(A)/log(B).
log_finder3(A^B,C,_,_) :-
	number(A),number(B),C is A^B.

% https://www.intmath.com/exponential-logarithmic-functions/3-logarithm-laws.php

% 10. ["Mind Reading","mr spiritual screen 2.txt",0,algorithms,"34. *I cast the actor by checking his face matched the character's appearance on the spiritual screen."]

actor(a,["fat elf"]).
actor(b,["thin elf"]).

% ["Medicine","MEDICINE by Lucian Green Get in Touch with God about Breasonings Details to see High Quality Imagery and Earn H1 4 of 4.txt",0,algorithms,"40. I prepared to pen laws into existence. I did this by writing the The Anti-Nuclear Bomb song argument. First, I avoided softening it. Second, I rejected L, the famous warring lecturer (supported unity). Third, I hated war (liked peace). In this way, I prepared to pen laws into existence by writing the The Anti-Nuclear Bomb song argument."]

% 11. I prepared to pen laws into existence.

law :- safety.
law :- necessity.

% 12. I did this by writing the The Anti-Nuclear Bomb song argument.

safety :- not(bomb).
bomb :- false.

% 13. First, I avoided softening it.

% agree_at_time([1,2,3,4,5],Agree_at_times).
agree_at_time(Agree_at_times,Agree_at_times).

% 14. Second, I rejected L, the famous warring lecturer (supported unity).

% append1([1,2],[3,4],C).
% C = [1, 2, 3, 4].
append1(A,B,C) :-
	append(A,B,C).

% 15. Third, I hated war (liked peace).

peace :- not(negative),positive.
negative :- fail.
positive.

