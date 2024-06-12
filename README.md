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
halt
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

* In `swipl`: `['minimise_alg.pl'].`

```
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

# Strings to Grammar

* A black spherical ink well represents the transformation from strings to grammar (lensgo.ai). <img width="463" alt="A black spherical ink well" src="https://github.com/luciangreen/Philosophy/assets/15845542/47484bd8-acc6-46fa-92cc-3339d46fa00b">

* Enter possible strings to convert to a context-free grammar in `strings_to_grammar.pl`.

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
['strings_to_grammar.pl'].
test_s2g.
```

* The output contains the following lines:

```
[success,1,strings_to_grammar,test]
[success,1,strings_to_grammar,check_grammar,test]
```

* <a href="https://lucianpedia.fandom.com/wiki/Philosophy">Further instructions</a> to change to input ordinary strings.

* These give the test number. The first result is that the output matches the test output. The second result is the strings being substituted back into the found grammar working.

# Authors

Lucian Green - Initial programmer - <a href="https://www.lucianacademy.com/">Lucian Academy</a>

# License

I licensed this project under the BSD3 License - see the <a href="LICENSE">LICENSE.md</a> file for details

