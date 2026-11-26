% algs 2 9 23.pl

% 22 done
% 23*3-22 = 47 needed

% ["Short Arguments","Competition 6.txt",0,algorithms,"53. The competition was comparing with one's personal best.  People moved up and down because of competition as the heart of society.  Everything was developed.  Jobs were always available and grew.  I moved up."]

% ?- personal_best([1,2,3],PB).
% PB = 1.

personal_best(L,PB) :-
 sort(L,L2),L2=[PB|_].

% ?- faster_than_personal_best(2,1).
% true.

faster_than_personal_best(PB,V) :-
 V<PB.
 
% ?- how_much_faster_than_personal_best(2,1,D).
% D = 1.

% ?- how_much_faster_than_personal_best(1,2,D).
% D = -1.

how_much_faster_than_personal_best(PB,V,D) :-
 D is PB-V.

% competition(3,0).
/*
[6,9,<, = or >:]
[Correct, Score = ,1]
[3,1,<, = or >:]
[Correct, Score = ,2]
[7,2,<, = or >:]
[Incorrect]
*/

competition(0,_) :- !.
competition(N,S) :-
 random(X),X1 is floor(10*X),
 random(Y),Y1 is floor(10*Y),
 (X1<Y1->K1="<";(X1=Y1->K1="=";K1=">")),
 writeln([X1,Y1,"<, = or >:"]),
 (catch(call_with_time_limit(2,get_single_char(K2)),_,false)->(char_code(K3,K2),atom_string(K3,K));(%nl,
 K="")),
 
 (K=K1->(S1 is S+1,writeln(["Correct, Score = ",S1]));
 (S1 is S,writeln(["Incorrect"]))),
 N1 is N-1,
 competition(N1,S1),!.

% race against itself for pb, ave

:-include('../listprologinterpreter/listprolog.pl').

% race(PB,Ave).
% PB = 17,
% Ave = 18.8.

race(PB,Ave) :-

 retractall(times(_)),
 assertz(times([])),
 
 numbers(5,1,[],Competitors),
 findall([Competitor,0],member(Competitor,Competitors),Start2),

 retractall(progress(_)),
 assertz(progress(Start2)),
 
 tty_size(R,_C),
 
 numbers(40,1,[],Paces),

 numbers(R,1,[],R1),

 findall(_,(member(Pace,Paces),
 findall([Competitor,Progress],(progress(Start),
 member([Competitor,Start1],Start),random(X),X1 is floor(2*X),Progress is Start1+X1,
 numbers(Progress,1,[],P),
 findall(_,(member(_,P),write(" ")),_),writeln("*"),(Progress=10->
 
 (times(T),
 append(T,[[Competitor,Pace]],T1),
 retractall(times(_)),
 assertz(times(T1)));true)

 ),Progress1),sleep(0.1),
 findall(_,(member(_,R1),nl),_),
 retractall(progress(_)),
 assertz(progress(Progress1))
 )

 ,_),
 
 times(T2),
 
 
 findall(PB1,(member(Competitor,Competitors),
 findall(T,member([Competitor,T],T2),T21),
 sort(T21,T31),
 (T31=[PB1|_]->true;PB1=[])),PB2),

%trace,

 msort(PB2,T32),
 (T32=[PB|_]->true;(writeln("No one finished"),abort)),

 %findall(PB3,member([_,PB3],T32),PB4),
 sum(T32,0,Sum),
 length(T32,L),
 Ave is Sum/L.
 
% 13 done

% ["Mind Reading","Mr for philosophy and algorithm writing 1.txt",0,algorithms,"9. I mind read the algorithms for details in the essay for 100%."]

% 68 from ../Algorithm-Writer-with-Lists/grammar_logic_to_alg_mr.pl

 




