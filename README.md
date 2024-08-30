# Philosophy
List of Philosophy Algorithms

* Prolog and List Prolog Algorithms
* From articles at <a href="http://lucianpedia.fandom.com/">http://lucianpedia.fandom.com/</a>.

# Getting Started

Please read the following instructions on how to install the project on your computer for running algorithms.

# Prerequisites

* Please download and install SWI-Prolog for your machine at `https://www.swi-prolog.org/build/`.

* You may need to install gawk using Homebrew.

* Install <a href="https://github.com/soimort/translate-shell">Translation Shell</a> on Mac, etc.
Change line in
```
culturaltranslationtool/ctt2.pl
trans_location("../../../gawk/trans").
```
to correct location of <a href="https://github.com/soimort/translate-shell">trans</a>.

# 1. Install manually

* Download:
* <a href="https://github.com/luciangreen/Philosophy">this repository</a>
* <a href="https://github.com/luciangreen/listprologinterpreter">listprologinterpreter</a>
* <a href="https://github.com/luciangreen/Languages">Languages</a>
* <a href="https://github.com/luciangreen/culturaltranslationtool">Cultural Translation Tool</a>. Requires Translation Shell (you may need to install gawk using Homebrew. Install <a href="https://github.com/soimort/translate-shell">Translation Shell</a> on Mac, etc.
Change line in culturaltranslationtool/ctt2.pl
`trans_location("../../../gawk/trans").` to correct location of <a href="https://github.com/soimort/translate-shell">trans</a>).
* <a href="https://github.com/luciangreen/mindreader">mindreader</a>.  (Caution: Before running texttobr/mindreader, think of two radio buttons put on recordings, put through with prayer, nut and bolt, quantum box prayer 1, 1, 0.5 cm and 1, 1, 0.5 cm.  Follow instructions in <a href="https://github.com/luciangreen/Text-to-Breasonings/blob/master/Instructions_for_Using_texttobr(2).pl.txt">Instructions for Using texttobr(2)</a> when using texttobr, texttobr2 or mind reader to avoid medical problems).
* <a href="https://github.com/luciangreen/LuciansHandBitMap-Font">LuciansHandBitMap-Font</a>
* <a href="https://github.com/luciangreen/Lucian-Academy">Lucian-Academy</a>
* <a href="https://github.com/luciangreen/Prolog-to-List-Prolog">Prolog-to-List-Prolog</a>
* <a href="https://github.com/luciangreen/List-Prolog-to-Prolog-Converter">List-Prolog-to-Prolog-Converter</a>

# 2. Or Install from List Prolog Package Manager (LPPM)

* Download the <a href="https://github.com/luciangreen/List-Prolog-Package-Manager">LPPM Repository</a>:

```
mkdir GitHub
cd GitHub/
git clone https://github.com/luciangreen/List-Prolog-Package-Manager.git
cd List-Prolog-Package-Manager
swipl
['lppm'].
lppm_install("luciangreen","Philosophy").
../
halt.
```

# Running

* In Shell:
`cd Philosophy`
`swipl`

* If the algorithm is a Prolog algorithm, in SWI-Prolog, in the relevant folder, enter:
```
['filename.pl'].
```
where filename is the name of the file.
* Enter `name_of_predicate(Input,Output).` where name_of_predicate is the main predicate of the algorithm, and the input and output arguments are given.

* If the algorithm is a List Prolog algorithm, run it in List Prolog.
* In the SWI-Prolog environment in the Philosophy folder, enter:
`['../listprologinterpreter/listprolog'].`    

* To run a specific test:
`test1(off,TestNumber,Passed).`
where TestNumber is the test number from <a href="lpiverify4.pl">lpiverify4.pl</a> in List Prolog.

# paint.pl - Vector to Paint

* In `swipl`: `['paint.pl'].`

* The following `file_paint.txt` file contains the width and height of the image and a description of a text box, with number of columns (x_bounds) and rows (y_bounds), the x and y offsets, size (1,2,3 etc.), text colour and text to draw ("."):

```
["width",6,"height",10,
[
["text","x_bounds",1,"y_bounds",1,"x",0,"y",0,"size",1,"colour",black,"."]]]
```
# minimise_alg.pl

