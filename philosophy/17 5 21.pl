% 17 5 21

% First, I thought the professor’s image of the vocal folds was weird (interesting) because it wasn’t (was) real. 

%text([[delivery,written]]).
%text([[delivery,spoken]]).
%text([[delivery,thought]]).

writing :- speech.
speech :- thought.
thought.

puzzle(Solution) :-
	subtract([[w,s],[s,t],[t]],Solution,[]).

% Second, I liked realism, ironism, to do with text-to-speech.

sentence(
[["i","tied","the","bow"],
["person","right","down","bow"]]).
sentence(
[["i","will","bow","to","the","audience"],
["person","right","down","right","down","person"]]).

% Third, I didn’t like text-to-speech because I didn’t think robotics was real enough.

% ?- algebra([1*x,+,3*x],A).
% A = [4*x].

algebra([A*X,+,B*X],[C*X]) :-
	C is A+B.

% ?- algebra([2*(a+c)],A).
% A = [2*a+2*c] ;

% ?- algebra([2*(a+(-1*c))],A).
% A = [2*a+2*(-1*c)] ;

algebra([A*(B+C)],[A*B+A*C]).
algebra([(B+C)*A],[A*B+A*C]).

% ?- algebra([(2+(-1))*(a+b)],A).
% A = [2*a+2*b+ -1*a+ -1*b].

algebra([(A+B)*(C+D)],[A*C+A*D+B*C+B*D]).

% DION: The subject shouldn't endorse positive-enough objects

/**
?- combination(2,[],A).
A = [1, 1] ;
A = [1, 0] ;
A = [0, 1] ;
A = [0, 0].
**/

combination(0,C,C) :- !.
combination(N1,C1,C2) :-
	switch(S),
	append(C1,[S],C3),
	N2 is N1-1,
	combination(N2,C3,C2).

switch(1).
switch(0).
