% ["Short Arguments","Simulated Intelligence 2.txt",0,algorithms,"14. The man added to the simulation.  *God (the man) took care of people in subsets of the simulation.  *God found the subset of the simulation.  *It was the place.  *The man recorded them."]

% people_care("gay",[["gay","sexual health"],["bot","equality"],["ethnic minority","education"]],Care).

people_care(Person,People_and_care,Care) :-
	member([Person,Care],People_and_care).
	
% simulation_subset("gay",[["gay","sexual orientation"],["bot","origin"],["ethnic minority","culture"]],Subset).

simulation_subset(Person,People_subset,Subset) :-
	member([Person,Subset],Subset).
	
% subset_place("sexual orientation",[["sexual orientation","medicine"],["origin","computer science"],["culture","cultural studies"]],Place).

subset_place(Subset,People_subset,Place):
	member([Subset,Place],People_subset).
	
% subset_record("sexual orientation",[["sexual orientation","social services"],["origin","government records"],["culture","census"]],Record).

subset_record(Subset,Subset_record,Record) :-
	member([Subset,Record],Subset_record).
	
% place_record("medicine",[["medicine","pharmaceuticals"],["computer science","viral plans"],["cultural studies","cook book]],Record).

place_record(Place,Place_record,Record) :-
	member([Place,Record],Place_record).
