# S2GN (s2g/normalise.pl): 200 input/output pairs

Each pair is a query to S2GN, which turns strings of words into grammars. Every output was produced by running this repository's code with `io_pairs/generate.pl` (inputs are generated from a fixed random seed, so the file is reproducible); nothing was written by hand. The output is what the query printed, then its variable bindings. A query that takes longer than 30 seconds is recorded as such.

| Category | Pairs |
|---|---|
| `s2g/symbols` | 50 |
| `s2g/grammar` | 90 |
| `s2g/covering` | 50 |
| `s2g/symbol-capacity` | 10 |

## 1. Symbol table for 1 string(s) of caps words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["AF,AF,AB,AE"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,a,b,c]"]
Words = ["['AF','AF','AB','AE']"]
```

## 2. Symbol table for 1 string(s) of colours words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["grey,green,red,red"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,b,c,c]"]
Words = ["[grey,green,red,red]"]
```

## 3. Symbol table for 2 string(s) of code words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["s1,s1,k9,v3,n1,l2", "n1,n1,n1,v3"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,a,b,c,d,e]", "[d,d,d,c]"]
Words = ["[s1,s1,k9,v3,n1,l2]", "[n1,n1,n1,v3]"]
```

## 4. Symbol table for 1 string(s) of numbers words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["3,7"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,b]"]
Words = ["[3,7]"]
```

## 5. Symbol table for 2 string(s) of names words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["Dee,Ann,Eli", "Dee,Bo,Cy"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,b,c]", "[a,d,e]"]
Words = ["['Dee','Ann','Eli']", "['Dee','Bo','Cy']"]
```

## 6. Symbol table for 1 string(s) of mixed words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["n1,n1,AA"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,a,b]"]
Words = ["[n1,n1,'AA']"]
```

## 7. Symbol table for 1 string(s) of caps words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["AB,AA,AA,AC,AE"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,b,b,c,d]"]
Words = ["['AB','AA','AA','AC','AE']"]
```

## 8. Symbol table for 1 string(s) of colours words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["gold,green,red,red"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,b,c,c]"]
Words = ["[gold,green,red,red]"]
```

## 9. Symbol table for 2 string(s) of code words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["l2,s1,l2", "k9,l2,l2,n1,v3"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,b,a]", "[c,a,a,d,e]"]
Words = ["[l2,s1,l2]", "[k9,l2,l2,n1,v3]"]
```

## 10. Symbol table for 3 string(s) of numbers words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["99,7", "99,99,3,99,99,7", "3,3"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,b]", "[a,a,c,a,a,b]", "[c,c]"]
Words = ["[99,7]", "[99,99,3,99,99,7]", "[3,3]"]
```

## 11. Symbol table for 1 string(s) of names words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["Dee,Dee"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,a]"]
Words = ["['Dee','Dee']"]
```

## 12. Symbol table for 3 string(s) of mixed words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["Bo,AA,AA,Bo,red", "7,red,AA", "Bo,7,7"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,b,b,a,c]", "[d,c,b]", "[a,d,d]"]
Words = ["['Bo','AA','AA','Bo',red]", "[7,red,'AA']", "['Bo',7,7]"]
```

## 13. Symbol table for 1 string(s) of caps words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["AF,AB,AA,AC,AF,AA"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,b,c,d,a,c]"]
Words = ["['AF','AB','AA','AC','AF','AA']"]
```

## 14. Symbol table for 1 string(s) of colours words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["green,green,green"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,a,a]"]
Words = ["[green,green,green]"]
```

## 15. Symbol table for 2 string(s) of code words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["l2,k9,n1,n1,k9", "n1,k9,n1,v3,k9"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,b,c,c,b]", "[c,b,c,d,b]"]
Words = ["[l2,k9,n1,n1,k9]", "[n1,k9,n1,v3,k9]"]
```

## 16. Symbol table for 1 string(s) of numbers words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["99,3,1,12,12"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,b,c,d,d]"]
Words = ["[99,3,1,12,12]"]
```

## 17. Symbol table for 1 string(s) of names words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["Dee,Cy,Cy,Eli"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,b,b,c]"]
Words = ["['Dee','Cy','Cy','Eli']"]
```

## 18. Symbol table for 3 string(s) of mixed words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["7,n1,AA", "AA,n1,7", "7,red,7,Bo,red,7"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,b,c]", "[c,b,a]", "[a,d,a,e,d,a]"]
Words = ["[7,n1,'AA']", "['AA',n1,7]", "[7,red,7,'Bo',red,7]"]
```

## 19. Symbol table for 3 string(s) of caps words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["AC,AB,AD,AB,AC,AA", "AC,AA,AE,AF,AC,AC", "AA,AD,AD,AB"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,b,c,b,a,d]", "[a,d,e,f,a,a]", "[d,c,c,b]"]
Words = ["['AC','AB','AD','AB','AC','AA']", "['AC','AA','AE','AF','AC','AC']", "['AA','AD','AD','AB']"]
```

## 20. Symbol table for 2 string(s) of colours words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["grey,gold,gold,red", "green,red"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,b,b,c]", "[d,c]"]
Words = ["[grey,gold,gold,red]", "[green,red]"]
```

## 21. Symbol table for 3 string(s) of code words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["s1,n1", "l2,l2,n1,k9,n1", "s1,s1,l2"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,b]", "[c,c,b,d,b]", "[a,a,c]"]
Words = ["[s1,n1]", "[l2,l2,n1,k9,n1]", "[s1,s1,l2]"]
```

## 22. Symbol table for 2 string(s) of numbers words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["3,2,99,99,99,99", "2,3,3,1,1"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,b,c,c,c,c]", "[b,a,a,d,d]"]
Words = ["[3,2,99,99,99,99]", "[2,3,3,1,1]"]
```

## 23. Symbol table for 1 string(s) of names words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["Bo,Bo,Bo,Bo"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,a,a,a]"]
Words = ["['Bo','Bo','Bo','Bo']"]
```

## 24. Symbol table for 1 string(s) of mixed words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["Bo,n1,red,red,Bo"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,b,c,c,a]"]
Words = ["['Bo',n1,red,red,'Bo']"]
```

## 25. Symbol table for 1 string(s) of caps words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["AB,AA,AB"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,b,a]"]
Words = ["['AB','AA','AB']"]
```

## 26. Symbol table for 1 string(s) of colours words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["red,blue,grey,grey"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,b,c,c]"]
Words = ["[red,blue,grey,grey]"]
```

## 27. Symbol table for 1 string(s) of code words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["n1,k9,v3,k9"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,b,c,b]"]
Words = ["[n1,k9,v3,k9]"]
```

## 28. Symbol table for 3 string(s) of numbers words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["3,2,7,1,2", "3,99,2,1,3", "1,12,3,12"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,b,c,d,b]", "[a,e,b,d,a]", "[d,f,a,f]"]
Words = ["[3,2,7,1,2]", "[3,99,2,1,3]", "[1,12,3,12]"]
```

## 29. Symbol table for 2 string(s) of names words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["Eli,Eli,Ann,Eli,Dee,Dee", "Bo,Bo,Bo,Eli"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,a,b,a,c,c]", "[d,d,d,a]"]
Words = ["['Eli','Eli','Ann','Eli','Dee','Dee']", "['Bo','Bo','Bo','Eli']"]
```

## 30. Symbol table for 1 string(s) of mixed words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["Bo,7"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,b]"]
Words = ["['Bo',7]"]
```

## 31. Symbol table for 1 string(s) of caps words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["AE,AA"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,b]"]
Words = ["['AE','AA']"]
```

## 32. Symbol table for 2 string(s) of colours words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["green,green,red", "gold,red,grey,blue,green"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,a,b]", "[c,b,d,e,a]"]
Words = ["[green,green,red]", "[gold,red,grey,blue,green]"]
```

## 33. Symbol table for 3 string(s) of code words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["n1,l2,k9,l2,n1", "k9,k9,s1,l2,l2", "s1,v3,v3,n1"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,b,c,b,a]", "[c,c,d,b,b]", "[d,e,e,a]"]
Words = ["[n1,l2,k9,l2,n1]", "[k9,k9,s1,l2,l2]", "[s1,v3,v3,n1]"]
```

## 34. Symbol table for 3 string(s) of numbers words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["12,2,12,3,2,99", "3,3,1,7", "99,2,3,12"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,b,a,c,b,d]", "[c,c,e,f]", "[d,b,c,a]"]
Words = ["[12,2,12,3,2,99]", "[3,3,1,7]", "[99,2,3,12]"]
```

## 35. Symbol table for 3 string(s) of names words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["Dee,Ann,Dee,Ann", "Dee,Dee", "Eli,Cy,Eli,Cy,Eli"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,b,a,b]", "[a,a]", "[c,d,c,d,c]"]
Words = ["['Dee','Ann','Dee','Ann']", "['Dee','Dee']", "['Eli','Cy','Eli','Cy','Eli']"]
```

## 36. Symbol table for 1 string(s) of mixed words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["Bo,red"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,b]"]
Words = ["['Bo',red]"]
```

