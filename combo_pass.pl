:-include('../listprologinterpreter/listprolog.pl').

%?- combo_pass([1,2,3,5],[1,4,3,6],11,G).                                        
%G = [[1, 2, 3, 5]].

combo_pass(A,B,Sum,G) :-
 length(A,L),
 numbers(L,1,[],Ns),
 
 % Finds the possibility list [[1], [2, 4], [3], [5, 6]]
 findall(C,(member(N,Ns),get_item_n(A,N,An),get_item_n(B,N,Bn),(An=Bn->C=[An];C=[An,Bn])),D),
 
 % Finds the expanded possibility list [[1, 2, 3, 5], [1, 2, 3, 6], [1, 4, 3, 5], [1, 4, 3, 6]]
 
 findall(H,findall2(D,[],H),J),
 
 % Finds the list that sums to Sum=11 [[1, 2, 3, 5]]
 
 findall(M,(member(M,J),sum(M,Sum)),G)
 .%(E,(member(F,D),member(E,F)),G).
 
findall2([],A,A) :- !.
findall2(A,B,C) :-
 A=[D|E],member(F,D),append(B,[F],G),findall2(E,G,C).