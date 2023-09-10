% 10 9 23

% 23-4=19 algs

% ["Mind Reading","Mind Reading.txt",0,algorithms,"29. I regularly tested the encryption-decryption system."]

:-include('../listprologinterpreter/la_strings_string.pl').
:-include('../listprologinterpreter/listprolog.pl').

% rot_n("happy apples",1,A),rot_n(A,-1,B).
% A = "ibqqz!bqqmft",
% B = "happy apples".

% rot_n("good watermelon",1,A),rot_n(A,-1,B).
% A = "hppe!xbufsnfmpo",
% B = "good watermelon".

rot_n(A,N,B) :-
 %strings_string(A,C),
 string_codes(A,C),
 findall(E,(member(D,C),E is D+N%,char_code(F,E)
 ),G),
 string_codes(B,G).

% ["Fundamentals of Meditation and Meditation Indicators","FUNDAMENTALS OF MEDITATION by Lucian Green Maharishi Sutra 4 of 4.txt",0,algorithms,"34.   I prepared to explain how I became wise. I did this by stating that I am wise. First, I opened my journal.  Second, I stated what I did.  Third, I stated why it was wise.  In this way, I prepared to explain how I became wise by stating that I am wise."]

object(argument,(((null,4,null),2,(null,5,null)),1,(null,3,(null,6,null)))).

/*
 pretty_print(argument,dfs_in_order,A),findall(A1,(member(A1,A),write(A1)),_). 

       -4-
   |-2-
   |   -5-
-1-|
   |-3-
       -6-
       
 pretty_print(argument1,dfs_in_order,A),findall(A1,(member(A1,A),write(A1)),_). 

       -1-
   |-2-
   |   -3-
-5-|
   |-4-
       -6-
       
*/

object(argument1,(((null,1,null),2,(null,3,null)),5,(null,4,(null,6,null)))).


pretty_print(Object,Method,A) :-
 object(Object,Items2),
 pretty_print2(Method,Items2,A).
 
%pretty_print2(dfs_pre_order,Items1,A) :-
% pretty_print_dfs_pre_order(Items1,0,A).

pretty_print2(dfs_in_order,Items1,B) :-
 pretty_print_dfs_in_order(Items1,0,[],A),
 insert_vertical_lines(A,4,B).

pretty_print_dfs_in_order(null,_,A,A) :- !.
pretty_print_dfs_in_order((Item7,Item4,Item8),N,D,E) :-
 N1 is N+3,
 pretty_print_dfs_in_order(Item7,N1,D,D1),
 numbers(N,1,[],Ns),
 findall(A,(member(_,Ns),A=" "),B),
 foldr(string_concat,B,B1),
 foldr(string_concat,[B1,"-",Item4,"-","\n"],F),
 append(D1,[F],F1),
 pretty_print_dfs_in_order(Item8,N1,F1,E),!.

/*

      -4-
   -2-
      -5-
-1-
   -3-
      -6-

*/

insert_vertical_lines(A,N,A) :-
 N1 is N+4,
 end_of_cols(A,N1),!.
insert_vertical_lines(A,N,%B1,
B) :-
%trace,
 get_up_to_n_cols(A,N,C,D,D2),
 get_first_and_last_items(D,I1,I2),
 append_vertical_line(C,I1,I2,C2),
 group_concat(C2,D,D4),
 group_concat(D4,D2,D3),
 N1 is N+4,
 insert_vertical_lines(D3,N1,B).

get_up_to_n_cols(A,N,C,D,D2) :-

 N1 is N-1,
 %N2 is N+1,
 findall(A2,(member(A1,A),sub_string(A1,0,N1,_,A2)),C),
 findall(A2,(member(A1,A),sub_string(A1,N1,1,_,A2)),D),
%trace, 
findall(A2,(%trace,
 member(A1,A),%string_length(A1,SL),
 sub_string(A1,N,_,0,A2)),D2).
 
 
get_first_and_last_items(D,I1,I2) :-
%trace,
 foldr(string_concat,D,D1),
 findall(A,(sub_string(D1,A1,1,_,"-"),A is A1+1),D2),
 append([I1],_,D2),
 append(_,[I2],D2).
 
append_vertical_line(C,I1,I2,C2) :-
 I11 is I1-1,
 numbers(I11,1,[],N1),
 findall(" ",member(_N11,N1),A),
 %I3 is I1+1,
 I4 is I2-I1+2,
 numbers(I4,I1,[],N2),
 findall("|",member(_N12,N2),A1),
 %I5 is I2+1,
 length(C,I6),I7 is I6-I2,
 numbers(I7,1,[],N3),
 findall(" ",member(_N13,N3),A2),
 foldr(append,[A,A1,A2],A3),
 numbers(I6,1,[],I61),
 findall(B11,(member(C1,I61),get_item_n(C,C1,C11),get_item_n(A3,C1,A11),string_concat(C11,A11,B11)),C2).
 
group_concat(C2,D2,D3) :-
 length(C2,I6),
 numbers(I6,1,[],N1),
  findall(B11,(member(C1,N1),get_item_n(C2,C1,C11),get_item_n(D2,C1,A11),string_concat(C11,A11,B11)),D3).

end_of_cols(A,N) :-
 A=[B|_],
 string_length(B,L),
 N>=L.
 