## 37. Symbol table for 1 string(s) of caps words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["AE,AA,AF,AC,AB,AF"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,b,c,d,e,c]"]
Words = ["['AE','AA','AF','AC','AB','AF']"]
```

## 38. Symbol table for 1 string(s) of colours words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["grey,gold"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,b]"]
Words = ["[grey,gold]"]
```

## 39. Symbol table for 2 string(s) of code words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["s1,n1,n1,k9", "v3,n1,l2"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,b,b,c]", "[d,b,e]"]
Words = ["[s1,n1,n1,k9]", "[v3,n1,l2]"]
```

## 40. Symbol table for 3 string(s) of numbers words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["1,7,3,3,99", "99,7,99,3,1", "2,3,12,99"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,b,c,c,d]", "[d,b,d,c,a]", "[e,c,f,d]"]
Words = ["[1,7,3,3,99]", "[99,7,99,3,1]", "[2,3,12,99]"]
```

## 41. Symbol table for 1 string(s) of names words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["Eli,Cy"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,b]"]
Words = ["['Eli','Cy']"]
```

## 42. Symbol table for 1 string(s) of mixed words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["AA,7,Bo,Bo"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,b,c,c]"]
Words = ["['AA',7,'Bo','Bo']"]
```

## 43. Symbol table for 2 string(s) of caps words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["AE,AB", "AF,AA"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,b]", "[c,d]"]
Words = ["['AE','AB']", "['AF','AA']"]
```

## 44. Symbol table for 1 string(s) of colours words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["red,gold,blue,green,gold"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,b,c,d,b]"]
Words = ["[red,gold,blue,green,gold]"]
```

## 45. Symbol table for 1 string(s) of code words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["l2,n1,n1,k9,v3,l2"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,b,b,c,d,a]"]
Words = ["[l2,n1,n1,k9,v3,l2]"]
```

## 46. Symbol table for 3 string(s) of numbers words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["99,2,7,99,2,2", "2,12", "12,99"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,b,c,a,b,b]", "[b,d]", "[d,a]"]
Words = ["[99,2,7,99,2,2]", "[2,12]", "[12,99]"]
```

## 47. Symbol table for 3 string(s) of names words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["Ann,Cy,Dee,Ann", "Dee,Eli", "Ann,Eli,Dee"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,b,c,a]", "[c,d]", "[a,d,c]"]
Words = ["['Ann','Cy','Dee','Ann']", "['Dee','Eli']", "['Ann','Eli','Dee']"]
```

## 48. Symbol table for 3 string(s) of mixed words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["7,7,Bo,7", "red,AA,red,red,7,red", "red,red"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,a,b,a]", "[c,d,c,c,a,c]", "[c,c]"]
Words = ["[7,7,'Bo',7]", "[red,'AA',red,red,7,red]", "[red,red]"]
```

## 49. Symbol table for 2 string(s) of caps words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["AE,AE,AB,AA", "AD,AE"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,a,b,c]", "[d,a]"]
Words = ["['AE','AE','AB','AA']", "['AD','AE']"]
```

## 50. Symbol table for 1 string(s) of colours words

*Category:* `s2g/symbols`

**Input**

```prolog
?- strings_to_symbols(["green,gold,green,red,red,gold"], Symbols, Words).
```

**Output**

```text
Symbols = ["[a,b,a,c,c,b]"]
Words = ["[green,gold,green,red,red,gold]"]
```

## 51. Grammar for caps words: block [AF] repeated 4 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["AF,AF,AF,AF,AF,AC"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[[n, a2]], ['AC']]], [[n, a2], "->", [[]]], [[n, a2], "->", [['AF'], [[n, a2]]]]]
```

## 52. Grammar for colours words: block [red,red,green] repeated 2 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["blue,red,red,green,red,red,green"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[blue], [[n, a2]]]], [[n, a2], "->", [[]]], [[n, a2], "->", [[[n, a3]], [green], [[n, a2]]]], [[n, a3], "->", [[]]], [[n, a3], "->", [[red], [[n, a3]]]]]
```

## 53. Grammar for code words: block [n1,s1,n1] repeated 4 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["n1,s1,n1,n1,s1,n1,n1,s1,n1,n1,s1,n1,k9"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[n1], [s1], [n1], [n1], [s1], [n1], [n1], [s1], [n1], [n1], [s1], [n1], [k9]]]]
```

## 54. Grammar for numbers words: block [99] repeated 4 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["99,99,99,99"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[]]], [[n, a1], "->", [[99], [[n, a1]]]]]
```

## 55. Grammar for names words: block [Dee,Bo,Eli] repeated 2 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["Dee,Dee,Bo,Eli,Dee,Bo,Eli"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [['Dee'], [[n, a2]]]], [[n, a2], "->", [[]]], [[n, a2], "->", [['Dee'], ['Bo'], ['Eli'], [[n, a2]]]]]
```

## 56. Grammar for mixed words: block [Bo,n1] repeated 1 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["red,Bo,n1,Bo"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[red], ['Bo'], [n1], ['Bo']]]]
```

## 57. Grammar for caps words: block [AE] repeated 2 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["AE,AE,AE,AE"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[]]], [[n, a1], "->", [['AE'], [[n, a1]]]]]
```

## 58. Grammar for colours words: block [grey,red] repeated 4 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["red,grey,red,grey,red,grey,red,grey,red"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[red], [[n, a2]]]], [[n, a2], "->", [[]]], [[n, a2], "->", [[grey], [red], [[n, a2]]]]]
```

## 59. Grammar for code words: block [s1] repeated 3 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["l2,s1,s1,s1,n1"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[l2], [[n, a2]], [n1]]], [[n, a2], "->", [[]]], [[n, a2], "->", [[s1], [[n, a2]]]]]
```

## 60. Grammar for numbers words: block [99,12,3] repeated 4 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["99,12,3,99,12,3,99,12,3,99,12,3"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[]]], [[n, a1], "->", [[99], [12], [3], [[n, a1]]]]]
```

## 61. Grammar for names words: block [Ann,Ann,Eli] repeated 2 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["Ann,Ann,Eli,Ann,Ann,Eli,Dee"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[[n, a2]], ['Dee']]], [[n, a2], "->", [[]]], [[n, a2], "->", [[[n, a3]], ['Eli'], [[n, a2]]]], [[n, a3], "->", [[]]], [[n, a3], "->", [['Ann'], [[n, a3]]]]]
```

## 62. Grammar for mixed words: block [Bo] repeated 3 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["Bo,Bo,Bo"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[]]], [[n, a1], "->", [['Bo'], [[n, a1]]]]]
```

## 63. Grammar for caps words: block [AF,AE,AA] repeated 2 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["AC,AF,AE,AA,AF,AE,AA"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [['AC'], [[n, a2]]]], [[n, a2], "->", [[]]], [[n, a2], "->", [['AF'], ['AE'], ['AA'], [[n, a2]]]]]
```

## 64. Grammar for colours words: block [green,red,green] repeated 4 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["green,green,red,green,green,red,green,green,red,green,green,red,green,red"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[green], [green], [red], [green], [green], [red], [green], [green], [red], [green], [green], [red], [green], [red]]]]
```

## 65. Grammar for code words: block [v3,s1] repeated 4 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["s1,v3,s1,v3,s1,v3,s1,v3,s1,n1"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[s1], [[n, a2]], [n1]]], [[n, a2], "->", [[]]], [[n, a2], "->", [[v3], [s1], [[n, a2]]]]]
```

## 66. Grammar for numbers words: block [99,2] repeated 3 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["3,99,2,99,2,99,2"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[3], [[n, a2]]]], [[n, a2], "->", [[]]], [[n, a2], "->", [[99], [2], [[n, a2]]]]]
```

## 67. Grammar for names words: block [Eli,Cy] repeated 3 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["Ann,Eli,Cy,Eli,Cy,Eli,Cy,Bo"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [['Ann'], [[n, a2]], ['Bo']]], [[n, a2], "->", [[]]], [[n, a2], "->", [['Eli'], ['Cy'], [[n, a2]]]]]
```

## 68. Grammar for mixed words: block [7] repeated 1 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["n1,7,AA"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[n1], [7], ['AA']]]]
```

## 69. Grammar for caps words: block [AB,AF,AC] repeated 4 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["AB,AF,AC,AB,AF,AC,AB,AF,AC,AB,AF,AC"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[]]], [[n, a1], "->", [['AB'], ['AF'], ['AC'], [[n, a1]]]]]
```

## 70. Grammar for colours words: block [red,grey] repeated 2 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["red,grey,red,grey"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[]]], [[n, a1], "->", [[red], [grey], [[n, a1]]]]]
```

## 71. Grammar for code words: block [n1] repeated 1 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["n1,v3"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[n1], [v3]]]]
```

