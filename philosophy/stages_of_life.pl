stages_of_life(L) :-
	(writeln("Have you learnt spiritual meditation (y/n)?"),
	read_string(user_input,"\n","\r",_,S1),
	(S1="y"->
	(writeln("Have you breasoned out 80 breasonings that definitely worked (y/n)?"),
	read_string(user_input,"\n","\r",_,S21),
	(S21="y"->
	(writeln("Have you definitely breasoned out meditation arguments (y/n)?"),
	read_string(user_input,"\n","\r",_,S31),
	(S31="y"->
	(writeln("Have you definitely breasoned out the lecturer argument, allowing you to choose breasonings, not have breasonings chosen for you (y/n)?"),
	read_string(user_input,"\n","\r",_,S3),
	(S3="y"->
	(writeln("Have you definitely breasoned out the recordings argument, allowing you to mentally duplicate and project breasonings (y/n)?"),
	read_string(user_input,"\n","\r",_,S4),
	(S4="y"->
	(writeln("Have you definitely breasoned out medicine arguments, allowing you to definitely prevent a headache with spiritual means (y/n)?"),
	read_string(user_input,"\n","\r",_,S5),
	(S5="y"->
	(writeln("Have you definitely developed a set of algorithms that you have written down (y/n)?"),
	read_string(user_input,"\n","\r",_,S6),
	(S6="y"->
	(writeln("Have you definitely breasoned out the right number of breasonings for honours/masters/PhD (y/n)?"),
	read_string(user_input,"\n","\r",_,S7),
	(S7="y"->
	(writeln("Have you written 6/16/50 algorithms per day for Master/PhD/Professor (y/n)?"),
	read_string(user_input,"\n","\r",_,S8),
	(S8="y"->
(L="written 6/16/50 algorithms per day for Master/PhD/Professor");L="Breasoned out the right number of breasonings for honours/masters/PhD."));
	(L="Developed algorithms")));
	(L="Medicine arguments")));
	(L="Recordings argument")));
	(L="Lecturer argument")));
	(L="Meditation arguments")));
	(L="80 breasonings")));
	(L="Spiritual meditation")));
	(L="Not started yet"))).
