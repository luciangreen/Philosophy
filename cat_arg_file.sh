#!/bin/bash 
swipl --stack-limit=80G --goal=main --stand_alone=true -o cat_arg_files -c cat_arg_files1.pl
./cat_arg_files