## 72. Grammar for numbers words: block [7,1] repeated 2 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["99,7,1,7,1"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[99], [[n, a2]]]], [[n, a2], "->", [[]]], [[n, a2], "->", [[7], [1], [[n, a2]]]]]
```

## 73. Grammar for names words: block [Bo,Cy,Eli] repeated 3 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["Dee,Bo,Cy,Eli,Bo,Cy,Eli,Bo,Cy,Eli"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [['Dee'], [[n, a2]]]], [[n, a2], "->", [[]]], [[n, a2], "->", [['Bo'], ['Cy'], ['Eli'], [[n, a2]]]]]
```

## 74. Grammar for mixed words: block [7,AA,red] repeated 4 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["n1,7,AA,red,7,AA,red,7,AA,red,7,AA,red,Bo"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[n1], [[n, a2]], ['Bo']]], [[n, a2], "->", [[]]], [[n, a2], "->", [[7], ['AA'], [red], [[n, a2]]]]]
```

## 75. Grammar for caps words: block [AF] repeated 4 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["AF,AF,AF,AF,AF,AE"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[[n, a2]], ['AE']]], [[n, a2], "->", [[]]], [[n, a2], "->", [['AF'], [[n, a2]]]]]
```

## 76. Grammar for colours words: block [blue,blue,green] repeated 1 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["blue,blue,blue,green,green"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[[n, a2]], [[n, a3]]]], [[n, a2], "->", [[]]], [[n, a2], "->", [[blue], [[n, a2]]]], [[n, a3], "->", [[]]], [[n, a3], "->", [[green], [[n, a3]]]]]
```

## 77. Grammar for code words: block [n1,n1] repeated 3 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["k9,n1,n1,n1,n1,n1,n1,s1"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[k9], [[n, a2]], [s1]]], [[n, a2], "->", [[]]], [[n, a2], "->", [[n1], [[n, a2]]]]]
```

## 78. Grammar for numbers words: block [3,1] repeated 2 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["3,1,3,1,1"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[]]], [[n, a1], "->", [[3], [[n, a2]], [[n, a1]]]], [[n, a2], "->", [[]]], [[n, a2], "->", [[1], [[n, a2]]]]]
```

## 79. Grammar for names words: block [Cy,Dee,Cy] repeated 2 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["Cy,Cy,Dee,Cy,Cy,Dee,Cy"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[]]], [[n, a1], "->", [[[n, a2]], [[n, a1]]]], [[n, a2], "->", [[]]], [[n, a2], "->", [[[n, a3]], ['Cy'], [[n, a2]]]], [[n, a3], "->", [[]]], [[n, a3], "->", [['Cy'], ['Dee']]]]
```

## 80. Grammar for mixed words: block [7,Bo,AA] repeated 3 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["Bo,7,Bo,AA,7,Bo,AA,7,Bo,AA"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [['Bo'], [[n, a2]]]], [[n, a2], "->", [[]]], [[n, a2], "->", [[7], ['Bo'], ['AA'], [[n, a2]]]]]
```

## 81. Grammar for caps words: block [AD,AB,AB] repeated 1 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["AD,AB,AB,AD"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [['AD'], [[n, a2]], ['AD']]], [[n, a2], "->", [[]]], [[n, a2], "->", [['AB'], [[n, a2]]]]]
```

## 82. Grammar for colours words: block [gold,red] repeated 1 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["gold,red"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[gold], [red]]]]
```

## 83. Grammar for code words: block [s1,k9,v3] repeated 1 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["s1,s1,k9,v3"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[[n, a2]], [k9], [v3]]], [[n, a2], "->", [[]]], [[n, a2], "->", [[s1], [[n, a2]]]]]
```

## 84. Grammar for numbers words: block [2,12,3] repeated 2 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["7,2,12,3,2,12,3,1"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[7], [[n, a2]], [1]]], [[n, a2], "->", [[]]], [[n, a2], "->", [[2], [12], [3], [[n, a2]]]]]
```

## 85. Grammar for names words: block [Eli] repeated 1 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["Ann,Eli"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [['Ann'], ['Eli']]]]
```

## 86. Grammar for mixed words: block [AA,Bo,n1] repeated 1 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["AA,Bo,n1,n1"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [['AA'], ['Bo'], [[n, a2]]]], [[n, a2], "->", [[]]], [[n, a2], "->", [[n1], [[n, a2]]]]]
```

## 87. Grammar for caps words: block [AA] repeated 3 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["AA,AA,AA,AF"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[[n, a2]], ['AF']]], [[n, a2], "->", [[]]], [[n, a2], "->", [['AA'], [[n, a2]]]]]
```

## 88. Grammar for colours words: block [grey,grey,gold] repeated 2 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["green,grey,grey,gold,grey,grey,gold,green"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[green], [[n, a2]], [green]]], [[n, a2], "->", [[]]], [[n, a2], "->", [[[n, a3]], [gold], [[n, a2]]]], [[n, a3], "->", [[]]], [[n, a3], "->", [[grey], [[n, a3]]]]]
```

## 89. Grammar for code words: block [k9,n1] repeated 3 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["v3,k9,n1,k9,n1,k9,n1,l2"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[v3], [[n, a2]], [l2]]], [[n, a2], "->", [[]]], [[n, a2], "->", [[k9], [n1], [[n, a2]]]]]
```

## 90. Grammar for numbers words: block [12,3,99] repeated 3 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["12,3,99,12,3,99,12,3,99"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[]]], [[n, a1], "->", [[12], [3], [99], [[n, a1]]]]]
```

## 91. Grammar for names words: block [Ann] repeated 4 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["Ann,Ann,Ann,Ann,Ann,Bo"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[[n, a2]], ['Bo']]], [[n, a2], "->", [[]]], [[n, a2], "->", [['Ann'], [[n, a2]]]]]
```

## 92. Grammar for mixed words: block [7,Bo] repeated 3 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["7,7,Bo,7,Bo,7,Bo,n1"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[[n, a2]], [n1]]], [[n, a2], "->", [[]]], [[n, a2], "->", [[[n, a3]], [[n, a4]], [[n, a2]]]], [[n, a3], "->", [[]]], [[n, a3], "->", [[7]]], [[n, a4], "->", [[]]], [[n, a4], "->", [[7], ['Bo'], [[n, a4]]]]]
```

## 93. Grammar for caps words: block [AE] repeated 2 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["AE,AE,AE,AF"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[[n, a2]], ['AF']]], [[n, a2], "->", [[]]], [[n, a2], "->", [['AE'], [[n, a2]]]]]
```

## 94. Grammar for colours words: block [green,green] repeated 2 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["green,green,green,green,gold"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[[n, a2]], [gold]]], [[n, a2], "->", [[]]], [[n, a2], "->", [[green], [[n, a2]]]]]
```

## 95. Grammar for code words: block [s1,n1] repeated 4 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["s1,n1,s1,n1,s1,n1,s1,n1"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[]]], [[n, a1], "->", [[s1], [n1], [[n, a1]]]]]
```

## 96. Grammar for numbers words: block [1,1,99] repeated 3 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["1,1,99,1,1,99,1,1,99,3"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[[n, a2]], [3]]], [[n, a2], "->", [[]]], [[n, a2], "->", [[[n, a3]], [99], [[n, a2]]]], [[n, a3], "->", [[]]], [[n, a3], "->", [[1], [[n, a3]]]]]
```

## 97. Grammar for names words: block [Bo,Eli] repeated 3 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["Cy,Bo,Eli,Bo,Eli,Bo,Eli"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [['Cy'], [[n, a2]]]], [[n, a2], "->", [[]]], [[n, a2], "->", [['Bo'], ['Eli'], [[n, a2]]]]]
```

## 98. Grammar for mixed words: block [7] repeated 1 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["AA,7"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [['AA'], [7]]]]
```

## 99. Grammar for caps words: block [AC,AD] repeated 1 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["AE,AC,AD"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [['AE'], ['AC'], ['AD']]]]
```

## 100. Grammar for colours words: block [green,gold] repeated 1 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["green,gold"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[green], [gold]]]]
```

## 101. Grammar for code words: block [k9,l2,l2] repeated 3 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["l2,k9,l2,l2,k9,l2,l2,k9,l2,l2"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[]]], [[n, a1], "->", [[[n, a2]], [[n, a3]], [[n, a1]]]], [[n, a2], "->", [[]]], [[n, a2], "->", [[l2], [k9]]], [[n, a3], "->", [[]]], [[n, a3], "->", [[[n, a4]], [[n, a5]], [[n, a3]]]], [[n, a4], "->", [[]]], [[n, a4], "->", [[l2]]], [[n, a5], "->", [[]]], [[n, a5], "->", [[[n, a6]], [l2], [[n, a5]]]], [[n, a6], "->", [[]]], [[n, a6], "->", [[k9]]]]
```

## 102. Grammar for numbers words: block [3] repeated 4 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["3,3,3,3,1"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[[n, a2]], [1]]], [[n, a2], "->", [[]]], [[n, a2], "->", [[3], [[n, a2]]]]]
```

## 103. Grammar for names words: block [Bo] repeated 2 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["Bo,Bo,Bo"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[]]], [[n, a1], "->", [['Bo'], [[n, a1]]]]]
```

