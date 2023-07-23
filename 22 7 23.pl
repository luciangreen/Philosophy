% 22 7 23.pl

% ["Fundamentals of Pedagogy and Pedagogy Indicators","FUNDAMENTALS OF PEDAGOGY by Lucian Green Two Uses 30 of 30.txt",0,algorithms,"292.	DION: Two uses is correct because of the empiricism of nature, which is correct because the subject should rely on records."]

:-include('../listprologinterpreter/la_maths.pl').

% empirical([1,+,1,=,2]).

empirical([1,+,1,=,2]) :- string_length("*",A), string_length("*",B), string_length("**",C),C is A+B,!.

% empirical([A,+,B,=,C]).
% A = B, B = 1,
% C = 2 ;
% A = B, B = C, C = 0 

% empirical([2,+,7,=,C]).
% C = 9 ;

% empirical([A,+,B,=,4]).
% A = 0,
% B = 4 ;

empirical([A,+,B,=,C]) :- length(AL,A),length(BL,B),length(CL,C),length(AL,A1),length(BL,B1),length(CL,C1),C1 is A1+B1,!.

% empirical([A,*,B,=,C]).
% A = C, C = 0 

% empirical([2,*,3,=,6]).

% empirical([2,*,5,=,C]).
% C = 10.

empirical([A,*,B,=,C]) :- length(AL,A), findall(BL,(member(_,AL),length(BL,B)),BLs),
findall(B,(member(BL,BLs),length(BL,B)),Bs),
sum(Bs,0,C),!.

% ["Lecturer","Lecturer Rhetoric 2.txt",0,algorithms,"6. Writing is rhetorical.  Rhetoric was in itself.  As A is to B, C is to D, where A, B, C and D are each as Ax is to Bx, Cx is to Dx.  Ax, Bx, Cx and Dx are each as Ay is to By, Cy is to Dy.  This continued until ground.  I computer- and human-verified the conclusion.  As I ran the program, I verified it.  I read the input and output.  I verified them.  I verified that the program produced the correct output."]

% Writing is rhetorical.

rhetoric([as,A,is,to,B,C,is,to,D],A,B,C,D).

% A/B = C/D

% rhetoric1([as,2,is,to,5,4,is,to,10]).

% rhetoric1([as,2,is,to,4,5,is,to,D]).
% D = 10

% rhetoric1([as,A,is,to,4,5,is,to,10]).
% A = 2

% rhetoric1([as,2,is,to,B,5,is,to,10]).
% B = 4.

% rhetoric1([as,2,is,to,5,C,is,to,10]).
% C = 4

rhetoric1([as,A,is,to,B,C,is,to,D]) :- not(var(A)),not(var(B)),not(var(C)),not(var(D)),E is A/B, E is C/D,!.
rhetoric1([as,A,is,to,B,C,is,to,D]) :- var(A),not(var(B)),not(var(C)),not(var(D)),A is (C*B)/D,!.
rhetoric1([as,A,is,to,B,C,is,to,D]) :- not(var(A)),var(B),not(var(C)),not(var(D)),B is (A*D)/C,!.
rhetoric1([as,A,is,to,B,C,is,to,D]) :- 
rhetoric1([as,C,is,to,D,A,is,to,B]),!.

% Rhetoric was in itself.

% In a,[1,2], b,[1,2], c,[2], c/a=c/b

% rhetoric2([[a,[1,2]],[b,[1,2]],[c,[2]]],c,a,c,b).

% rhetoric2([[a,[1,2]],[b,[1,2]],[c,[2]]],c,a,c,D).
% D = a ;
% D = b ;

% rhetoric2([[a,[1,2]],[b,[1,2]],[c,[2]]],A,a,c,b).
% A = c ;

% rhetoric2([[a,[1,2]],[b,[1,2]],[c,[2]]],c,B,c,b).
% B = a ;
% B = b ;

% rhetoric2([[a,[1,2]],[b,[1,2]],[c,[2]]],c,a,C,b).
% C = c ;

rhetoric2a(Sets,A,B,C,D) :-
	not(var(A)),not(var(B)),not(var(C)),not(var(D)),
	member([A,SA],Sets),member([C,SC],Sets),SA=SC,
	member([B,SB],Sets),member([D,SD],Sets),SB=SD,
	subtract(SA,SB,[]).
