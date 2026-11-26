% join_period(["a",".","b","c",".",".","s"],C).
% C = ["a.", "bc..", "s"].
join_period([],[]) :-!.
join_period([A],[A]) :-!.
join_period([X11,".",X13|Xs], [X12|Ys]) :-
	string_concat(X11,".",X12),
	not(X13="."),
	join_period([X13|Xs], Ys),!.
join_period([A1,A2|A3],Ys) :-
	foldr(string_concat,[A1,A2],A4),
	join_period([A4|A3],Ys),!.