## 104. Grammar for mixed words: block [Bo] repeated 2 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["n1,Bo,Bo,7"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[n1], [[n, a2]], [7]]], [[n, a2], "->", [[]]], [[n, a2], "->", [['Bo'], [[n, a2]]]]]
```

## 105. Grammar for caps words: block [AD,AC] repeated 4 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["AD,AC,AD,AC,AD,AC,AD,AC"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[]]], [[n, a1], "->", [['AD'], ['AC'], [[n, a1]]]]]
```

## 106. Grammar for colours words: block [grey,blue] repeated 4 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["red,grey,blue,grey,blue,grey,blue,grey,blue,red"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[red], [[n, a2]], [red]]], [[n, a2], "->", [[]]], [[n, a2], "->", [[grey], [blue], [[n, a2]]]]]
```

## 107. Grammar for code words: block [n1] repeated 1 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["n1"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[n1]]]]
```

## 108. Grammar for numbers words: block [99,7,99] repeated 4 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["1,99,7,99,99,7,99,99,7,99,99,7,99"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[1], [99], [7], [99], [99], [7], [99], [99], [7], [99], [99], [7], [99]]]]
```

## 109. Grammar for names words: block [Bo,Eli] repeated 3 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["Bo,Eli,Bo,Eli,Bo,Eli"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[]]], [[n, a1], "->", [['Bo'], ['Eli'], [[n, a1]]]]]
```

## 110. Grammar for mixed words: block [n1,7] repeated 2 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["n1,7,n1,7,n1"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[n1], [[n, a2]]]], [[n, a2], "->", [[]]], [[n, a2], "->", [[7], [n1], [[n, a2]]]]]
```

## 111. Grammar for caps words: block [AA,AE] repeated 2 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["AA,AA,AE,AA,AE,AE"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [['AA'], [[n, a2]]]], [[n, a2], "->", [[]]], [[n, a2], "->", [['AA'], [[n, a3]], [[n, a2]]]], [[n, a3], "->", [[]]], [[n, a3], "->", [['AE'], [[n, a3]]]]]
```

## 112. Grammar for colours words: block [blue] repeated 4 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["blue,blue,blue,blue,blue,green"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[[n, a2]], [green]]], [[n, a2], "->", [[]]], [[n, a2], "->", [[blue], [[n, a2]]]]]
```

## 113. Grammar for code words: block [k9,k9] repeated 4 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["k9,k9,k9,k9,k9,k9,k9,k9,l2"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[k9], [k9], [k9], [k9], [k9], [k9], [k9], [k9], [l2]]]]
```

## 114. Grammar for numbers words: block [7] repeated 2 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["7,7"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[]]], [[n, a1], "->", [[7], [[n, a1]]]]]
```

## 115. Grammar for names words: block [Bo,Bo,Ann] repeated 4 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["Bo,Bo,Ann,Bo,Bo,Ann,Bo,Bo,Ann,Bo,Bo,Ann"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[]]], [[n, a1], "->", [[[n, a2]], ['Ann'], [[n, a1]]]], [[n, a2], "->", [[]]], [[n, a2], "->", [['Bo'], [[n, a2]]]]]
```

## 116. Grammar for mixed words: block [n1,AA,n1] repeated 1 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["n1,AA,n1"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[n1], ['AA'], [n1]]]]
```

## 117. Grammar for caps words: block [AF] repeated 4 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["AB,AF,AF,AF,AF,AC"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [['AB'], [[n, a2]], ['AC']]], [[n, a2], "->", [[]]], [[n, a2], "->", [['AF'], [[n, a2]]]]]
```

## 118. Grammar for colours words: block [grey] repeated 1 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["grey"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[grey]]]]
```

## 119. Grammar for code words: block [s1,k9] repeated 3 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["v3,s1,k9,s1,k9,s1,k9"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[v3], [[n, a2]]]], [[n, a2], "->", [[]]], [[n, a2], "->", [[s1], [k9], [[n, a2]]]]]
```

## 120. Grammar for numbers words: block [2,12] repeated 3 time(s)

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["2,12,2,12,2,12"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[]]], [[n, a1], "->", [[2], [12], [[n, a1]]]]]
```

## 121. Grammar for two caps strings with a shared prefix

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["AC,AE,AA", "AC,AE,AB"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [['AC'], ['AE'], [[n, a2]]]], [[n, a2], "->", [['AA']]], [[n, a2], "->", [['AB']]]]
```

## 122. Grammar for two colours strings with a shared prefix

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["grey,green,grey", "grey,green,gold"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[grey], [green], [[n, a2]]]], [[n, a2], "->", [[grey]]], [[n, a2], "->", [[gold]]]]
```

## 123. Grammar for two code strings with a shared prefix

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["l2,l2,s1", "l2,l2,k9"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[[n, a2]], [[n, a3]]]], [[n, a2], "->", [[]]], [[n, a2], "->", [[l2], [[n, a2]]]], [[n, a3], "->", [[s1]]], [[n, a3], "->", [[k9]]]]
```

## 124. Grammar for two numbers strings with a shared prefix

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["3,99,1", "3,99,7"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[3], [99], [[n, a2]]]], [[n, a2], "->", [[1]]], [[n, a2], "->", [[7]]]]
```

## 125. Grammar for two names strings with a shared prefix

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["Ann,Cy,Ann", "Ann,Cy,Cy"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [['Ann'], [[n, a4]]]], [[n, a4], "->", [[]]], [[n, a4], "->", [['Cy'], ['Ann']]], [[n, a4], "->", [['Cy'], [[n, a4]]]]]
```

## 126. Grammar for two mixed strings with a shared prefix

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["Bo,red,AA", "Bo,red,AA"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [['Bo'], [red], ['AA']]]]
```

## 127. Grammar for two caps strings with a shared prefix

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["AA,AF,AE", "AA,AF,AA"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [['AA'], ['AF'], [[n, a2]]]], [[n, a2], "->", [['AA']]], [[n, a2], "->", [['AE']]]]
```

## 128. Grammar for two colours strings with a shared prefix

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["blue,red,gold", "blue,red,green"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[blue], [red], [[n, a2]]]], [[n, a2], "->", [[gold]]], [[n, a2], "->", [[green]]]]
```

## 129. Grammar for two code strings with a shared prefix

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["v3,l2,n1", "v3,l2,n1"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[v3], [l2], [n1]]]]
```

## 130. Grammar for two numbers strings with a shared prefix

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["2,2,99", "2,2,7"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[[n, a2]], [[n, a3]]]], [[n, a2], "->", [[]]], [[n, a2], "->", [[2], [[n, a2]]]], [[n, a3], "->", [[99]]], [[n, a3], "->", [[7]]]]
```

## 131. Grammar for two names strings with a shared prefix

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["Dee,Dee,Cy", "Dee,Dee,Eli"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[[n, a2]], [[n, a3]]]], [[n, a2], "->", [[]]], [[n, a2], "->", [['Dee'], [[n, a2]]]], [[n, a3], "->", [['Cy']]], [[n, a3], "->", [['Eli']]]]
```

## 132. Grammar for two mixed strings with a shared prefix

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["7,n1,AA", "7,n1,7"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[7], [n1], [[n, a2]]]], [[n, a2], "->", [[7]]], [[n, a2], "->", [['AA']]]]
```

## 133. Grammar for two caps strings with a shared prefix

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["AF,AF,AC", "AF,AF,AF"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[[n, a2]], ['AC']]], [[n, a2], "->", [[]]], [[n, a2], "->", [['AF'], [[n, a2]]]]]
```

## 134. Grammar for two colours strings with a shared prefix

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["blue,green,blue", "blue,green,blue"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[blue], [green], [blue]]]]
```

## 135. Grammar for two code strings with a shared prefix

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["s1,l2,n1", "s1,l2,k9"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[s1], [l2], [[n, a2]]]], [[n, a2], "->", [[n1]]], [[n, a2], "->", [[k9]]]]
```

## 136. Grammar for two numbers strings with a shared prefix

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["3,99,2", "3,99,2"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[3], [99], [2]]]]
```

## 137. Grammar for two names strings with a shared prefix

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["Cy,Ann,Bo", "Cy,Ann,Cy"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [['Cy'], ['Ann'], [[n, a2]]]], [[n, a2], "->", [['Cy']]], [[n, a2], "->", [['Bo']]]]
```

## 138. Grammar for two mixed strings with a shared prefix

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["AA,n1,Bo", "AA,n1,n1"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [['AA'], [[n, a4]]]], [[n, a4], "->", [[]]], [[n, a4], "->", [[n1], ['Bo']]], [[n, a4], "->", [[n1], [[n, a4]]]]]
```

## 139. Grammar for two caps strings with a shared prefix

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["AC,AD,AA", "AC,AD,AA"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [['AC'], ['AD'], ['AA']]]]
```

## 140. Grammar for two colours strings with a shared prefix

*Category:* `s2g/grammar`

