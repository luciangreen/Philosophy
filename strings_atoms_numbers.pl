strings_atoms_numbers(T1,T2) :-

	sub_term_types_wa([string,atom,number],T1,In1),
	%(length(In1,1)->T1=T2;
	(findall([Ad,[Type,A2]],(member([Ad,A1],In1),
	not(type_s2a1(A1)),
	not(is_var_s2a(A1)),
	get_type(A1,Type),
	%try(A1,A2)
	characterise(A1,Type,A2),
	(length(A2,1)->fail;true)
	),In2),
	foldr(put_sub_term_wa_ae,In2,T1,T2)).

get_type(A1,string) :- string(A1).
get_type(A1,atom)   :- atom(A1).
get_type(A1,number) :- number(A1).

type_s2a1(string).
type_s2a1(atom).
type_s2a1(number).

characterise(A1,_,A2) :- string_strings(A1,A2),!.
%characterise(A1,atom,A2) :- string_chars(A1,A2),!.
%characterise(A1,number,A2) :- number_string(A1,A3),string_strings(A3,A21),findall(A4,(member(A5,A21),number_string(A4,A5)),A2),!.

join_san(A,string,B) :- foldr(string_concat,A,B),!.
join_san(A,atom,B) :- foldr(string_concat,A,B1),atom_string(B,B1),!.
join_san(A,number,B) :- foldr(string_concat,A,B1),number_string(B,B1),!.
