% eh.pl

:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)).

% we need this module from the HTTP client library for http_read_data
:- use_module(library(http/http_client)).
:- http_handler('/', eh_form, []).

% http://localhost:8000/a

:-include('../Lucian-Academy/short_essay_helper3_agps.pl').
:-include('../listprologinterpreter/la_maths.pl').
:-include('../Text-to-Breasonings/text_to_breasonings.pl').

%:-include('test_form1.pl').

%:- include('files/listprolog.pl').

eh_server(Port) :-
        http_server(http_dispatch, [port(Port)]).

	/*
	browse http://127.0.0.1:8000/
	This demonstrates handling POST requests
	   */

	   eh_form(_Request) :-

																										              %format('Content-type: text/html~n~n', []),

%				data_copy(Header,Footer),
%				format(Header,[]),

% 

	   	reply_html_page(
			    title('Essay Helper'),
			    	    [

form([action='/landing1', method='POST'], [
													      		
													      		p([], [
																	  label([for=title],'Essay Title'),
																	  		  input([name=title, type=textarea])
																			  		      ]),

													      		p([], [
																	  label([for=s1l],'Source 1 long citation, e.g. Surname, I., & Surname, I. (2000). Title. <i>Publisher</i>'),
																	  		  input([name=s1l, type=textarea])
																			  		      ]),

													      		p([], [
																	  label([for=s1s],'Source 1 short citation, e.g. Surname, 2000'),
																	  		  input([name=s1s, type=textarea])
																			  		      ]),

											      		p([], [
																	  label([for=s1p],'Source 1 page number of first page, e.g. 1'),
																	  		  input([name=s1p, type=textarea])
																			  		      ]),

													      		p([], [
																	  label([for=s1c],'Source 1 content'),
																	  		  input([name=s1c, type=textarea])
																			  		      ]),

													      																					      		p([], input([name=submit, type=submit, value='Submit'], []))
																								      ])])%,
																								      
																					      				%format(Footer,[])
																								      				.


																								      :- http_handler('/landing1', landing_pad1, []).

																								      landing_pad1(Request) :-
																								              member(method(post), Request), !,
																									              http_read_data(Request, Data, []),
				

				format('Content-type: text/html~n~n', []),
																											      	%format('<p>', []),

Data=[%%debug='off',%%Debug1,
title=Title,s1l=S1l,s1s=S1s,s1p=S1p,s1c=S1c,submit=_],

				
			data_copy(Header,Footer),
			
				format(Header,[]),

 atom_string(Title,Title1),
 atom_string(S1l,S1l1),
 atom_string(S1s,S1s1),
 atom_number(S1p,S1p1),
 atom_string(S1c,S1c1),

 term_to_atom(
 [S1l1,S1s1,S1p1,S1c1],Texts),
 
 atom_string(Texts,Texts1),
 Texts2=[Texts1],
 %writeln1(Texts1),
	short_essay_helper(Texts2,Title,1,Essay_0),
				
				atomic_list_concat(A,"\n",Essay_0),
				atomic_list_concat(A,"<br>",Essay_01),

				writeln(Essay_01),																				        
%/*
%term_to_atom(Hidden1,Hidden),


				format(Footer,[])

%,_,writeln("Error."))
.






data_copy(Header,Footer) :-

Header='<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2//EN">
<html lang="en">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title>State Saving Interpreter</title>
    <style type="text/css"> 
<!-- 

A:link {text-decoration: none;} 
A:visited {text-decoration: none;} 
A:hover {text-decoration: underline;} 

img {
 height: auto;
 max-width: 100%;
 object-fit: contain;
} 

table {table-layout: fixed; width: 100%;}

td {word-wrap: break-word;}

--> 
  </style>
    <meta name="viewport" content="width=device-width, initial-scale=1">

  </head>
  <body style="background-color: rgb(255, 239, 227);">

   
    <div style="text-align: center;">
      <table width="80%">
        <tbody>
          <tr>
            <td>
              <p>',

Footer='</p>
            </td>
          </tr>
        </tbody>
      </table>
      <br>

    <br>
  </body>
</html>'.
