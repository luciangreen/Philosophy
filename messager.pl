:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)).

% we need this module from the HTTP client library for http_read_data
:- use_module(library(http/http_client)).
:- http_handler('/', web_form, []).

%:- include('files/listprolog.pl').
:- include('../listprologinterpreter/listprolog.pl').
:- include('../listprologinterpreter/la_files.pl').

% server(8000).

server(Port) :-
        http_server(http_dispatch, [port(Port)]).

	/*
	browse http://127.0.0.1:8000/
	This demonstrates handling POST requests
	   */

	   web_form(_Request) :-
	   	reply_html_page(
			    title('Messager'),
			    	    [
				    	     form([action='/landing', method='POST'], [
				    	     /**
					     		p([], [
									  label([for=debug],'Debug (on/off):'),
									  		  input([name=debug, type=textarea])
											  		      ]),
											  		      **/
													      		p([], [
																	  label([for=message],'Message:'),
																	  		  input([name=message, type=textarea])
																			  		      ])
													      		
																								      ])]).

																								      :- http_handler('/landing', landing_pad, []).

																								      landing_pad(Request) :-
																								              member(method(post), Request), !,
																									              http_read_data(Request, Data, []),
																										              format('Content-type: text/html~n~n', []),
																											      	format('<p>', []),
																												        %%portray_clause(Data),
																												        
																												        %%term_to_atom(Term,Data),
					%writeln(here0),
											%writeln(Data)		
																							        
Data=[%%debug='off',%%Debug1,
message=Message%,submit=_
],

string_atom(Message1,Message),
%writeln(Data),

open_file_s("messager.txt",Messages_term),
%writeln(here1),
%term_to_atom(Messages_term,Messages),
append(Messages_term,[Message1],Messages_term2),
%writeln(here2),
save_file_s("messager.txt",Messages_term2),
%writeln(here3),
writeln("Message saved."),
%term_to_atom(Query2,Query1),
%term_to_atom(Functions2,Functions1),

%international_interpret([lang,"en"],Debug2,Query2,Functions2,Result),
																														format('</p><p>========~n', []),
																															%%portray_clause
																															%portray_clause(Result),
																																																															%%writeln1(Data),

format('</p>')
%*/
.





																								      :- http_handler('/messages', messages, []).

																								      messages(_Request) :-
																								              %member(method(post), Request), !,
																									              %http_read_data(Request, Data, []),
																										              format('Content-type: text/html~n~n', []),
																											      	format('<p>', []),
																												        %%portray_clause(Data),
																												        
																												        %%term_to_atom(Term,Data),
																												        
%Data=[%%debug='off',%%Debug1,
%message=Message,submit=_],

open_file_s("messager.txt",Messages),
%term_to_atom(Messages_term,Messages),
%append(Messages_term,[Message],Messages_term2),
%save_file_s("messager.txt",Messages_term2),

findall(_,(member(Message,Messages),writeln(Message),writeln("<br><br>")),_),
%writeln("Message saved."),
%term_to_atom(Query2,Query1),
%term_to_atom(Functions2,Functions1),

%international_interpret([lang,"en"],Debug2,Query2,Functions2,Result),
																														format('</p><p>========~n', []),
																															%%portray_clause
																															%portray_clause(Result),
																																																															%%writeln1(Data),

format('</p>')
%*/
.