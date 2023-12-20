parent(albert, jim).
parent(albert, peter).
parent(jim, brian).
parent(peter, lee).
parent(peter, john).

year_of_birth(albert, 1926).
year_of_birth(peter, 1945).
year_of_birth(jim, 1949).
year_of_birth(brian, 1974).
year_of_birth(john, 1974).
year_of_birth(lee, 1975).

gender(albert,male).
gender(jim,male).
gender(peter,male).
gender(brian,male).
gender(lee,male).
gender(john,male).

grandparent(GG) :-
	findall([A,B],parent(A,B),C),
	findall([Grandparent,Grandchild],(member([Grandparent, Child],C),
	member([Child, Grandchild],C)),GG),!.

% older(A,B)
% means A is older than B
%
older(GG) :-
	findall([A,B],year_of_birth(A,B),C),
	findall([A1,B1],(member([A1, Y1],C),
	member([B1, Y2],C), Y2 > Y1),GG),!.


% siblings(A,B)
% means A and B are siblings
%
siblings(GG) :-
	findall([A,B],parent(A,B),C),
	findall([A1,B1],(member([X, A1],C),
	member([X, B1],C),not(A1=B1)),GG),!.

      % A & B share a common parent
         %
                 % A is different from B  (Bratko, p175)



% sibling_list(Child, Siblings)
% Siblings is a list of A1's brothers and sisters
%
sibling_list(A1, Siblings) :-
	findall([A,B],parent(A,B),C),
	findall([A1,B1],(member([X, A1],C),
	member([X, B1],C),not(A1=B1)),List),
	remove_duplicates(List, Siblings),!.
	

% remove_duplicates(List, Result)
%
% Removes duplicate entries in a list
%
remove_duplicates([], []):-!.

remove_duplicates([[X1,X2]|Rest], [[X1,X2]|Result]) :-
	delete(Rest,[X1,X2],R1),
	delete(R1,[X2,X1],R2),
	remove_duplicates(R2, Result),!.

% older_brother(A,B)
% means A is an older brother of B
%
older_brother(GG) :-
	older_brother1(P,Y,G),

findall([A,B,C1,B3],(member([A,B],P),member([B,C1],Y),member([B,B3],G)),C),findall([A1,B1],(member([X, A1, C2, male],C),member([X, B1, C21, _],C),C2 > C21),GG),!.

older_brother1(P,Y,G) :-
	findall([A,B],parent(A,B),P),
	findall([A,B],year_of_birth(A,B),Y),
	findall([A,B],gender(A,B),G),!.


% descendant(Person, Descendant)
% means Descendant is a descendant of Person.
%

descendant(A1,B1) :- findall([A,B],parent(A,B),C), descendant1(A1,B1,C,C). 
descendant1(_Person, [],[],_) :-!. 
descendant1(Person, D2,[[Person,C2]|C1],E) :-
 descendant1(C2,D, E,E),
 descendant1(Person,Descendant, C1,E),
 foldr_append([[C2],D,Descendant],[],D2),!.

descendant1(Person1, Descendant,[[Person2,_C2]|C1],E) :- 
 not(Person1=Person2),
 descendant1(Person1,Descendant, C1,E),!.
 
foldr_append([],B,B) :- !.
foldr_append([A1|A2],B,C) :-
 append(B,A1,D),
 foldr_append(A2,D,C),!.

% ancestor(Person, Ancestor)
% means Ancestor is an ancestor of Person.
%
% This is functionally equivalent to descendant(Ancestor, Person).
%

ancestor(A1,B1) :- findall([A,B],parent(A,B),C), ancestor1(A1,B1,C,C). 
ancestor1(_Person, [],[],_) :-!. 
ancestor1(Person, D2,[[C2,Person]|C1],E) :-
 ancestor1(C2,D, E,E),
 ancestor1(Person,Ancestor, C1,E),
 foldr_append([[C2],D,Ancestor],[],D2),!.

ancestor1(Person1, Ancestor,[[_C2,Person2]|C1],E) :- 
 not(Person1=Person2),
 ancestor1(Person1,Ancestor, C1,E),!.
 

% children(Parent, ChildList)
% ChildList is bound to a list of the children of Parent.
%
children(Parent, ChildList) :-
    findall(Child, parent(Parent,Child), ChildList).


% list_count(List, Count)
% Count is bound to the number of elements in List.
%
list_count([], 0).
list_count([_|Tail], Count) :-
    list_count(Tail, TailCount),
    Count is TailCount + 1.


% count_descendants(Person, Count)
% Count is bound to the number of descentants of Person.
%
count_descendants(Person, Count) :-
    descendant(Person, List),
    list_count(List, Count).
    