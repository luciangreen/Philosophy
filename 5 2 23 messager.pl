% 5 2 23.pl

% ["Fundamentals of Meditation and Meditation Indicators","FUNDAMENTALS OF MEDITATION by Lucian Green Upasana Sutra 4 of 4.txt",0,algorithms,"31. *I prepared to send the letter to the Queen.  I did this by licking the stamp.  First, I detached the stamp from the perforated sheet.  Second, I licked it.  Third, I attached it to the envelope.  In this way, I prepared to send the letter to the Queen by licking the stamp."]

% messager

% this version: one user without login creates, edits or deletes messages - can port from pl to ssiws (lp) later

%:-include('../')
:-include('../listprologinterpreter/listprolog.pl').
:-include('../private/la_com_ssi1.pl').
:-include('../private/la_com_ssi1_run_in_prolog.pl').

messager :- display_messages(Messages), nl, writeln("Enter (0 - Exit, 1 - New message, 2 - Edit a message, 3 - Delete a message):"),
read_string(S),(number_string(N,S)->go_messager_option(N,Messages);messager),!.

display_messages(Messages2) :- open_file('messages.txt',Messages),length(Messages,Length),numbers(Length,1,[],Ns), findall([N,Title,Message],(member2(Ns,N),get_item_n(Messages,N,[N,Title,Message]),%write(N),write(" - "),
writeln(Title)),Messages2).

go_messager_option(0,_Messages) :- true,!.
go_messager_option(1,Messages) :- length(Messages,L),L2 is L+1,writeln("Enter Title:"),read_string(T),writeln("Enter Message:"),read_string(M),append(Messages,[[L2,T,M]],Messages2),sort(Messages2,Messages21),write_file('messages.txt',Messages21),messager.
go_messager_option(2,Messages) :- display_messages_to_select(Messages),length(Messages,L),nl,write("Enter number of message to edit (1-"),write(L),writeln(" or 0 to go up):"),read_string(S),(number_string(N,S)->(go_edit_message(N,Messages));go_messager_option(2,Messages)).
go_messager_option(3,Messages) :- display_messages_to_select(Messages),length(Messages,L),nl,write("Enter number of message to delete (1-"),write(L),writeln(" or 0 to go up):"),read_string(S),(number_string(N,S)->(go_delete_message(N,Messages));go_messager_option(3,Messages)).

go_messager_option(N) :- not(N=1),not(N=2),not(N=3),not(N=4),messager.

go_edit_message(0,_Messages) :- messager,!.
go_edit_message(N,Messages) :- %trace,
get_item_n(Messages,N,[N,Title,Message]),writeln("Edit title:"),text_area("rows=\"4\" style=\"width:100%\"",Title,T2),writeln("Edit message:"),text_area("rows=\"4\" style=\"width:100%\"",Message,M2),delete(Messages,[N,_A,_B],Messages0),append(Messages0,[[N,T2,M2]],Messages2),sort(Messages2,Messages21),write_file('messages.txt',Messages21),nl,writeln("Edited message."),nl,messager.

go_delete_message(0,_Messages) :- messager,!.
go_delete_message(N,Messages) :- delete_item_n(Messages,N,Messages2),write_file('messages.txt',Messages2),nl,writeln("Deleted message."),nl,messager.

display_messages_to_select(Messages) :-%trace,
findall([N," - ",T,"\n"],member2(Messages,[N,T,_M]),Messages3),
maplist([n,append],Messages3,[],Messages1),maplist([n,string_concat],Messages1,"",Messages2),writeln(Messages2).