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

% 5. 

% log_finder2(log(3,(Y^(1/3))/(2^3)),(1/3)*log(3,Y)-3*log(3,2)).
log_finder1(A,B,C,D) :-
	log_finder(A,B,C,D),!.
log_finder1(A,B,C,D) :-
	log_finder(A,B,E,F),
	log_finder1(E,F,C,D).

% log_finder(
%log_finder2(A,B,C,D) :-
%	log_finder(A,B,C,D),!.
log_finder2(D,J-K) :-
	log_finder(_,_,G-H,D),
	log_finder(_,_,J,G),
	log_finder(_,_,K,H).

log_finder(B^M*B^N,B^(M+N),log(B,M)+log(B,N),log(B,M*N)).
log_finder(B^M/B^N,B^(M-N),log(B,X)-log(B,Y),log(B,(X/Y))).
log_finder((B^M)^N,B^(M*N),N*log(B,X),log(B,X^N)).
log_finder(B^1,B,1,log(B,B)).
log_finer(B^0,1,0,log(B,1)).

% https://www.intmath.com/exponential-logarithmic-functions/3-logarithm-laws.php