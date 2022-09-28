test1([
[[n,test],":-",
[
	[[n,findall],
	[
		[[v,x1],[v,y1],[v,s]],

		[
		[[n,member2],[[1,2],[v,y1]]],
		[[n,member2],[["a","b"],[v,x1]]],
		[[n,writeln],["Enter cell"]],
		[[n,writeln],[[v,y1]]],
		[[n,writeln],[[v,x1]]],
		[[n,read_string],[[v,s]]]
		],

		[v,z]
	]],
	[[n,findall],
	[
		["<tr>",[v,z1],"</tr>"],

		[
		[[n,member2],[[1,2],[v,y2]]],
		[[n,findall],
		[
			["<td>",[v,s2],"</td>"],

			[
			[[n,member2],[["a","b"],[v,x2]]],
			[[n,member2],[[v,z],[[v,x2],[v,y2],[v,s2]]]]
			],

			[v,z1]
		]]
		],

		[v,z2]
	]],
	[[n,equals4],[[v,z3],["<table>",[v,z2],"</table>"]]],
	[[n,flatten1],[[v,z3],[v,z4]]],
	[[n,concat_list],[[v,z4],[v,z5]]],
	[[n,writeln],[[v,z5]]]
]],
[[n,flatten1],[[v,a],[v,b]],":-",
[
	[[n,flatten2],[[v,a],[],[v,b]]]
]],
[[n,flatten2],[[],[v,b],[v,b]]],
[[n,flatten2],[[v,a],[v,b],[v,c]],":-",
[
	[[n,"->"],
	[
		[[n,not],[[[n,"->"],[[[n,equals4],[[v,a],[[v,a1],"|",[v,a2]]]],[[n,true]],[[n,equals4],[[v,a],[]]]]]]],

		[[n,append],[[v,b],[[v,a]],[v,c]]],

		[
		[[n,equals4],[[v,a],[[v,d],"|",[v,e]]]],
		[[n,flatten2],[[v,d],[v,b],[v,f]]],
		[[n,flatten2],[[v,e],[v,f],[v,c]]]
		]
	]]
]],
[[n,concat_list],[[v,a1],[v,b]],":-",
[
	[[n,equals4],[[v,a1],[[v,a],"|",[v,list]]]],
	[[n,concat_list],[[v,a],[v,list],[v,b]]],
	[[n,cut]]
]],
[[n,concat_list],[[v,a],[],[v,a]],":-",
[
	[[n,cut]]
]],
[[n,concat_list],[[v,a],[v,list],[v,b]],":-",
[
	[[n,equals4],[[v,list],[[v,item],"|",[v,items]]]],
	[[n,stringconcat],[[v,a],[v,item],[v,c]]],
	[[n,concat_list],[[v,c],[v,items],[v,b]]]
]]
]).