% debug_tools.pl

test_p(A) :- (A->true;(writeln(["Predicate failed:",A]),abort)),!.

test_r(A,B) :-
sub_term_types_wa([string,number,atom,[]],A,Instances1),
sub_term_types_wa([string,number,atom,[]],B,Instances2),
(Instances1=Instances2->true;
(subtract(Instances1,Instances2,Instances1a),
subtract(Instances2,Instances1,Instances2a),
writeln(["**********","\n","Error in result:",A,"\n**********","\n","given correct result:",B,"\n**********","\n","Missing terminals:",Instances1a,
"\n**********","\n","Incorrect terminals:",Instances2a]),
abort)),!.
