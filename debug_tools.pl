% debug_tools.pl

:-include('pretty_print_table.pl').
:-include('sub_term_with_address.pl').

test_p(A) :- (catch(call_with_time_limit(10,A),_,(writeln1(["Predicate timed out:",A]),abort))->true;(writeln1(["Predicate failed:",A]),fail%abort
)),!.

test_p_woto(A) :- (catch(A,_,fail)->true;(writeln1(["Predicate failed:",A]),%fail,
abort
)),!.

test_r(A,B) :-
sub_term_types_wa([string,number,atom,[]],A,Instances1),
sub_term_types_wa([string,number,atom,[]],B,Instances2),
(Instances1=Instances2->true;
(subtract(Instances1,Instances2,Instances1a),
subtract(Instances2,Instances1,Instances2a),
(pretty_print_table([A],A1)->true;pretty_print_table([[A]],A1)),
(pretty_print_table([B],B1)->true;pretty_print_table([[B]],B1)),
pretty_print_table([Instances1a],Instances1a1),
pretty_print_table([Instances2a],Instances2a1),
writeln(["**********","\n","Error in result:",A1,"\n**********","\n","given correct result:",B1,"\n**********","\n","Missing terminals:",Instances1a1,
"\n**********","\n","Incorrect terminals:",Instances2a1]),
true%abort
)),!.