**Input**

```prolog
?- strings_to_grammar_words(["green,gold,gold", "green,gold,blue"], Grammar).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[green], [[n, a4]]]], [[n, a4], "->", [[]]], [[n, a4], "->", [[gold], [blue]]], [[n, a4], "->", [[gold], [[n, a4]]]]]
```

## 141. Covering grammar for caps words: full, shortened and with a repeated first word

*Category:* `s2g/covering`

**Input**

```prolog
?- strings_to_grammar_words_covering(["AC,AE,AB,AD,AD", "AC,AE,AB,AD", "AC,AC,AE,AB,AD,AD"], Grammar, Added).
```

**Output**

```text
Grammar = [[[n, a1], "->", [['AC'], ['AE'], ['AB'], [[n, a4]]]], [[n, a1], "->", [[[n, a5]], ['AE'], ['AB'], [[n, a4]]]], [[n, a4], "->", [[]]], [[n, a4], "->", [['AD']]], [[n, a4], "->", [['AD'], [[n, a4]]]], [[n, a5], "->", [[]]], [[n, a5], "->", [['AC'], [[n, a5]]]]]
Added = []
```

## 142. Covering grammar for colours words: full, shortened and with a repeated first word

*Category:* `s2g/covering`

**Input**

```prolog
?- strings_to_grammar_words_covering(["grey,grey,green,red,green", "grey,grey,green,red", "grey,grey,grey,green,red,green"], Grammar, Added).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[[n, a2]], [green], [red], [green]]], [[n, a2], "->", [[]]], [[n, a2], "->", [[grey], [[n, a2]]]], [[n, a1], "->", [[grey], [grey], [green], [red]]]]
Added = ["[grey,grey,green,red]"]
```

## 143. Covering grammar for code words: full, shortened and with a repeated first word

*Category:* `s2g/covering`

**Input**

```prolog
?- strings_to_grammar_words_covering(["l2,l2,n1,v3", "l2,l2,n1", "l2,l2,l2,n1,v3"], Grammar, Added).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[[n, a2]], [n1], [v3]]], [[n, a2], "->", [[]]], [[n, a2], "->", [[l2], [[n, a2]]]], [[n, a1], "->", [[l2], [l2], [n1]]]]
Added = ["[l2,l2,n1]"]
```

## 144. Covering grammar for numbers words: full, shortened and with a repeated first word

*Category:* `s2g/covering`

**Input**

```prolog
?- strings_to_grammar_words_covering(["1,1,2", "1,1", "1,1,1,2"], Grammar, Added).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[[n, a2]], [2]]], [[n, a2], "->", [[]]], [[n, a2], "->", [[1], [[n, a2]]]], [[n, a1], "->", [[1], [1]]]]
Added = ["[1,1]"]
```

## 145. Covering grammar for names words: full, shortened and with a repeated first word

*Category:* `s2g/covering`

**Input**

```prolog
?- strings_to_grammar_words_covering(["Bo,Dee,Bo,Cy", "Bo,Dee,Bo", "Bo,Bo,Dee,Bo,Cy"], Grammar, Added).
```

**Output**

```text
Grammar = [[[n, a1], "->", [['Bo'], ['Dee'], ['Bo'], ['Cy']]], [[n, a1], "->", [[[n, a2]], ['Dee'], ['Bo'], ['Cy']]], [[n, a2], "->", [[]]], [[n, a2], "->", [['Bo'], [[n, a2]]]], [[n, a1], "->", [['Bo'], ['Dee'], ['Bo']]]]
Added = ["['Bo','Dee','Bo']"]
```

## 146. Covering grammar for mixed words: full, shortened and with a repeated first word

*Category:* `s2g/covering`

**Input**

```prolog
?- strings_to_grammar_words_covering(["AA,red,AA", "AA,red", "AA,AA,red,AA"], Grammar, Added).
```

**Output**

```text
Grammar = [[[n, a1], "->", [['AA'], [red], ['AA']]], [[n, a1], "->", [[[n, a2]], [red], ['AA']]], [[n, a2], "->", [[]]], [[n, a2], "->", [['AA'], [[n, a2]]]], [[n, a1], "->", [['AA'], [red]]]]
Added = ["['AA',red]"]
```

## 147. Covering grammar for caps words: full, shortened and with a repeated first word

*Category:* `s2g/covering`

**Input**

```prolog
?- strings_to_grammar_words_covering(["AF,AF,AA", "AF,AF", "AF,AF,AF,AA"], Grammar, Added).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[[n, a2]], ['AA']]], [[n, a2], "->", [[]]], [[n, a2], "->", [['AF'], [[n, a2]]]], [[n, a1], "->", [['AF'], ['AF']]]]
Added = ["['AF','AF']"]
```

## 148. Covering grammar for colours words: full, shortened and with a repeated first word

*Category:* `s2g/covering`

**Input**

```prolog
?- strings_to_grammar_words_covering(["red,red,red", "red,red", "red,red,red,red"], Grammar, Added).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[]]], [[n, a1], "->", [[red], [[n, a1]]]]]
Added = []
```

## 149. Covering grammar for code words: full, shortened and with a repeated first word

*Category:* `s2g/covering`

**Input**

```prolog
?- strings_to_grammar_words_covering(["k9,n1,k9,s1", "k9,n1,k9", "k9,k9,n1,k9,s1"], Grammar, Added).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[k9], [n1], [k9], [s1]]], [[n, a1], "->", [[[n, a2]], [n1], [k9], [s1]]], [[n, a2], "->", [[]]], [[n, a2], "->", [[k9], [[n, a2]]]], [[n, a1], "->", [[k9], [n1], [k9]]]]
Added = ["[k9,n1,k9]"]
```

## 150. Covering grammar for numbers words: full, shortened and with a repeated first word

*Category:* `s2g/covering`

**Input**

```prolog
?- strings_to_grammar_words_covering(["7,1,1,1,3", "7,1,1,1", "7,7,1,1,1,3"], Grammar, Added).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[7], [[n, a2]], [3]]], [[n, a1], "->", [[[n, a3]], [[n, a2]], [3]]], [[n, a2], "->", [[]]], [[n, a2], "->", [[1], [[n, a2]]]], [[n, a3], "->", [[]]], [[n, a3], "->", [[7], [[n, a3]]]], [[n, a1], "->", [[7], [1], [1], [1]]]]
Added = ["[7,1,1,1]"]
```

## 151. Covering grammar for names words: full, shortened and with a repeated first word

*Category:* `s2g/covering`

**Input**

```prolog
?- strings_to_grammar_words_covering(["Eli,Dee,Dee,Bo", "Eli,Dee,Dee", "Eli,Eli,Dee,Dee,Bo"], Grammar, Added).
```

**Output**

```text
Grammar = [[[n, a1], "->", [['Eli'], [[n, a2]], ['Bo']]], [[n, a1], "->", [[[n, a3]], [[n, a2]], ['Bo']]], [[n, a2], "->", [[]]], [[n, a2], "->", [['Dee'], [[n, a2]]]], [[n, a3], "->", [[]]], [[n, a3], "->", [['Eli'], [[n, a3]]]], [[n, a1], "->", [['Eli'], ['Dee'], ['Dee']]]]
Added = ["['Eli','Dee','Dee']"]
```

## 152. Covering grammar for mixed words: full, shortened and with a repeated first word

*Category:* `s2g/covering`

**Input**

```prolog
?- strings_to_grammar_words_covering(["7,Bo,Bo", "7,Bo", "7,7,Bo,Bo"], Grammar, Added).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[7], [[n, a4]]]], [[n, a1], "->", [[[n, a5]], [[n, a4]]]], [[n, a4], "->", [[]]], [[n, a4], "->", [['Bo']]], [[n, a4], "->", [['Bo'], [[n, a4]]]], [[n, a5], "->", [[]]], [[n, a5], "->", [[7], [[n, a5]]]]]
Added = []
```

## 153. Covering grammar for caps words: full, shortened and with a repeated first word

*Category:* `s2g/covering`

**Input**

```prolog
?- strings_to_grammar_words_covering(["AA,AB,AE,AA,AA", "AA,AB,AE,AA", "AA,AA,AB,AE,AA,AA"], Grammar, Added).
```

**Output**

```text
Grammar = [[[n, a1], "->", [['AA'], ['AA'], ['AB'], ['AE'], ['AA'], ['AA']]], [[n, a1], "->", [['AA'], ['AB'], ['AE'], ['AA'], ['AA']]], [[n, a1], "->", [['AA'], ['AB'], ['AE'], ['AA']]]]
Added = []
```

## 154. Covering grammar for colours words: full, shortened and with a repeated first word

*Category:* `s2g/covering`

**Input**

```prolog
?- strings_to_grammar_words_covering(["green,gold,grey,blue,blue", "green,gold,grey,blue", "green,green,gold,grey,blue,blue"], Grammar, Added).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[green], [gold], [grey], [[n, a4]]]], [[n, a1], "->", [[[n, a5]], [gold], [grey], [[n, a4]]]], [[n, a4], "->", [[]]], [[n, a4], "->", [[blue]]], [[n, a4], "->", [[blue], [[n, a4]]]], [[n, a5], "->", [[]]], [[n, a5], "->", [[green], [[n, a5]]]]]
Added = []
```

