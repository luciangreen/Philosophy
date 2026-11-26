%% graph true (nx) vs good (random-length and height steps)

%% ?- true_vs_good(T,G).
%% T = [[0, 0], [1, 1], [2, 2], [3, 3], [4, 4], [5, 5]],
%% G = [[0, 0], [3.6, 2.4], [3.9, 3.9], [3.9, 4.7], [4.4, 4.9], [5, 5]].

true_vs_good([[0,0],[1,1],[2,2],[3,3],[4,4],[5,5]],Good) :-
	random1(0.1,4.6,Y1),
	random1(Y1,4.7,Y2),
	random1(Y2,4.8,Y3),
	random1(Y3,4.9,Y4),
	Good=[[0,0],[1,Y1],[2,Y2],[3,Y3],[4,Y4],[5,5]].
	
random1(A1,A2,N3) :-
	random(A1,A2,N4),
	N3 is round(N4*10)/10.
