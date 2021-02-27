/**

apply_for_loan(1,0,0,1,A).
A = 0.5.

apply_for_loan(1,1,0,2,A).
A = 0.5.
                                                           apply_for_loan(2,0,1,1,A).
A = 0.5.

apply_for_loan(2,1,1,2,A).
A = 0.5.

apply_for_loan(1,1,-1,3,A).
A = 1.0.

**/

apply_for_loan(M1,C1,M2,C2,Amount_needed) :-
	
	% Start with 1 volunteer, 1 product with development time of pedagogy for product, sales (that connects through buyers' lives sevenfold)
	
	% avoids actual r&d cost for product, advertising costs x (ads' specific As beginning to melt away with availability of pedagogy LSTMs x that is the whole point of this algorithm)
	
	% How much time until profit is made?
	% Note to self: examine graphs, meanings of first n days of companies.
	
	% Time x breasoned As x time to break even
	
	% y= m1*x+c1 - expenditure
	% y= m2*x+c2 - income
	% m1*x+c1=m2*x+c2
	% m1*x-m2*x=c2-c1
	% (m1-m2)*x=c2-c1
	% x=(c2-c1)/(m1-m2)
	
	Time is (C2-C1)/(M1-M2),
	
	% How much money is needed to help make a profit?
	
	(C2>C1->(C21=C2,C11=C1,_M21=M2,M11=M1);
	(C11=C2,C21=C1,M11=M2,_M21=M1)),
	
	%abs(((M11*Time)+C11)-C21,DY),
	/**
	Amount_needed is 
	% top area
	((Time*((M11*Time)+C11))+
	(0.5*DY*Time))
	
	-
	% bottom area
	((0.5*Time*(DY))+
	(C11*Time))
	**/
	
	Amount_needed is
	(0.5*Time*(((M11*Time)+C11)-C11))
	-
	(0.5*Time*(((M11*Time)+C11)-C21))
	.
	
	% could be exact that it is the expenditure only triangle before break-even point
	