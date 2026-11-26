test2a :- findall(_,test2,_).
test2:-a(1,T),b(T).
test2:-T=false,b(T).
a(1,true).
b(true):-writeln(true).
b(false):- writeln(false).