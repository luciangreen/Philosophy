% ["Fundamentals of Pedagogy and Pedagogy Indicators","PEDAGOGY INDICATORS by Lucian Green Higher Grades 1 of 3.txt",0,algorithms,"9. I prepared to use all the As up.  I did this by stating that the Lucianic doctor used a pedagogical perspective to read the number of As per body system.  First, I counted the first A.  Second, I prepared counted the next A.  Third, I repeated this until I had counted all the As.  In this way, I prepared to use all the As up by stating that the Lucianic doctor used a pedagogical perspective to read the number of As per body system."]

% Use all items up.

% use_up([1,5,6,4],[1,5,7,8,9],Result).
% Result = false

% use_up([1,5,6,4],[1,5,6,8,4],Result).
% Result = true

use_up(Items_used,All_items,Result) :-
	(subtract(Items_used,All_items,[])->Result=true;Result=false).
	
	
