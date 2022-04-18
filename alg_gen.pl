% a b word c automate -> (word->word,automate->recurse) -> recurse(word)

% - word or automate used if only a b or c present (or same with another sent), otherwise asks which words to use * x
% collects words to note and discard (automatically discards connectives and any non-computational terms without brdict such as plus, variable, box, square, right, down),
% asks about new words x
% x discards conn and non comp words, asks about rest
% x *

% alg - takes previous status of word as arg or function, in previous relations (if has no function, then make function), if has no previous relation (and, a fn/arg) then ask
% x uses previous relations

% tech_dict.txt: automate,recurse, alg_dict.txt: [a, b, c, word,recurse],recurse(word)

:-include('../Text-to-Breasonings/text_to_breasonings.pl').
:-include('../listprologinterpreter/la_files.pl').

alg_gen :-

 phrase_from_file_s(string(File), "../Text-to-Breasonings/file.txt"),
 string_codes(File_string0,File),
 
 downcase_atom(File_string0,File_string1),
 split_string(File_string1,".\n\r",".\n\r",File_string3),
 
 % to delete connectives such as and, the
 open_file_s("connectives.txt",Connectives),

 open_file_s("tech_dict.txt",Tech_dict1),

 open_file_s("alg_dict.txt",Alg_dict1),

% * Recursively do it, replacing old tech dict entries

alg_gen1(File_string3,Connectives,Tech_dict1,Tech_dict2,Alg_dict1,Alg_dict2),

 save_file_s("tech_dict.txt",Tech_dict2),

 save_file_s("alg_dict.txt",Alg_dict2).

alg_gen1([],_Connectives,Tech_dict,Tech_dict,Alg_dict,Alg_dict) :- !.

alg_gen1(File_string3,Connectives,Tech_dict1,Tech_dict2,Alg_dict1,Alg_dict2) :-

 File_string3=[File_string3a|Rest],
 
 %findall(Words1j,(member(File_string3a,File_string3), 
  SepandPad="#@~%`$?-+*^,()|.:;=_/[]<>{}\n\r\s\t\\!'\"0123456789",
 split_string(File_string3a,SepandPad,SepandPad,File_string2),
 
 subtract(File_string2,Connectives,Words1f),

 findall(Words1e,(member(Words1c,Words1f),
 (member([Words1c,Words1d],Tech_dict1)->Words1e=Words1d;
 Words1e=Words1c)),Words1g1),
 
 % remove duplicates
 sort(Words1g1,Words1h),
 
 (member([Words1h,_A],Alg_dict1)->
 (Tech_dict1=Tech_dict3,Alg_dict1=Alg_dict3);
 (
 
 term_to_atom(Words1f,Words1g),
 
 foldr(string_concat,["What are the [Computational_words,Algorithm] for: ",Words1g,
 "\n","e.g. [[[\"word\",\"word\"],[\"automate\",\"recurse\"]], \"recurse(word)\"] ?"],"",Prompt),
 repeat,
 writeln(Prompt),
 read_string(user_input,"\n","\r",_,S),
 
 term_to_atom(S1,S),
 
 S1=[Computational_words,Algorithm],
 
 findall([A,B],(member([A,B],Computational_words)%,
 %(string_atom(A1,A),string_atom(B1,B))
 ),Computational_words1),

 findall(Words1e,(member(Words1c,Words1h),
 (member([Words1c,Words1d],Computational_words1)->
 Words1e=Words1d;
 Words1e=Words1c)),Words1j),
 %))),Words1k),
 
 sort(Words1j,Words1j1),
 % foldr(append,Words1k,[],Words1m),
 
 append(Tech_dict1,Computational_words,Tech_dict31),
 sort(Tech_dict31,Tech_dict3),
 append(Alg_dict1,[[Words1j1,Algorithm]],Alg_dict31),
 sort(Alg_dict31,Alg_dict3)
 )),

alg_gen1(Rest,Connectives,Tech_dict3,Tech_dict2,Alg_dict3,Alg_dict2),!.




