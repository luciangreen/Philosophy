% way_of_speaking1(["high-pitched","smiling"],Way).

way_of_speaking1(Properties,Expression):-
        Properties=[Item1a,Item1b],
        findall(Item2,
    	  (way_of_speaking(Item1a,Item2)),
        Items2a),
        sort(Items2a,Items2a1),
        findall(Item2,
    	  (way_of_speaking(Item1b,Item2)),
        Items2b),
        sort(Items2b,Items2b1),
        intersection(Items2a1,Items2b1,Expression).
        way_of_speaking("high-pitched","happy").
        way_of_speaking("high-pitched","unhappy").
        way_of_speaking("low-pitched","angry").
        way_of_speaking("smiling","happy").
        way_of_speaking("frowning","sad").

% wos should have 2 not 1 args