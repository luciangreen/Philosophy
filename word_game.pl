:-include('../listprologinterpreter/listprolog.pl').

word_game :-
 writeln("Player 1, please enter the word for player 2 to guess without showing them."),
 read_string(user_input,"\n","\r",_,S),
 nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl,
 string_codes(S,C),
 findall(C2,(member(C1,C),string_codes(C2,[C1])),S2),
 length(S2,N),
 numbers(N,1,[],S1),
 N2 is 20,
 word_game1(S1,S2,N2).
 
%word_game(Numbers,Correct_letters,Tries_left)
word_game1(_,S,0) :- writeln("You lost!"),write("The word was "),foldr(string_concat,S,"",S1),writeln(S1),!.
word_game1(S,S,_) :- writeln("You won!"),write("The word was "),foldr(string_concat,S,"",S1),writeln(S1),!.
word_game1(S,S1,N) :-
 repeat,
 writeln("Player 2, please enter e.g. 1,a where 1 is the position number and a is the letter."),
 writeln(S),
 read_string(user_input,"\n","\r",_,S2),
 split_string(S2,", ",", ",[N1,L1]),
 number_string(N2,N1),
 
 get_item_n(S1,N2,L2),
 (L1=L2->
 (writeln("Correct!"),
 put_item_n(S,N2,L1,S3),
 N0 is N-1,
 word_game1(S3,S1,N0))
 ;
 (writeln("Incorrect!"),
 N0 is N-1,
 word_game1(S,S1,N0))),!.
 

 