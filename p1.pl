/*
p1(["a",["b", "b"],"a",["b"]],[],A).
A = ["a", ["b", "b"], "a", ["b"]] 
*/

p1([],V1,V1).
p1(V1,V2,V3):-equals4(V1,[V11,V12|V13]),equals4(V11,"a"),p2(V12,[],V15),append(V2,[V11,V15],V14),p1(V13,V14,V3).
p2([],V4,V4).
p2(V4,V5,V6):-equals4(V4,[V7|V8]),equals4(V7,"b"),append(V5,[V7],V9),p2(V8,V9,V6).

equals4(A,B):-A=B.
