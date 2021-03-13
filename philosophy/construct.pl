% ["Computational English","COMPUTATIONAL ENGLISH by Lucian Green *Dereconstruction 4 of 4.txt",0,algorithms,"31.    I prepared to lead open-minded religious races.  I did this by becoming the open-minded religious leader.  First, I taught pedagogy for positive and negative medical reasons.  Second, I taught yoga for positive reasons.  Third, I taught yoga for negative positive reasons (in fact, another positive reason).  In this way, I prepared to lead open-minded religious races by becoming the open-minded religious leader."]

% Construct a building

% construct([1],[[1,[2,3,4,5]]],Result).
construct(Base,Materials,Result) :-  
	construct1(Base,Materials,[],Result).
construct1([],_Materials,Result,Result) :- !.
construct1(Base,Materials,Result1,Result2) :-
	Base=[B1|B2],
	trace,
	member([B1,Materials2],Materials),
	append(Result1,[[B1|Materials2]],Result3),
	construct1(B2,Materials,Result3,Result2).
