find18(Text,Strings,List) :- find118(Text,Strings,[],List).
find118(Text,Strings,List1,List2):-findall(String,(member(String,Strings),not(sub_string(Text,_A,_B,_C,String))),Strings2),length(Strings,L),length(Strings2,L),append(List1,[Text],List2),!.
find118(Text,Strings,List1,List2):-findall([A,C,String],(sub_string(Text,A,_B,C,String),member(String,Strings)),D),not(D=[]),D=[[A,C,String]|_E],sub_string(Text,0,A,_,String2),
sub_string(Text,_,C,0,String3),append(List1,[String2,String],List3),find118(String3,Strings,List3,List2).
