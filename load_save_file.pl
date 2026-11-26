/*

How can I save and load data files in Prolog?

How can I quickly save and load data files in Prolog, for use with games?

Save files with save(File_name,Term), where File_name is the file name in folder folder_name and Term is a compound containing the data file.

    ?- save("file_name.txt",[[["player_name","Harold"],["score",10],["symbol",key_word]],[["player_name","Queenie"],["score",20],["symbol",schema]]]).

Load files with load(File_name,Term), where File_name is the file name in folder folder_name and Term is the contents loaded from the file.

    ?- load("file_name.txt",Term),writeln1(Term).
    Term=[[["player_name","Harold"],["score",10],["symbol",key_word]],[["player_name","Queenie"],["score",20],["symbol",schema]]]


Using the code below you can save and load data files in Prolog.

    % save("file_name.txt",[[["player_name","Harold"],["score",10],["symbol",key_word]],[["player_name","Queenie"],["score",20],["symbol",schema]]]).

*/
    
    save(File_name,Term) :-
        string_concat("folder_name/",File_name,Path),
        term_to_atom(Term,Atom),
        string_atom(String,Atom),
        (open_s(Path,write,Stream1),
        write(Stream1,String),
        close(Stream1)),!.
    
    % load("file_name.txt",Term).
    
    load(File_name,Term) :-
        File_name="file_name.txt",
        string_concat("folder_name/",File_name,Path),
        phrase_from_file_s(string(Codes),Path),
        string_codes(String,Codes),
        atom_to_term(String,Term,[]).
    
    open_s(File,Mode,Stream) :-
        atom_string(File1,File),
        open(File1,Mode,Stream),!.
    
    string_atom(String,Atom) :-
        atom_string(Atom,String),!.
    
    phrase_from_file_s(string(Output), String) :-
        atom_string(String1,String),
        phrase_from_file(string(Output), String1),!.
    
    string(String) --> list(String).
    
    list([]) --> [].
    list([L|Ls]) --> [L], list(Ls).
        
    writeln1(Term) :-
        term_to_atom(Term,Atom),
        writeln(Atom),!.    
   
/*

See also string to list (test 15) in List Prolog at `https://github.com/luciangreen/listprologinterpreter/blob/master/lpiverify4.pl`, which does the same thing as atom_to_term//3.  The predicates above replace the need for using long grammars, however I have posted answers on "My long SWI-Prolog grammar keeps on failing" (`https://stackoverflow.com/questions/52559339/my-long-swi-prolog-grammar-keeps-on-failing`) and "I can't get my Prolog DCG working with atom concat" (`https://stackoverflow.com/questions/54374105/i-cant-get-my-prolog-dcg-working-with-atom-concat`) for those who are interested.

*/