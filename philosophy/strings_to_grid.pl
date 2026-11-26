/**

strings_to_grid([
"***********",
"*         *",
"*** *** ***",
"*         *",
"* * *** ***",
"* *       *",
"***********"
],Grid),writeln1(Grid).

***********
*         *
*** *** ***
*         *
* * *** ***
* *       *
***********

change to maze format v
**/

:-include('../../listprologinterpreter/la_strings.pl').
:-include('../../listprologinterpreter/la_maths.pl').

strings_to_grid(Strings,Grid) :-
	process_strings(Strings,Strings2),
	length(Strings2,Y),
	Strings2=[String1|_],
	length(String1,X),
	numbers(Y,1,[],YN1),
	reverse(YN1,YN),
	numbers(X,1,[],XN),
	findall([X1,Y11,String3],(member(Y1,YN),Y11 is Y-Y1+1,
	get_item_n(Strings2,Y1,String),
	member(X1,XN),
	get_item_n(String,X1,String2),
	(String2="*"->String3=[*];String3=[])
	),Grid),
	print_grid(Grid,X,Y).

process_strings(Strings,Strings2) :-
	findall(String2,(member(String,Strings),
	process_strings1(String,[],String2)),Strings2).

process_strings1("",String,String) :- !.
process_strings1(String,String1,String2) :-
	string_concat(String3,String4,String),
	string_length(String3,1),
	append(String1,[String3],String5),
	process_strings1(String4,String5,String2).

print_grid(Grid,X,Y) :-
	numbers(Y,1,[],YN1),
	reverse(YN1,YN),
	numbers(X,1,[],XN),

	findall(_,(member(Y1,YN),
	nl,
	member(X1,XN),
	member([X1,Y1,Pixel1],Grid),
	(Pixel1=[*]->Pixel="*";Pixel=" "),
	write(Pixel)),_).
	
print_grid(Grid,X,Y,Z) :-
	numbers(Y,1,[],YN1),
	reverse(YN1,YN),
	numbers(X,1,[],XN),
	numbers(Z,1,[],ZN1),
	reverse(ZN1,ZN),


	findall(_,(member(Z1,ZN),
	nl,nl,
	member(Y1,YN),
	nl,
	member(X1,XN),
	member([Z1,X1,Y1,Pixel1],Grid),
	(Pixel1=[*]->Pixel="*";Pixel=" "),
	write(Pixel)),_).
	
% X2, Y2 are person co-ords

/**

?- Map=[[2,2,[]],[3,2,[]],[4,2,[]],[5,2,[]],[6,2,[]],[4,3,[]],[6,3,[]],[2,4,[]],[3,4,[]],[4,4,[]],[6,4,[]],[4,5,[]],[2,6,[]],[3,6,[]],[4,6,[]],[5,6,[b]],[6,6,[a]],[2,1,[*]],[3,1,[*]],[4,1,[*]],[5,1,[*]],[6,1,[*]],[2,7,[*]],[3,7,[*]],[4,7,[*]],[5,7,[*]],[6,7,[*]],[1,1,[*]],[1,2,[*]],[1,3,[*]],[1,4,[*]],[1,5,[*]],[1,6,[*]],[1,7,[*]],[7,1,[*]],[7,2,[*]],[7,3,[*]],[7,4,[*]],[7,5,[*]],[7,6,[*]],[7,7,[*]],[3,3,[*]],[5,3,[*]],[3,5,[*]],[5,5,[*]],[2,3,[*]],[5,4,[*]],[2,5,[*]],[6,5,[*]]],print_map(Map,7,5,2,2).

[*]	[*]	[*]	[*]	[*]	[*]	[*]	
[*]	[+]	[]	[]	[]	[]	[*]	
[*]	[*]	[*]	[]	[*]	[]	[*]	
[*]	[]	[]	[]	[*]	[]	[*]	
[*]	[*]	[*]	[]	[*]	[*]	[*]	

**/
	
