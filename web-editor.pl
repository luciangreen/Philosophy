% The cp and mv commands may need to be modified in linux

:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)).

% we need this module from the HTTP client library for http_read_data
:- use_module(library(http/http_client)).
:- http_handler('/webeditor', get_pw, []).

:- include('../listprologinterpreter/listprolog.pl').
:- include('web-editor-pw.pl').

web_editor_server(Port) :-
        http_server(http_dispatch, [port(Port)]).

	/*
	browse http://127.0.0.1:8000/
	This demonstrates handling POST requests
	   */

  get_pw(_Request) :-


																										              %format('Content-type: text/html~n~n', []),

%				data_copy(Header,Footer),
%				format(Header,[]),


	   	reply_html_page(
			    title('Web Editor'),
			    	    [

form([action='/landing2', method='POST'], [
													      		
													      		p([], [
																	  label([for=pw],'Password:'),
																	  		  input([name=pw, type=password])
																			  		      ]),

		
																					      		p([], input([name=submit, type=submit, value='Submit'], []))
																								      ])])%,
																								      
																								      				%format(Footer,[])
																								      				.

																								      :- http_handler('/landing2', landing_pad2, []).

																								      landing_pad2(Request) :-
																								              member(method(post), Request), !,
																									              http_read_data(Request, Data, []),
				

				format('Content-type: text/html~n~n', []),
																											      	%format('<p>', []),

Data=[%%debug='off',%%Debug1,
pw=Pw,submit=_],

				
			data(Header,Footer),
			
				format(Header,[]),
				
				((password(Pw1),atom_string(Pw,Pw1))->
				
				(
				
							
	   %web_form2(_Request) :-
%retractall(html_api_maker_or_terminal(_)),
%assertz(html_api_maker_or_terminal(html
 %terminal
 %)),
																										              %format('Content-type: text/html~n~n', []),




%open_string_file_s("file.txt",File_string),

% commands need path passed to them
% file_browser needs path passed to it

first_directory(CWD1),
file_browser(CWD1)
/*
foldr(string_concat,
["<form action=\"/landing\" method=\"POST\">
        <p>Edit file.txt:</p>
        <textarea name=text rows=\"20\">",File_string,"</textarea>
  <input type=submit name=submit value='Submit'>
    </form>"],String),


writeln(String),

*/

);format('Wrong password.',[])),
								format(Footer,[])
																				      .


file_browser(Path) :-

																										              %format('Content-type: text/html~n~n', []),
																			
data(Header,Footer),

format(Header,[]),

writeln(Path),
%working_directory(Path, Path),

(Path="/"->Up="";
foldr(string_concat,["<form action=\"/we\" method=\"POST\"><input type=hidden name=input value=\"","","\"><input type=hidden name=input1 value=\"",Path,"\"><input type=submit name=submit value='up'></form>"],Up)),

foldr(string_concat,["<form action=\"/we\" method=\"POST\"><input type=hidden name=input value=\"",Path,"\"><input type=hidden name=input1 value=\"","","\"><input type=submit name=submit value='new folder'></form>",

"<form action=\"/we\" method=\"POST\"><input type=hidden name=input value=\"",Path,"\"><input type=hidden name=input1 value=\"","","\"><input type=submit name=submit value='new file'></form>",

"<br>"],New),

