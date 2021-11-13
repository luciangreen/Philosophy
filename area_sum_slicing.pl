% ["Computational English","COMPUTATIONAL ENGLISH by Lucian Green Lenses 1 of 4.txt",0,algorithms,"8.    I prepared to swallow the slice of apple.  I did this by chewing the apple slice.  First, I cut the slice of apple.  Second, I placed the slice of apple in my mouth.  Third, I chewed the slice of apple.  In this way, I prepared to swallow the slice of apple by chewing the apple slice."]

% area, sum, slicing

:-include('../listprologinterpreter/la_maths.pl').

area(X,Y,XY) :-
	XY is X*Y.
	
sum(S1,S2,S) :-
	S is S1+S2.
	
% slices([[4,5],[3,6],[2,7],[1,6],[0,8]],2,S).
% S = [[3, 6], [1, 6]].

slices(Bounds_list,Slice_width,Slices) :-
	length(Bounds_list,Bounds_list_length),
	Slice_number is div(Bounds_list_length,Slice_width),
	numbers(Slice_number,1,[],Slice_numbers),
	findall(Slice,(member(Slice_number1,Slice_numbers),
	Item_number is Slice_number1*Slice_width,
	get_item_n(Bounds_list,Item_number,Slice)),Slices).
	
length(X1,X2,D) :-
	D is X2-X1.
	
% area2([[4,5],[3,6],[2,7],[1,6],[0,8]],3,A).
% A = 15
	
% area2([[4,5],[3,6],[2,7],[1,6],[0,8]],2,A).
% A = 16
	
% area2([[4,5],[3,6],[2,7],[1,6],[0,8]],1,A).
% A = 22

area2(Bounds_list,Slice_width,Area) :-
	length(Bounds_list,Bounds_list_length),
	Height is %Bounds_list_length/
	Slice_width,
	
	slices(Bounds_list,Slice_width,Slices),
	findall(D1,(member([B,C],Slices),
	length(B,C,D),area(Height,D,D1)),Areas),
	foldl(sum,Areas,0,Area).

	
