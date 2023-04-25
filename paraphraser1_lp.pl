para([
[[n,paraphraser],":-",
[
	%[[n,trace]],
	[[n,read_password],["apple"]],
	%[[n,phrase_from_file],[[[n,string],[[v,codes]]],'file.txt']],

[[n,writeln],["Please enter the file to paraphrase."]],

[[n,text_area
],["rows=\"8\" style=\"width:100%\"","",[v,string_a]]],
	
	[[n,string_chars],[" .", 
	%"#@~%`$?-+*^,()|.:;=_/[]<>{}\n\r\s\t\\\"!0123456789",
	[v,sepandpad]
	]],
	
	[[n,findall],[[v,c1],[[[n,member2],[[v,sepandpad],[v,c]]],
	[[n,atom_string],[[v,c],[v,c1]]]],[v,sepandpad1]]],
	%[[n,string_codes],[[v,sepandpad],[v,sepandpad1]]],
	
	
[[n,interpret],[[lang,same],same,[[n,find18],[[v,string_a],[v,sepandpad1],[v,file_list]]],

[
[[n,find18],[[v,text],[v,strings],[v,list]],":-",
[
	[[n,find118],[[v,text],[v,strings],[],[v,list]]]
]],
[[n,find118],[[v,text],[v,strings],[v,list1],[v,list2]],":-",
[
	[[n,findall],[[v,string],[[[n,member2],[[v,strings],[v,string]]],[[n,not],[[[n,substring],[[v,text],[v,'_a'],[v,'_b'],[v,'_c'],[v,string]]]]]],[v,b]]],
	[[n,length],[[v,strings],[v,l]]],
	[[n,length],[[v,b],[v,l]]],	
	[[n,append],[[v,list1],[[v,text]],[v,list2]]],
	[[n,cut]]
]],
[[n,find118],[[v,text],[v,strings],[v,list1],[v,list2]],":-",
[
	[[n,findall],
	[
		[[v,a],[v,c],[v,string]],

		[
		[[n,sub_string],[[v,text],[v,a],[v,'_b'],[v,c],[v,string]]],
		[[n,member],[[v,strings],[v,string]]]
		],

		[v,d]
	]],
	[[n,not],[[[n,equals4],[[v,d],[]]]]],
	[[n,equals4],[[v,d],[[[v,a1],[v,c1],[v,string1]],"|",[v,'_e']]]],
	[[n,sub_string],[[v,text],0,[v,a1],[v,'_a'],[v,string2]]],
	[[n,sub_string],[[v,text],[v,'_b'],[v,c1],0,[v,string3]]],
	[[n,append],[[v,list1],[[v,string2],[v,string1]],[v,list3]]],
	[[n,find118],[[v,string3],[v,strings],[v,list3],[v,list2]]]
]],


[[n,substring],[[v,t],[v,before],[v,length],[v,after],[v,ss]],":-",
[
	[[n,string_chars],[[v,t],[v,tc]]],
	[[n,length],[[v,tc],[v,tl]]],
	[[n,numbers],[[v,tl],0,[],[v,tln]]],
	[[n,substring2],[[v,tc],[v,tln],[v,before],[v,length],[v,after],[v,ss]]]
]],
[[n,substring2],[[v,t],[v,tln],[v,before],[v,length],[v,after],[v,ss]],":-",
[
	[[n,length],[[v,t],[v,tl2]]],
	[[n,numbers],[[v,tl2],0,[],[v,tln2]]],
	[[n,or],[[[[n,equals4],[[v,tln],[[v,before],"|",[v,rest]]]],[[n,member],[[v,tln2],[v,length]]],[[n,-],[[v,tl2],[v,length],[v,after]]],[[n,append],[[v,ss1],[v,a],[v,t]]],[[n,length],[[v,ss1],[v,length]]],[[n,string_chars],[[v,ss2],[v,ss1]]],[[n,equals4],[[v,ss2],[v,ss]]],[[n,"->"],[[[n,equals4],[[v,rest],[]]],[[n,cut]],[[n,true]]]]],[[[n,equals4],[[v,tln],[[v,b],"|",[v,rest]]]],[[[n,append],[[v,c],[v,t2],[v,t]]],[[n,length],[[v,c],1]],[[n,substring2],[[v,t2],[v,rest],[v,before],[v,length],[v,after],[v,ss]]]]]]]]
],
[[n,numbers],[[v,n2],[v,n1],[v,numbers1],[v,numbers2]],":-",
[
	[[n,numbers1],[[v,n2],[v,n1],[v,numbers1],[v,numbers2]]],
	[[n,cut]]
]],
[[n,numbers1],[[v,n2],[v,n1],[v,numbers],[v,numbers]],":-",
[
	[[n,-],[[v,n1],1,[v,n2]]],
	[[n,cut]]
]],
[[n,numbers1],[[v,n2],[v,n1],[v,numbers1],[v,numbers2]],":-",
[
	[[n,+],[[v,n1],1,[v,n3]]],
	[[n,append],[[v,numbers1],[[v,n1]],[v,numbers3]]],
	[[n,numbers1],[[v,n2],[v,n3],[v,numbers3],[v,numbers2]]],
	[[n,cut]]
]]
]%,Result
        ]],	
	
	
	%[[n,find18],[[v,string_a],[v,sepandpad1],[v,file_list]]],
	%[[n,phrase_from_file],[[[n,string],[[v,codes2]]],'thesaurus.txt']],
	%[[n,string_codes],[[v,string2],[v,codes2]]],
	%[[n,trace]],
	[[n,writeln],["Please enter the thesaurus or []."]],

[[n,text_area
],["rows=\"2\" style=\"width:100%\"","[]",[v,string2]]],


%[[n,read_string],[[v,string2]]],

[[n,term_to_atom],[[v,synonym_list],[v,string2]]],

	%[[n,trace]],

 [[n,delete],[[v,file_list],"",[v,file_list0]]],
 
[[n,paraphrase1],[[v,file_list0],[],[v,file_lista],[v,synonym_list],[v,synonym_listb]]],
	%
%[[n,writeln],[["4",[v,file_list],[],[v,file_lista],[v,synonym_list],[v,synonym_listb]]]],
	%[[n,read_string],[[v,input_a]]], %% for testing
	[[n,concat_list],[[v,file_lista],[v,file_listd]]],

	[[n,writeln],[[v,file_listd]]],
	
	/*[
	[[n,open],['file2.txt',write,[v,stream1]]],
	[[n,write],[[v,stream1],[v,file_list_a]]],
	[[n,close],[[v,stream1]]]
	],*/
	[[n,term_to_atom],[[v,synonym_listb],[v,synonym_listc]]],
	
	[[n,writeln],["Finished (submit does nothing). Please save thesaurus below."]],

	[[n,text_area
],["rows=\"4\" style=\"width:100%\"",[v,synonym_listc],[v,s]]],
	/*[
	[[n,open],['thesaurus.txt',write,[v,stream2]]],
	[[n,write],[[v,stream2],[v,synonym_list_a]]],
	[[n,close],[[v,stream2]]]
	],*/
	
	[[n,cut]]
]],
[[n,string_to_list2],[[v,b],[v,a1],[v,a2]],":-",
[
	[[n,string_concat],[[v,d],"",[v,b]]],
	[[n,string_length],[[v,d],1]],
	[[n,append],[[v,a1],[[v,d]],[v,a2]]],
	[[n,cut]]
]],
[[n,string_to_list2],[[v,a],[v,b],[v,c]],":-",
[
	[[n,string_concat],[[v,d],[v,e],[v,a]]],
	[[n,string_length],[[v,d],1]],
	[[n,append],[[v,b],[[v,d]],[v,f]]],
	[[n,string_to_list2],[[v,e],[v,f],[v,c]]]
]],
[[n,paraphrase1],[[v,file_list]%[""]
 ,[v,file_list1],[v,file_list2],[v,synonym_list],[v,synonym_list2]],":-",
[
	[[n,"->"],[
	[[n,"->"],[
	[[n,equals4],[[v,file_list],[""]]],
	
	[[n,true]],
	
	[[n,equals4],[[v,file_list],[]]]
	]],
	
	[
	[[n,equals4],[[v,file_list1],[v,file_list2]]],
	[[n,equals4],[[v,synonym_list],[v,synonym_list2]]]
	%,[[n,writeln],[["3",[v,file_list2],[v,synonym_list2]]]]
	,[[n,cut]]
	],

	[
	[[n,equals4],[[v,file_list],[[v,file_list3],"|",[v,file_list4]]]],
	[[n,string_concat],[[v,file_list5],[v,'_e'],[v,file_list3]]],
	[[n,string_length],[[v,file_list5],1]],
	%[[n,trace]],
	[[n,string_codes],[[v,file_list5],[v,file_list5_c]]],
	[[n,"->"],
	[[
	[[n,"->"],
	[
		%[[n,not],[[[n,phrase],[[[n,word1],[[v,file_list5_c]]],[v,'_']]]]],
		[[n,not],[[[n,word1],[[v,file_list5_c]]]]],

		[[n,true]],

		[[n,member],[["the","a","i","on","with","of","an","for","to","was","were","and","in","my","from","out","by"],[v,file_list3]]]
	]],
	[[n,append],[[v,file_list1],[[v,file_list3]],[v,file_list6]]],

	%[[n,writeln],[["1",[v,file_list6],[v,synonym_list]]]],
	[[n,paraphrase1],[[v,file_list4],[v,file_list6],[v,file_list2],[v,synonym_list],[v,synonym_list2]]]%,
	%[[n,cut]]
],

 [[n,true]],
 
 [
 [[n,word1],[[v,file_list5_c]]],
	[[n,"->"],
	[
	[[n,"->"],
	[
		[[[n,member],[[v,synonym_list],[v,s1]]],
		[[n,equals4],[[v,s1],[[v,file_list3],[v,synonym]]]]],

		[[n,true]],

		[[[n,member],[[v,synonym_list],[v,s2]]],
		[[n,equals4],[[v,s2],[[v,synonym],[v,file_list3]]]]]
	]],
	[
	[[n,append],[[v,file_list1],[[v,synonym]],[v,file_list6]]],
	[[n,=],[[v,synonym_list],[v,synonym_list1]]]
	],
	
	[[[n,concat_list],[["What is a synonym for: ",[v,file_list3],"\n","or <Return> to skip."],[v,notification]]],
	[[n,writeln],[[v,notification]]],
	[[n,read_string],[[v,input]]],
	[[n,"->"],
	[
		[[n,equals4],[[v,input],""]],

		[
		[[n,=],[[v,synonym2],[v,file_list3]]]
		],

		[
		[[n,=],[[v,synonym2],[v,input]]]
		]
	]],
	[[n,append],[[v,synonym_list],[[[v,file_list3],[v,synonym2]]],[v,synonym_list1]]]
	]]],
	[[n,append],[[v,file_list1],[[v,synonym2]],[v,file_list6]]]
	
	%,[[n,trace]]%,[[n,paraphrase1],[[v,file_list4],[v,file_list6],[v,file_list2],[v,synonym_list1],[v,synonym_list2]]]
	%[[n,trace]],[[n,writeln],[[[v,file_list4],[v,file_list6],[v,file_list2],[v,synonym_list1],[v,synonym_list2]]]]
	%,[[n,writeln],[["2",[v,file_list6],[v,synonym_list1]]]]

			,[[n,paraphrase1],[[v,file_list4],[v,file_list6],[v,file_list2],[v,synonym_list1],[v,synonym_list2]]]%,

	]
	]]
	

	
	]]]
	
		%,[[n,trace2]],
	%[[n,cut]]
]],


/*
[[n,paraphrase2],[[v,file_list4],[v,file_list6],[v,file_list2],[v,synonym_list1],[v,synonym_list2]],":-",
[[[n,paraphrase1],[[v,file_list4],[v,file_list6],[v,file_list2],[v,synonym_list1],[v,synonym_list2]]]]],
*/
[[n,concat_list],[[v,a1],[v,b]],":-",
[
	[[n,concat_list],["",[v,a1],[v,b]]],
	[[n,cut]]
]],
[[n,concat_list],[[v,a],[v,list],[v,b]],":-",
[
	[[n,concat_list1],[[v,a],[v,list],[v,b]]]
]],
[[n,concat_list1],[[v,a],[],[v,a]],":-",
[
	[[n,cut]]
]],
[[n,concat_list1],[[v,a],[v,list],[v,b]],":-",
[
	[[n,equals4],[[v,list],[[v,item],"|",[v,items]]]],
	[[n,stringconcat],[[v,a],[v,item],[v,c]]],
	[[n,concat_list1],[[v,c],[v,items],[v,b]]]
]]

]).
