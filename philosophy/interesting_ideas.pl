% ["Lecturer","Lecturer - Simulated Intelligence 3.txt",0,algorithms,"[""Green, L 2021, <i>Lecturer - Simulated Intelligence 3</i>, Lucian Academy Press, Melbourne."",""Green, L 2021"",1,""*Lecturer - Simulated Intelligence 3"]

% detect and order interesting ideas during the day

% interesting_ideas(["statement 1","statement 2","statement 3"],["comment 1","comment 2","comment 3"]).

/**

Ideas:
[3,35,statement 3,comment 2]
[21,18,statement 2,comment 2]

**/


interesting_ideas(Philosophies,Comments) :-
	ideas(Philosophies,Comments,[],Ideas1),
	sort(Ideas1,Ideas),
	writeln("Ideas:"),
	findall(_,(member(Idea,Ideas),
	writeln(Idea)),_).

ideas(Philosophies,Comments,Ideas1,Ideas2) :-
	((random(X),1 is ceiling(X*2))->
	(random_member(Hour,[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23]),
	random_member(Minute,[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59]),
	random_member(Philosophy,Philosophies),
	random_member(Comment,Comments),
	append(Ideas1,[[Hour,Minute,Philosophy,Comment]],Ideas3),
	% rebut attack here
	ideas(Philosophies,Comments,Ideas3,Ideas2));
	Ideas1=Ideas2).

