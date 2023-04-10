:-include('../listprologinterpreter/listprolog.pl').
%substring("abcd",A,B,C,SS).
substring(T,Before,Length,After,SS) :-
 string_chars(T,TC),
 %substring1(TC,Before,Length,After,SS).
%substring1(T,Before,Length,After,SS) :-
 length(TC,TL),
 numbers(TL,0,[],TLN),
 substring2(TC,TLN,Before,Length,After,SS).
%substring2(T,_TLN,_Length,_After,_SS):-string_length(T,0).
substring2(T,TLN,Before,Length,After,SS):-
 length(T,TL2),
 numbers(TL2,0,[],TLN2),
 ((TLN=[Before|Rest],
 member(Length,TLN2),
 After is TL2-Length,
 length(SS1,Length),
 append(SS1,_,T),
 string_chars(SS,SS1),
 (Rest=[]->!;true));
 (%string_chars(T,TC),
 TLN=[_|Rest],
 %(Rest=[]->true;
 (length(C,1),
 append(C,T2,T),
 %length(T2,T2L),
 %numbers(T2L,0,[],T2LN),
 %Rest=[0]->true;
 substring2(T2,Rest,Before,Length,After,SS)))).
 