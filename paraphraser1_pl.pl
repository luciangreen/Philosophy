para([
[[n,shell1],[[v,i],[v,q],[v,p],[v,o]],":-",
[
]],
[[n,paraphraser],":-",
[
	%[[n,trace]],
	[[n,read_password],["apple"]],
	%[[n,phrase_from_file],[[[n,string],[[v,codes]]],'file.txt']],

[[n,writeln],["Please enter the file to paraphrase."]],

[[n,text_area
],["rows=\"8\" style=\"width:100%\"","",[v,string_a]]],
	
	[[n,shell_pl],[[],"sepandpad1","","string_chars(\"#@~%`$?-+*^,().:;=_/[]<>{}\\n\\r\s\t\\\"!0123456789\",Sepandpad),findall(C1,(member(C,Sepandpad),atom_string(C,C1)),Sepandpad2),term_to_atom(Sepandpad2,Sepandpad3),write(Sepandpad3).",[v,sepandpad1]]],	

	[[n,shell_pl],[[[v,string_a],[v,sepandpad1]],"find18","Text,Strings","find118(Text,Strings,[],File_list),term_to_atom(File_list,File_list1),write(File_list1).
find118(Text,Strings,List1,List2):-findall(String,(member(String,Strings),not((sub_string(Text,_A,_B,_C,String)))),B),length(Strings,L),length(B,L),append(List1,[Text],List2),!.
find118(Text,Strings,List1,List2):-findall([A,C,String],(sub_string(Text,A,_B,C,String),member(String,Strings)),D),not((=(D,[]))),=(D,[[A1,C1,String1]|_E]),sub_string(Text,0,A1,_A,String2),sub_string(Text,_B1,C1,0,String3),append(List1,[String2,String1],List3),find118(String3,Strings,List3,List2).",[v,file_list]]],


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
		[[[n,member],[[[v,file_list3],[v,synonym]],[v,synonym_list]]]
		],

		[[n,true]],

		[[[n,member],[[[v,synonym],[v,file_list3]],[v,synonym_list]]]
		]
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