## 155. Covering grammar for code words: full, shortened and with a repeated first word

*Category:* `s2g/covering`

**Input**

```prolog
?- strings_to_grammar_words_covering(["n1,n1,s1,k9", "n1,n1,s1", "n1,n1,n1,s1,k9"], Grammar, Added).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[[n, a2]], [s1], [k9]]], [[n, a2], "->", [[]]], [[n, a2], "->", [[n1], [[n, a2]]]], [[n, a1], "->", [[n1], [n1], [s1]]]]
Added = ["[n1,n1,s1]"]
```

## 156. Covering grammar for numbers words: full, shortened and with a repeated first word

*Category:* `s2g/covering`

**Input**

```prolog
?- strings_to_grammar_words_covering(["99,99,1,3,2", "99,99,1,3", "99,99,99,1,3,2"], Grammar, Added).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[[n, a2]], [1], [3], [2]]], [[n, a2], "->", [[]]], [[n, a2], "->", [[99], [[n, a2]]]], [[n, a1], "->", [[99], [99], [1], [3]]]]
Added = ["[99,99,1,3]"]
```

## 157. Covering grammar for names words: full, shortened and with a repeated first word

*Category:* `s2g/covering`

**Input**

```prolog
?- strings_to_grammar_words_covering(["Dee,Eli,Ann,Bo,Bo", "Dee,Eli,Ann,Bo", "Dee,Dee,Eli,Ann,Bo,Bo"], Grammar, Added).
```

**Output**

```text
Grammar = [[[n, a1], "->", [['Dee'], ['Eli'], ['Ann'], [[n, a4]]]], [[n, a1], "->", [[[n, a5]], ['Eli'], ['Ann'], [[n, a4]]]], [[n, a4], "->", [[]]], [[n, a4], "->", [['Bo']]], [[n, a4], "->", [['Bo'], [[n, a4]]]], [[n, a5], "->", [[]]], [[n, a5], "->", [['Dee'], [[n, a5]]]]]
Added = []
```

## 158. Covering grammar for mixed words: full, shortened and with a repeated first word

*Category:* `s2g/covering`

**Input**

```prolog
?- strings_to_grammar_words_covering(["Bo,AA,red", "Bo,AA", "Bo,Bo,AA,red"], Grammar, Added).
```

**Output**

```text
Grammar = [[[n, a1], "->", [['Bo'], ['AA'], [red]]], [[n, a1], "->", [[[n, a2]], ['AA'], [red]]], [[n, a2], "->", [[]]], [[n, a2], "->", [['Bo'], [[n, a2]]]], [[n, a1], "->", [['Bo'], ['AA']]]]
Added = ["['Bo','AA']"]
```

## 159. Covering grammar for caps words: full, shortened and with a repeated first word

*Category:* `s2g/covering`

**Input**

```prolog
?- strings_to_grammar_words_covering(["AC,AF,AE", "AC,AF", "AC,AC,AF,AE"], Grammar, Added).
```

**Output**

```text
Grammar = [[[n, a1], "->", [['AC'], ['AF'], ['AE']]], [[n, a1], "->", [[[n, a2]], ['AF'], ['AE']]], [[n, a2], "->", [[]]], [[n, a2], "->", [['AC'], [[n, a2]]]], [[n, a1], "->", [['AC'], ['AF']]]]
Added = ["['AC','AF']"]
```

## 160. Covering grammar for colours words: full, shortened and with a repeated first word

*Category:* `s2g/covering`

**Input**

```prolog
?- strings_to_grammar_words_covering(["blue,gold,grey,red,blue", "blue,gold,grey,red", "blue,blue,gold,grey,red,blue"], Grammar, Added).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[blue], [gold], [grey], [red], [blue]]], [[n, a1], "->", [[[n, a2]], [gold], [grey], [red], [blue]]], [[n, a2], "->", [[]]], [[n, a2], "->", [[blue], [[n, a2]]]], [[n, a1], "->", [[blue], [gold], [grey], [red]]]]
Added = ["[blue,gold,grey,red]"]
```

## 161. Covering grammar for code words: full, shortened and with a repeated first word

*Category:* `s2g/covering`

**Input**

```prolog
?- strings_to_grammar_words_covering(["l2,l2,s1,l2,n1", "l2,l2,s1,l2", "l2,l2,l2,s1,l2,n1"], Grammar, Added).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[l2], [l2], [l2], [s1], [l2], [n1]]], [[n, a1], "->", [[l2], [l2], [s1], [l2], [n1]]], [[n, a1], "->", [[l2], [l2], [s1], [l2]]]]
Added = []
```

## 162. Covering grammar for numbers words: full, shortened and with a repeated first word

*Category:* `s2g/covering`

**Input**

```prolog
?- strings_to_grammar_words_covering(["3,12,3,1,3", "3,12,3,1", "3,3,12,3,1,3"], Grammar, Added).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[3], [12], [3], [1], [3]]], [[n, a1], "->", [[[n, a2]], [12], [3], [1], [3]]], [[n, a2], "->", [[]]], [[n, a2], "->", [[3], [[n, a2]]]], [[n, a1], "->", [[3], [12], [3], [1]]]]
Added = ["[3,12,3,1]"]
```

## 163. Covering grammar for names words: full, shortened and with a repeated first word

*Category:* `s2g/covering`

**Input**

```prolog
?- strings_to_grammar_words_covering(["Cy,Eli,Cy,Cy", "Cy,Eli,Cy", "Cy,Cy,Eli,Cy,Cy"], Grammar, Added).
```

**Output**

```text
Grammar = [[[n, a1], "->", [['Cy'], ['Cy'], ['Eli'], ['Cy'], ['Cy']]], [[n, a1], "->", [['Cy'], ['Eli'], ['Cy'], ['Cy']]], [[n, a1], "->", [['Cy'], ['Eli'], ['Cy']]]]
Added = []
```

## 164. Covering grammar for mixed words: full, shortened and with a repeated first word

*Category:* `s2g/covering`

**Input**

```prolog
?- strings_to_grammar_words_covering(["red,red,n1,red", "red,red,n1", "red,red,red,n1,red"], Grammar, Added).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[red], [red], [red], [n1], [red]]], [[n, a1], "->", [[red], [red], [n1], [red]]], [[n, a1], "->", [[red], [red], [n1]]]]
Added = []
```

## 165. Covering grammar for caps words: full, shortened and with a repeated first word

*Category:* `s2g/covering`

**Input**

```prolog
?- strings_to_grammar_words_covering(["AC,AC,AA,AA", "AC,AC,AA", "AC,AC,AC,AA,AA"], Grammar, Added).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[[n, a2]], [[n, a5]]]], [[n, a2], "->", [[]]], [[n, a2], "->", [['AC'], [[n, a2]]]], [[n, a5], "->", [[]]], [[n, a5], "->", [['AA']]], [[n, a5], "->", [['AA'], [[n, a5]]]]]
Added = []
```

## 166. Covering grammar for colours words: full, shortened and with a repeated first word

*Category:* `s2g/covering`

**Input**

```prolog
?- strings_to_grammar_words_covering(["gold,green,gold,red,red", "gold,green,gold,red", "gold,gold,green,gold,red,red"], Grammar, Added).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[gold], [green], [gold], [[n, a4]]]], [[n, a1], "->", [[[n, a5]], [green], [gold], [[n, a4]]]], [[n, a4], "->", [[]]], [[n, a4], "->", [[red]]], [[n, a4], "->", [[red], [[n, a4]]]], [[n, a5], "->", [[]]], [[n, a5], "->", [[gold], [[n, a5]]]]]
Added = []
```

## 167. Covering grammar for code words: full, shortened and with a repeated first word

*Category:* `s2g/covering`

**Input**

```prolog
?- strings_to_grammar_words_covering(["k9,n1,l2,k9", "k9,n1,l2", "k9,k9,n1,l2,k9"], Grammar, Added).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[k9], [n1], [l2], [k9]]], [[n, a1], "->", [[[n, a2]], [n1], [l2], [k9]]], [[n, a2], "->", [[]]], [[n, a2], "->", [[k9], [[n, a2]]]], [[n, a1], "->", [[k9], [n1], [l2]]]]
Added = ["[k9,n1,l2]"]
```

## 168. Covering grammar for numbers words: full, shortened and with a repeated first word

*Category:* `s2g/covering`

**Input**

```prolog
?- strings_to_grammar_words_covering(["99,99,7,99", "99,99,7", "99,99,99,7,99"], Grammar, Added).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[99], [99], [99], [7], [99]]], [[n, a1], "->", [[99], [99], [7], [99]]], [[n, a1], "->", [[99], [99], [7]]]]
Added = []
```

## 169. Covering grammar for names words: full, shortened and with a repeated first word

