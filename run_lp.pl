% run_lp.pl

% converts pl to lp, turns leash on or off, runs ssi-ws.

% catch errors, 500 errors

% Later: multiple files

:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)).

% we need this module from the HTTP client library for http_read_data
:- use_module(library(http/http_client)).
:- http_handler('/a', run_lp_form, []).

% http://localhost:8000/a

:-include('../Prolog-to-List-Prolog/p2lpconverter.pl').
:-include('../SSI/ssi.pl').

%:-include('test_form1.pl').

%:- include('files/listprolog.pl').

run_lp_server(Port) :-
        http_server(http_dispatch, [port(Port)]).

	/*
	browse http://127.0.0.1:8000/
	This demonstrates handling POST requests
	   */

	   run_lp_form(_Request) :-

retractall(html_api_maker_or_terminal(_)),
assertz(html_api_maker_or_terminal(html
 %terminal
 )),

																										              format('Content-type: text/html~n~n', []),

				data(Header,Footer),
				format(Header,[]),


	   	reply_html_page(
			    title('List Prolog Interpreter'),
			    	    [

form([action='/landing1', method='POST'], [
													      		
													      		p([], [
																	  label([for=input],'Run List Prolog (1 - Convert *.pl to *.lp and run query. 2 - Convert *.pl to *.lp. 3 - Run query.) Enter 1-3:'),
																	  		  input([name=input, type=textarea])
																			  		      ]),

													      		p([], [
																	  label([for=query],'Prolog query for 1 or 3:'),
																	  		  input([name=query, type=textarea])
																			  		      ]),

													      		p([], [
																	  label([for=leash],'Leash (on/off) for 1 or 3:'),
																	  		  input([name=leash, type=textarea])
																			  		      ]),

													      		p([], [
																	  label([for=pl],'*.pl file for 1 or 2:'),
																	  		  input([name=pl, type=textarea])
																			  		      ]),

													      		p([], [
																	  label([for=lp],'*.lp file for 1, 2 or 3:'),
																	  		  input([name=lp, type=textarea])
																			  		      ]),
																					      		p([], input([name=submit, type=submit, value='Submit'], []))
																								      ])]),
																								      
																								      				format(Footer,[]).


																								      :- http_handler('/landing1', landing_pad1, []).

																								      landing_pad1(Request) :-
																								              member(method(post), Request), !,
																									              http_read_data(Request, Data, []),
				

				format('Content-type: text/html~n~n', []),
																											      	format('<p>', []),
				
								data(Header,Footer),
				format(Header,[]),
																								        
%/*
Data=[%%debug='off',%%Debug1,
input=Input,query=Query,leash=Leash,pl=Pl1,lp=Lp1,submit=_],
%term_to_atom(Hidden1,Hidden),

string_atom(Pl,Pl1),
string_atom(Lp,Lp1),

working_directory(_CWD,'../Philosophy/'),


	(p2lpconverter([string,Query],Query1)->true;
	%_,
	%(catch(
	(%trace,
	string_concat("a:-",Query,Query2),
	p2lpconverter([string,Query2],Query3),
	Query3=[[[n,a],":-",Query1]])),
	
	%writeln1(Leash),
 retractall(leash1(_)),
   assertz(leash1(Leash)), 

(Leash=off->Debug=off;Debug=on),

%catch(
(Input='1'->
(
catch(
p2lpconverter([file,Pl],Test11),
_,writeln("Error in p2lpconverter.")),

catch(pp0(Test11,Test1),_,writeln("Error in pp0.")),

%term_to_atom(Test1,Test2),
string_concat(Test1,".",Test3),

catch(
	(open_s(Lp,write,Stream),
	write(Stream,Test3),
	close(Stream))
	,_,writeln("Error writing to file.")),

%writeln1(international_lucianpl([lang,"en"],Debug,Query1,Test11,_Result1)),

	working_directory(_CWD,'../SSI/'),

catch(international_lucianpl([lang,"en"],Debug,Query1,Test11,_Result1),
	_,writeln("Error in international_lucianpl."))

)->true;

(Input='2'->

catch(
p2lpconverter([file,Pl],Test11),
_,writeln("Error in p2lpconverter.")),

catch(pp0(Test11,Test1),_,writeln("Error in pp0.")),

%term_to_atom(Test1,Test2),
string_concat(Test1,".",Test3),

catch(
	(open_s(Lp,write,Stream),
	write(Stream,Test3),
	close(Stream))
	,_,writeln("Error writing to file."))

)->true;
(Input='3'->
(
	catch(
	(open_s(Lp,read,Stream),
	read(Stream,File_term1),
	close(Stream)),
	_,writeln("Error reading file.")),
	
	%term_to_atom(File_term2,File_term1),
	
	working_directory(_CWD,'../SSI/'),

	catch(
	international_lucianpl([lang,"en"],Debug,Query1,File_term1,_Result1),
	_,writeln("Error in international_lucianpl."))
	
)
))

,				format(Footer,[])

%,_,writeln("Error."))
.






data(Header,Footer) :-

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
