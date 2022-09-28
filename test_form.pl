test:-findall([X1,Y1,S],(member2([1,2],Y1),member2(["a","b"],X1),writeln("Enter cell"),writeln(Y1),writeln(X1),read_string(S)),Z),findall(["<tr>",Z1,"</tr>"],(member2([1,2],Y2),findall(["<td>",S2,"</td>"],(member2(["a","b"],X2),member2(Z,[X2,Y2,S2])),Z1)),Z2),Z3=["<table>",Z2,"</table>"],flatten1(Z3,Z4),concat_list(Z4,Z5),writeln(Z5).
flatten1(A,B):-flatten2(A,[],B).
flatten2([],B,B).
flatten2(A,B,C):-(not((A=[A1|A2]->true;A=[]))->append(B,[A],C);(A=[D|E],flatten2(D,B,F),flatten2(E,F,C))).
concat_list(A1,B):-A1=[A|List],concat_list(A,List,B),!.
concat_list(A,[],A):-!.
concat_list(A,List,B):-List=[Item|Items],stringconcat(A,Item,C),concat_list(C,Items,B).
