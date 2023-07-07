:-include('big_connections_with_bag3_and_mr_short_books_aa540_args_init2.pl').
%:-include('../t2ab/t2ab.pl').
:- dynamic count2/1.
:-include('la_vps.pl').

%bag_args(96000).
get_r(X2) :-
random(X),X1 is ceiling(X*1000000),foldr(string_concat,["Books/args-",X1,"/"],X3),
(exists_directory(X3)->get_r(X2);X3=X2).

bag_args(Limit1) :-
(exists_directory('Books/args')->(get_r(X2),mv("Books/args/",X2));true),
time((Split_into_n=%1,%
2,
%Limit is ceiling((Limit1*2.5*Split_into_n)),%/(*5)),
Limit is Limit1,%*2.5*Split_into_n)),%/(*5)),

 retractall(count2(_)),
 assertz(count2(0)), 
 %length(L,10),
 %L=[1,2,3,4,5,6,7,8,9,10],
 open_string_file_s("../Lucian-Academy/Books1/args/lgtext_a.txt",File_string),
 term_to_atom(File_string2,File_string),
 File_string2=["","","",File_string1],
 split1(Split_into_n,File_string1,File_strings),
 length(File_strings,L),
 numbers(L,1,[],Ls),

 concurrent_maplist(a1([File_strings,Limit]),Ls,N2))),
 delete(N2,0,N3),append(_,[N4],N3),writeln1(N4),!.

%%%%

count21(C) :- count2(C).

a1([File_strings,Limit],L1,Sent_br2) :-
 %findall(Sent_br2,(
 %member(L1,Ls),
 count21(C2),writeln([count,C2,/,Limit]),(C2>=Limit->
 (Sent_br2=0%open_s("../Lucian-Academy/Books1/algs/lgalgs_a.txt",write,Stream1),
	%write(Stream1,File_string),
	%close(Stream1),abort
	);(get_item_n(File_strings,L1,N),
 

      
(((catch(call_with_time_limit(5,
                          time( big_connections_with_bag3_and_mr(N,File_string_a))),
      time_limit_exceeded,
      false)),%->
 
 findall(_,sub_string(File_string_a,_,_,_,". "),A),length(A,L2),
split_string(File_string_a,"\n\r","\n\r",NL),length(NL,NLN),Sent_br2 is L2-NLN,

 %split_string(File_string_a,"\n\r.","\n\r.",Sents),
 %split_string(File_string_a,"\n\r","\n\r",Sents1),

 %length(Sents1,Sents1L),
 %length(Sents,Sent_br21),
 %Sent_br2 is Sent_br21-Sents1L,
  
   %trace,
  %t2b,
 %t2ab,
%N1=1,texttobr2(N1,"Books/args/lgtext_a.txt",u,u,false,false,false,false,false,false,[auto,on]),
  %trace,
 %t2ab(u,"Books/args/lgtext_a.txt",u,u,on),
 
  count21(C),
 C1 is C+Sent_br2,
 retractall(count2(_)),
 assertz(count2(C1))

 )->true;(writeln([here]),Sent_br2=0)))),!.
 
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
N1=1,texttobr2(N1,"Books/args/lgtext_a.txt",u,u,false,false,false,false,false,false,[auto,on]),!.

t2ab:-t2ab(u,"Books/args/lgtext_a.txt",u,u,on),!.