print_map(Grid1,X,Y,X2,Y2) :-
	member([X2,Y2,Pixel1],Grid1),
	append(Pixel1,[+],Pixel2),
	delete(Grid1,[X2,Y2,_],Grid2),
	append(Grid2,[[X2,Y2,Pixel2]],Grid),
	
	numbers(Y,0,[],YN1),
	reverse(YN1,YN),
	numbers(X,0,[],XN),

	findall(_,(member(Y1,YN),
	nl,
	member(X1,XN),
	member([X1,Y1,Pixel],Grid),
	%(Pixel1=[*]->Pixel="*";Pixel=" "),
	write(Pixel),write("\t")),_),
	nl.

print_map_path(Grid1,X,Y,X2,Y2) :-
	member([X2,Y2,Pixel1],Grid1),
	append(Pixel1,[+],Pixel2),
	delete(Grid1,[X2,Y2,_],Grid2),
	append(Grid2,[[X2,Y2,Pixel2]],Grid3),
	
	findall([X3,Y3],path([X3,Y3]),Path),
	print_map_path1(Grid3,Grid,Path),
	
	numbers(Y,0,[],YN1),
	reverse(YN1,YN),
	numbers(X,0,[],XN),

	findall(_,(member(Y1,YN),
	nl,
	member(X1,XN),
	member([X1,Y1,Pixel],Grid),
	%(Pixel1=[*]->Pixel="*";Pixel=" "),
	write(Pixel),write("\t")),_),
	nl.
	
print_map_path1(Grid,Grid,[]) :- !.
print_map_path1(Grid1,Grid,Path) :-
	Path=[[X,Y]|Path2],
	member([X,Y,Pixel1],Grid1),
	append(Pixel1,[-],Pixel2),
	delete(Grid1,[X,Y,_],Grid2),
	append(Grid2,[[X,Y,Pixel2]],Grid3),
	print_map_path1(Grid3,Grid,Path2).

% X2, Y2, Z2 are person co-ords

/**

?- Map=[[1,1,1,[*]],[1,2,1,[*]],[1,3,1,[*]],[1,1,2,[*]],[1,2,2,[*]],[1,3,2,[*]],[1,1,3,[*]],[1,2,3,[*]],[1,3,3,[*]],[2,1,1,[*]],[2,2,1,[*]],[2,3,1,[*]],[2,1,2,[*]],[2,2,2,[]],[2,3,2,[*]],[2,1,3,[*]],[2,2,3,[*]],[2,3,3,[*]],[3,1,1,[*]],[3,2,1,[*]],[3,3,1,[*]],[3,1,2,[*]],[3,2,2,[*]],[3,3,2,[*]],[3,1,3,[*]],[3,2,3,[*]],[3,3,3,[*]]],print_map(Map,3,3,3,2,2,2).

[*]	[*]	[*]	
[*]	[*]	[*]	
[*]	[*]	[*]	


[*]	[*]	[*]	
[*]	[+]	[*]	
[*]	[*]	[*]	


[*]	[*]	[*]	
[*]	[*]	[*]	
[*]	[*]	[*]	

**/

print_map(Grid1,X,Y,Z,X2,Y2,Z2) :-
	member([Z2,X2,Y2,Pixel1],Grid1),
	append(Pixel1,[+],Pixel2),
	delete(Grid1,[Z2,X2,Y2,_],Grid2),
	append(Grid2,[[Z2,X2,Y2,Pixel2]],Grid),

	numbers(Y,0,[],YN1),
	reverse(YN1,YN),
	numbers(X,0,[],XN),
	numbers(Z,0,[],ZN1),
	reverse(ZN1,ZN),

	findall(_,(member(Z1,ZN),
	nl,nl,
	member(Y1,YN),
	nl,
	member(X1,XN),
	member([Z1,X1,Y1,Pixel],Grid),
	%(Pixel1=[*]->Pixel="*";Pixel=" "),
	write(Pixel),write("\t")),_),
	nl.

