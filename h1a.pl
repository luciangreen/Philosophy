:-include('../Algorithm-Writer-with-Lists/grammar_logic_to_alg.pl').
:-include('../Philosophy/s2a/spec_to_algorithm.pl').
:-include('../Philosophy/word_frequency_count2-1.pl').

main_h1a :- 
h1a(file,"../Text-to-Breasonings/file5.txt"),!.

h1a(File_or_string,Infile) :-
(File_or_string=file->
open_string_file_s(Infile,A);(File_or_string=string,Infile=A)),
split_string(A,"!?.\n\r","!?.\n\r",B),delete(B,"",A1),findall(C,(member(C5,A1),SepandPad="#@~%`$^()|=_?+*/-,.:;[]<>{}\n\r\t\\!'\"0123456789",split_string(C5,SepandPad,SepandPad,C1),findall([C2," "],member(C2,C1),C3),foldr(append,C3,C4),foldr(string_concat,C4,C),string_chars(C,D),not(forall(member(E,D),char_type(E,white)))),F),

findall(_,(member(G,F),

wc(G,WC),

Factor=200, %2000
(WC<Factor->N is ceiling(Factor/WC);N=1),
    length(List, N),
    maplist(=(G), List),
    atomics_to_string(List, " ", G1),

grammar_logic_to_alg113(G1,GL_out1),term_to_atom(GL_out1,GL_out2),string_atom(GL_out,GL_out2),

writeln(GL_out2),

kw(GL_out,KW),length(List1,200),append(List1,_,KW),
%trace,
findall([[input,[['A',[W2]]]],[output,[['B',[0]]]]],
(member(_-W,List1),string_strings(W,A2),truncate(A2,10,B2),atomics_to_string(B2,W2)),Ws),

split_10(Ws,Ws1),

findall(_,(member(Ws2,Ws1),

S2a_test=

[1,algorithm,

Ws2
,character_breakdown_mode=on,
_
],

S2a_test=[N1,Predicate_name,S,
character_breakdown_mode=CBM,_Alg2],
string_concat(Predicate_name,N1,PN),

term_to_atom((	(catch(algs(Algs),_,false)->
	findall(_,(member(Alg,Algs),
	retractall(algs(Alg))),_);
	true),
	retractall(algs(_)),
	assertz(algs([])),
spec_to_algorithm(PN,S,CBM,Alg1),writeln(Alg1)),Atom),
container3(Atom,Out),
writeln(Out),

term_to_atom(Alg,G2),

writeln(G2),

foldr(string_concat,["N=u,M=u,texttobr2(N,u,\"",G2,"\",M,[auto,on]),texttobr(N,u,\"",G2,"\",M)"],S4),
container2("../Text-to-Breasonings/text_to_breasonings.pl",S4,_)
),_)

),_),!.

kw(S,KW) :-
	word_frequency_count2(["string",S],A),sort(A,B),reverse(B,KW),!.

split_10([], []).
split_10(List, [Chunk|Rest]) :-
    append(Chunk, Remainder, List),
    length(Chunk, 200),
    split_10(Remainder, Rest).

container3(Command,Out) :-

foldr(string_concat,["#!/usr/bin/swipl -g main -q\n\n",":-include('../Philosophy/s2a/spec_to_algorithm.pl').\n","handle_error(_Err):-\n  halt(1).\n","main :-\n    catch(call_with_time_limit(",2000,",(",Command,")), Err, handle_error(Err)), nl,\n    halt.\n","main :- halt(1).\n"],String),
foldr(string_concat,[
"test364728.pl"],GP),
open_s(GP,write,S1),
write(S1,String),close(S1),
foldr(string_concat,["chmod +x ",GP,"\n","swipl -g main -q ./",GP],S3),
catch(bash_command1(S3,Out), _, (foldr(string_concat,["Warning."
	],_Text4),
	fail
 	)),!.
 	
