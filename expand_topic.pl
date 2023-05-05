/*

Algs to speed writing paras
- Takes topic sentence, and paraphrases comma and "and" delimited parts in subsentences
- Use: The <mask> worked because of <topic sentence> *1 x
- If no or missing comma delimited parts, paraphrase other sentences, same for use.
 - Or, use bag again for rest of sents *2, gl for use sent *1
 - Or, use bag with relevant subsentences for *2
 - Hybrid model of basing on hand written topic sentences, writing topic sentences with bag with relevant sentences/gl for use
 - NB. use use sentence if provided (2 sentences given)
 
Algs to speed writing alg examples
- can use clause (or any pred x) written
- Replace words with similar words (names, parts of speech, numbers)
- Rework out result
- Write examples

X do 4*curr work x

X - 3-step sentences won't be like bag

Given:
word.
word and word.
word, word and word.
word1. word.

Produces:
1. *. word. c. 
2. *. word and word. c. c. 
3. *. word, word and word. c. c. c. 
4. word1. word. c. 

In 4, the first sentence is the use and the second sentence is the topic sentence (the first sentence given in each of 1-3).

*/

:- include('../listprologinterpreter/listprolog').
:- include('paraphraser1.pl').

% write file.txt as "a\nb c\nd" (no numbers)

expand_topic([string,String],ET0) :-
	%File1="test1.pl",
	expand_topic1(String,ET0),!.

expand_topic([file,File1],ET0
) :-
	%File1="test1.pl",
	phrase_from_file_s(string(Codes), File1),
	string_codes(String,Codes),
	expand_topic1(String,ET0),

	open_s("file2.txt",write,Stream1),
	write(Stream1,ET0),
	close(Stream1),!.

expand_topic1(String,ET0) :-
	Sep_and_pad="\n",
	split_string(String,Sep_and_pad,Sep_and_pad,Strings),
	length(Strings,L1),
	numbers(L1,1,[],LN),
	findall([LN1,". ",A1,". ",ET1,"\n"],(member(LN1,LN),get_item_n(Strings,LN1,String1),
	Sep_and_pad1=".",
	split_string(String1,Sep_and_pad1,Sep_and_pad1,Strings1),
	%length(Strings1,L),
	(Strings1=[A,B] -> % A use has been provided
	(%trace,
	expand_topic11(B,ET10),
	%(B=ET10->ET100="";ET100=ET10),
	%foldr(append,[%[A],
	%ET],ET4),
	trim_spaces_before(ET10,ET1),
	trim_spaces_before(B,B1),
	A1=[A,". ",B1]
	%foldr(string_concat,ET4,ET1)
	)
	;
	(Strings1=[B],
	A1=[*,". ",B],
	expand_topic11(B,ET1)
	%(B=ET10->ET1="";ET1=ET10)
	
	%foldr(append,ET,ET1)
	%foldr(string_concat,[ET],ET1)
	))),ET2),
	flatten(ET2,ET3),
	%findall(*,(member(ET3,ET2))) if needs " "
	foldr(string_concat,ET3,ET0),!.
	
expand_topic11(B,ET1) :-
	string_chars(B,B1),
	findall(B2,(member(B3,B1),atom_string(B3,B2)),B4),
	expand_topic2(B4,[],ET11),
	foldr(string_concat,ET11,ET13),	
	%findall(ET1,(member(ET12,ET13),
	paraphraser([string,ET13],%ET1)),
	ET),
	(ET13=ET->ET1="";ET1=ET),
	!.
expand_topic2(B4,B5,B6) :-
	forall(append(_A,C,B4),
	not(append([" ","a","n","d"," "],_D,C))),
	foldr(append,[B4,[". "],B5],B6),!.
expand_topic2(B4,ET11,ET) :-
%trace,
	append(A,C,B4),
	append([","," "],D,C),
	foldr(append,[ET11,%[". "],
	A,[". "]],ET1),
	expand_topic2(D,ET1,ET),!.
expand_topic2(B4,ET1,ET) :-
	append(A,C,B4),
	append([" ","a","n","d"," "],D,C),
	foldr(append,[ET1,A,[". "]],ET2),
	expand_topic2(D,ET2,ET),!.

trim_spaces_before(A,A8) :-
	string_chars(A,A1),
	findall(A2,(member(A3,A1),atom_string(A3,A2)),A4),
	append(_A5,A6,A4),
	append([A7],_A8,A6),
	not(is_space(A7)),
	foldr(string_concat,A6,A8),!.
trim_spaces_before(A,"") :-
	string_chars(A,A1),
	findall(A2,(member(A3,A1),atom_string(A3,A2)),A4),
	forall(member(A5,A4),is_space(A5)),!.
trim_spaces_before(A,A) :- !.


