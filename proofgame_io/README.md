# proofgame.pl: inputs and outputs

`proofgame_io/ios.txt` lists 200 inputs and the outputs they give, from real runs of proofgame.pl's predicates (which predicates, and how the inputs are made, is in `proofgame_io/cases.pl`; the inputs are made the same way every time). `swipl proofgame_io/check_ios.pl` runs them again and fails if any output changed; the "proofgame inputs and outputs" workflow does the same on every push. If a change is meant, run `swipl proofgame_io/make_ios.pl` and check the diff.