findall(["<div style=\"width:415;\">
    <div style=\"float: left; width: 65px\"> 


<form action=\"/we\" method=\"POST\"><input type=hidden name=input value=\"",M,"\"><input type=hidden name=input1 value=\"",M2,"\"><input type=submit name=submit value='open'></form>",

"    </div>"
,
 "   <div style=\"float: left; width: 65px\"> 

",

"<form action=\"/we\" method=\"POST\"><input type=hidden name=input value=\"",M,"\"><input type=hidden name=input1 value=\"",M2,"\"><input type=submit name=submit value='move'></form>",

"    </div>",
"   <div style=\"float: left; width: 65px\"> 

",

"<form action=\"/we\" method=\"POST\"><input type=hidden name=input value=\"",M,"\"><input type=hidden name=input1 value=\"",M2,"\"><input type=submit name=submit value='copy'></form>",

"    </div>"

,"    <div style=\"float: left; width: 65px\"> 

",

"<form action=\"/we\" method=\"POST\"><input type=hidden name=input value=\"",M,"\"><input type=hidden name=input1 value=\"",M2,"\"><input type=submit name=submit value='delete'></form>

",

"    </div>

    <div style=\"float: left; width: 130px\"> 

"

,M4,"

    </div>
</div>
<br><br><br>
"],
(directory_member(Path,M1,[file_type(directory)]),file_name(M1,M4),%string_concat("/",M2,M1),
directory_file_path(Path,M4,M),Path=M2),Folders),

directory_files(Path,Files1),
delete_invisibles_etc(Files1,Files2),
findall(M3,(directory_member(Path,M1,[file_type(directory)]),file_name(M1,M2),atom_string(M2,M3)),Folders1),
%trace,
subtract(Files2,Folders1,Files3),

findall(["<div style=\"width:498px;\">
    <div style=\"float: left; width: 65px\">
    
    <form action=\"/we\" method=\"POST\"><input type=hidden name=input value=\"",M,"\"><input type=hidden name=input1 value=\"",M2,"\"><input type=submit name=submit value='view'></form>",
    
    "    </div>

    <div style=\"float: left; width: 65px\"> 

",
"<form action=\"/we\" method=\"POST\"><input type=hidden name=input value=\"",M,"\"><input type=hidden name=input1 value=\"",M2,"\"><input type=submit name=submit value='edit'></form>",
    
    "    </div>

    <div style=\"float: left; width: 65px\"> 

",


"<form action=\"/we\" method=\"POST\"><input type=hidden name=input value=\"",M,"\"><input type=hidden name=input1 value=\"",M2,"\"><input type=submit name=submit value='move'></form>",

"    </div>

<div style=\"float: left; width: 65px\"> 

",


"<form action=\"/we\" method=\"POST\"><input type=hidden name=input value=\"",M,"\"><input type=hidden name=input1 value=\"",M2,"\"><input type=submit name=submit value='copy'></form>",

"    </div>

    <div style=\"float: left; width: 65px\"> 

",


"<form action=\"/we\" method=\"POST\"><input type=hidden name=input value=\"",M,"\"><input type=hidden name=input1 value=\"",M2,"\"><input type=submit name=submit value='delete'></form>",

"    </div>

    <div style=\"float: left; width: 130px\"> 

"
,M4,"

    </div>
</div><br><br><br>
"],
(member(M4,Files3),
%(directory_member(Path,M1,[regular(true)]),
%file_name(M1,M2),%%
directory_file_path(Path,M4,M),Path=M2),Files),

% directories - open, rename, move, delete
% files - edit, rename, move, delete 

flatten([Up,New,"Folders<br><br>",Folders,"Files<br><br>",Files],List),
foldr(string_concat,List,"",String),

writeln(String),

format(Footer,[])
.
																								      :- http_handler('/we', we, []).
																								      
																								      
																								      file_name(M1,M2) :-
																								       atomic_list_concat(M3,'/',M1),
																								       append(_,[M2],M3),!.

																								      we(Request) :-
																								              member(method(post), Request), !,
																									              http_read_data(Request, Data, []),
				

				format('Content-type: text/html~n~n', []),
																											      	format('<p>', []),
																												        %%portray_clause(Data),
																												        
																												        %%term_to_atom(Term,Data),
	
		%format(Data,[])

%writeln1(Data)																												        
%/*
Data=[%%debug='off',%%Debug1,
input=Input,
input1=Input0,
submit=Submit],
%*/
%writeln1([Input,Input0,Submit])

/*
term_to_atom(Input1,Input),
term_to_atom(Input01,Input0),
term_to_atom(Submit1,Submit),

writeln1([Input1,Input01,Submit1])

*/
%/*
% directories - open, rename, move, delete
% files - edit, rename, move, delete 
%writeln(here)
%writeln1(Submit)

%/*
(Submit=up->
%(writeln(here));
(atom_concat(_,'/',Input0)->Input01=Input0;atom_concat(Input0,'/',Input01)),
atom_concat(Input01,'../',Input00),
(working_directory(_CWD,Input00%"../"
),working_directory(CWD1,CWD1),file_browser(CWD1));

(Submit=open->
(%working_directory(_CWD,Input1),
%string_concat(Input1,Input01,Full_path),
file_browser(Input));

(Submit='new folder'->
(%working_directory(_CWD,Input1),
%string_concat(Input1,Input01,Full_path),
new_folder(Input));

(Submit=move->
(go_move(Input,Input0));

(Submit=copy->
(go_copy(Input,Input0));

(Submit=delete->
(delete_file(Input),file_browser(Input0));

(Submit=edit->
(go_edit(Input,Input0));

(Submit='new file'->
(new_file(Input%,Input0
));

(Submit=view->
(go_view(Input,Input0))

)))))))))
%*/
.




%writeln1([atom_string(Hidden11,Hidden1)]),

new_folder(Input%,Input01
) :-
%*/

data(Header,Footer),
%/*
format(Header,[]),

writeln(Input),writeln("<br><br>"),

foldr(string_concat,
["<form action=\"/new_folder\" method=\"POST\">
        <p>New folder:</p>
  <input type=hidden name=text1 value=\"",Input,"\">
        <textarea name=text2 rows=\"1\">","","</textarea>
  <input type=submit name=submit value='Submit'>
    </form>"],String),


writeln(String),


%*/
format(Footer,[])
%*/
.

go_move(Input,Input01) :-
%*/

data(Header,Footer),
%/*
format(Header,[]),

foldr(string_concat,
["<form action=\"/move\" method=\"POST\">
        <p>Move/rename file from: <br>",Input,"</p>
To: </p>
  <input type=hidden name=text1 value=\"",Input,"\">
        <textarea name=text2 rows=\"5\">",Input,"</textarea>
  <input type=hidden name=text01 value=\"",Input01,"\">
  <input type=submit name=submit value='Submit'>
    </form>"],String),


writeln(String),


%*/
format(Footer,[])
%*/
.

go_copy(Input,Input01) :-
%*/

data(Header,Footer),
%/*
format(Header,[]),

foldr(string_concat,
["<form action=\"/copy\" method=\"POST\">
        <p>Copy file from: <br>",Input,"</p>
        <p>To:</p>
  <input type=hidden name=text1 value=\"",Input,"\">
        <textarea name=text2 rows=\"5\">",Input,"</textarea>
  <input type=hidden name=text01 value=\"",Input01,"\">
  <input type=submit name=submit value='Submit'>
    </form>"],String),


writeln(String),


%*/
format(Footer,[])
%*/
.

go_edit(Input,Input01) :-
%*/

open_string_file_s(Input,File_string),

data(Header,Footer),
%/*
format(Header,[]),

foldr(string_concat,
["<form action=\"/edit\" method=\"POST\">
        <p>Edit file:</p>
          <input type=hidden name=text1 value=\"",Input,"\">
        <textarea name=text2 rows=\"20\">",File_string,"</textarea>
  <input type=hidden name=text01 value=\"",Input01,"\">
  <input type=submit name=submit value='Submit'>
    </form>"],String),


writeln(String),


%*/
format(Footer,[])
%*/
.

new_file(Input%,Input01
) :-
%*/

%open_string_file_s(Input,File_string),

data(Header,Footer),
%/*
format(Header,[]),

writeln(Input),writeln("<br><br>"),

foldr(string_concat,
["<form action=\"/new_file\" method=\"POST\">
        <p>New filename:</p>
        <textarea name=text0 rows=\"1\">","","</textarea><br><br>
        <p>Contents:</p>
          <input type=hidden name=text1 value=\"",Input,"\">
        <textarea name=text2 rows=\"20\">","","</textarea>
  <input type=submit name=submit value='Submit'>
    </form>"],String),


writeln(String),


%*/
format(Footer,[])
%*/
.

go_view(Input,Input01) :-
%*/

open_string_file_s(Input,File_string),

data(Header,Footer),
%/*
format(Header,[]),

writeln(Input),writeln("<br><br>"),
(string_concat(_,".html",Input)->File_string=File_string1;
(atomic_list_concat(A,'\n',File_string),
atomic_list_concat(A,'<br>',File_string1))),

writeln(File_string1),

foldr(string_concat,
["<form action=\"/return\" method=\"POST\">
        
          <input type=hidden name=text1 value=\"",Input,"\">
        
  <input type=hidden name=text01 value=\"",Input01,"\">
  <input type=submit name=submit value='Return'>
    </form>"],String),


writeln(String),


%*/
format(Footer,[])
%*/
.

:- http_handler('/new_folder', new_folder1, []).

new_folder1(Request) :-
																								              member(method(post), Request), !,
																									              http_read_data(Request, Data, []),
				

				format('Content-type: text/html~n~n', []),
																											      	format('<p>', []),
																												        %%portray_clause(Data),
																												        
																												        %%term_to_atom(Term,Data),
	
		%format(Data,[])
																												        
%/*
%writeln1(Data)
%/*
Data=[%%debug='off',%%Debug1,
text1=Path,text2=New_folder,
submit=_],

%term_to_atom(From,Text1),
%term_to_atom(To,Text2),
%term_to_atom(Path,Text01),

%(string_concat(_,"/",Path)->Path1=Path;string_concat(Path,"/",Path1)),

%writeln(Path)
%/*
working_directory(A,A),
working_directory(_,Path),
	%Mv="rsync -avz --remove-source-files ",
NF="mkdir ",	concat_list([NF,New_folder],Command),
	shell1_s(Command),
working_directory(_,A),
	
file_browser(Path)
%*/
.


:- http_handler('/move', move, []).

move(Request) :-
																								              member(method(post), Request), !,
																									              http_read_data(Request, Data, []),
				

				format('Content-type: text/html~n~n', []),
																											      	format('<p>', []),
																												        %%portray_clause(Data),
																												        
																												        %%term_to_atom(Term,Data),
	
		%format(Data,[])
																												        
%/*
%writeln1(Data)
%/*
Data=[%%debug='off',%%Debug1,
text1=From,text2=To,text01=Path,
submit=_],

%term_to_atom(From,Text1),
%term_to_atom(To,Text2),
%term_to_atom(Path,Text01),

	%Mv="rsync -avz --remove-source-files ",
Mv="mv ",	concat_list([Mv,From," ",To],Command),
	shell1_s(Command),
	
file_browser(Path)

.



:- http_handler('/copy', copy, []).

copy(Request) :-
																								              member(method(post), Request), !,
																									              http_read_data(Request, Data, []),
				

				format('Content-type: text/html~n~n', []),
																											      	format('<p>', []),
																												        %%portray_clause(Data),
																												        
																												        %%term_to_atom(Term,Data),
	
		%format(Data,[])
																												        
%/*
Data=[%%debug='off',%%Debug1,
text1=From,text2=To,text01=Path,
submit=_],

%term_to_atom(From,Text1),
%term_to_atom(To,Text2),
%term_to_atom(Path,Text01),

	Scp="scp -pr ",
	%Scp="cp ",
	concat_list([Scp,From," ",To],Command),
	shell1_s(Command),
	
file_browser(Path).



:- http_handler('/edit', edit, []).

edit(Request) :-
																								              member(method(post), Request), !,
																									              http_read_data(Request, Data, []),
				

				format('Content-type: text/html~n~n', []),
																											      	format('<p>', []),
																												        %%portray_clause(Data),
																												        
																												        %%term_to_atom(Term,Data),
	
		%format(Data,[])
%writeln1(Data),																												      

Data=[%%debug='off',%%Debug1,
text1=Text1,text2=Text2,text01=Path,
submit=_],
/*
%term_to_atom(Text11,Text1),
%term_to_atom(Text21,Text2),
%term_to_atom(Path,Text01),
*/
atom_string(Text1,Text1s),
atom_string(Text2,Text2s),
save_file_s(Text1s,Text2s),
	
file_browser(Path).

:- http_handler('/new_file', new_file1, []).

new_file1(Request) :-
																								              member(method(post), Request), !,
																									              http_read_data(Request, Data, []),
				

				format('Content-type: text/html~n~n', []),
																											      	format('<p>', []),
																												        %%portray_clause(Data),
																												        
																												        %%term_to_atom(Term,Data),
	
		%format(Data,[])
%writeln1(Data),																												      

Data=[%%debug='off',%%Debug1,
text0=File_name,text1=Path,text2=Contents,
submit=_],
/*
%term_to_atom(Text11,Text1),
%term_to_atom(Text21,Text2),
%term_to_atom(Path,Text01),
*/

%(string_concat(_,"/",Path)->Path1=Path;string_concat(Path,"/",Path1)),
working_directory(A,A),
working_directory(_,Path),
%string_concat(Path1,File_name,Path2),

atom_string(File_name,File_names),
atom_string(Contents,Contentss),
save_file_s(File_names,Contentss),
	
working_directory(_,A),
	
file_browser(Path).

:- http_handler('/return', return, []).

return(Request) :-
																								              member(method(post), Request), !,
																									              http_read_data(Request, Data, []),
				

				format('Content-type: text/html~n~n', []),
																											      	format('<p>', []),
																												        %%portray_clause(Data),
																												        
																												        %%term_to_atom(Term,Data),
	
		%format(Data,[])
%writeln1(Data),																												      

Data=[%%debug='off',%%Debug1,
text1=_Text1,text01=Path,
submit=_],
/*
%term_to_atom(Text11,Text1),
%term_to_atom(Text21,Text2),
%term_to_atom(Path,Text01),
*/
%atom_string(Text1,Text1s),
%atom_string(Text2,Text2s),
%save_file_s(Text1s,Text2s),
	
file_browser(Path).


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
