% ["Computational English","COMPUTATIONAL ENGLISH by Lucian Green Narratology Diagram 2 of 4.txt",0,algorithms,"17.   *I, a philosopher, prepared to survive in the industry.  I did this by writing an essay.  First, I wrote the exposition.  Second, I wrote the critique.  Third, I added introduction and conclusion paragraphs to the start and end of the essay, respectively.  In this way, I, a philosopher, prepared to survive in the industry by writing an essay."]


% survive_philosophy(["statement 1","statement 2","statement 3"],["person 1","person 2","person 3"]).
/**
Attacks:
[statement 2,person 3]
**/
survive_philosophy(Philosophies,People) :-
	attacks(Philosophies,People,[],Attacks),
	writeln("Attacks:"),
	findall(_,(member(Attack,Attacks),
	writeln(Attack)),_).

attacks(Philosophies,People,Attacks1,Attacks2) :-
	((random(X),1 is ceiling(X*2))->
	(random_member(Philosophy,Philosophies),
	random_member(Person,People),
	append(Attacks1,[[Philosophy,Person]],Attacks3),
	% rebut attack here
	attacks(Philosophies,People,Attacks3,Attacks2));
	Attacks1=Attacks2).

