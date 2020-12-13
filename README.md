# Philosophy
List of Philosophy Algorithms

* Prolog and List Prolog Algorithms
* From articles at <a href="http://lucianpedia.fandom.com/">http://lucianpedia.fandom.com/</a>.

# Getting Started

Please read the following instructions on how to install the project on your computer for running algorithms.


# Installation from List Prolog Package Manager (LPPM)

* Optionally, you can install from LPPM by installing <a href="https://www.swi-prolog.org/build/">SWI-Prolog</a> for your machine, downloading the <a href="https://github.com/luciangreen/List-Prolog-Package-Manager">LPPM Repository</a>,
```
git clone https://github.com/luciangreen/List-Prolog-Package-Manager.git
cd List-Prolog-Package-Manager
```
loading LPPM with `['lppm'].` then installing the package by running `lppm_install("luciangreen","Philosophy").`.

# Prerequisites

Install List Prolog Interpreter Repository (https://github.com/luciangreen/listprologinterpreter) first.

* Download this repository.
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

