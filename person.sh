
# Run swipl with flags:
swipl --stack-limit=80G

['bag_args21.pl'].
#96000 = 4*50 As * (2 medicine+3 time travel+1 meditation)+random(0-5)*thoughts

time(bag_args(16000)).
halt.

# STOP - run at same time:

cd Dropbox/GitHub/private2/Philosophy/

# Run swipl with flags:
swipl --stack-limit=80G

['bag_algs1.pl'].

#6000 at a time or crashes

time(bag_algs(6000)).
halt.
