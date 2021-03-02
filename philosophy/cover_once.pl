% ["Fundamentals of Pedagogy and Pedagogy Indicators","FUNDAMENTALS OF PEDAGOGY by Lucian Green Two Uses 19 of 30.txt",0,algorithms,"181.	DION: *The subject shouldn't differentiate the same point about the object in the essay (where the subject wrote the piece with others, like being given or giving the object with one hand and writing with the other)."]

% cover_once(["object 1","object 2"],[["object 1",["distinction 1","distinction 2"]],["object 2",["distinction 3"]]]).

/**

object 1
distinction 1
distinction 2

object 2
distinction 3

**/

cover_once(Objects,Differentiations) :-
	findall(_,(member(Object,Objects),
	nl,
	writeln(Object),
	member([Object,Differentiations1],Differentiations),
	member(Differentiation,Differentiations1),
	writeln(Differentiation)),_).
