% ["Short Arguments","God Algorithm.txt",0,algorithms,"5. I prepared to ask why why was.  I did this by stating that I knew the result of the God algorithm was why.  First, I noticed the occurrence of the event.  Second, I read the result of the God algorithm.  Third, I worked out that the result explained the occurrence."]

% * Second, I read the result of the God algorithm.

% Who is in your family?

% children, parents, grandparents, aunts, uncles, previous partners (), foster children (), alive/dead (), age (), start at top

family(Tree) :-
 writeln("Who is the oldest living parent in your family?"),
 read_string(user_input,"\n","\r",_,Top_person),
 partner_and_children(Top_person,Tree),!.

partner_and_children(Person,Children1) :-
 writeln(["Does",Person,"have a partner? (y/n)"]),
 read_string(user_input,"\n","\r",_,Partner1),
 (Partner1="n"->Children1=[];
 (writeln(["Who is the partner of",Person,"?"]),
 read_string(user_input,"\n","\r",_,Partner),
 children(Person,Partner,Children),
 Children1=[Person-Partner,Children])). 

children(Person,Partner,Children) :-
 writeln(["Do",Person,"and",Partner,"have any children? (y/n)"]),
 read_string(user_input,"\n","\r",_,Children1),
 (Children1="n"->Children=[];
 (writeln(["Who is the oldest child of",Person,"and",Partner,"?"]),
 read_string(user_input,"\n","\r",_,Child1),
 partner_and_children(Child1,Children3),
 children(Person,Partner,[[Child1,Children3]],Children))),!.

children(Person,Partner,Children1,Children2) :-
writeln(["Do",Person,"and",Partner,"have any more children? (y/n)"]),
 read_string(user_input,"\n","\r",_,Children10),
(Children10="n"->Children1=Children2;
 (writeln(["Who is the next oldest child of",Person,"and",Partner,"?"]),
 read_string(user_input,"\n","\r",_,Child1),
 partner_and_children(Child1,Children4),
 append(Children1,[[Child1,Children4]],Children3),
 children(Person,Partner,Children3,Children2))),!.

