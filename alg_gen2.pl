% #4

/*

?- alg_gen.
a is not in dictionary.  Is it computational (y/n)?
|    y
What is the command name for a (<return> for the same)?
|    
The sentence: "a" has the computational terms:
1 - a
What is the number of the main computational term?
|    1
What is the algorithm note for a?
|    a=b
true.

*/

% test then put q skips

% for 80 algs

% a b word c automate -> (word->word,automate->recurse) -> recurse(word)

% - word or automate used if only a b or c present (or same with another sent), otherwise asks which words to use * x
% collects words to note and discard (automatically discards connectives and any non-computational terms without brdict such as plus, variable, box, square, right, down),
% asks about new words x
% x discards conn and non comp words, asks about rest
% x *
% *** x records computational, discarded terms x

% alg - takes previous status of word as arg or function, in previous relations (if has no function, then make function), if has no previous relation (and, a fn/arg) then ask
% x uses previous relations
% *** x records weightings of and uses algs (notes string) for single computational terms (also uses dict1 for converting to comp terms)

% tech_dict.txt: automate,recurse, alg_dict.txt: [a, b, c, word,recurse],recurse(word) x

% *** alg_gen_dict1.txt [add,sum], alg_gen_dict2.txt [sum,1,"1+1=2"]

:-include('../Text-to-Breasonings/text_to_breasonings.pl').
:-include('../listprologinterpreter/la_files.pl').

alg_gen :-

 phrase_from_file_s(string(File), "../Text-to-Breasonings/file.txt"),
 string_codes(File_string0,File),
 
 downcase_atom(File_string0,File_string1),
 split_string(File_string1,".\n\r",".\n\r",File_string3),
 
 % to delete connectives such as and, the
 % open_file_s("connectives.txt",Connectives),

 open_file_s("alg_gen_dict1.txt",Alg_gen_dict1),

 open_file_s("alg_gen_dict2.txt",Alg_gen_dict2),

% * Recursively do it, replacing old dict entries
 alg_gen1(File_string3,Alg_gen_dict1,Alg_gen_dict1a,Alg_gen_dict2,Alg_gen_dict2a),
 
 save_file_s("alg_gen_dict1.txt",Alg_gen_dict1a),

 save_file_s("alg_gen_dict2.txt",Alg_gen_dict2a).
 
 