*Category:* `s2g/covering`

**Input**

```prolog
?- strings_to_grammar_words_covering(["Cy,Ann,Cy,Eli,Cy", "Cy,Ann,Cy,Eli", "Cy,Cy,Ann,Cy,Eli,Cy"], Grammar, Added).
```

**Output**

```text
Grammar = [[[n, a1], "->", [['Cy'], ['Ann'], ['Cy'], ['Eli'], ['Cy']]], [[n, a1], "->", [[[n, a2]], ['Ann'], ['Cy'], ['Eli'], ['Cy']]], [[n, a2], "->", [[]]], [[n, a2], "->", [['Cy'], [[n, a2]]]], [[n, a1], "->", [['Cy'], ['Ann'], ['Cy'], ['Eli']]]]
Added = ["['Cy','Ann','Cy','Eli']"]
```

## 170. Covering grammar for mixed words: full, shortened and with a repeated first word

*Category:* `s2g/covering`

**Input**

```prolog
?- strings_to_grammar_words_covering(["7,Bo,7", "7,Bo", "7,7,Bo,7"], Grammar, Added).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[7], ['Bo'], [7]]], [[n, a1], "->", [[[n, a2]], ['Bo'], [7]]], [[n, a2], "->", [[]]], [[n, a2], "->", [[7], [[n, a2]]]], [[n, a1], "->", [[7], ['Bo']]]]
Added = ["[7,'Bo']"]
```

## 171. Covering grammar for caps words: full, shortened and with a repeated first word

*Category:* `s2g/covering`

**Input**

```prolog
?- strings_to_grammar_words_covering(["AC,AC,AB", "AC,AC", "AC,AC,AC,AB"], Grammar, Added).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[[n, a2]], ['AB']]], [[n, a2], "->", [[]]], [[n, a2], "->", [['AC'], [[n, a2]]]], [[n, a1], "->", [['AC'], ['AC']]]]
Added = ["['AC','AC']"]
```

## 172. Covering grammar for colours words: full, shortened and with a repeated first word

*Category:* `s2g/covering`

**Input**

```prolog
?- strings_to_grammar_words_covering(["blue,green,gold", "blue,green", "blue,blue,green,gold"], Grammar, Added).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[blue], [green], [gold]]], [[n, a1], "->", [[[n, a2]], [green], [gold]]], [[n, a2], "->", [[]]], [[n, a2], "->", [[blue], [[n, a2]]]], [[n, a1], "->", [[blue], [green]]]]
Added = ["[blue,green]"]
```

## 173. Covering grammar for code words: full, shortened and with a repeated first word

*Category:* `s2g/covering`

**Input**

```prolog
?- strings_to_grammar_words_covering(["l2,v3,k9", "l2,v3", "l2,l2,v3,k9"], Grammar, Added).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[l2], [v3], [k9]]], [[n, a1], "->", [[[n, a2]], [v3], [k9]]], [[n, a2], "->", [[]]], [[n, a2], "->", [[l2], [[n, a2]]]], [[n, a1], "->", [[l2], [v3]]]]
Added = ["[l2,v3]"]
```

## 174. Covering grammar for numbers words: full, shortened and with a repeated first word

*Category:* `s2g/covering`

**Input**

```prolog
?- strings_to_grammar_words_covering(["99,12,99,3", "99,12,99", "99,99,12,99,3"], Grammar, Added).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[99], [12], [99], [3]]], [[n, a1], "->", [[[n, a2]], [12], [99], [3]]], [[n, a2], "->", [[]]], [[n, a2], "->", [[99], [[n, a2]]]], [[n, a1], "->", [[99], [12], [99]]]]
Added = ["[99,12,99]"]
```

## 175. Covering grammar for names words: full, shortened and with a repeated first word

*Category:* `s2g/covering`

**Input**

```prolog
?- strings_to_grammar_words_covering(["Cy,Eli,Ann,Cy,Ann", "Cy,Eli,Ann,Cy", "Cy,Cy,Eli,Ann,Cy,Ann"], Grammar, Added).
```

**Output**

```text
Grammar = [[[n, a4], "->", [[]]], [[n, a4], "->", [['Cy'], [[n, a4]]]], [[n, a4], "->", [['Cy'], [[n, a5]], ['Ann'], [[n, a4]]]], [[n, a4], "->", [['Eli'], ['Ann'], ['Cy']]], [[n, a5], "->", [[]]], [[n, a5], "->", [['Eli']]], [[n, a4], "->", [['Cy'], ['Eli'], ['Ann'], ['Cy'], ['Ann']]], [[n, a4], "->", [['Cy'], ['Eli'], ['Ann'], ['Cy']]], [[n, a4], "->", [['Cy'], ['Cy'], ['Eli'], ['Ann'], ['Cy'], ['Ann']]]]
Added = ["['Cy','Eli','Ann','Cy','Ann']", "['Cy','Eli','Ann','Cy']", "['Cy','Cy','Eli','Ann','Cy','Ann']"]
```

## 176. Covering grammar for mixed words: full, shortened and with a repeated first word

*Category:* `s2g/covering`

**Input**

```prolog
?- strings_to_grammar_words_covering(["red,red,n1", "red,red", "red,red,red,n1"], Grammar, Added).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[[n, a2]], [n1]]], [[n, a2], "->", [[]]], [[n, a2], "->", [[red], [[n, a2]]]], [[n, a1], "->", [[red], [red]]]]
Added = ["[red,red]"]
```

## 177. Covering grammar for caps words: full, shortened and with a repeated first word

*Category:* `s2g/covering`

**Input**

```prolog
?- strings_to_grammar_words_covering(["AE,AC,AF,AD,AC", "AE,AC,AF,AD", "AE,AE,AC,AF,AD,AC"], Grammar, Added).
```

**Output**

```text
Grammar = [[[n, a1], "->", [['AE'], ['AC'], ['AF'], ['AD'], ['AC']]], [[n, a1], "->", [[[n, a2]], ['AC'], ['AF'], ['AD'], ['AC']]], [[n, a2], "->", [[]]], [[n, a2], "->", [['AE'], [[n, a2]]]], [[n, a1], "->", [['AE'], ['AC'], ['AF'], ['AD']]]]
Added = ["['AE','AC','AF','AD']"]
```

## 178. Covering grammar for colours words: full, shortened and with a repeated first word

*Category:* `s2g/covering`

**Input**

```prolog
?- strings_to_grammar_words_covering(["blue,gold,red", "blue,gold", "blue,blue,gold,red"], Grammar, Added).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[blue], [gold], [red]]], [[n, a1], "->", [[[n, a2]], [gold], [red]]], [[n, a2], "->", [[]]], [[n, a2], "->", [[blue], [[n, a2]]]], [[n, a1], "->", [[blue], [gold]]]]
Added = ["[blue,gold]"]
```

## 179. Covering grammar for code words: full, shortened and with a repeated first word

*Category:* `s2g/covering`

**Input**

```prolog
?- strings_to_grammar_words_covering(["s1,v3,l2", "s1,v3", "s1,s1,v3,l2"], Grammar, Added).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[s1], [v3], [l2]]], [[n, a1], "->", [[[n, a2]], [v3], [l2]]], [[n, a2], "->", [[]]], [[n, a2], "->", [[s1], [[n, a2]]]], [[n, a1], "->", [[s1], [v3]]]]
Added = ["[s1,v3]"]
```

## 180. Covering grammar for numbers words: full, shortened and with a repeated first word

*Category:* `s2g/covering`

**Input**

```prolog
?- strings_to_grammar_words_covering(["99,99,2,99", "99,99,2", "99,99,99,2,99"], Grammar, Added).
```

**Output**

```text
Grammar = [[[n, a1], "->", [[99], [99], [99], [2], [99]]], [[n, a1], "->", [[99], [99], [2], [99]]], [[n, a1], "->", [[99], [99], [2]]]]
Added = []
```

## 181. Which caps inputs the plain grammar misses, and the covering grammar

*Category:* `s2g/covering`

**Input**

```prolog
?- _L = ["AC,AE,AD,AD", "AC,AE,AD"], strings_to_symbols(_L, _, _W), strings_to_grammar_words(_L, _G), findall(X, ( member(X, _W), \+ catch(check_grammar([X], _G), _, fail) ), NotParsed), strings_to_grammar_words_covering(_L, _G2, _), ( check_grammar(_W, _G2) -> CoveringParsesAll = yes ; CoveringParsesAll = no ).
```

**Output**

```text
NotParsed = []
CoveringParsesAll = yes
```

## 182. Which colours inputs the plain grammar misses, and the covering grammar

*Category:* `s2g/covering`

**Input**

```prolog
?- _L = ["grey,grey,red,grey", "grey,grey,red"], strings_to_symbols(_L, _, _W), strings_to_grammar_words(_L, _G), findall(X, ( member(X, _W), \+ catch(check_grammar([X], _G), _, fail) ), NotParsed), strings_to_grammar_words_covering(_L, _G2, _), ( check_grammar(_W, _G2) -> CoveringParsesAll = yes ; CoveringParsesAll = no ).
```

