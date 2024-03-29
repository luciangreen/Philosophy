% bag2phil.pl

% breasoning algorithm generator 2 to philosophy

% uses breasoning algorithm generator 2 to output the maximum number of philosophy paragraphs with 5 sentences.

% later: do this for combos of texts

:-include('../listprologinterpreter/listprolog.pl').
:-include('br_alg_gen2.pl').

/*
?- bag2phil(Br),writeln(Br).
Enter number of input files:
|: 2
Enter file 1 path:
|: ../Lucian-Academy/Books/IMMORTALITY/Immortality 1.txt
Enter file 2 path:
|: ../Lucian-Academy/Books/IMMORTALITY/Immortality 2.txt
*/

bag2phil(Br32) :-
repeat,
writeln("Enter number of input files:"),
read_string(user_input,"\n\r","\n\r",_,S1),
number_string(N,S1),
numbers(N,1,[],N1),
findall([T2,"\n",T3,"\n",T4,"\n"],(member(N2,N1),write("Enter file "),write(N2),writeln(" path:"),read_string(user_input,"\n\r","\n\r",_,S2),

%open_s(S2,read,T1),read_term(T1,[T2,T3,_,T4]),close(S2)

phrase_from_file_s(string(A),S2),term_to_atom([T2,T3,_,T4],A)%writeln(A1).

),T5),
%trace,
flatten(T5,T6),
%findall([T61,". "],member(T61,T6),T62),
%flatten(T62,T63),
foldr(string_concat,T6,T7),
open_s("../Text-to-Breasonings/file.txt",write,S3),write(S3,T7),close(S3),
%trace,
br_alg_gen2(Br0),
sort(Br0,Br),

findall(T63,(member(T61,Br),string_concat(T61,". ",T63)),T62),
%flatten(T62,Br11),

length(T62,N3),
N4 is N3 div 5,

N6 is 5*N4,
length(L,N6),
append(L,L2,T62),

divide(1,L,5,[],Br2),

N8 is N4+1,
append(Br2,[N8,". ",L2],Br3),

flatten(Br3,Br31),foldr(string_concat,Br31,Br32),!.


divide(_,[],_,Br2,Br2) :- !.
divide(N7,Br,N4,Br1,Br2) :-
 length(L,N4),append(L,L2,Br),
 append(Br1,[N7,". ",L,"\n"],Br3),
 N8 is N7+1,
 divide(N8,L2,N4,Br3,Br2).