alg_gen1([],Alg_gen_dict1,Alg_gen_dict1,Alg_gen_dict2,Alg_gen_dict2) :- !.
alg_gen1(File_string3,Alg_gen_dict1,Alg_gen_dict1a,Alg_gen_dict2,Alg_gen_dict2a) :-

 File_string3=[File_string3a|Rest],
 %findall(Words1j,(member(File_string3a,File_string3), 
 SepandPad="#@~%`$?-+*^,()|.:;=_/[]<>{}\n\r\s\t\\!'\"0123456789",
 split_string(File_string3a,SepandPad,SepandPad,File_string2),

 repeat,

 alg_gen2(File_string2,Alg_gen_dict1,Alg_gen_dict1b,
 Alg_gen_dict2,Alg_gen_dict2b,
 [],Alg_gen_dict3b,New_flag
 ),
 
% if a word is new, asks for the main term in the sentence, otherwise determines it from weights
%trace,
((not(var(New_flag)),New_flag=true)->
(
term_to_atom(File_string3a,File_string3a1),
length(Alg_gen_dict3b,L),
numbers(L,1,[],N),
findall([N1," - ",Item,"\n"],(member(N1,N),get_item_n(Alg_gen_dict3b,N1,Item)),List),foldr(append,List,[],Item2a),
foldr(string_concat,Item2a,"",Item2),

%term_to_atom(Alg_gen_dict3b,Alg_gen_dict3b1),
foldr(string_concat,["The sentence: ",File_string3a1," has the computational terms:","\n",Item2,"What is the number of the main computational term?"],"",Prompt1),
repeat,
writeln(Prompt1),
read_string(user_input,"\n","\r",_,S1),
number_string(S11,S1),
get_item_n(Alg_gen_dict3b,S11,Item3),
Flag=true
%
%Alg_gen_dict2=Alg_gen_dict2c
)
;
((Alg_gen_dict3b=[]->fail;true),
findall([Weight,M,Note],(member(M,File_string2),member([Weight,M,Note],Alg_gen_dict2)),M1),
(M1=[]->
Flag=fail;
(sort(M1,M2),
reverse(M2,[W,Item3,Note],
Flag=true))))),

% () * repeat, get A out of [A,B]

% if a word's note is not in a_dict2, then asks for its alg 

(Flag=fail->
Alg_gen_dict2b=Alg_gen_dict2c;
(
(Note=(-)->
(foldr(string_concat,["What is the algorithm note for ",Item3,"?"],"",Prompt2),
%repeat,
writeln(Prompt2),
read_string(user_input,"\n","\r",_,S4),
member([W,Item3,_],Alg_gen_dict2b),
delete(Alg_gen_dict2b,[W,Item3,_],Alg_gen_dict2c1),
append(Alg_gen_dict2c1,[[W,Item3,S4]],Alg_gen_dict2c))
;
true))),

alg_gen1(Rest,Alg_gen_dict1b,Alg_gen_dict1a,Alg_gen_dict2c,Alg_gen_dict2a),!.

 %alg_gen1(Rest,Alg_gen_dict1a,Alg_gen_dict1b,Alg_gen_dict2a,Alg_gen_dict2b).
 

alg_gen2([],Alg_gen_dict1,Alg_gen_dict1,
 Alg_gen_dict2,Alg_gen_dict2,
 Alg_gen_dict3,Alg_gen_dict3,
 _New_flag
 ) :- !.

alg_gen2(File_string2,Alg_gen_dict1a,Alg_gen_dict1b,
 Alg_gen_dict2a,Alg_gen_dict2b,
 Alg_gen_dict3a,Alg_gen_dict3b,
 New_flag
 ) :-

File_string2=[Word|Rest],

% if a word is not in a_dict1, then asks for that word's status or computational version

(member([Word,Words1d],Alg_gen_dict1a)->
(Alg_gen_dict1a=Alg_gen_dict1c,
Alg_gen_dict2a=Alg_gen_dict2c,
append(Alg_gen_dict3a,[Words1d],Alg_gen_dict3c)

)
;
(foldr(string_concat,[Word," is not in dictionary.  Is it computational (y/n)?"],"",Prompt1),
%repeat,
writeln(Prompt1),
read_string(user_input,"\n","\r",_,S1),
(S1="y"->
(%trace,
foldr(string_concat,["What is the command name for ",Word," (<return> for the same)?"],"",Prompt2),
%repeat,
writeln(Prompt2),
read_string(user_input,"\n","\r",_,S2),
(S2=""->S3=Word;S3=S2),
append(Alg_gen_dict1a,[[Word,S3]],Alg_gen_dict1c),
append(Alg_gen_dict2a,[[0,S3,-]],Alg_gen_dict2c),
append(Alg_gen_dict3a,[S3],Alg_gen_dict3c),
New_flag=true
);
(append(Alg_gen_dict1a,[[Word,-]],Alg_gen_dict1c),
Alg_gen_dict2a=Alg_gen_dict2c,
Alg_gen_dict3a=Alg_gen_dict3c)
))),

alg_gen2(Rest,Alg_gen_dict1c,Alg_gen_dict1b,
Alg_gen_dict2c,Alg_gen_dict2b,
Alg_gen_dict3c,Alg_gen_dict3b,
New_flag
).



% * if not in a_dict1, *

/* 
 findall(Words1e,(member(Words1c,File_string2),
 (member([Words1c,Words1d],Alg_gen_dict1)->Words1e=Words1d;
 Words1e=Words1c)),Words1f),
 

 subtract(Words1f,Connectives,Words1g1),

 % remove duplicates
 sort(Words1g1,Words1h),
 
 (member([Words1h,_A],Alg_dict)->fail*;
 (

 term_to_atom(Words1f,Words1g),
 
 foldr(string_concat,"What are the [Computational_words,Algorithm] for: ",Words1g,
 "\n","e.g. [[[word,word],[automate,recurse]], [recurse(word)]] ?",Prompt),
 repeat,
 writeln(Prompt),
 read_string(user_input,"\n","\r",_,S),
 
 term_to_atom(S1,S),
 
 S1=[Computational_words,_Algorithm],
 
 findall([A1,B1],(member([A,B],Computational_words),
 (string_atom(A1,A),string_atom(B1,B))),Computational_words1),

 findall(Words1e,(member(Words1c,Words1h),
 (member([Words1c,Words1d],Computational_words1)->
 Words1e=Words1d;
 Words1e=Words1c)),Words1j)
 ))),Words1k),
 
 % foldr(append,Words1k,[],Words1m),
 
 append()


*/

