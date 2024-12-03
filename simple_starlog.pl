% Simple Starlog

% ss([a,b]&[c,d],Result).
% Result  = [a,b,c,d]

% ss("ab":"cd",Result).
% Result  = "abcd"

% ss('ab'^'cd',Result).
% Result  = 'abcd'

% brackets () and []

% compound terms

% p2lp with ops

:- op(900, xfx, user:(&)).
:- op(800, xfx, user:(:)).
:- op(700, xfx, user:(^)).

ss(A&B,C) :- append(A,B,C),!.
ss(A:B,C) :- string_concat(A,B,C),!.
ss(A^B,C) :- atom_concat(A,B,C),!.

