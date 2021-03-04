% ["Fundamentals of Meditation and Meditation Indicators","FUNDAMENTALS OF MEDITATION by Lucian Green Meditation Teacher Sutra 4 of 4.txt",0,algorithms,"42.   I prepared to observe life on planet Earth.  I did this by repeating the sutra.  First, I read the sutra in a book.  Alternatively, I listened to a teacher tell it to me.  Then, I repeated the sutra for twenty minutes twice per day.  In this way, I prepared to observe life on planet Earth by repeating the sutra."]

% I plotted the durations with time.

% time_chart([[1,4,"a"],[2,6,"b"],[5,10,"c"]],Chart).

/**

a ****

b  *****

c     ******

**/

:-include('../../../GitHub/listprologinterpreter/la_strings.pl').
:-include('../../../GitHub/listprologinterpreter/la_maths.pl').

time_chart(Data,Chart) :-

	% find maximum label length
	
	findall(Length,(member([_N1,_N2,Label1],Data),
	string_length(Label1,Length)),Lengths1),
	sort(Lengths1,Lengths2),
	reverse(Lengths2,[Maximum1|_Lengths3]),
	Maximum2 is Maximum1+1,
	
	% find time chart
	
	findall([Label2,Chart1],
	(member([N1,N2,Label1],Data),
	label(Label1,Maximum2,Label2),
	chart(N1,N2,Chart1)),Chart3),
	maplist(append,[Chart3],[Chart4]),
	concat_list(Chart4,Chart),
	writeln(Chart).

label(Label1,Maximum,Label2) :-
	string_length(Label1,Length1),
	Length2 is Length1+1,
	chars(Length2,Maximum," ",Spaces2),
	string_concat(Label1,Spaces2,Label2).
	
chars(Length2,Maximum,Char,Spaces2) :-
	numbers(Maximum,Length2,[],Numbers),
	findall(Char,(member(_Number,Numbers)),Spaces1),
	concat_list(Spaces1,Spaces2).
	
chart(N1,N2,Chart1) :-
	N11 is N1-1,
	chars(1,N11," ",Spaces1),
	chars(N1,N2,"*",Stars),
	concat_list([Spaces1,Stars,"\n\n"],Chart1).
