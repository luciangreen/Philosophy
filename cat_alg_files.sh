#!/bin/bash 
swipl --stack-limit=80G --goal=main --stand_alone=true -o cat_alg_files -c cat_alg_files1.pl
./cat_alg_files