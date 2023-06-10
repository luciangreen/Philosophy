/*

append hierarchy traversal

- get first and last items
- get items either side and at next instance of item
- multiple possibilities (using above as functions)
- multiple items per line

x grammars process all data, don't skip data

instead, write fns to find next instance of item (single levelled data)

- patterns such as *,(,*,N,*,),*,.,*
- reverse - right justify
- multiple items per space in patterns

- a zig zag tree with multiple items coming left or right from last point

eg
lr_tree(
[
[l 111],
   [[r 222],
          [[l 00]
           [l 01]
          ]
   ]
],
Code
).

can convert lp to pl later
 
*/

:-include('../listprologinterpreter/listprolog.pl').
:-include('../Prolog-to-List-Prolog/pretty_print_lp2p.pl').

:-dynamic var_at/1.

/*
append_tree(Tree,Code) :-
 

pattern(Line,Code) :-
 Line=[Direction|Pattern]
 (Direction=l->DC=[];(get_var_at(Var), % delete l
 CD=[[[n,reverse],[[v,*],Var]]])),
 */
get_var_at(Var) :-
 var_at(N1),
 N2 is N1+1,
 retractall(var_at(_)),
 assertz(var_at(N2)),
 atom_concat('v',N1,N3),
 Var=[v,N3].

% eg data

/*

E=[a,b,b,c]
append(A,B1,E),
append(b,C1,B1),
append(B2,D1,C1),
append(c,C,D1)

- 

*/
 
% convert lines to append tree specs

/*
[a,*1=[b],*2=[b],c]
*/

%  like caw, it finds l, r spec

% convert append tree specs to code


% simple form: finds code in common for l,r data, returns excerpts

% data2at([["abbc","bb"],["addc","dd"]],Code).

% X:
% Spec = [[a,*1,*2,c],[*1,*2]] x
% Spec = [[a,*1,c],[*1]]

% data2at([["abbebc","b"],["addededfc","f"]],Code).

% X:
% Spec = [[a,*1,c],[*1 x]],[[*1,r],[*2,e,*3],[*3]] x
% Spec = [[a,[r,*2,e,*3],c],[*3]]

/*
                                                              data2at([["abc","b"]],Code),findall(_,(member(C,Code),pp_lp2p0(C,D),writeln(D)),_).
                                                              data2at([["abbc","bb"]],Code),findall(_,(member(C,Code),pp_lp2p0(C,D),writeln(D)),_).

data2at([["abc","b"],["zxy","x"]],Code),findall(_,(member(C,Code),pp_lp2p0(C,D),writeln(D)),_).

*/


data2at(Lines,Code) :-
 findall(Code,(member(Line,Lines),data2at1(Line,Code)),Code1),
 sort(Code1,Code2),Code2=[Code].%,_].
data2at1(Line,Code) :-
 retractall(var_at(_)),
 assertz(var_at(1)),

 Line=[Line1,Result1],
 string_strings(Line1,Line2),
 string_strings(Result1,Result2),
%trace,
 findall(N,(member(L2,Result2),get_n_item(Line2,L2,N)),Ns),
 sort(Ns,Ns1),
 append([Min],_,Ns1),
 append(_,[Max],Ns1),
 Min1 is Min-1,
 Max1 is Max+1,
 %trace,
 get_item_n(Line2,Min1,G1),
 get_item_n(Line2,Max1,G2),
 GGs=[G1,G2],
 get_var_at(V),
 get_var_at(V2),
 
 %length(Result2,L),
 numbers(2,1,[],Ls),

 %trace,
 findall([[n,get_item_n],[V2,L1,V1]],(member(L1,Ls),get_var_at(V1)),Gs),
 findall([GGG,GGGG],(member(L1,Ls),get_item_n(GGs,L1,GGG),get_item_n(Gs,L1,[[n,get_item_n],[_,_,GGGG]])),G1s),
%trace,
 data2at21(Line2,Result2,V,Gs,Code3,G1s,V3),
 Code=[[[n,a],[V,V2,V3],":-",Code3]].
data2at21(Line,Result,V,Code1,Code2,G1s,V3) :-
 data2at2(Line,Result,V,l,Code1,Code2,G1s,V3).
data2at21(Line,Result,V,Code1,Code2,G1s,V3) :-
 reverse(Line,Line1),
 data2at2(Line1,Result,V,r,Code1,Code2,G1s,V3).
