% ["Time Travel","Meditate to Time Travel 3.txt",0,algorithms,"34. *The time traveller gave feedback about the time travel company.  The time traveller gave feedback about those he visited."]

% Not time travelling, I walked to the end of the line.

:-include('../../listprologinterpreter/la_strings.pl').
:-include('../../listprologinterpreter/la_maths.pl').

% one_fill("           ",Ones1).
one_fill(Spaces,Ones1) :-
	string_length(Spaces,Length),
	numbers(Length,1,[],Numbers),
	findall("1",member(_Number,Numbers),
	Ones2),
	concat_list(Ones2,Ones1).
