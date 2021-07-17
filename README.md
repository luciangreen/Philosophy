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

# 2. Or Install from List Prolog Package Manager (LPPM)

* Download the <a href="https://github.com/luciangreen/List-Prolog-Package-Manager">LPPM Repository</a>:

```
git clone https://github.com/luciangreen/List-Prolog-Package-Manager.git
cd List-Prolog-Package-Manager
swipl
['lppm'].
lppm_install("luciangreen","Philosophy").
halt
```

# Running

* In Shell:
`cd Philosophy/philosophy`
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

# Authors

Lucian Green - Initial programmer - <a href="https://www.lucianacademy.com/">Lucian Academy</a>

# License

I licensed this project under the BSD3 License - see the <a href="LICENSE">LICENSE.md</a> file for details

