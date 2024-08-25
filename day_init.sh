#!/bin/sh

cd GitHub/Text-to-Breasonings/

swipl -f -q ./bag_tt1.pl

cd ../Philosophy/

#swipl -f -q ./bag_cat_alg.pl

#swipl -f -q ./bag_cat_arg.pl

swipl -f -q ./day.pl
