% ["Computational English","COMPUTATIONAL ENGLISH by Lucian Green Philosophical Computational English 1 of 4.txt",0,algorithms,"3.     *I prepared to lead the person.  I did this by hugging the thinking head.  First, I asked the lady whether I could touch her head.  Second, I placed my left hand on one side on her head.  Third, I placed my right hand on the other side of her head.  In this way, I prepared to lead the person by hugging the thinking head."]

% I overtook the person.

% overtake([3,4,5,7,6],6,4,Result).
% Result=[3,6,4,5,7].

overtake(List1,Person,Person_to_overtake,Result) :-
	delete(List1,Person,List2),
	append(List3,[Person_to_overtake|List4],List2),
	maplist(append,[[List3,[Person],[Person_to_overtake|List4]]],[Result]),!.


