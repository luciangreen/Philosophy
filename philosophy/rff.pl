% ["Mind Reading","Mr for philosophy and algorithm writing 1.txt",0,algorithms,"14. *I used mind formula finder e.g. to find the difference formula.""]"]

% randomly generate a formula

rff(A) :-
	random_member(B,['*','/','+','-']),
	A = [a,B,b].