/*
?- text2aphors(A),writeln(A).                                                   What is the main shape in the object called?
|: a
What are the ratios of side lengths of the object in form x:y:z?
|: 1:1:1
What is one of the lengths, i.e. ':1:' for y=1cm?
|: 2::
If there is another shape in the object, please enter its name, otherwise press 'cancel'.
|: b
What are the ratios of side lengths of the object in form x:y:z?
|: 1:2:3
What is one of the lengths, i.e. ':1:' for y=1cm?
|: :4:
If there is another shape in the object, please enter its name, otherwise enter 'cancel'.
|: cancel
[[a,[2,2,2]],[b,[2,4,6]]]
A = [["a", [2, 2, 2]], ["b", [2, 4, 6]]].
*/
:-include('../listprologinterpreter/listprolog.pl').
text2aphors([[S1,D1]|O]) :-

writeln("What is the main shape in the object called?"),
read_string(user_input,"\n","\n",_,S1),
dim(D1),
more_objects(O).

dim(D1) :-
repeat,
writeln("What are the ratios of side lengths of the object in form x:y:z?"),
read_string(user_input,"\n","\n",_,D2),
Sep_and_pad=" :,.",
split_string(D2,Sep_and_pad,Sep_and_pad,D3),
forall(member(D,D3),catch(number_string(_,D),_,false)),!,
repeat,
writeln("What is one of the lengths, i.e. ':1:' for y=1cm?"),
read_string(user_input,"\n","\n",_,L1),
split_on_substring117a(L1,Sep_and_pad,L2),
member(L5,L2),catch(number_string(_,L5),_,false),
%trace,
length(L2,L),numbers(L,1,[],Ns),
%trace,
findall(A,(member(N,Ns),get_item_n(L2,N,L3),get_item_n(D3,N,D4),number_string(D5,D4),(catch(number_string(L4,L3),_,false)->(A1 is L4/D5,A=[N,[n,L4,A1]]);A=[N,[u,D5]])),A2),
findall(A1,member([N,[n,L4,A1]],A2),A3),
maplist(=(_),A3),
A3=[A5|_],

findall(B1,(member(B,A2),(B=[N,[u,D5]]->B1 is D5*A5;(B=[N,[n,L4,A1]],B1=L4))),D1),!.

/*
1:1:2
:2:
2:2:4
*/

more_objects(O) :-
findall_until_fail([S2,D2],(repeat,writeln("If there is another shape in the object, please enter its name, otherwise enter 'cancel'."),read_string(user_input,"\n","\n",_,S2),
(S2="cancel"->S3=fail;(S3=true,dim(D2)))),S3,O),!.

