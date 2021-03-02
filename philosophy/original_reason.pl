/**
["Computational English","COMPUTATIONAL ENGLISH by Lucian Green Symbols 3 of 4.txt",0,algorithms,"25.  *I prepared to connect deconstruction with supplement by stating the meaning had an original reason.  I did this by connecting Derrida’s deconstruction with Lucian’s philosophy.  First, I found the supplement (secondary thought from the following that is original or natural) of pedagogy was oppressiveness (freedom).  Second, I found the supplement of medicine was reaching nothingness.  Third, I found the supplement of meditation (philosophy) was bliss.  In this way, I prepared to connect deconstruction with supplement by stating the meaning had an original reason by connecting Derrida’s deconstruction with Lucian’s philosophy."]

[debug]  ?- original_reason(W,M,R).
W = banana,
M = medication,
R = watch ;
W = banana,
M = medication,
R = eat ;
W = apple,
M = medication,
R = watch ;
W = apple,
M = medication,
R = eat ;

**/

original_reason(Word,Meaning,Reason) :- word(Word), meaning(Meaning),forall(true,not(meaning(Word,Meaning))),reason(Reason),forall(true,not(reason(Meaning,Reason))).

word(banana).
word(apple).
meaning(medication).
meaning(fruit).
reason(watch).
reason(eat).

meaning(apple,fruit).
meaning(banana,fruit).
reason(medication,cure).
reason(fruit,eat).