% 17 3 24

% 16 so far

% "Time Travel","People 1.txt",0,algorithms,"2. The aliens have different animals they have evolved from"

% The following are theories.

ancestor(different).
medicine(different).
culture(different).
pedagogy(same).
meditation(same).
computers(same).
simulation(same).
immortality(same).

% ["Short Arguments","Gridline 2.txt",0,algorithms,"3. I noted the height of the meniscus.  I measured the meniscuses.  I read the value for the bottom of the meniscus.  I read the value for the top of the meniscus.  I used the correct value."]

concave(bottom). % u
convex(top). % ^

% ["Creating and Helping Pedagogues","CREATE AND HELP PEDAGOGUES by Lucian Green Pedagogy Helper - Write on Breasoning - Computer Science 3 of 4.txt",0,algorithms,"    45.    I plugged Simulated Intelligence (SI) into people."]

% br with pos

% ?- new_t2b("Mara wrote the pear.",B,XYZ),length(B,L),numbers(L,1,[],N),findall([B1,XYZ1],(member(N1,N),get_item_n(B,N1,B1),get_item_n(XYZ,N1,XYZ1)),List),writeln(List).

% [[person,[50,30,180]],[square,[1,1,0]],[pen,[15,0.5,0.5]],[square,[1,1,0]],[down,[1,1,0]],[square,[1,1,0]],[pear,[5,5,10]],[block,[1,1,1]]]

:-include('../listprologinterpreter/listprolog.pl').

new_t2b(S,B,XYZ) :- downcase_atom(S,S1),string_codes(S1,C),phrase(s(B),C),maplist(br,B,XYZ),!.

s(B) --> noun1(B1), space(B2), verb(B3), space(B4), noun1(B5), full_stop(B6), {foldr(append,[B1,[B2],[B3],[B4],B5,[B6]],B)}.
noun1(B) --> determiner(B1), space(B2), noun(B3), {foldr(append,[[B1],[B2],[B3]],B)}.
noun1(B) --> noun(B1), {foldr(append,[[B1]],B)}.

determiner("down") --> "the".
determiner("down") --> "an".
determiner("down")  --> "a".

space("square") --> " ".
full_stop("block")  --> ".".

noun("pear")  --> "pear".
noun("person")  --> "mara".

verb("pen")  --> "wrote".
verb("mouth")  --> "addressed".

br("down",	[1,1,0]).
br("square",[1,1,0]).
br("block",	[1,1,1]).
br("pear",	[5,5,10]).
br("person",[50,30,180]).
br("pen",	[15,0.5,0.5]).
br("mouth",	[4,0,1]).

% br with sent and alg

% types

% eg type_checker([c1(a,b),c2(a),c3(b,c)],Types).
% Types = [c1(atom, number), c2(atom), c3(number, string)].

type_checker([],[]).
type_checker([C1|C],[T1|T]) :-
	functor(C1,C2,Ar),
	(Ar=1->
	(arg(1,C1,A1),
	type(A1,T2),
	type(C2,T2),
	functor(T1,C2,Ar),arg(1,T1,T2));
	(Ar=2,
	arg(1,C1,A1),arg(2,C1,A2),
	type(A1,T2),type(A2,T3),
	type(C2,T2,T3),
	functor(T1,C2,Ar),arg(1,T1,T2),arg(2,T1,T3))),
	type_checker(C,T).

type(a,atom).
type(b,number).
type(c,string).

type(c1,atom,number).
type(c2,atom).
type(c3,number,string).

% types with a sentence

% eg types_to_sentence([c1(atom, number), c2(atom), c3(number, string), c4(string, atom)],S).
% S = "I converted the value from an atom to a number, checked it was an atom, then converted it to a string, then back to an atom."

types_to_sentence([],[]).
types_to_sentence(T,S) :-
	findall(T1b,(member(T1,T),
	((functor(T1,C2,2),arg(1,T1,A1),arg(2,T1,A2))->T1b=[C2,A1,A2];
	(functor(T1,C2,1),arg(1,T1,A1),T1b=[C2,A1]))),T2b),
	t2s(T2b,[],S1,T2b),foldr(string_concat,S1,S),!.
t2s([],S,S,_).
t2s([T1|T2b],S1,S2,SS) :-
	S1=[],
	(T1=[_,A1,A2]->(det(A1,DA1),det(A2,DA2),foldr(string_concat,["I converted the value from ",DA1," ",A1," to ",DA2," ",A2,""],S3));
	(T1=[_,A1]->(det(A1,DA1),foldr(string_concat,["I checked the value was ",DA1," ",A1,""],S3)))),
	append(S1,[S3],S4),
	t2s(T2b,S4,S2,SS).
	
t2s([T1],S1,S2,SS) :-
	not(S1=[]),
	(T1=[_,_A1,A2]->(det(A2,DA2),findall(X,member([_,X,_],SS),X1),(member(A2,X1)->W="back";W=""),foldr(string_concat,[", then ",W," to ",DA2," ",A2,"."],S3));
	(T1=[_,A1]->(det(A1,DA1),findall(X,member([_,X],SS),X1),(member(A1,X1)->W=" again";W=""),foldr(string_concat,[", then checked it was ",DA1," ",A1,W,"."],S3)))),
	append(S1,[S3],S4),
	t2s([],S4,S2,SS).

t2s([T1|T2b],S1,S2,SS) :-
	not(S1=[]),
	(T1=[_,_A1,A2]->(det(A2,DA2),foldr(string_concat,[", then converted it to ",DA2," ",A2,""],S3));
	(T1=[_,A1]->(det(A1,DA1),foldr(string_concat,[", checked it was ",DA1," ",A1,""],S3)))),
	append(S1,[S3],S4),
	t2s(T2b,S4,S2,SS).
	

det(atom,an).
det(number,a).
det(string,a).
 	
% 68 in total


