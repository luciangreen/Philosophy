test_s2a :-

	retractall(num_s2a(_)),
	assertz(num_s2a(1)),

	retractall(vars_s2a(_)),
	assertz(vars_s2a([])),

	retractall(vars_base_s2a(_)),
	assertz(vars_base_s2a('A')),

 test_find_unique_variables,
 test_find_constants.
 

test_find_unique_variables :-

	%retractall(vars_base_s2a(_)),
	%assertz(vars_base_s2a('A')),

findall(_,(member([N,S,UV2],
[
[1,[['A', [1, 3]]],
 [['A', ['A1', 'A2']]]],

[2,[['A',[1,3,1]]],
 [['A',['A1','A2','A1']]]]

]),
/*
	retractall(num_s2a(_)),
	assertz(num_s2a(1)),

	retractall(vars_s2a(_)),
	assertz(vars_s2a([])),
*/
 ((find_unique_variables(S,UV1),
 
 %writeln1(find_unique_variables(S,UV1)),
 
 UV1=UV2)->R=success;R=fail),
 writeln([R,N,find_unique_variables,test])),_),!.



test_find_constants :-


findall(_,(member([N,S1,C2],
[

[1, [[['A',[3]],['B',[3]]],[['A',[4]],['B',[6]]]],
[['A',['C1']],['B',['C2']]]],

[2, [[['A',[1]],['B',[1]]],[['A',[1]],['B',[1]]]],
[['A',[1]],['B',[1]]]],

[3, [[['A',[1,3]],['B',[1,3]]],[['A',[1,4]],['B',[1,6]]]],
[['A',[1,'C1']],['B',[1,'C2']]]],

[4,
[[['A',[1,3]],['B',[2,3]]],[['A',[5,4]],['B',[5,6]]]],
[['A',['C1','C2']],['B',['C3','C4']]]]


 
]),

	findall(RS2,(member(S2,S1),
	
	%retractall(num_s2a(_)),
	%assertz(num_s2a(1)),
	%retractall(vars_s2a(_)),
	%assertz(vars_s2a([])),
	% vars base
	
	find_unique_variables(S2,UV),
	findall([UV1,RS],(member([UV1,UV2],UV),
	find_lists3b(UV2,RS)
	),RS2)
	),RS1),
	
((find_constants(S1,RS1,C1),

%writeln1(find_constants(S1,RS1,C1)),

C1=C2)->R=success;R=fail),
 writeln([R,N,find_constants,test])),_),!.
