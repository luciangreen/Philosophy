prepare_string_c(S,O) :-
	string_codes(S,O).

read_string_c(O) :-
	read_string(user_input,_,_,S),
	prepare_string(S,O).

write_to_stream_c(Codes,I,O) :-	
	append(I,Codes,O).
	