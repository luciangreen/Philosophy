:-include('replace_vars.pl').
:-include('replace_pred_names.pl').
:-include('../listprologinterpreter/listprolog.pl').

% delete_duplicate_clauses([[[n,function],[[v,a]],":-",[[[n,+],[[v,a]]]]],[[n,function2],[[v,a]],":-",[[[n,+],[[v,a]]]]],[[n,function3],[[v,a]],":-",[[[n,function2],[[v,a]]]]]],[],L),writeln1(L).
% [[[n,function],[[v,a]],":-",[[[n,+],[[v,a]]]]],[[n,function3],[[v,a]],":-",[[n,function],[[v,a]]]]]

% Processes a list of clauses, removing the same clauses with different names, and replaces instances of the old names of the removed clauses with the name of the remaining clause.

% delete_duplicate_clauses([[[n,a],":-",[[[n,b]]]],[[n,c],":-",[[[n,b]]]],[[n,d],":-",[[[n,c]]]]],[],L),writeln1(L).
% L = [[[n, a], ":-", [[[n, b]]]], [[n, d], ":-", [[n, a]]]].

delete_duplicate_clauses([],List,List) :- !.
delete_duplicate_clauses(List1,List2,List3) :-
 List1=[[[[n,N]|Item1],VT]|List4],
 findall(N1,member([[n,N1]|Item1],List4),N2),
 delete(List4,[[[n,_]|Item1],_],List5),
 ((
 Item1=[])->append(List2,[[[[n,N]],VT]],List6);
 append(List2,[[[[n,N]|Item1],VT]],List6)),
 findall([List7,L10],(member([List8,L10],List5),replace_pred_names1(List8,List7,N2,N)),List9),
 delete_duplicate_clauses(List9,List6,List3),!.
 
% with state machine, going backwards from base cases, minimises sm - like minimise decision tree, do groups of clauses together x join clauses together first [x minimise decision tree doesn't have cycles - account for incoming stems (if same inc. stems etc. then delete) and delete references to deleted branches] nd branches have no condition
% stop infinite loop in minimise decision tree by 

% is delete duplicate clauses the same as the second alg but processes preds with different names - no, the second alg processes inside preds
% weird to do clauses together, do them separately (test whether they are the same but have different names) followed by alg 1
% replace pred names with numbers, keeping a list of name-number correspondences, then run alg 1
%  just delete them, move up and repeat until the same (not use alg 1 x also use it)

% a(v2,v1):-b(v2,v1). -> ?(new_v1,new_v2):-b(new_v1,new_v2). - if two instances, delete and replace non a with a
% do with sm x

% minimise_alg([[[n,function],[[v,a],[v,b]],":-",[[[n,+],[[v,a],[v,b]]]]],[[n,function],[[v,b],[v,a]],":-",[[[n,+],[[v,b],[v,a]]]]]],A),writeln1(A).
% [[[n,function],[[v,a],[v,b]],":-",[[n,+],[[v,a],[v,b]]]]]

minimise_alg(Algorithm1,Algorithm2) :-
 findall([Algorithm3,Var_table],(member(Algorithm0,Algorithm1),replace_vars1(Algorithm0,Algorithm3,1,_,[],Var_table)),Algorithm4),
 %findall(Algorithm,member([Algorithm,_],Algorithm4),Algorithm4a),
 delete_duplicate_clauses(Algorithm4,[],Algorithm5),
length(Algorithm5,L),
 numbers(L,1,[],Ns),
 findall(Algorithm7,(member(N,Ns),
 %trace,
 %get_item_n(Algorithm5,N,Algorithm6),
 
get_item_n(Algorithm5,N,[Algorithm6,Var_table2]),
findall([B,A],member([A,B],Var_table2),Var_table3),
replace_vars1(Algorithm6,Algorithm7,1,_,Var_table3,_)),Algorithm8), 
 (Algorithm1=Algorithm8->Algorithm8=Algorithm2;
 minimise_alg(Algorithm8,Algorithm2)).