print_map_path3d(Grid1,X,Y,Z,X2,Y2,Z2) :-
	member([Z2,X2,Y2,Pixel1],Grid1),
	append(Pixel1,[+],Pixel2),
	delete(Grid1,[Z2,X2,Y2,_],Grid2),
	append(Grid2,[[Z2,X2,Y2,Pixel2]],Grid3),
	
	findall([Z3,X3,Y3],path([Z3,X3,Y3]),Path),
	print_map_path3d1(Grid3,Grid,Path),
	
	numbers(Y,0,[],YN1),
	reverse(YN1,YN),
	numbers(X,0,[],XN),
	numbers(Z,0,[],ZN1),
	reverse(ZN1,ZN),

	findall(_,(member(Z1,ZN),
	nl,nl,
	member(Y1,YN),
	nl,
	member(X1,XN),
	member([Z1,X1,Y1,Pixel],Grid),
	%(Pixel1=[*]->Pixel="*";Pixel=" "),
	write(Pixel),write("\t")),_),
	nl.
	
print_map_path3d1(Grid,Grid,[]) :- !.
print_map_path3d1(Grid1,Grid,Path) :-
	Path=[[Z,X,Y]|Path2],
	member([Z,X,Y,Pixel1],Grid1),
	append(Pixel1,[-],Pixel2),
	delete(Grid1,[Z,X,Y,_],Grid2),
	append(Grid2,[[Z,X,Y,Pixel2]],Grid3),
	print_map_path3d1(Grid3,Grid,Path2).
		
% 8 3 21

/**

strings_to_grid3d([
[
"***********",
"***********",
"***********",
"***********",
"***********",
"***********",
"***********"
],
[
"***********",
"*         *",
"*** *** ***",
"*         *",
"* * *** ***",
"* *       *",
"***********"
],
[
"***********",
"*         *",
"*** **  ***",
"*    *    *",
"* * **  ***",
"* *       *",
"***********"
],
[
"***********",
"***********",
"***********",
"***********",
"***********",
"***********",
"***********"
]
]
,_).

***********
***********
***********
***********
***********
***********
***********


***********
*         *
*** *** ***
*         *
* * *** ***
* *       *
***********


***********
*         *
*** **  ***
*    *    *
* * **  ***
* *       *
***********


***********
***********
***********
***********
***********
***********
***********

**/

strings_to_grid3d(Strings,Grid) :-
	length(Strings,Levels),
	numbers(Levels,1,[],LN1),
	reverse(LN1,LN),
	
	Strings=[Strings_1|_],
	length(Strings_1,Y),
	Strings_1=[String_2|_],
	string_length(String_2,X),

	findall(Grid2,(member(Level,LN),
	get_item_n(Strings,Level,String),
	process_strings(String,Strings2),
	length(Strings2,Y),
	Strings2=[String1|_],
	length(String1,X),
	numbers(Y,1,[],YN1),
	reverse(YN1,YN),
	numbers(X,1,[],XN),
	findall([Level1,X1,Y11,String3],(member(Y1,YN),Y11 is Y-Y1+1,
	Level1 is Levels-Level+1,
	get_item_n(Strings2,Y1,String4),
	member(X1,XN),
	get_item_n(String4,X1,String2),
	(String2="*"->String3=[*];String3=[])
	),Grid2)%,
	%print_grid(Grid2,X,Y)
	),Grid3),
	%trace,
	maplist(append,[Grid3],[Grid]),
	print_grid(Grid,X,Y,Levels).
	
get_map_dimensions2d(Map) :- %,X3,Y3,Z3) :-
	findall(X,member([X,_Y1,_],Map),X1),
	sort(X1,X2),reverse(X2,[X3|_]),
	findall(Y,member([_X1,Y,_],Map),Y1),
	sort(Y1,Y2),reverse(Y2,[Y3|_]),
	retractall(map_dimensions(_)),
	assertz(map_dimensions([X3,Y3])).
	
get_map_dimensions(Map) :- %,X3,Y3,Z3) :-
	findall(X,member([_Z1,X,_Y1,_],Map),X1),
	sort(X1,X2),reverse(X2,[X3|_]),
	findall(Y,member([_Z2,_X1,Y,_],Map),Y1),
	sort(Y1,Y2),reverse(Y2,[Y3|_]),
	findall(Z,member([Z,_X2,_Y2,_],Map),Z1),
	sort(Z1,Z2),reverse(Z2,[Z3|_]),
	retractall(map_dimensions(_)),
	assertz(map_dimensions([X3,Y3,Z3])).
