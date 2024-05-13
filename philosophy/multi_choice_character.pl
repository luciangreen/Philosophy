/**

multi_choice_character([[1,[[2,"a"],[-,"b"],[-,"c"],[-,"d"]]],[2,[[-,"a"],[-,"b"],[-,"c"],[-,"d"]]]],1,[],Choices).

1	a
2	b
3	c
4	d

Please choose from menu items 1-4, or q to quit
|: 1

1	a
2	b
3	c
4	d

Please choose from menu items 1-4, or q to quit
|: q
Choices = ["a"].

**/

:-include('../../listprologinterpreter/la_strings.pl').
:-include('../../listprologinterpreter/la_maths.pl').

multi_choice_character(Menu,Screen_number,Choices1,Choices2) :-
	nl,
	member([Screen_number,Menu_items],Menu),
	length(Menu_items,Menu_items_length),
	numbers(Menu_items_length,1,[],N),
	findall([N1,"\t",Menu_item,"\n"],(member(N1,N),
	find_first(get_item_n(Menu_items,N1,[_,Menu_item]))),Menu1),
	maplist(append,[Menu1],[Menu3]),
	concat_list(Menu3,Menu2),
	writeln(Menu2),
	repeat,
	concat_list(["Please choose from menu items 1-",Menu_items_length,", or q to quit"],Prompt),
	writeln(Prompt),
	read_string(user_input,"\n","\r",_,Input),
	(Input="q"->Choices1=Choices2;
	(%trace,
	number_string(Input_num,Input),
	Input_num>=1,Input_num=<Menu_items_length,
	(get_item_n(Menu_items,Input_num,[Next_screen_number,Menu_item1]),
	append(Choices1,[Menu_item1],Choices3),
	(Next_screen_number=(-) -> Choices3=Choices2;
	multi_choice_character(Menu,Next_screen_number,Choices3,Choices2))))),!.

