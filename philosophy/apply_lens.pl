% ["Computational English","COMPUTATIONAL ENGLISH by Lucian Green *Lenses 3 of 4.txt",0,algorithms,"[""Green, L 2021, <i>Lenses 3 of 4</i>, Lucian Academy Press, Melbourne."",""Green, L 2021"",1,""COMPUTATIONAL ENGLISH"]

% Ask for the result of applying a random lens to an idea

% apply_lens("program finder",["Computational English","optimisation","miniature version","use"],A1).

% the use for program finder is to look up values from a table

apply_lens(Idea,Lenses,Result):-
        random_member(Lens,Lenses),
        write("What is the result of applying "),
        write(Lens),
        write(" to "),
        write(Idea),
        writeln("?"),
        read_string(user_input, "\n", "\r", _End2, Result).