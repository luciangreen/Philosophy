% Move to Text-to-Breasonings folder

% ["Creating and Helping Pedagogues","CREATE AND HELP PEDAGOGUES by Lucian Green Daily Professional Requirement of the Pedagogy Helper 2 of 5.txt",0,algorithms,"19.    *I observed that an Aig containing an infinary (sic) number of breasonings was given to the writer, where infinary means an infinite-like number where one can see all the numbers.  I did this by stating that the pedagogy helper helped Aigs to be somewhere.  First, I observed the writer.  Second, I observed the reader.  Third, I observed that everyone was happy""]"]

% Picture to pixel per line of text.

:-include("../listprologinterpreter/la_strings.pl").

/**
pixels(
[[1,9,[     ]],[2,9,[     ]],[3,9,[     ]],[4,9,[     ]],[5,9,[     ]],
 [1,8,[     ]],[2,8,[r    ]],[3,8,[     ]],[4,8,[     ]],[5,8,[     ]],
 [1,7,[r    ]],[2,7,[y    ]],[3,7,[r    ]],[4,7,[     ]],[5,7,[     ]],
 [1,6,[     ]],[2,6,[r    ]],[3,6,[     ]],[4,6,[     ]],[5,6,[     ]],
 [1,5,[     ]],[2,5,[g    ]],[3,5,[     ]],[4,5,[     ]],[5,5,[     ]],
 [1,4,[     ]],[2,4,[g    ]],[3,4,[     ]],[4,4,[     ]],[5,4,[     ]],
 [1,3,[     ]],[2,3,[g    ]],[3,3,[     ]],[4,3,[     ]],[5,3,[     ]],
 [1,2,[     ]],[2,2,[     ]],[3,2,[     ]],[4,2,[     ]],[5,2,[     ]],
 [1,1,[     ]],[2,1,[     ]],[3,1,[     ]],[4,1,[     ]],[5,1,[     ]]],
Text).

pixels( [[1,9,[     ]],[2,9,[     ]],[3,9,[     ]],[4,9,[     ]],[5,9,[     ]],  [1,8,[     ]],[2,8,[r    ]],[3,8,[     ]],[4,8,[     ]],[5,8,[     ]],  [1,7,[r    ]],[2,7,[y    ]],[3,7,[r    ]],[4,7,[     ]],[5,7,[     ]],  [1,6,[     ]],[2,6,[r    ]],[3,6,[     ]],[4,6,[     ]],[5,6,[     ]],  [1,5,[     ]],[2,5,[g    ]],[3,5,[     ]],[4,5,[     ]],[5,5,[     ]],  [1,4,[     ]],[2,4,[g    ]],[3,4,[     ]],[4,4,[     ]],[5,4,[     ]],  [1,3,[     ]],[2,3,[g    ]],[3,3,[     ]],[4,3,[     ]],[5,3,[     ]],  [1,2,[     ]],[2,2,[     ]],[3,2,[     ]],[4,2,[     ]],[5,2,[     ]],  [1,1,[     ]],[2,1,[     ]],[3,1,[     ]],[4,1,[     ]],[5,1,[     ]]], Text). 

Text = "[1,9,[]]\n[2,9,[]]\n[3,9,[]]\n[4,9,[]]\n[5,9,[]]\n[1,8,[]]\n[2,8,[r]]\n[3,8,[]]\n[4,8,[]]\n[5,8,[]]\n[1,7,[r]]\n[2,7,[y]]\n[3,7,[r]]\n[4,7,[]]\n[5,7,[]]\n[1,6,[]]\n[2,6,[r]]\n[3,6,[]]\n[4,6,[]]\n[5,6,[]]\n[1,5,[]]\n[2,5,[g]]\n[3,5,[]]\n[4,5,[]]\n[5,5,[]]\n[1,4,[]]\n[2,4,[g]]\n[3,4,[]]\n[4,4,[]]\n[5,4,[]]\n[1,3,[]]\n[2,3,[g]]\n[3,3,[]]\n[4,3,[]]\n[5,3,[]]\n[1,2,[]]\n[2,2,[]]\n[3,2,[]]\n[4,2,[]]\n[5,2,[]]\n[1,1,[]]\n[2,1,[]]\n[3,1,[]]\n[4,1,[]]\n[5,1,[]]\n".

**/

pixels(Pixels,Text) :-
	findall([Text1,"\n"],(member(Item,Pixels),
	term_to_atom(Item,Text1)),Text2),
	maplist(append,[Text2],[Text3]),
	concat_list(Text3,Text).