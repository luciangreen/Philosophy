% ["Medicine","MEDICINE by Lucian Green Pedagogy Course Plan 2 of 4.txt",0,algorithms,"17. *I prepared to become famous.  I did this by writing the Distinctions song argument.  First, I was a philosopher in a University subject.  Second, the student was given 50 As in the subject and to be a helped pedagogue.  Third, the pedagogy helper helped the student.  In this way, I prepared to become famous by writing the Distinctions song argument."]

% Find new algorithms.

/**

combo of algs

what the alg is - phil desc - verb(object)

how it will work

data


?- find_new_algorithms.
Computational English
Creating and Helping Pedagogues
Fundamentals of Meditation and Meditation Indicators
Fundamentals of Pedagogy and Pedagogy Indicators
Medicine
Lecturer
Short Arguments
Mind Reading
Time Travel
Delegate workloads, Lecturer, Recordings
Enter Book of algorithm:
|: Lecturer
Meditation.txt
Lecturer 2.txt
Computer Science.txt
Lecturer Communication.txt
Medicine.txt
Lecturer - Pedagogy Helper.txt
Lecturer Metaphysics.txt
Lecturer Societology.txt
Lecturer - Lecturer Pedagogy.txt
Lecturer - Pedagogy.txt
Lecturer Simulated Intelligence cont'd 2.txt
Lecturer Hermeneutics.txt
Lecturer Simulated Intelligence cont'd.txt
Lecturer - Simulated Intelligence.txt
Lecturer Lucianism.txt
Lecturer Culturology.txt
Lecturer.txt
Lecturer Rhetoric 2.txt
Lecturer Gay Studies.txt
Politics.txt
Lecturer - Comments.txt
People Values.txt
English.txt
Linguistics.txt
Lecturer - Recordings Pedagogy.txt
History.txt
Lecturer Rhetoric.txt
Philosophy:Computational English.txt
Psychology.txt
Lecturer Popology.txt
Lecturer - Simulated Intelligence 2.txt
Lecturer - Simulated Intelligence 3.txt
Enter Essay of algorithm:
|: Meditation.txt
1
Enter paragraph number of algorithm :
|: 1
1
Enter sentence number of algorithm :
|: 2
Enter what the algorithm is (verb(object)), how it will work and its data:
|: v(o3),here,now
true.


**/

:-include('../../Lucian-Academy/folders.pl').
%:-include('../../Lucian-Academy/la_com1.pl').
:-include('../../listprologinterpreter/la_strings.pl').
:-include('../../listprologinterpreter/la_strings_string.pl').
:-include('../../listprologinterpreter/la_files.pl').

find_new_algorithms :-

		phrase_from_file_s(string(String00a), "combo_of_algs.txt"),
		string_codes(String02b,String00a),
		atom_to_term(String02b,Algorithms,[]),

		folders(Courses1),
		findall(_,(member(Course,Courses1),
		writeln(Course)),_),
		
		repeat,
		writeln("Enter Book of algorithm:"),
		read_string(user_input,"\n","\r",_,B),
		member(B,Courses1),
		
		repeat,
		get_essays(B,Texts1),
		findall(_,(member(Text,Texts1),
		writeln(Text)),_),
		writeln("Enter Essay of algorithm:"),
		read_string(user_input,"\n","\r",_,E),
		member(E,Texts1),

		repeat,
		findall([B,E|Rest1],member([B,E|Rest1],Algorithms),Algorithms1a),
		sort(Algorithms1a,Algorithms1a2),
		findall(PN2,member([B,E,PN2|_],Algorithms),Algorithms1b),
		sort(Algorithms1b,Algorithms1),
		findall(_,(member(A,Algorithms1),
		writeln(A)),_),
		writeln("Enter paragraph number of algorithm :"),
		read_string(user_input,"\n","\r",_,PN),
		number_string(PN1,PN),

		repeat,
			findall([B,E,PN1|Rest2],member([B,E,PN1|Rest2],Algorithms1a2),Algorithms1c),
		sort(Algorithms1c,Algorithms1c2),
		findall(SN2,member([B,E,PN1,SN2|_],Algorithms1a2),Algorithms1d),
		sort(Algorithms1d,Algorithms2),
		findall(_,(member(A,Algorithms2),
		writeln(A)),_),
		writeln("Enter sentence number of algorithm :"),
		read_string(user_input,"\n","\r",_,SN),
		number_string(SN1,SN),
		
		repeat,
			%findall([B,E,PN1,SN1|Rest2],member([B,E,PN1,SN1|Rest2],Algorithms1c2),Algorithms1e),
		%sort(Algorithms1e,Algorithms1e2),
		findall(WHD2,member([B,E,PN1,SN1,WHD2|_],Algorithms1c2),Algorithms1f),
		sort(Algorithms1f,Algorithms3),
		findall(_,(member(A,Algorithms3),
		writeln(A)),_),
		writeln("Enter what the algorithm is (verb(object)), how it will work and its data:"),
		read_string(user_input,"\n","\r",_,WHD),
		
	append(Algorithms,[[B,E,PN1,SN1,WHD]],Algorithms4),
	term_to_atom(Algorithms4,String02a_b),
	string_atom(String02a_c,String02a_b),

	(open_s("combo_of_algs.txt",write,Stream1),
	write(Stream1,String02a_c),
	close(Stream1)),!.
		
get_essays(Dept,G) :-
	concat_list(["../../Lucian-Academy/",Dept,"/"],Dept1),
	directory_files(Dept1,F),
	delete_invisibles_etc(F,G).
