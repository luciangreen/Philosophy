# Spec to Algorithm Caveats

* Don't forget to call
```
(catch(algs(Algs),_,false)->
	findall(_,(member(Alg,Algs),
	retractall(algs(Alg))),_);
	true),
	retractall(algs(_)),
	assertz(algs([])),
```
* before running
`spec_to_algorithm(PN,S,CBM,Alg1)`.
