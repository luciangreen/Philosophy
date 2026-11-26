replace_in_term3(A,B,G,C):-
 copy_term(B,B1),
 copy_term(B,B2),
 replace_in_term(A,B1,G,D),
 %replace_in_term3(D,B,G,E),
 (A=D->D=C;
 replace_in_term3(D,B2,G,C)),!.