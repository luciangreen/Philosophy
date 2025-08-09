% Finds n(n+1)/2 for 1+2+...+n
nn_induction_optimisation(B,C):-A=[0.5,1,-0.5,-1,0,-2,2],member(B,A),member(C,A),F = [[1,1],[2,3],[3,6],[4,10]],maplist(f([B,C]),F,_G).
f([B,C],F,E3):-[E1,E2]=F,E3 is B*(E1^2)+C*E1,E2 =:= E3.
