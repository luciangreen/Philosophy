nn_induction_optimisation(B,C):-A=[0.5,1,-0.5,-1,0,-2,2],member(B,A),member(C,A),F = [[1,1],[2,3],[3,6],[4,10]],findall(E3,(member([E1,E2],F),E3 is B*(E1^2)+C*E1),E4),E4=[1.0,3.0,6.0,10.0].
