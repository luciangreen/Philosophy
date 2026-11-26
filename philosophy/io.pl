% io(+,[1,2],[C]).
% C=3.
io(+,[A,B],[C]):-
C is A+B.


/**

% ["Fundamentals of Pedagogy and Pedagogy Indicators","FUNDAMENTALS OF PEDAGOGY by Lucian Green Two Uses 9 of 30.txt",0,algorithms,"90.	ALEXIS: *What is one use that this program verifies?"]


test_types_cases(41,[[n,io],["+",[v,a2],[v,a3]]],
        [[[n,io],[[t,string],[[t,list],[[t,item]]],
        [[t,list],[[t,item]]]]],
        [[t,item],[[t,number]]],
        [[t,item],[[t,string]]]],
        [[[n,io],[input,output,output]]],

[
        [[n,io],["+",[v,water],[v,gear],[v,run]],":-",
        [       [[n,=],[[v,stretches],"true"]],
                [[n,=],[[v,water],"true"]],
                [[n,=],[[v,gear],"true"]],
                [[n,=],[[v,run],"true"]]
        ]]

        [[n,run_checklist],[[v,stretches],[v,water],[v,gear],[v,run]],":-",
        [       [[n,=],[[v,stretches],"true"]],
                [[n,=],[[v,water],"true"]],
                [[n,=],[[v,gear],"true"]],
                [[n,=],[[v,run],"true"]]
        ]]

        [[n,io],["+",[1,1],[2]]],
        [[n,io],["-",[1,1],[0]]]
],[[[[v,a2],[1,1]],[[v,a3],[2]]]]).

**/