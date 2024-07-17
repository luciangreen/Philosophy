%:-dynamic test_n/1.

test_s2a :-

	retractall(num_s2a(_)),
	assertz(num_s2a(1)),

	retractall(vars_s2a(_)),
	assertz(vars_s2a([])),

	retractall(vars_base_s2a(_)),
	assertz(vars_base_s2a('A')),

	retractall(character_breakdown_mode(_)),
	assertz(character_breakdown_mode(off)),

 test_find_unique_variables,
 test_find_constants,
 test_spec_to_algorithm.
 

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




test_spec_to_algorithm :-
/*
	retractall(num_s2a(_)),
	assertz(num_s2a(1)),

	retractall(vars_s2a(_)),
	assertz(vars_s2a([])),

	retractall(vars_base_s2a(_)),
	assertz(vars_base_s2a('A')),
*/

findall(_,(member([N,S,
character_breakdown_mode=CBM],
[

[1, 
[
[[input,[['A',[1,2]]]],[output,[['B',[2,1]]]]],
[[input,[['A',[3,4]]]],[output,[['B',[4,3]]]]]
],character_breakdown_mode=off
],

[2, 
[
[[input,[['A',[1,2,3,2,3,1,2,3,2,3]]]],[output,[['B',[3]]]]],
[[input,[['A',[1,2,4,2,4,1,2,4,2,4]]]],[output,[['B',[4]]]]]
],
character_breakdown_mode=off
],
 
[3, 
[
[[input,[['A',[1]],['B',[2]]]],[output,[['C',[1]]]]],
[[input,[['A',[3]],['B',[4]]]],[output,[['C',[3]]]]]
],
character_breakdown_mode=off
],

[4, 
[
[[input,[['A',[[1]]],['B',[[2]]]]],[output,[['C',[[1,[]]]]]]],
[[input,[['A',[[3]]],['B',[[4]]]]],[output,[['C',[[3,[]]]]]]]
],
character_breakdown_mode=off
],

[5, 
[
[[input,[['A',[1,3]],['B',[2,3]]]],[output,[['C',[3]]]]],
[[input,[['A',[4,3]],['B',[5,3]]]],[output,[['C',[3]]]]]
],
character_breakdown_mode=off
],

[6, 
[
[[input,[['A',[[1]]],['B',[[2]]]]],[output,[['C',[[1,[[]]]]]]]],
[[input,[['A',[[3]]],['B',[[4]]]]],[output,[['C',[[3,[[]]]]]]]]
% [[]] not [] at end
],
character_breakdown_mode=off
],

[7, 
[
[[input,[['A',[[1]]],['B',[[2]]]]],[output,[['C',[[1]]]]]],
[[input,[['A',[[3]]],['B',[[4]]]]],[output,[['C',[[3]]]]]],
[[input,[['A',[[1,3]]],['B',[[1,4]]]]],[output,[['C',[[1]]]]]],
[[input,[['A',[[1,3]]],['B',[[1,4]]]]],[output,[['C',[[3]]]]]] % separate for find_constants
],
character_breakdown_mode=off
],

[8, 
[
[[input,[['A',[[1]]],['B',[[2]]]]],[output,[['C',[[1]]]]]],
[[input,[['A',[[3]]],['B',[[4]]]]],[output,[['C',[[3]]]]]],
[[input,[['A',[[1,1,1]]],['B',[[1,1,2]]]]],[output,[['C',[[1]]]]]],
[[input,[['A',[[1,1,3]]],['B',[[1,1,4]]]]],[output,[['C',[[3]]]]]],
[[input,[['A',[[1,3]]],['B',[[1,4]]]]],[output,[['C',[[1,3]]]]]],
[[input,[['A',[[1,3]]],['B',[[1,4]]]]],[output,[['C',[[1,3]]]]]]
],
character_breakdown_mode=off
],

[9,
[
[[input,[['A',[11,aa]],['B',["B",aa]]]],[output,[['C',[a1]]]]],
[[input,[['A',[44,aa]],['B',["C",aa]]]],[output,[['C',[a4]]]]]
],
character_breakdown_mode=on
],

[10,
[
[[input,[['A',[1,2]],['B',[3,2]]]],[output,[['C',[2]]]]],
[[input,[['A',[4,2]],['B',[5,2]]]],[output,[['C',[2]]]]]
],
character_breakdown_mode=on
],

[11,
[
[[input,[['A',[[["aa,]",b,"c",[]],1]]]]],[output,[['B',["aa,]",b]]]]],
[[input,[['A',[[["cc,]",d,"e",[]],1]]]]],[output,[['B',["cc,]",d]]]]]
],
character_breakdown_mode=off
],
% doesn't work with nested brackets in output yet
% can work with multiple specs to form variables and constants
% doesn't convert characters from upper to lower yet

[12,
[
[[input,[['A',[a,is,1,"+",1]]]],[output,[['B',[
[[n,"+"],[1,1,[v,a]]]]]]]],
[[input,[['A',[b,is,3,"+",4]]]],[output,[['B',[
[[n,"+"],[3,4,[v,b]]]]]]]],
[[input,[['A',[a,is,1,"-",1]]]],[output,[['B',[
[[n,"-"],[1,1,[v,a]]]]]]]],
[[input,[['A',[b,is,3,"-",4]]]],[output,[['B',[
[[n,"-"],[3,4,[v,b]]]]]]]]
],
character_breakdown_mode=off
],
% actually a converter
% decision trees as the alg being converted, recursion with series of decision trees in DFA
% can't recognise upper and lower case as the same character yet

[13,
[
[[input,[['A',[1,2]]]],[output,[['B',[21]]]]], [[input,[['A',[3,4]]]],[output,[['B',[43]]]]]
],
character_breakdown_mode=on
],

[14,
[
[[input,[['A',[1+2]]]],[output,[['B',[21]]]]], [[input,[['A',[3+4]]]],[output,[['B',[43]]]]]
],
character_breakdown_mode=on
],

[15,
[
[[input,[['A',["1+2"]]]],[output,[['B',[21]]]]], [[input,[['A',["3+4"]]]],[output,[['B',[43]]]]]
],
character_breakdown_mode=on
],


[16,
[
[[input,[['A',"Ci"]]],[output,[['B','C']]]],
[[input,[['A',"Di"]]],[output,[['B','D']]]]
],
character_breakdown_mode=on
],


[17,
[
[[input,[['A',["A is 1+2,B is A+3."]]]],[output,[['B',[[[+,[1,2,[lower,["A"]]]],[+,[[lower,["A"]],3,[lower,["B"]]]]]]]]]],
[[input,[['A',["C is 3+4,D is C+3."]]]],[output,[['B',[[[+,[3,4,[lower,["C"]]]],[+,[[lower,["C"]],3,[lower,["D"]]]]]]]]]]
],
character_breakdown_mode=on
],

[18,
[
[[input,[['A',"1232312323"]]],[output,[['B',"2"]]]],
[[input,[['A',"1434314343"]]],[output,[['B',"4"]]]]
],
character_breakdown_mode=on
]




]),

	
	
((	%retractall(test_n(_)),
	%assertz(test_n(N)),

	%catch(call_with_time_limit(10,
	(spec_to_algorithm(S,CBM,_Alg1))
	%)%,
    %time_limit_exceeded,
    %fail)

%writeln1(spec_to_algorithm(S,Alg1))

%Alg=Alg1
)->R=success;R=fail),
 writeln([R,N,spec_to_algorithm,test])),_),!.


