% ["Fundamentals of Pedagogy and Pedagogy Indicators","PEDAGOGY INDICATORS by Lucian Green Aigs for Pedagogy Helper 1 of 3.txt",0,algorithms,"7.    *I experienced the stages of life.  I did this by observing that the meditator pedagogy professor coordinated the Aigs, then stopped and looked at the images and was given images of the rest of the Aigs.  First, I found the Aig.  Second, I looked at it.  Third, I was given the rest of them."]


/**

?- stages_of_life(L).
Have you learnt spiritual meditation (y/n)?
|: n
L = "Not started yet".

?- stages_of_life(L).
Have you learnt spiritual meditation (y/n)?
|: y
Have you breasoned out 80 breasonings that definitely worked (y/n)?
|: n
L = "Spiritual meditation".

?- stages_of_life(L).
Have you learnt spiritual meditation (y/n)?
|: y
Have you breasoned out 80 breasonings that definitely worked (y/n)?
|: y
Have you definitely breasoned out meditation arguments (y/n)?
|: n
L = "80 breasonings".

?- stages_of_life(L).
Have you learnt spiritual meditation (y/n)?
|: y
Have you breasoned out 80 breasonings that definitely worked (y/n)?
|: y
Have you definitely breasoned out meditation arguments (y/n)?
|: y
Have you definitely breasoned out the lecturer argument, allowing you to choose breasonings, not have breasonings chosen for you (y/n)?
|: n
L = "Meditation arguments".

?- stages_of_life(L).
Have you learnt spiritual meditation (y/n)?
|: y
Have you breasoned out 80 breasonings that definitely worked (y/n)?
|: y
Have you definitely breasoned out meditation arguments (y/n)?
|: y
Have you definitely breasoned out the lecturer argument, allowing you to choose breasonings, not have breasonings chosen for you (y/n)?
|: y
Have you definitely breasoned out the recordings argument, allowing you to mentally duplicate and project breasonings (y/n)?
|: n
L = "Lecturer argument".

?- stages_of_life(L).
Have you learnt spiritual meditation (y/n)?
|: y
Have you breasoned out 80 breasonings that definitely worked (y/n)?
|: y
Have you definitely breasoned out meditation arguments (y/n)?
|: y
Have you definitely breasoned out the lecturer argument, allowing you to choose breasonings, not have breasonings chosen for you (y/n)?
|: y
Have you definitely breasoned out the recordings argument, allowing you to mentally duplicate and project breasonings (y/n)?
|: y
Have you definitely breasoned out medicine arguments, allowing you to definitely prevent a headache with spiritual means (y/n)?
|: n
L = "Recordings argument".

?- stages_of_life(L).
Have you learnt spiritual meditation (y/n)?
|: y
Have you breasoned out 80 breasonings that definitely worked (y/n)?
|: y
Have you definitely breasoned out meditation arguments (y/n)?
|: y
Have you definitely breasoned out the lecturer argument, allowing you to choose breasonings, not have breasonings chosen for you (y/n)?
|: y
Have you definitely breasoned out the recordings argument, allowing you to mentally duplicate and project breasonings (y/n)?
|: y
Have you definitely breasoned out medicine arguments, allowing you to definitely prevent a headache with spiritual means (y/n)?
|: y
Have you definitely developed a set of algorithms that you have written down (y/n)?
|: n
L = "Medicine arguments".

?- stages_of_life(L).
Have you learnt spiritual meditation (y/n)?
|: y
Have you breasoned out 80 breasonings that definitely worked (y/n)?
|: y
Have you definitely breasoned out meditation arguments (y/n)?
|: y
Have you definitely breasoned out the lecturer argument, allowing you to choose breasonings, not have breasonings chosen for you (y/n)?
|: y
Have you definitely breasoned out the recordings argument, allowing you to mentally duplicate and project breasonings (y/n)?
|: y
Have you definitely breasoned out medicine arguments, allowing you to definitely prevent a headache with spiritual means (y/n)?
|: y
Have you definitely developed a set of algorithms that you have written down (y/n)?
|: y
Have you definitely breasoned out the right number of breasonings for honours/masters/PhD (y/n)?
|: n
L = "Developed algorithms".

?- stages_of_life(L).
Have you learnt spiritual meditation (y/n)?
|: y
Have you breasoned out 80 breasonings that definitely worked (y/n)?
|: y
Have you definitely breasoned out meditation arguments (y/n)?
|: y
Have you definitely breasoned out the lecturer argument, allowing you to choose breasonings, not have breasonings chosen for you (y/n)?
|: y
Have you definitely breasoned out the recordings argument, allowing you to mentally duplicate and project breasonings (y/n)?
|: y
Have you definitely breasoned out medicine arguments, allowing you to definitely prevent a headache with spiritual means (y/n)?
|: y
Have you definitely developed a set of algorithms that you have written down (y/n)?
|: y
Have you definitely breasoned out the right number of breasonings for honours/masters/PhD (y/n)?
|: y
Have you written 6/16/50 algorithms per day for Master/PhD/Professor (y/n)?
|: y
L = "written 6/16/50 algorithms per day for Master/PhD/Professor".

?- stages_of_life(L).
Have you learnt spiritual meditation (y/n)?
|: y
Have you breasoned out 80 breasonings that definitely worked (y/n)?
|: y
Have you definitely breasoned out meditation arguments (y/n)?
|: y
Have you definitely breasoned out the lecturer argument, allowing you to choose breasonings, not have breasonings chosen for you (y/n)?
|: y
Have you definitely breasoned out the recordings argument, allowing you to mentally duplicate and project breasonings (y/n)?
|: y
Have you definitely breasoned out medicine arguments, allowing you to definitely prevent a headache with spiritual means (y/n)?
|: y
Have you definitely developed a set of algorithms that you have written down (y/n)?
|: y
Have you definitely breasoned out the right number of breasonings for honours/masters/PhD (y/n)?
|: y
Have you written 6/16/50 algorithms per day for Master/PhD/Professor (y/n)?
|: n
L = "Breasoned out the right number of breasonings for honours/masters/PhD.".

**/

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
