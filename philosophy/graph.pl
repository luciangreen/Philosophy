:-include('build_maze2d.pl').
:-include('strings_to_grid.pl').

/**

graph(1, 0, _).

         *
        * 
       *  
      *   
     *    
    *     
   *      
  *       
 *        
*         

**/

graph(M,C,Graph) :-
	grid(10,10,Grid),
	numbers(10,1,[],Ns),
	graph1(M,C,Grid,Ns,Graph),
	print_grid(Graph,10,10).
	
graph1(M,C,Grid,[],Grid) :- !.
graph1(M,C,Grid,Ns,Graph) :-
	Ns=[N|Ns2],
	Y is M*N+C,
	((Y>=1,Y=<10)->
	(delete(Grid,[N,Y,_],Grid2),
	append(Grid2,[[N,Y,[*]]],Grid3));
	Grid=Grid3),
	graph1(M,C,Grid3,Ns2,Graph).
