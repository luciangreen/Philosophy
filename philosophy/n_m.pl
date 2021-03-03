% ["Lecturer","Philosophy:Computational English.txt",0,algorithms,"4. *I wrote on the finite.  I cut off infinity.  I prepared for the longest amount of work being possible.  I found the way of producing the longest of amount of work.  I produced the longest amount of work."]

% What parameters does text to breasoning take to breason out an exact number of breasonings?

/**

?- n_m(32001,N,M).
N = M, M = 1.

?- n_m(32002,N,M).
N = 1,
M = 2.

?- n_m(31999,N,M).
N = 0,
M = 31999.

**/

% n_m(32001,N,M).
n_m(Number,N,M) :-
	%(Number<32000->
	N is div(Number,32000),
	M is mod(Number,32000).