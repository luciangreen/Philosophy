% ["Mind Reading","mr spiritual screen 1.txt",0,algorithms,"27. Fly or browse through the 3D spiritual operating system."]

% "cd ../", "cd <directory>", "ls" or "q" to quit.

file_os :-
	pwd,
	directory_files("./",Files),
	findall(_,(member(File,Files),
	writeln(File)),_),
	writeln("\n"),
	writeln("Enter \"cd ../\", \"cd <directory>\", \"ls\" or \"q\" to quit."),
	read_string(user_input, "\n", "\r", _End2, Command),
	(Command="ls"->true;
	(Command="q"->abort;
	(Command="cd ../"->
	working_directory(_, "../");
	((string_concat("cd ",Directory,Command),
	working_directory(_, Directory))->true;true)))),
	file_os.
	