% 14 5 21

% Two Uses
% 4. DION: Two uses is correct because of the phenomenology of nature, which is correct because the subject should write unique algorithms and arguments.

use("tree","branch").
use("branch","child node").
use("child node","verifying person").


% 5. First, I asked what’s Daoism (concerning individualness) got to do with it?

% unique([1,2,3]).
% true.
% unique([1,2,3,3]).
% false.

unique(A) :- sort(A,B),length(B,L),length(A,L).

% 6. Second, I wrote they must be perfect. 

% perfect([1,1,1]).
% true.
% perfect([1,0,0]).
% false.

perfect(A) :- forall(member(B,A),B=1).

% 7. Third, I wrote they must be put together again.

% unzip_sort_zip([[2,6],[1,5],[3,4]],L).
% L = [[1,4],[2,5],[3,6]]

:-include('../../listprologinterpreter/la_maths.pl').
unzip_sort_zip(A,B) :- 
	findall(A1,member([A1,_],A),A2),
	sort(A2,A3),
	findall(B1,member([_,B1],A),B2),
	sort(B2,B3),
	length(A,L),
	numbers(L,1,[],N),
	findall([A4,B4],
		(member(N1,N),get_item_n(A3,N1,A4),
	get_item_n(B3,N1,B4)),B).
	
