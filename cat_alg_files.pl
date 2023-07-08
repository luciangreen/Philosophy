:-include('../listprologinterpreter/listprolog.pl').
:-include('../listprologinterpreter/la_files.pl').
%:-include('cat_files2.pl').
:- use_module(library(date)).
cat_alg_files :-
 %/*
date_time_stamp(date(2023,1,1,0,0,0,_,_,_),TS0),
date_time_stamp(date(2023,1,8,0,0,0,_,_,_),TS01),
TSD is TS01-TS0,

get_time(TS1),
Week_ago is TS1-TSD,

 directory_files('../../GitHub/',F),
	delete_invisibles_etc(F,G1),
	delete(G1,"Lucian-Academy",G),

findall([F5_old,F5_new],
(member(F2,G),

foldr(atom_concat,['../../GitHub/',F2,'/'],F1),

 directory_files(F1,F21),
	delete_invisibles_etc(F21,G2),

member(F3,G2),
foldr(atom_concat,['../../GitHub/',F2,'/',F3],F4),

(exists_file(F4)->(
time_file(F4,T),

open_string_file_s(F4,F5),
% if T is less than a week old
(T > Week_ago ->
(%trace,
F5_new=F5,
F5_old="");
(F5_new="",
F5_old=F5))
);fail)),F6),
delete(F6,["",""],F61),
%trace,

findall([F62_new,"\n"],member([_,F62_new],F61),F63_new),
findall([F62_old,"\n"],member([F62_old,_],F61),F63_old),
append(F63_new,F63_old,F64),
flatten(F64,F7),
foldr(string_concat,F7,F8),

F9=["","","",F8],
term_to_atom(F9,F10),

open_s("../Lucian-Academy/Books1/algs/lgalgs_new.txt",write,S),
write(S,F10),close(S),
%*/
%cat_files('../../../GitHub/',"Lucian-Academy","../Lucian-Academy/Books1/algs/lgalgs_a.txt"),

!.

