:-include('../listprologinterpreter/listprolog.pl').

zero_based_budgeting :-

writeln("List all income sources."),

% findall_until_fail(B,member(B,[true,true,false,true]),B,D).
% D = [true,true] .

findall_until_fail([A5,A4],(repeat,writeln("source-($)value <return>, repeat then <return> to finish."),read_string(user_input,"\n","\r",_,A),split_string(A,"- $,","- $,",A2),((once(append(A3,[A41],A2)),number_string(A4,A41),foldr(string_concat,A3,A5))->true;A="")),not(A=""),C),

nl,

findall(A,member([_,A],C),A6),
foldr(plus,A6,A7),
write("Total income: $"),writeln(A7),nl,


writeln("List all expenditure sources."),

writeln("Categories include rent, groceries, utilities, entertainment, other and x."),

% findall_until_fail(B,member(B,[true,true,false,true]),B,D).
% D = [true,true] .
%trace,
findall_until_fail([A5,A41,A51],(repeat,writeln("source-($)value-category <return>, repeat then <return> to finish."),read_string(user_input,"\n","\r",_,A),split_string(A,"- $,","- $,",A2),((once((append(B1,B2,A2),not(B1=[]),append([A4],B4,B2))),number_string(A41,A4),foldr(string_concat,B1,A5),foldr(string_concat,B4,A51))->true;A="")),not(A=""),C1),

nl,

findall([A3,A1,A2],member([A1,A2,A3],C1),A61),
sort(A61,A62),

%trace,
delete(A62,["x",_,_],A63),
findall(A,member([_,_,A],A63),A64),
foldr(plus,A64,A71),

write("Total expenditure: $"),writeln(A71),
A72 is A7-A71,
write("Income - expenditure = $"),writeln(A72),!.

