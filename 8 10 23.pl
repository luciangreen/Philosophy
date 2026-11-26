% 8 10 23

% 34 algs

find_alg(list([a1,an]),list([f(a1),f(an)]),maplist(f)).
find_alg(list([a1,an]),b,list([f(a1,f(an,b))],foldr(f))).

% alg noumenon - ontolog are 2 parts going together, can be merged into 1 pred
% not waste of time bec can be rapidly found

% natural language to find algs
% endpoints' (see below)

% a -b, -c do U to do computation not endpoints lower down
% U is decompose, build in rec preds

% use ontol connection with a -b (one branching point per level) for U
% and not or subpreds

:-include('7 10 23.pl').

% ontol_conn(a,[[a,[b,c]],[b,[]],[c,[d]],[d,[]]],Alg).
% Alg = [a, b, c, d].

% ontol_conn(w,[[w,[x,y]],[x,[]],[y,[z]],[z,[]]],Alg).
% Alg = [w, x, y, z].

% ontol_conn("A-B",[["A-B",["B","C"]],["B",[]],["C",["D"]],["D",[]]],Alg).
% Alg = ["A-B", "B", "C", "D"].

% ontol_conn(cake,[[cake,[water,batter]],[water,[]],[batter,[flour]],[flour,[]]],Alg).
% Alg = [cake, water, batter, flour].

% ontol_conn(john,[[john,[mary,sue]],[mary,[]],[sue,[david]],[david,[]]],Alg).
% Alg = [john, mary, sue, david].

% ontol_conn("a:-b.",[["a:-b.",["b:-c."]],["b:-c.",["d."]],["d.",[]]],Alg).
% Alg = ["a:-b.", "b:-c.", "d."].

ontol_conn(A,Tree,Alg3):-
 findall(Alg,path1(A,A,Tree,[],Alg),Alg1),
 flatten(Alg1,Alg2),
 list_to_set(Alg2,Alg3).

path1(First,_A,Tree,A0,A1) :-
 member([First,[]],Tree),
 %member(Second1,Second),
 append(A0,[First],A1).
 %path1(Second1,A,Tree,A2,A1).
path1(First,A,Tree,A0,A1) :-
 member([First,Second],Tree),
 member(Second1,Second),
 append(A0,[First],A2),
 path1(Second1,A,Tree,A2,A1).

% natural language to find algs

% nl2alg([a,via,b],[[a,[]],[a,[b,c]],[b,[]],[c,[d]],[d,[]]],Alg).

% Alg = [a, b, c, d].

% nl2alg([w,via,x],[[w,[x,y]],[x,[]],[y,[z]],[z,[]]],Alg).
% Alg = [w, x, y, z].

% nl2alg(["A-B",via,"C"],[["A-B",["B","C"]],["B",[]],["C",["D"]],["D",[]]],Alg).
% Alg = ["A-B", "B", "C", "D"].

% nl2alg([cake,via,water],[[table,[cake]],[cake,[water,batter]],[water,[]],[batter,[flour]],[flour,[]]],Alg).
% Alg = [cake, water, batter, flour].

% nl2alg([sue,via,david],[[john,[mary,sue]],[mary,[]],[sue,[david]],[david,[]]],Alg).
% Alg = [sue, david].

% nl2alg(["a:-b.",via,"d."],[["a:-b.",["b:-c."]],["b:-c.",["d."]],["d.",[]]],Alg).
% Alg = ["a:-b.", "b:-c.", "d."].

nl2alg([A,via,B],Tree,Alg) :-
 ontol_conn(A,Tree,Alg),
 member(B,Alg),!.

% 34-18=16

% find regions of texts with co-occurring terms

% co_occurring_terms(Ns).
% Ns = [[4, 5], [3, 5], [2, 3], [1, 5], [1, 3]].

text(1,"a b c d").
text(2,"w x y z").
text(3,"a b x").
text(4,"j k m").
text(5,"a j").

co_occurring_terms(Ns) :-
 findall([N1,N2],(text(N1,A),text(N2,B),split_string(A," "," ",A1),split_string(B," "," ",B1),not(N1=N2),intersection(A1,B1,C),not(C=[])),Ns1),foldr(del_reflections,Ns1,[],Ns).

del_reflections([A,B],Ns2,Ns3) :-
 delete(Ns2,[B,A],Ns4),append(Ns4,[[A,B]],Ns3).

% 16-8=8

% alg that reduces descr to simple alg

reduce("find dependencies",
["find cycles","find non-cycles under cycle item",
"find dependencies and cycles bottom-up"]).

reduce("cultural translation tool",
["translate page","repeat until correct translation"]).

optimise("databaseformulafinder",foldr).
optimise("Simple-List-Prolog-to-List-Prolog",maplist).
optimise("Logic-Formula-Finder",foldr).
optimise("Program-Finder-from-Data-",maplist).
optimise("Combination-Algorithm-Writer",foldr).
optimise("Program-Finder-from-Data-",maplist).