**Output**

```text
NotParsed = ["[grey,grey,red]"]
CoveringParsesAll = yes
```

## 183. Which code inputs the plain grammar misses, and the covering grammar

*Category:* `s2g/covering`

**Input**

```prolog
?- _L = ["v3,n1,l2", "v3,n1"], strings_to_symbols(_L, _, _W), strings_to_grammar_words(_L, _G), findall(X, ( member(X, _W), \+ catch(check_grammar([X], _G), _, fail) ), NotParsed), strings_to_grammar_words_covering(_L, _G2, _), ( check_grammar(_W, _G2) -> CoveringParsesAll = yes ; CoveringParsesAll = no ).
```

**Output**

```text
NotParsed = ["[v3,n1]"]
CoveringParsesAll = yes
```

## 184. Which numbers inputs the plain grammar misses, and the covering grammar

*Category:* `s2g/covering`

**Input**

```prolog
?- _L = ["3,2,99", "3,2"], strings_to_symbols(_L, _, _W), strings_to_grammar_words(_L, _G), findall(X, ( member(X, _W), \+ catch(check_grammar([X], _G), _, fail) ), NotParsed), strings_to_grammar_words_covering(_L, _G2, _), ( check_grammar(_W, _G2) -> CoveringParsesAll = yes ; CoveringParsesAll = no ).
```

**Output**

```text
NotParsed = ["[3,2]"]
CoveringParsesAll = yes
```

## 185. Which names inputs the plain grammar misses, and the covering grammar

*Category:* `s2g/covering`

**Input**

```prolog
?- _L = ["Bo,Eli,Ann,Dee", "Bo,Eli,Ann"], strings_to_symbols(_L, _, _W), strings_to_grammar_words(_L, _G), findall(X, ( member(X, _W), \+ catch(check_grammar([X], _G), _, fail) ), NotParsed), strings_to_grammar_words_covering(_L, _G2, _), ( check_grammar(_W, _G2) -> CoveringParsesAll = yes ; CoveringParsesAll = no ).
```

**Output**

```text
NotParsed = ["['Bo','Eli','Ann']"]
CoveringParsesAll = yes
```

## 186. Which mixed inputs the plain grammar misses, and the covering grammar

*Category:* `s2g/covering`

**Input**

```prolog
?- _L = ["7,red,AA,n1", "7,red,AA"], strings_to_symbols(_L, _, _W), strings_to_grammar_words(_L, _G), findall(X, ( member(X, _W), \+ catch(check_grammar([X], _G), _, fail) ), NotParsed), strings_to_grammar_words_covering(_L, _G2, _), ( check_grammar(_W, _G2) -> CoveringParsesAll = yes ; CoveringParsesAll = no ).
```

**Output**

```text
NotParsed = ["[7,red,'AA']"]
CoveringParsesAll = yes
```

## 187. Which caps inputs the plain grammar misses, and the covering grammar

*Category:* `s2g/covering`

**Input**

```prolog
?- _L = ["AC,AC,AE,AB", "AC,AC,AE"], strings_to_symbols(_L, _, _W), strings_to_grammar_words(_L, _G), findall(X, ( member(X, _W), \+ catch(check_grammar([X], _G), _, fail) ), NotParsed), strings_to_grammar_words_covering(_L, _G2, _), ( check_grammar(_W, _G2) -> CoveringParsesAll = yes ; CoveringParsesAll = no ).
```

**Output**

```text
NotParsed = ["['AC','AC','AE']"]
CoveringParsesAll = yes
```

## 188. Which colours inputs the plain grammar misses, and the covering grammar

*Category:* `s2g/covering`

**Input**

```prolog
?- _L = ["gold,blue,gold", "gold,blue"], strings_to_symbols(_L, _, _W), strings_to_grammar_words(_L, _G), findall(X, ( member(X, _W), \+ catch(check_grammar([X], _G), _, fail) ), NotParsed), strings_to_grammar_words_covering(_L, _G2, _), ( check_grammar(_W, _G2) -> CoveringParsesAll = yes ; CoveringParsesAll = no ).
```

**Output**

```text
NotParsed = ["[gold,blue]"]
CoveringParsesAll = yes
```

## 189. Which code inputs the plain grammar misses, and the covering grammar

*Category:* `s2g/covering`

**Input**

```prolog
?- _L = ["k9,k9,v3,n1", "k9,k9,v3"], strings_to_symbols(_L, _, _W), strings_to_grammar_words(_L, _G), findall(X, ( member(X, _W), \+ catch(check_grammar([X], _G), _, fail) ), NotParsed), strings_to_grammar_words_covering(_L, _G2, _), ( check_grammar(_W, _G2) -> CoveringParsesAll = yes ; CoveringParsesAll = no ).
```

**Output**

```text
NotParsed = ["[k9,k9,v3]"]
CoveringParsesAll = yes
```

## 190. Which numbers inputs the plain grammar misses, and the covering grammar

*Category:* `s2g/covering`

**Input**

```prolog
?- _L = ["12,99,2", "12,99"], strings_to_symbols(_L, _, _W), strings_to_grammar_words(_L, _G), findall(X, ( member(X, _W), \+ catch(check_grammar([X], _G), _, fail) ), NotParsed), strings_to_grammar_words_covering(_L, _G2, _), ( check_grammar(_W, _G2) -> CoveringParsesAll = yes ; CoveringParsesAll = no ).
```

**Output**

```text
NotParsed = ["[12,99]"]
CoveringParsesAll = yes
```

## 191. Symbol capacity: the first symbol for a capitalised word

*Category:* `s2g/symbol-capacity`

**Input**

```prolog
?- ws_fresh(upper, st(26,0,0), [], _Code, State), format("U+~16r~n", [_Code]).
```

**Output**

```text
U+100
State = st(26, 1, 0)
```

## 192. Symbol capacity: the first symbol for a lower-case word

*Category:* `s2g/symbol-capacity`

**Input**

```prolog
?- ws_fresh(lower, st(26,0,0), [], _Code, State), format("U+~16r~n", [_Code]).
```

**Output**

```text
U+101
State = st(26, 0, 1)
```

## 193. Symbol capacity: the last capitalised symbol before the surrogates

*Category:* `s2g/symbol-capacity`

**Input**

```prolog
?- ws_fresh(upper, st(26,27519,0), [], _Code, State), format("U+~16r~n", [_Code]).
```

**Output**

```text
U+d7fe
State = st(26, 27520, 0)
```

## 194. Symbol capacity: a capitalised symbol at the surrogates

*Category:* `s2g/symbol-capacity`

**Input**

```prolog
?- ws_fresh(upper, st(26,27520,0), [], _Code, State), format("U+~16r~n", [_Code]).
```

**Output**

```text
U+e000
State = st(26, 28545, 0)
```

## 195. Symbol capacity: a lower-case symbol at the surrogates

*Category:* `s2g/symbol-capacity`

**Input**

```prolog
?- ws_fresh(lower, st(26,0,27519), [], _Code, State), format("U+~16r~n", [_Code]).
```

**Output**

```text
U+d7ff
State = st(26, 0, 27520)
```

## 196. Symbol capacity: a capitalised symbol far above the surrogates

*Category:* `s2g/symbol-capacity`

**Input**

```prolog
?- ws_fresh(upper, st(26,100000,0), [], _Code, State), format("U+~16r~n", [_Code]).
```

**Output**

```text
U+30e40
State = st(26, 100001, 0)
```

## 197. Symbol capacity: a lower-case symbol far above the surrogates

*Category:* `s2g/symbol-capacity`

**Input**

```prolog
?- ws_fresh(lower, st(26,0,100000), [], _Code, State), format("U+~16r~n", [_Code]).
```

**Output**

```text
U+30e41
State = st(26, 0, 100001)
```

## 198. Symbol capacity: the last capitalised symbol

*Category:* `s2g/symbol-capacity`

**Input**

```prolog
?- ws_fresh(upper, st(26,556927,0), [], _Code, State), format("U+~16r~n", [_Code]).
```

**Output**

```text
U+10fffe
State = st(26, 556928, 0)
```

## 199. Symbol capacity: one capitalised word too many

*Category:* `s2g/symbol-capacity`

**Input**

```prolog
?- ws_fresh(upper, st(26,556928,0), [], _Code, State), format("U+~16r~n", [_Code]).
```

**Output**

```text
error: error(resource_error(s2g_symbols(upper)),context(ws_fresh/5,'more distinct words than Unicode symbols for this case (555,904 each)'))
```

## 200. Symbol capacity: one lower-case word too many

*Category:* `s2g/symbol-capacity`

**Input**

```prolog
?- ws_fresh(lower, st(26,0,556928), [], _Code, State), format("U+~16r~n", [_Code]).
```

**Output**

```text
error: error(resource_error(s2g_symbols(lower)),context(ws_fresh/5,'more distinct words than Unicode symbols for this case (555,904 each)'))
```

