% ["Medicine","MEDICINE by Lucian Green Prevent Headaches on Train and a Bent Spine 3 of 4.txt",0,algorithms,"23.   I prepared to eat the soy fish.  I did this by providing Social Work service as breasonings currency.  First, I worked as a big social worker.  Second, I enamoured it lightly.  Third, I connected unrelatedness.  In this way, I prepared to eat the soy fish by providing Social Work service as breasonings currency."]

% ?- connect_unrelatedness([[a,b],[a,c],[d,e]],Other_connections),writeln(Other_connections).
% Other_connections = [[a,a],[a,d],[a,e],[b,a],[b,b],[b,c],[b,d],[b,e],[c,a],[c,b],[c,c],[c,d],[c,e],[d,a],[d,b],[d,c],[d,d],[e,a],[e,b],[e,c],[e,d],[e,e]]

connect_unrelatedness(Connections,Other_connections) :-
	collect_vars(Connections,Vars),
	findall([A,B],(member(A,Vars),member(B,Vars)),C),
	subtract(C,Connections,Other_connections).
		
collect_vars(Connections,Vars2) :-
	maplist(append,[Connections],[Vars1]),
	sort(Vars1,Vars2).
	