% formula((round(1+2.2*ceiling(2.7))),A),!.
%A=8
formula(A*B,C) :- formula(A,C1), formula(B,C2), C is C1*C2.
formula(A/B,C) :- formula(A,C1), formula(B,C2), C is C1/C2.
formula(A+B,C) :- formula(A,C1), formula(B,C2), C is C1+C2.
formula(A-B,C) :- formula(A,C1), formula(B,C2), C is C1-C2.
formula(A,C) :- number(A), C=A.

formula(round(A),C) :- formula(A,C1), C is round(C1).
formula(ceiling(A),C) :- formula(A,C1), C is ceiling(C1).
formula(floor(A),C) :- formula(A,C1), C is floor(C1).