* Delete duplicate predicates, no matter what their name or variable names.

* In `swipl`:
```
cd s2g
['minimise_alg.pl'].
minimise_alg([[[n,function],[[v,a],[v,b]],":-",[[[n,+],[[v,a],[v,b]]]]],[[n,function],[[v,b],[v,a]],":-",[[[n,+],[[v,b],[v,a]]]]]],A),writeln1(A).

A = [[[n,function],[[v,a],[v,b]],":-",[[n,+],[[v,a],[v,b]]]]]
```

# Web Editor

* Open files or edit folders and move, rename or delete files or folders.

* Remember to edit the password in `web-editor-pw.pl` before running.

* In `swipl`, `['web-editor1.pl'].` `web_editor_server(8000).` Go to <a href="http://localhost:8000/webeditor">http://localhost:8000/webeditor</a> or http://***your IP address***:8000 to access files online.

# Paraphraser

* Enter text to paraphrase in `Philosophy/file.txt` while reading the text in another window and the paraphrased file `file2.txt` will be produced.

* Warning: Check results for correctness.

* In `swipl`, `['paraphraser1.pl'].` `paraphraser([file,"file.txt"],A).`

# Paraphraser Web Service

* In `paraphraser1_pl.pl` change the password `apple` to something else.

* Load with `['paraphraser1_pl_ws.pl'].` and `paraphraser_server(8000).`.

* Go to `http://localhost:8000/paraphraser`.

* Enter the password.

* Enter the file to paraphrase.

* Enter the thesaurus or [], for example `[["a","c"], etc]` where these are the pairs of bidirectional synonyms.

* Enter synonyms for additional words.

* Save the finished paraphrasing and thesaurus.

* Warning: Check results for correctness.

# LPI and lucianpl

* To run List Prolog Interpreter and enter Prolog queries, load `['lpi.pl'].` and run `lpi.`.

* To run State Saving Interpreter and enter Prolog queries, load `['lucianpl.pl'].` and run `lucianpl.`.

# Subterm with Address

```
sub_term_wa(Subterm, Term, Instances).
Subterm - Subterm to find
Term - Initial list to search
Instances - List of addresses and subterms

Subterm (with address) gives the "address" of a term in a term, such as [[[1], a]] for a in a, [[[1, 2], b]] for b in [a,b], (where the column number is the dimension), and put subterm with address puts an item into an address.

sub_term_wa(Subterm, Term, Instances)
sub_term_wa([a,_], [[a,b], [a,c]], Instances).
Instances = [[[1, 1], [a, b]], [[1, 2], [a, c]]]

get_sub_term_wa(Term, Address, Item)
get_sub_term_wa([[1, 4], 2, 3], [1, 1, 2], Item).
Item = 4

put_sub_term_wa(Item, Address, Term1, Term2)
put_sub_term_wa(88, [1,1], [[2, 3], 4], Term2).
Term2 = [88, 4]

put_sub_term_wa_smooth(Item, Address, Term1, Term2)
put_sub_term_wa_smooth([88,1], [1,1], [[2,3],4], Term2).
Term2 = [88, 1, 4]

delete_sub_term_wa(Instances, Term1, Term2)
delete_sub_term_wa([[1, 1], [1, 2]], [a, b], Term2).
Term2 = []

foldr(put_sub_term_wa_ae,Instances, Term1, Term2).
foldr(put_sub_term_wa_ae,[[[1, 1], [v, 2]], [[1, 2], [v, 3]]], [[v, 1], [v, 2]], Term2).
Term2 = [[v, 2], [v, 3]]

foldr(put_sub_term_wa_ae_smooth, Instances, Term1, Term2)
foldr(put_sub_term_wa_ae_smooth, [[[1, 1], [v, 2]], [[1, 2], [v, 3]]], [[v, 1], [v, 2]], Term2).
Term2 = [v, 2, v, 3]

sub_term_types_wa(Heuristic, Term, Instances)
sub_term_types_wa([all([number, string])], [1,[a,3]], Instances).
Instances = [[[1,2], [a,3]]]

Possible heuristics:
var
string
atom
[]
number
compound (non-list compounds)
all(Insert_more_heuristics) (all the items are of a type, can be used to select terminals)
heuristic(Heuristic, Output_variable) (Heuristic may be for example A=a and Output_variable=A)
```