data2at2(Line,Result,V,Dir,Code1,Code2,G1s,V3) :-
 append_line(Line,Code,V,V1,Dir,Results,Spaces,G1s,V3),
 /*
findall(Results3,(find_combos(Results,Results,[],Results3)%,flatten(Results1,Results3)
 ),Results2),
 */
 %sort(Results21,Results2),
 %trace,
 flatten(Results,Results2),
 data2at31(Result,Results2,%Results2,
 Code,Spaces,V1,Code1,Code2,V3).
data2at2(Line,Result,V,Dir,Code1,Code2,G1s,V3) :-
 append_line(Line,Code,V,V1,Dir,Results,Spaces,-,V3),
 /*
findall(Results3,(find_combos(Results,Results,[],Results3)%,flatten(Results1,Results3)
 ),Results2),
 */
 %sort(Results21,Results2),
 %trace,
 flatten(Results,Results2),
 data2at32(Result,Results2,%Results2,
 Code,Spaces,V1,Code1,Code2,G1s).
data2at31(Result,Results2,Code,_Spaces,_V1,Code1,Code2,V3) :-
%writeln(member(Result,Results2)),
 %member(Result,Results2),
 Result=Results2,
 %trace,
 foldr(append,[Code1,Code],Code2).
data2at32(Result,Results2,Code,Spaces,V1,Code1,Code2,G1s) :- 
 not(member(Result,Results2)),
 member(Space,Spaces),
 foldr(append,[Code1,Code],Code3),
 data2at21(Space,Result,V1,Code3,Code2,G1s,V3).
 
find_combos(_,_,Combos,Combos).
find_combos(S1,S,Combos1,Combos2) :-
 S1=[_|S2],
 member(Switch,S),
 append(Combos1,[Switch],Combos3),
 find_combos(S2,S,Combos3,Combos2).
 
append_line(Line,Code,V,V6,Dir,Results1,Spaces1,G1s,V7) :-
 not(G1s=(-)),
 G1s=[[B,BV],[C,CV]],
 append(_A,B1,Line),
 append([B],C1,B1),
 append(B2,D1,C1),
 append([C],C2,D1),
 find_rev(Dir,D_code,V,V1),
 %(Dir=l->(D_code=[],V=V1);
 %(get_var_at(V1),
 %D_code=[[[n,reverse],[V,V1]]])),
 get_var_at(V2),
 get_var_at(V3),
 get_var_at(V4),
 get_var_at(V5),
 get_var_at(V6),
 get_var_at(V7),
 
 Code1=
 [
 [[n,append],[V2,V3,V1]],
 [[n,append],[[BV],V4,V3]],
 [[n,append],[%B2
 V7,V5,V4]],
 [[n,append],[[CV],V6,V5]]
 ],
 
 %trace,
 foldr(append,[D_code,Code1],Code),
 %foldr(append,Code2,Code),

 Results=[%A,[B],
 B2%,[C]
 ],
 foldr(append,Results,Results1),

 Spaces=[C2],
 foldr(append,Spaces,Spaces1).

append_line(Line,Code,V,V6,Dir,Results1,Spaces1,-,_) :-
 append(_A,B1,Line),
 append([B],C1,B1),
 append(B2,D1,C1),
 append([C],C2,D1),
 find_rev(Dir,D_code,V,V1),
 %(Dir=l->(D_code=[],V=V1);
 %(get_var_at(V1),
 %D_code=[[[n,reverse],[V,V1]]])),
 get_var_at(V2),
 get_var_at(V3),
 get_var_at(V4),
 get_var_at(V5),
 get_var_at(V6),
 get_var_at(V7),
 
 Code1=
 [
 [[n,append],[V2,V3,V1]],
 [[n,append],[[B],V4,V3]],
 [[n,append],[%B2
 V7,V5,V4]],
 [[n,append],[[C],V6,V5]]
 ],
 
 %trace,
 foldr(append,[D_code,Code1],Code),
 %foldr(append,Code2,Code),

 Results=[%A,[B],
 B2%,[C]
 ],
 foldr(append,Results,Results1),

 Spaces=[C2],
 foldr(append,Spaces,Spaces1).

find_rev(Dir,D_code,V,V1) :-
 Dir=l,
 D_code=[],V=V1.
find_rev(Dir,D_code,V,V1) :-
 Dir=r,
 get_var_at(V1),
 D_code=[[[n,reverse],[V,V1]]].
