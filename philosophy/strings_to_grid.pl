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
	numbers(Y,1,[],YN),
	numbers(X,1,[],XN),
	findall([X1,Y1,String3],(member(Y1,YN),
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
	numbers(Y,1,[],YN),
	numbers(X,1,[],XN),

	findall(_,(member(Y1,YN),
	nl,
	member(X1,XN),
	member([X1,Y1,Pixel1],Grid),
	(Pixel1=[*]->Pixel="*";Pixel=" "),
	write(Pixel)),_).
	
print_grid(Grid,X,Y,Z) :-
	numbers(Y,1,[],YN),
	numbers(X,1,[],XN),
	numbers(Z,1,[],ZN),

	findall(_,(member(Z1,ZN),
	nl,nl,
	member(Y1,YN),
	nl,
	member(X1,XN),
	member([Z1,X1,Y1,Pixel1],Grid),
	(Pixel1=[*]->Pixel="*";Pixel=" "),
	write(Pixel)),_).
	
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
	numbers(Levels,1,[],LN),
	
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
	numbers(Y,1,[],YN),
	numbers(X,1,[],XN),
	findall([Level,X1,Y1,String3],(member(Y1,YN),
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
	