% ["Medicine","MEDICINE by Lucian Green 250 Breasonings 4 of 4.txt",0,algorithms,"38. *I prepared to enjoy the hibiscuses bloom.  I did this by using the sprinkler to water the garden.  First, I placed the sprinkler in position.  Second, I turned the tap on.  Third, I watered the garden.  In this way, I prepared to enjoy the hibiscuses bloom by using the sprinkler to water the garden."]

% Vector drawing app

vector_drawing :-
	retractall(rectangles(_)),
	vector_drawing1.

vector_drawing1 :-
	writeln("What is X1 in ((X1,Y1),(X2,Y2)) in the rectangle"),
	read_string(user_input,"\n","\r",_,X11),
	number_string(X1,X11),
	writeln("What is Y1 in ((X1,Y1),(X2,Y2)) in the rectangle"),
	read_string(user_input,"\n","\r",_,Y11),
	number_string(Y1,Y11),
	writeln("What is X2 in ((X1,Y1),(X2,Y2)) in the rectangle"),
	read_string(user_input,"\n","\r",_,X21),
	number_string(X2,X21),
	writeln("What is Y2 in ((X1,Y1),(X2,Y2)) in the rectangle"),
	read_string(user_input,"\n","\r",_,Y21),
	number_string(Y2,Y21),
	writeln([(X1,Y1),(X2,Y2)]),
	assertz(rectangles([(X1,Y1),(X2,Y2)])),
	writeln("c-continue or q-quit:"),
	read_string(user_input,"\n","\r",_,CQ),
	(CQ="c"->vector_drawing1;
	(CQ="q"->(findall(R,rectangles(R),Rs),writeln(Rs)))).