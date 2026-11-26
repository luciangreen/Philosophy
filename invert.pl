% invert()

% reverse1([1,2,3],[],A). A=[3,2,1]

% invert: reverse1(B,[],[3,2,1]). want: B=[1,2,3]

reverse1([],A,A) :- !.
reverse1([A|D],B,C) :- reverse1(D,[A|B],C),!.

%invert()
