% ["Lecturer","Lecturer 2.txt",0,algorithms,"31. Only some parts were supported.  I wrote on ethics.  I investigated privacy in mind reading.  I investigated protecting myself and breasoning things out.  I found the that medicine worked."]

% All items in the list are supported.

% all_supported([1,3,4,5],[[1,6],[3,8],[5,7]],Result).
% Result=false.

% all_supported([1,3,4,5],[[1,6],[3,8],[4,10],[5,7]],Result).
% Result=true.

all_supported(Items,List,Result) :-
	(forall(member(Item,Items),member([Item,_],List))->Result=true;Result=false).