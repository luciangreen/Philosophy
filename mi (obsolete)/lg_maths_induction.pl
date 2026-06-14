% lg_maths_induction.pl

% combines row echelon reduction with constraint problems to find inductive versions of recursive addition or multiplication

% may only need nn_induction_optimisation not lg_maths_induction but lg_maths_induction for more complex multivariate formulas
% can't do whole alg of multiple formulas with lg_maths_induction because too complex, may not be determinable (x may be as good as nn regression), assuming no curve fitting, need accurate data based on split up formulas to find inductive formulas quickly
% could use standard formulas to find n(n+1)/2, but multivar ind finds formulas with other vars - can still use std formula
% do form by form for accurate data:
% - if, then and multiple clauses - also in formula, for example, if n>2 then n(n+1)/2
% - read these (combinations of) conditions (which can also lead to assignments) from alg, otherwise use running sentence logic or CAW
% - work out domains based on values
% - whole alg with formulas, when to use instead of regression 
% regression for log, 1/(ax^m+..bx^0) if formula not known, but if form known at start, then don't need reg
% after finding a form, find successive or further rec forms by using this alg again with substituted formulas that don't have to be worked out again, with RHS and + or * of sum of 1..n, etc
% finding an optimised algorithm formula from subformulas bottom-up is better because it is more accurate and won't miss details from step to step
% if possible, use linear solving technique, algebra rather than constraints to solve the reduced row echelon form with vars x, better to use constraints x try solving first
% signpost computations that recur in branches - merge, make occur once

convert_data_to_matrices(),
row_echelon_reduction_conserving_multivars,
constraint_solver

convert_data_to_matrices(),

row_echelon_reduction_conserving_multivars :-	

constraint_solver

% Finds n(n+1)/2 for 1+2+...+n
nn_induction_optimisation(B,C):-A=[0.5,1,-0.5,-1,0,-2,2],member(B,A),member(C,A),F = [[1,1],[2,3],[3,6],[4,10]],maplist(f([B,C]),F,_G).
f([B,C],F,E3):-[E1,E2]=F,E3 is B*(E1^2)+C*E1,E2 =:= E3.