* <a href="https://m.youtube.com/watch?v=oV4TdABKOl4">Subterm with Address Youtube Video</a>

# Strings to Grammar

* A black spherical ink well represents the transformation from strings to grammar (lensgo.ai). <img width="463" alt="A black spherical ink well" src="https://github.com/luciangreen/Philosophy/assets/15845542/47484bd8-acc6-46fa-92cc-3339d46fa00b">

* Enter possible strings to convert to a context-free grammar in `s2g/strings_to_grammar.pl`.

* For example, test 1 below takes the following string and tests for outputted grammar.

```
[1,["[1,2,3,2,3,1,2,3,2,3]"],
[[[n,a1],"->",[[]]],
[[n,a1],"->",[[1],[[n,a2]],[[n,a1]]]],
[[n,a2],"->",[[]]],
[[n,a2],"->",[[2],[3],[[n,a2]]]]]],
```

* Temporarily change the line `%writeln1(G1)` to `writeln1(G1)` to show the outputted grammar from a particular set of strings. You can replace the test output above with this output.

* To load strings to grammar and run tests, enter:
```
cd s2g
['strings_to_grammar.pl'].
test_s2g.
```

* The output contains the following lines:

```
[success,1,strings_to_grammar,test]
[success,1,strings_to_grammar,check_grammar,test]
```

* These give the test number. The first result is that the output matches the test output. The second result is the strings being substituted back into the found grammar working.

* <a href="https://lucianpedia.fandom.com/wiki/Philosophy">Further instructions</a> to change to input ordinary strings.

# Spec to Algorithm

* Starry Sunshine (a play on words on "subterm with address" and "spec to algorithm")  <img width="580" alt="Starry Sunshine" src="https://github.com/luciangreen/Philosophy/assets/15845542/505f3e18-00b4-4075-bf6f-6f09ee1f6eca">

* Enter possible specs to convert to a pattern-matching algorithm in `s2a/spec_to_algorithm.pl`.

* For example, test 1 below takes the following spec and tests the outputted algorithm.

```
[1, 
[
[[input,[['A',[1,2]]]],[output,[['B',[2,1]]]]],
[[input,[['A',[3,4]]]],[output,[['B',[4,3]]]]]
]
],
```

This creates the following algorithm:
```
algorithm(In_vars,Out_var) :-
  algorithm([[['C1','C2'],[output,[['C2','C1']]]]],[[[[1,1],[[1,2]]],[[1,2],[[1,1]]]]],In_vars,Out_var).
```

* To load Spec to Algorithm and run tests, enter:
```
cd s2a
['spec_to_algorithm.pl'].
test_s2a.
```

* The output contains the following lines:

```
success
success
[success,1,spec_to_algorithm,test]
```

* The first results are from testing the produced algorithm. The third result gives the test number.

* Use the query `spec_to_algorithm(algorithm,[[[input,[['A',[1,2]]]],[output,[['B',[21]]]]], [[input,[['A',[3,4]]]],[output,[['B',[43]]]]]],on,A),writeln1(A).` where `on` turns on breakdown of term elements to characters for recombination of characters in terms.

* <a href="https://stackoverflow.com/questions/78707063/how-can-i-improve-the-accuracy-of-chatgpt-in-prolog/78707064#78707064">Stack Overflow Question about Spec to Algorithm</a>

* <a href="https://t.co/EbMLOSVtHl">Dev.to Article about Spec to Algorithm</a>

* <a href="https://lucianpedia.fandom.com/wiki/Philosophy">Lucianpedia Article about Spec to Algorithm</a>

* <a href="https://youtu.be/EOMc-FHqDWg?si=fTRC1lwpDGGWUWcB">Spec to Algorithm Youtube Video</a>

# Authors

Lucian Green - Initial programmer - <a href="https://www.lucianacademy.com/">Lucian Academy</a>

# License

I licensed this project under the BSD3 License - see the <a href="LICENSE">LICENSE.md</a> file for details

