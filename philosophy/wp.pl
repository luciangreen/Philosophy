include:-('../../listprologinterpreter/la_maths.pl').

wp(T) :- writeln(["ESC to Quit"]),wp("",T).
wp(C,T) :-
	get_single_char(A),
	(A=27->C=T;
	(A=127->
	(C=""->wp(C,T);
	(string_concat(T1,B,C),
	string_length(B,1),
	write2(T1),%write(" "),
	wp(T1,T)));
	(A=13->
	(%string_concat(T1,B,C),
	%string_length(B,1),
	string_concat(C,"\n",T2),
	write2(T2),
	wp(T2,T));
	(char_code(B,A),
	string_concat(C,B,D),
	write2(D),
	wp(D,T))))),!.

	
write2(A) :-
	nls,write(A).
nls :-
	numbers(50,1,[],N),
	findall(_,(member(_,N),nl),_).