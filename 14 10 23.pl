% 14 10 23

% ["Medicine","MEDICINE by Lucian Green Grains, Nuts, Fruits and Vegetables 3 of 4.txt",0,algorithms,"30. I prepared to use the character again.  I did this by counting the character's appearances. First, I counted the character's appearance in the hallway.  Second, I counted the character's appearance in the attic.  Third, I counted the character's appearance in the luna (sic) driveway. In this way, I prepared to use the character again by counting the character's appearances."]

% (35*2)-33=37 for both days

% I prepared to use the character again.

% ?- split_on_non_alpha("abc 123 &*( ffg, g!",A).
% A = ["abc", "ffg", "g"].

:-include('../listprologinterpreter/la_strings.pl').

split_on_non_alpha(S1,S2):-
 string_strings(S1,S3),
 findall(S4,(member(S5,S3),(is_alpha(S5)->S5=S4;S4=" ")),S6),
 foldr(string_concat,S6,S7),
 SepandPad=" ",
 split_string(S7,SepandPad,SepandPad,S2),!.

	%SepandPad="&#@~%`$?-+*^,()|.:;=_/[]<>{}\n\r\s\t\\\"!'0123456789",

% ?- split_on_non_alpha_keep_quotes("\"Hello, dear's duckling.\"",A).
% A = ["Hello", "dear's", "duckling"].

% ?- split_on_non_alpha_keep_quotes("Andrew’s duckling.",A).
% A = ["Andrew’s", "duckling"].

split_on_non_alpha_keep_quotes(S1,S2):-
 string_strings(S1,S3),
 findall(S4,(member(S5,S3),(is_alpha_or_quotes(S5)->S5=S4;S4=" ")),S6),
 foldr(string_concat,S6,S7),
 SepandPad=" ",
 split_string(S7,SepandPad,SepandPad,S2),!.

is_alpha_or_quotes(A) :- is_alpha(A),!.
is_alpha_or_quotes("'") :- !.
is_alpha_or_quotes("’") :- !.

% 37-9=28

