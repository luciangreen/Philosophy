% ALEXIS: I prepared to write I don’t like vegan meat, good approaching bad, like I don’t like human-likeness, bad approaching good.

faces([[
"     *********     ",
"    *         *    ",
"   *           *   ",
"  *             *  ",
" **  ***   ***  ** ",
"* * **) * **) * * *",
"* * *   * *   * *",
" **  ***   ***  ** ",
" **     ***     ** ",
"   *           *   ",
"    *  *****  *    ",
"     *       *     ",
"      *******      "
],[
"     *********     ",
"    *         *    ",
"   *           *   ",
"  *             *  ",
" **  ***   ***  ** ",
"* * *(*)* *(*)* * *",
"* * *   * *   * * *",
" **  ***   ***  ** ",
" **     ***     ** ",
"   *           *   ",
"    *  *****  *    ",
"     *       *     ",
"      *******      "
],[
"     *********     ",
"    *         *    ",
"   *           *   ",
"  *             *  ",
" **  ***   ***  ** ",
"* * * (** * (** * *",
"* * *   * *   * * *",
" **  ***   ***  ** ",
" **     ***     ** ",
"   *           *   ",
"    *  *****  *    ",
"     *       *     ",
"      *******      "
],[
"     *********     ",
"    *         *    ",
"   *           *   ",
"  *             *  ",
" **  ***   ***  ** ",
"* * *   * *   * * *",
"* * **) * **) * * *",
" **  ***   ***  ** ",
" **     ***     ** ",
"   *           *   ",
"    *  *****  *    ",
"     *       *     ",
"      *******      "
],[
"     *********     ",
"    *         *    ",
"   *           *   ",
"  *             *  ",
" **  ***   ***  ** ",
"* * *   * *   * * *",
"* * *(*)* *(*)* * *",
" **  ***   ***  ** ",
" **     ***     ** ",
"   *           *   ",
"    *  *****  *    ",
"     *       *     ",
"      *******      "
],[
"     *********     ",
"    *         *    ",
"   *           *   ",
"  *             *  ",
" **  ***   ***  ** ",
"* * *   * *   * * *",
"* * * (** * (** * *",
" **  ***   ***  ** ",
" **     ***     ** ",
"   *           *   ",
"    *  *****  *    ",
"     *       *     ",
"      *******      "
]]).

questions([
"Do you see (hallucinatory) appearances?",
"Do you feel depressed?",
"Do you have headaches?",
"Do you have a job?",
"Do you have a business?",
"Are you doing training?",
"Do you have a partner?",
"Do you have sex?"]).

:-include('../../listprologinterpreter/la_maths.pl').

psychoanalyst :-
	faces(Faces),
	random(X),N is ceiling(6*X),
	get_item_n(Faces,N,Face),
	findall(_,(member(Line,Face),writeln(Line)),_),
	sleep(2),
	get_item_n(Faces,5,Face2),
	findall(_,(member(Line,Face2),writeln(Line)),_),
	sleep(2),
	questions(Questions),
	random(Y),M is ceiling(8*Y),
	get_item_n(Questions,M,Question),
	writeln(Question),
	read_string(user_input,"\n\r","\n\r",_,_S),
	psychoanalyst.
