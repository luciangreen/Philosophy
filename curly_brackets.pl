
t_or_empty([t,_]).
t_or_empty({[t,_]}).
t_or_empty([]).

/*
%curly_head_tail(T,List1,List2) :- t_or_empty(T),append(List1,T,List2),!.
curly_head_tail({T},{H},Ta) :- curly_head_tail(T,H,Ta),%,append(List1,T,List2),
!.
%curly_head_tail({T},{H},Ta) :- 
% T =.. [{}, Round_bracket_list],
%curly_head_tail(T,H,Ta),%,append(List1,T,List2),
%!.

curly_head_tail(Head1,C1,C2) :-

 Head1 =.. [{}, Round_bracket_list],
 
 curly_head_tail1(Round_bracket_list,[],[Head1a|Head1b]),
 
 (Round_bracket_list =.. [{}, _]-> (square_to_curly(Head1a,C1),(Head1b=C2));
 [Head1a|Head1b]=[C1|C2]),!
.
% numbers(20,1,[],N),
 	
 %findall(A,(member(N1,N),arg(N1,Round_bracket_list,A)),[Head1a|Head1b]).

*
curly_head_tail1(Round_bracket_list,List1,List2) :-

 Round_bracket_list =.. [t,A],
 append(List1,[[t,A]],List2),!.
*

curly_head_tail1(T,List1,List2) :- t_or_empty(T),append(List1,[T],List2),!.

%curly_head_tail1([T],List1,List2) :- t_or_empty(T),append(List1,%[[T]],List2),!.

curly_head_tail1(Round_bracket_list,List1,List2) :-
 curly_head_tail(Round_bracket_list,List3,List4),
 append(List1,[[List3|List4]],List2).

curly_head_tail1(Round_bracket_list,List1,List2) :-
 
 %t_or_empty(T),

 Round_bracket_list =.. [',', T,  B],
 %curly_head_tail(T,_,_),
 append(List1,[T],List3),
 curly_head_tail1(B,List3,List2),!.

*/
%/*

%curly_head_taila(T,H,Ta),%,append(List1,T,List2),
%!.

curly_head_taila(Head1,C1,C2) :-

 Head1 =.. [{}, Round_bracket_list],
 
 curly_head_tail1a(Round_bracket_list,[],[Head1a|Head1b]),
 
 (Round_bracket_list =.. [{}, _]-> (square_to_curly(Head1a,C1),(
 %(Head1b =.. [{}, _]-> square_to_curly(Head1b,C2);
 Head1b=C2))%)
 ;
 [Head1a|Head1b]=[C1|C2]),!.


curly_head_tail1a(T,List1,List2) :- t_or_empty(T),append(List1,[T],List2),!.

%curly_head_tail1([T],List1,List2) :- t_or_empty(T),append(List1,%[[T]],List2),!.

%curly_head_tail1a(Round_bracket_list,List1,List2) :-
% curly_head_taila(Round_bracket_list,List3,List4),
% append(List1,[[List3|List4]],List2).

curly_head_tail1a(Round_bracket_list,List1,List2) :-
 
 %t_or_empty(T),

 Round_bracket_list =.. [',', T,  B],
 %curly_head_tail(T,_,_),
 append(List1,[T],List3),
 (B=..[{}, _]->append(List3,[B],List2);
 curly_head_tail1a(B,List3,List2)),!.
%*/
 
 
square_to_curly(A,B) :-
 square_to_round(A,C),round_to_curly(C,B).
 
round_to_curly(A,B) :-
 B=..[{},A].
 
% square_to_round([1,2,3],A).                   
% A = (1, 2, 3).

square_to_round(A,C) :-
 %t_or_empty(T),
 ((A=[D]%,D=T
 )->
 C=(D);
 (A=[D|E],%not(T=A),
 square_to_round(E,F),
 C=..[',',D,F])),!.
 
