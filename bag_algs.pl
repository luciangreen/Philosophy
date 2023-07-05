:-include('big_connections_with_bag3_and_mr_short_books_aa540_algs_init.pl').
%:-include('../t2ab/t2ab.pl').
:- dynamic count2/1.

%bag_algs(80000).
bag_algs(Limit1) :-
time((
Split_into_n=4,
Limit is ceiling((Limit1*2.5*Split_into_n)),%/(*5)),
 retractall(count2(_)),
 assertz(count2(0)), 
 %length(L,10),
 %L=[1,2,3,4,5,6,7,8,9,10],
 open_string_file_s("../Lucian-Academy/Books1/algs/lgalgs_a.txt",File_string),
 term_to_atom(File_string2,File_string),
 File_string2=["","","",File_string1],
 split1(Split_into_n%17
 ,File_string1,File_strings),
 length(File_strings,L),
 numbers(L,1,[],Ls),

 findall(Sent_br2,(member(L1,Ls),count2(C2),writeln([count,C2,/,Limit]),(C2>=Limit->abort;true),get_item_n(File_strings,L1,N),
 
 FS2=["","","",N],term_to_atom(FS2,FS3),
 
  	(open_s("../Lucian-Academy/Books1/algs/lgalgs_a.txt",write,Stream),
	write(Stream,FS3),
	close(Stream)),

(((catch(call_with_time_limit(5,
                          time( big_connections_with_bag3_and_mr2)),
      time_limit_exceeded,
      false)),%->
      
      

 open_string_file_s("Books/algs/lgalgs_a.txt",File_string_a),
 split_string(File_string_a,"\n\r.","\n\r.",Sents),
 split_string(File_string_a,"\n\r","\n\r",Sents1),

 length(Sents1,Sents1L),
 length(Sents,Sent_br21),
 Sent_br2 is Sent_br21-Sents1L,
  
   %trace,
  %t2b,
 %t2ab,
%N1=1,texttobr2(N1,"Books/algs/lgalgs_a.txt",u,u,false,false,false,false,false,false,[auto,on]),
  %trace,
 %t2ab(u,"Books/algs/lgalgs_a.txt",u,u,on),
  foldr(string_concat,["Books/algs/lgalgs_a",L1,".txt"],File),

 mv("Books/algs/lgalgs_a.txt",File),
 count2(C),
 C1 is C+Sent_br2,
 retractall(count2(_)),
 assertz(count2(C1))
 
 )->true;(writeln([here]),Sent_br2=0))

 ),N2),
 foldr(sum,N2,0,M),writeln([M,alg,br])
 /*
  	(open_s("../Lucian-Academy/Books1/algs/lgalgs_a.txt",write,Stream1),
	write(Stream1,File_string),
	close(Stream1))
	
	
	count2(C3),
Limit11 is ceiling((Limit-C3)*Split_into_n*5),

(Limit11=0->abort;
bag_algs(Limit11))
*/

 )).
 
 %split1(17,A"a:-b,c.",B).

sum(A,B,C) :- C is A+B.
split1(N,A,B) :-
 split_string(A,"\n\r","\n\r",C),
 split2(N,C,[],D),
 findall(H,(member(D1,D),
 findall([E,"\n"],member(E,D1),F),
 flatten(F,G),
 foldr(string_concat,G,H)),B),!.
split2(N,A,B,C) :-
 length(D,N),
 (append(D,E,A)->
 (append(B,[D],F),
 split2(N,E,F,C));
 append(B,[A],C)),!.


  t2b :-
N1=1,texttobr2(N1,"Books/algs/lgalgs_a.txt",u,u,false,false,false,false,false,false,[auto,on]),!.

t2ab:-t2ab(u,"Books/algs/lgalgs_a.txt",u,u,on),!.