rhetoric2a(Sets,A,B,C,D) :-
	var(A),not(var(B)),not(var(C)),not(var(D)),
	member([C,SC],Sets),SA=SC,member([A,SA],Sets),
	member([B,SB],Sets),member([D,SD],Sets),SB=SD,
	subtract(SA,SB,[]).
rhetoric2a(Sets,A,B,C,D) :-
	not(var(A)),var(B),not(var(C)),not(var(D)),
	member([A,SA],Sets),member([C,SC],Sets),SA=SC,
	member([D,SD],Sets),SB=SD,member([B,SB],Sets),
	subtract(SA,SB,[]).
rhetoric2(Sets,A,B,C,D) :-
	rhetoric2a(Sets,A,B,C,D).
rhetoric2(Sets,A,B,C,D) :-
	rhetoric2a(Sets,C,D,A,B).

% As A is to B, C is to D, where A, B, C and D are each as Ax is to Bx, Cx is to Dx.  Ax, Bx, Cx and Dx are each as Ay is to By, Cy is to Dy.  This continued until ground.

% In [true,true,true,true], true=true ^ true=true

% rhetoric3([true,true,true,true]).
% true ;
% true ;

% rhetoric3([true,false,true,false]).
% false ;

% rhetoric3([true,true,false,false]).
% true ;
% true ;

r30(_,_,_,_) :-
rhetoric3([[[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]]],

[[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]]],

[[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]]],

[[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]]]]).

% true

r31(A,_,_,_) :-
rhetoric3([A,

[[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]]],

[[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]]],

[[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]]]]).

r32(_,B,_,_) :-
rhetoric3([[[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]]],

B,

[[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]]],

[[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]]]]).

r33(_,_,C,_) :-
rhetoric3([[[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]]],

[[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]]],

C,

[[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]]]]).

r34(_,_,_,D) :-
rhetoric3([[[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]]],

[[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]]],

[[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],
[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]]],

D]).

/*
?- r31(A,_,_,_).
A = true ;
false.

?- r32(_,B,_,_).
B = true ;
false.

?- r33(_,_,C,_).
C = true ;
false.

?- r34(_,_,_,D).
D = true.

*/

rhetoric3a([A,B,C,D]) :-
	not(var(A)),not(var(B)),not(var(C)),not(var(D)),
	(rhetoric3(A)->TA=true;TA=false),
	(rhetoric3(B)->TB=true;TB=false),
	(rhetoric3(C)->TC=true;TC=false),
	(rhetoric3(D)->TD=true;TD=false),
	((TA=TB,TC=TD)->true;false).
rhetoric3a([A,B,C,D]) :-
	var(A),not(var(B)),not(var(C)),not(var(D)),
	(rhetoric3(B)->TB=true;TB=false),
	(rhetoric3(C)->TC=true;TC=false),
	(rhetoric3(D)->TD=true;TD=false),
	((A=TB,TC=TD)->true;false).
rhetoric3a([A,B,C,D]) :-
	not(var(A)),var(B),not(var(C)),not(var(D)),
	(rhetoric3(A)->TA=true;TA=false),
	(rhetoric3(C)->TC=true;TC=false),
	(rhetoric3(D)->TD=true;TD=false),
	((TA=B,TC=TD)->true;false).
rhetoric3(true):-!.
rhetoric3(false):-false,!.
rhetoric3([A,B,C,D]) :-
	rhetoric3a([A,B,C,D]).
rhetoric3([A,B,C,D]) :-
	rhetoric3a([C,D,A,B]).
	
% As I ran the program, I verified it.	 I read the input and output.  I verified them.  I verified that the program produced the correct output.

% may need multiple specs

%algorithm_helper(Progress,Model,Specs,Rest) :-
%	test_progress_head(Progress,Specs)
%sm
% fills in missing with true in ssi x already filled in
% like ssi, but finds all results
% at each line of alg, saves results - line numbers x run groups of lines in ssi
%test_progress_head(Progress,Specs) :-

%alg_paraphraser()

