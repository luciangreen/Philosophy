/*

PFT testing data
                                                        data_to_types22([[1],[1]],T,V),find_lists1(T,[],L,[],S),writeln(T),writeln(V),writeln(S),writeln(L).
L = [[[t, number, 1]]]
 data_to_types22([[[1]]],T,V),find_lists1(T,[],L,[],S),writeln(T),writeln(V),writeln(S),writeln(L).
L = [[[[t, brackets], [[t, number, 1]]]]]

data_to_types22([[[[1]]]],T,V),find_lists1(T,[],L,[],S),writeln(T),writeln(V),writeln(S),writeln(L).
L = [[[[t,brackets],[[[t,brackets],[[t,number,1]]]]]]]

                                                             data_to_types22([[[2, 2]], [[2]]],T,V),find_lists1(T,[],L,[],S),writeln(T),writeln(V),writeln(L),writeln(S).

data_to_types22([[1,[2, 2],1,[2]], [1,[2]]],T,V),find_lists1(T,[],L,[],S),writeln(T),writeln(V),writeln(L),writeln(S).
L = [[t, number, 1], [[t, list], [[t, number, 2]]]]

brackets not lists

*/
