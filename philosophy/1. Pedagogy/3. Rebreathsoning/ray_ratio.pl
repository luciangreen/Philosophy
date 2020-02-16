%% ray_ratio.pl
%% https://lucianpedia.fandom.com/wiki/Rebreathsoning 3

test(76,[[n,ray_ratio],[2,[v,c]]],
[[[n,ray_ratio],[[v,a],[v,b]],":-",
	[[[n,sqrt],[[v,a],[v,c]]],
	[[n,/],[[v,c],[v,a],[v,b]]]]]],
[[[[v,c],0.7071067811865476]]]).
