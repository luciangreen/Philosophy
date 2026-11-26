% 11 2 24.pl

% 23 algs

% ["Computational English","COMPUTATIONAL ENGLISH by Lucian Green Subject Mix 1 of 4.txt",0,algorithms,"2.    I prepared to show the writer, reader and character interacting with each other during the stage play.  I did this by stating that the writer, reader and character entered each other's worlds.  First, I wrote that the writer and reader entered each other's worlds.  Second, I wrote that the reader and character entered each other's worlds.  Third, I wrote that the character and writer entered each other's worlds.  In this way, I prepared to show the writer, reader and character interacting with each other during the stage play by stating that the writer, reader and character entered each other's worlds."]

% Subject Mix
% The characters create a mixture x a pedagogue
% A dependency chart of algorithms

% ["a",
%  " b",
%  "c"]

% to [a,[b],c] and [1a2, 2b3, 1c4]

/*
find deps of lppm

find deps in include stmts
*/

:-include('../listprologinterpreter/listprolog.pl').

% find_lppm_deps(U).
% U=[[u,1,[[u,2,[[u,3]]]]],[u,2,[[u,3]]],[u,3]].

find_lppm_deps(UR3) :-

%open_file_s("../List-Prolog-Package-Manager/lppm_registry.txt",Term),

/*Term=[
[u,1,_,[[u,2],[u,3]]],
[u,2,_,[]],
[u,3,_,[[u,3]]]
],*/
%Term=[[u,1,_,[]],[u,2,_,[]]],
Term=[[u,1,_,[[u,2]]],[u,2,_,[[u,3]]],[u,3,_,[]]],
findall([U,R,D],member([U,R,_,D],Term),URD),

findall(UR21,(member([U,R,D],URD),
find_deps1(D,Term,[],UR2,[],_),
 ((flatten(UR2,UR22),UR22=[])->UR23=[U,R];UR23=[U,R,UR2]),
UR21=UR23),UR3),!.


find_deps1([],_,UR,UR,All,All) :- !.
find_deps1(D,Term,UR1,UR2,All1,All5) :-
 D=[D1|D2],
 find_deps2(D1,Term,[],UR3,All1,All3),
 ((flatten(UR3,UR22),UR22=[])->(UR23=[%D1
 ]%,All2=[]
 );(UR23=%[[%D1|
 UR3%]]%,All2=[UR3]x
 )),
 append(UR1,UR23,UR31),
 %append(All1,All2,All4),
 find_deps1(D2,Term,UR31,UR2,All3,All5),!.
 
find_deps2(_,[],UR,UR,All,All) :- !.
find_deps2([U,R],Term,UR1,UR2,All1,All2) :-
%trace,
 Term=[[U,R,_,D]|T2],
 %trace,
 (member([U,R],All1)->find_deps2([U,R],T2,UR1,UR2,All1,All2);
 (%trace,
 find_deps1(D,Term,[],UR21,All1,All3),
 ((flatten(UR21,UR22),UR22=[])->(UR23=[[U,R]],All31=[]);(UR23=[[U,R,UR21]],All31=[UR21])),
 append(UR1,UR23,UR3),
 append(All3,All31,All4),
 find_deps2([U,R],T2,UR3,UR2,All4,All2))),!.
find_deps2([U,R],Term,UR1,UR2,All1,All2) :-
 Term=[[U1,R1,_,_]|T2],
 not([U,R]=[U1,R1]),
 find_deps2([U,R],T2,UR1,UR2,All1,All2),!.

% 8 so far

:-include('sub_term_with_address.pl').

stwa(A) :-
 find_lppm_deps(B),sub_term_wa([u,_,_],B,A),!.



