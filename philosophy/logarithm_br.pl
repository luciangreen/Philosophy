% ["Fundamentals of Pedagogy and Pedagogy Indicators","PEDAGOGY INDICATORS by Lucian Green A Greater Number Of Successful Job Applications 3 of 3.txt",0,algorithms,"39.   *I prepared to breason it out in 32 days.  I did this by stating that I knew the successful job applicant.  First, I asked the job applicant how she earned the job.  Second, I listened to her say she learned Pedagogy.  Third, I listened to her say she breasoned out 100 specific As for the job application.  In this way, I prepared to breason it out in 32 days by stating that I knew the successful job applicant."]

% Calculate efficient number of breasonings needed for non-pedagogy.

/**

?- logarithm_br(100000,N).                                                      [5,*250 breasonings]
N = 5.

?- logarithm_br(10000,N).
[4,*250 breasonings]
N = 4.

?- logarithm_br(8000,N).
[4,*250 breasonings]
N = 4.

?- logarithm_br(100,N).
N = 100.

**/

logarithm_br(N,N) :-
	N=<1000,!.
logarithm_br(N1,N2) :-
	N2 is ceiling((log(N1)/log(10))),
	writeln([N2,"*250 breasonings"]).