para([
[[n,paraphraser],":-",
[
	%[[n,trace]],
	[[n,read_password],["apple"]],
	%[[n,phrase_from_file],[[[n,string],[[v,codes]]],'file.txt']],

[[n,writeln],["Please enter the file to paraphrase."]],

[[n,text_area
],["rows=\"8\" style=\"width:100%\"","",[v,string_a]]],
	
	/*
	[[n,string_strings],[%" .",
	%" .,?!()", 
	"|#@~%`$?-+*^,().:;=_/[]<>{}\n\r\s\t\\\"!0123456789",
	[v,sepandpad1]
	]],
	*/
	%[[n,findall],[[v,c1],[[[n,member],[[v,c],[v,sepandpad]]],
	%[[n,atom_string],[[v,c],[v,c1]]]],[v,sepandpad1]]],
	%[[n,string_codes],[[v,sepandpad],[v,sepandpad1]]],
	
	%[[n,string_codes],[[v,string_a],[v,string_a1]]],
	[[n,split_on_substring117a],[[v,string_a],"|#@~%`$?-+*^,().:;=_/[]<>{}\n\r\s\t\\\"!0123456789",[],[v,file_list]]],

	[[n,writeln],["Please enter the thesaurus or []."]],

[[n,text_area
],["rows=\"2\" style=\"width:100%\"","[]",[v,string21]]],

[[n,"->"],[[[n,equals4],[[v,string21],[]]],
[[n,equals4],[[v,string2],["[]"]]],
[[n,equals4],[[v,string21],[v,string2]]]]],


%[[n,read_string],[[v,string2]]],

[[n,term_to_atom],[[v,synonym_list],[v,string2]]],

	%[[n,trace]],

 [[n,delete],[[v,file_list],"",[v,file_list0]]],
 
%[[n,paraphrase1],[[v,file_list0],[],[v,file_lista],[v,synonym_list],[v,synonym_listb]]],
 [[n,open_string_file_s],["paraphraser1_lp1.txt",[v,s]]],
 
 [[n,equals4],[[v,auto],on]],

[[n,trace]],
[[n,shell_pl],[[[v,auto],[v,file_list0],[v,synonym_list]],"paraphrase1","Auto,File_list1,Synonym_list1",[v,s],[[v,file_lista],[v,synonym_listb]]]],

	%[[n,equals4],[[[v,file_lista],[v,synonym_listb]],[v,o]]],
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
],["rows=\"4\" style=\"width:100%\"",[v,synonym_listc],[v,s1]]],
	/*[
	[[n,open],['thesaurus.txt',write,[v,stream2]]],
	[[n,write],[[v,stream2],[v,synonym_list_a]]],
	[[n,close],[[v,stream2]]]
	],*/
	
	[[n,cut]]
]],

/*

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

		[[n,member],[[v,file_list3],["the","a","i","on","with","of","an","for","to","was","were","and","in","my","from","out","by"]]]
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
		[[n,member],[[[v,file_list3],[v,synonym]],[v,synonym_list]]],
		%[[n,equals4],[[[v,file_list3],[v,synonym]],[v,s1]]]],

		[[n,true]],

		[[n,member],[[[v,synonym],[v,file_list3]],[v,synonym_list]]]
		%[[n,equals4],[[v,s2],[[v,synonym],[v,file_list3]]]]]
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
