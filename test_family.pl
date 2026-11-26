:-include('../Prolog-to-List-Prolog/p2lpconverter.pl').
%:-include('../SSI-1d011c3148fcfb6edd02292b0151fa9aa858848d/ssi.pl').
:-include('../SSI/ssi.pl').
%:-include('../listprologinterpreter/listprolog.pl').
:-include('family_sols.pl').
:-include('family_test.pl').

test_family :-
 %working_directory1(A,A),
 %working_directory1(_,"../"),
 %fastp2lp("family_sols.pl",Functions),
 
 p2lpconverter([file,"family_sols.pl"],Functions1),
 p2lpconverter([file,"family_test.pl"],Functions2),
 
 append(Functions1,Functions2,Functions3),

 Debug=on,
 
 lucianpl(Debug,[[n,family_test]],Functions3,[[]]).