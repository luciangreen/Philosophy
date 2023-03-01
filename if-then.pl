/*
I want to design a top-level interface for Prolog that is not buggy (where cut successfully cuts choicepoints, not if-then causing choicepoints to be buggily cut).  I thought that I could convert if-then to clauses where the truth of the antecedent is reified and its truth is tested to be true or false at the start of each clause.

For example, test1 below shows the original if-then clause.
*/
test1:-(a1(1)->b1;c1).
a1(1).
b1.
c1.

/*
Here, test2 shows how if-then has been converted into separate clauses.  So, test1. does the same thing as test2., but test2's choicepoints are available to cut, as against the if-then clause in test1 possibly causing choicepoints to be buggily cut.
*/
test2:-a2(1,R),d2(R). 

a2(1,true):-!.
a2(_,false).
d2(true):-b2,!. 
d2(false):-c2.
b2:-writeln(b2).
c2:-writeln(c2).


% I could convert to the test2 format at compilation and display if-then using the test1 format in trace mode.