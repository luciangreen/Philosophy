#!/bin/sh

cd GitHub/private2/Text-to-Breasonings/

swipl -f -q ./bag_tt1.pl

cd ../Philosophy/

#swipl -f -q ./bag_cat_alg.pl

#swipl -f -q ./bag_cat_arg.pl

swipl -f -q ./day.pl
