:-include('big_connections_with_bag3_and_mr_short_books_aa540_args_init2.pl').
:-include('../t2ab/t2ab.pl').

:-dynamic count1/1.

bag_args :-
retractall(count1(_)),
assertz(count1(1)),
 %length(L,10),
 L=[1,2,3,4,5,6,7,8,9,10],
 
 findall(Sent_br2,(
 count1(Times),
 Times1 is Times+1,
 retractall(count1(_)),
assertz(count1(Times1)),

 member(N,L),big_connections_with_bag3_and_mr,

 open_string_file_s("Books/args/lgtext_a.txt",File_string),
 split_string(File_string,"\n\r.","\n\r.",Sents),
 split_string(File_string,"\n\r","\n\r",Sents1),

 length(Sents1,Sents1L),
 length(Sents,Sent_br21),
 Sent_br2 is Sent_br21-Sents1L,
 %trace,
  t2b,
 t2ab,
  foldr(string_concat,["Books/args/lgtext_a",Times,".txt"],File),

 mv("Books/args/lgtext_a.txt",File)

 ),N2),
 foldr(sum,N2,0,M),writeln([M,arg,br]).
 
 %split1(17,A"a:-b,c.",B).

sum(A,B,C) :- C is A+B.
split1(N,A,B) :-
 split_string(A,"\n\r","\n\r",C),
 split2(N,C,[],B).
split2(N,A,B,C) :-
 length(D,N),
 (append(D,E,A)->
 (append(B,[D],F),
 split2(N,E,F,C));
 append(B,[A],C)),!.

t2b:-
N1=1,texttobr2(N1,"Books/args/lgtext_a.txt",u,u,false,false,false,false,false,false,[auto,on]),!.

t2ab :-
t2ab(u,"Books/args/lgtext_a.txt",u,u,on),!.