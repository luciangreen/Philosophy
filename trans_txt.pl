% ChatGPT translates algorithm

% Can use to translate a txt dictionary to run an alg in another language.

% [[a,b],[c,d]]

% trans certain items
:-include('../listprologinterpreter/listprolog.pl').
:-include('sub_term_with_address.pl').

% trans_txt([-,t,-,t],"trans_txt.txt",A).
% A = [[1, "A. \nA.", 3, "A.A."], [5, "A.A.", 7, "a.a."]]

trans_txt(Template,Path,H) :-

 open_file_s(Path,File_term),

 length(File_term,File_term_L),
 numbers(File_term_L,1,[],Ns),
 
 findall(F,(member(C,Ns),get_item_n(File_term,C,C1),length(C1,C1L),numbers(C1L,1,[],Ns1),findall([D1,E4,E1L],(member(D,Ns1),get_item_n(Template,D,t),get_item_n(C1,D,E),append([1,C],[D],D1),split_string(E,".",".",E1),findall(E3,(member(E2,E1),string_concat(E2,".",E3)),E4),length(E1,E1L)),F)),G),
 foldr(append,G,G1),
 
 %findall([D1,[E1,E1L]],member([D1,E1,E1L],G1),G2),
 findall(E1,member([D1,E1,E1L],G1),G2),
 flatten(G2,G3),
 foldr(string_concat,G3,G4),
 
  %sub_term_wa([loop,_],A,D),
 %findall(E,member([E,_],D),F),
 %foldl(delete_sub_term_wa,[F],A,C).
 
 trans_gpt(G4,G5),
 split_string(G5,".",".",G6),
 findall(E3,(member(E2,G6),string_concat(E2,".",E3)),G61),
 assort_words(G61,G1,[],G7),
 %trace,
 % [[1, "A. \nA.", 3, "A.A."], [5, "A.A.", 7, "a.a."]]
 % [[1, "A. \nA.", 3, "A.A."], [5, "A.A.", 7, "a.a."]]
 
 foldr(put_sub_term_wa_ae,G7,File_term,H).
 
put_sub_term_wa_ae([E,A],B,C) :-
 put_sub_term_wa(A,E,B,C).

trans_gpt(A,A).

assort_words([],[],G,G) :- !.
assort_words(G0,G1,G6,G7) :-
 G1=[[D1,_E1,E1L]|G2],
 length(A,E1L),
 append(A,B,G0),
 foldr(string_concat,A,A1),
 append(G6,[[D1,A1]],G8),
 assort_words(B,G2,G8,G7),!.

 
