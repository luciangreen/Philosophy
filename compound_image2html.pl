% ["Short Arguments","Upasana Sutra.txt",0,algorithms,"1. I prepared to help people see high quality imagery to God.  I did this by stating that the Upasana Sutra helped write the breasonings details with people.  First, I stated that the Upasana Sutra helped me see top-level imagery.  Second, I saw examples of the breasonings details, for example, the object, the relation between objects, etc.  Third, I wrote about the object, etc. with people."]

:-include('colours_to_image.pl').
:-include('../listprologinterpreter/la_files.pl').

% compound_image2html([[red,red,red],[red,red,red],[red,red,red]]).
% compound_image2html([[red,orange,yellow],[green,blue,purple],[white,black,brown]]).

compound_image2html(Pixels) :-
	HTML_header="<html><head></head><body><table border = \"0\" cellpadding = \"0\" cellspacing = \"0\">",
	findall(["<tr height=\"100\">",Cell,"</tr>"],(member(Row,Pixels),
	findall([%"<td bgcolor = \"RGB( ",R,", ",G,", ",B," )\">"
"<td width=\"100\" bgcolor=\"",	Pixel_colour,"\">"
,%"&nbsp;",
"</td>"],(member(Pixel_colour,Row)%colour(Pixel_colour,[R,G,B])),
),Cell)),Body),

	HTML_footer="</table></body></html>",

	flatten([HTML_header,Body,HTML_footer],HTML1),
	foldr(string_concat,HTML1,"",HTML),
	
	save_file_s("file.html",HTML).