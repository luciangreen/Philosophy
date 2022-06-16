:-include('nns_alg_writer.pl').
%:-include('../SSI/ssi.pl').

% finds append a b (list of a, b) from the overall output a,b
                                           %induct0([[[c,d],e],f],_,[],C).
%C = [[append, [(c:d):e, f],  ((c:d):e):f], [append, [c:d, e],  (c:d):e], [append, [c, d], c:d]].

% (c:d):e -> [[append, [c:d, e],  (c:d):e], [append, [c, d], c:d]] -> below


% reverse([[1],[2]],[],A).
% A = [[2], [1]].

reverse([],A,A).
reverse([A|D],B,C) :- reverse(D,[A|B],C).

% a([[1],[2]],[],A).
% A = [[1], [2]].

a([],A,A).
a([A|D],B,[A|C]) :- a(D,B,C).

% c,d,e->append c d cd, append cd e cde->above

% check each stage satisfies above

% b(["a","b"],"",A).
% A = "ab".

b([],A,A).
b([A1|D],B,C) :- string_concat(B,A1,A3), b(D,A3,C).

% c-d-e->string concat c d cd, string concat cd e cde->above

% later: substitute other vars, preds to affect input

pf_types1(
[
[reverse,
[ % 
[[n,a],[[],[v,a],[v,a]]],
[[n,a],[[[v,a],"|",[v,d]],[v,b],[v,c]],":-",
[
	[[n,a],[[v,d],[[v,a],"|",[v,b]],[v,c]]]
]]
]],
[identity,
[ % identity
[[n,a],[[],[v,a],[v,a]]],
[[n,a],[[[v,a],"|",[v,d]],[v,b],[[v,a],"|",[v,c]]],":-",
[
	[[n,a],[[v,d],[v,b],[v,c]]]
]]
]],
[string_concat, % string concat
[
[[n,a],[[],[v,a],[v,a]]],
[[n,a],[[[v,e],"|",[v,d]],[v,b],[v,c]],":-",
[
	%[[n,equals4],[]],
	[[n,stringconcat],[[v,b],[v,e],[v,f]]],
	[[n,a],[[v,d],[v,f],[v,c]]]
]]
]]
],[[[c,d],e],f]).

% pf_types1(As,D),pf_types(As,D,A),writeln1(A).

% A = [[[n,a],[[],[v,a],[v,a]]],[[n,a],[[[v,a],"|",[v,d]],[v,b],[[v,a],"|",[v,c]]],":-",[[[n,a],[[v,d],[v,b],[v,c]]]]]]
% identity


% pf_types1(As,D),pf_types(As,D,A),writeln1(A).

% substitute - for : for string concat

pf_types(Algorithms,Data,Algorithm) :-

 writeln("1 - reverse, 2 - identity, 3 - string concat:"),
 read_string(user_input,"\n","\r",_,S),
 (S="1"->

 (member([reverse,Algorithm],Algorithms),
 C=[[reverse, [(c:d):e, f],  (f:(c:d):e)], [reverse, [c:d, e],  e:(c:d)], [reverse, [c, d], d:c]],
 reverse(C,D),
 findall(y,(member([Command, Inputs, Outputs],D),
 ((Command=reverse,Inputs=[A,B],Outputs=B:A,
 interpret(off,[[n,a],[["a","b"],[],[v,a]]],Algorithm,Result),Result=[[[[v,a],["b","a"]]]])->true;false)),Y),not(Y=[]));
 
 (S="2"->
 
 (induct01(Data,_,[],C),reverse(C,D),
 member([identity,Algorithm],Algorithms),
 findall(y,(member([Command, Inputs, Outputs],D),
 ((Command=append,Inputs=[A,B],Outputs=A:B,
 interpret(off,[[n,a],[["a","b"],[],[v,a]]],Algorithm,Result),Result=[[[[v,a],["a","b"]]]])->true;false)),Y),not(Y=[]));
 
 (S="3"->
 
 (member([string_concat,Algorithm],Algorithms),
 C=[[string_concat, [(c-d)-e, f],  ((c-d)-e)-f], [string_concat, [c-d, e],  (c-d)-e], [string_concat, [c, d], c-d]],
 reverse(C,D),
 findall(y,(member([Command, Inputs, Outputs],D),
 ((Command=string_concat,Inputs=[A,B],Outputs=A-B,
 %lucianpl
 interpret(off,[[n,a],[["a","b"],"",[v,a]]],Algorithm,Result),Result=[[[[v,a],"ab"]]])->true;false)),Y),not(Y=[]))))).
