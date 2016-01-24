clues(Street) :-
	%     a house is:  h(Nationality, Pet, Cigarette, Drink, Color, Number)
	length(Street, 5),                                           
	Street = [h(_,_,_,_,_,1),h(_,_,_,_,_,2),h(_,_,_,_,_,3),
	h(_,_,_,_,_,4),h(_,_,_,_,_,5)], %set_number_of_the_house

	member(h(english,_,_,_,red,_), Street),      %clue_1                 
	member(h(swedish,dogs,_,_,_,_), Street),      %clue_2               
	member(h(danish,_,_,tea,_,_), Street),         %clue_3             
	left(h(_,_,_,_,green,_), h(_,_,_,_,white,_), Street),    %clue4           
	member(h(_,_,_,coffee,green,_), Street),       %clue5     
	member(h(_,birds,pall_mall,_,_,_), Street),    %clue6               
	member(h(_,_,dunhill,_,yellow,_), Street),     %clue7          
	Street = [_,_,h(_,_,_,milk,_,_),_,_],          %clue8          
	Street = [h(norwegian,_,_,_,_,_)|_],           %clue9          
	next(h(_,cat,_,_,_,_), h(_,_,blend,_,_,_), Street),   %clue10    
	next(h(_,_,dunhill,_,_,_), h(_,horse,_,_,_,_), Street),  %clue11     
	member(h(_,_,blue_master,beer,_,_), Street),            %clue12	
	member(h(german,_,prince,_,_,_), Street),              %clue13 
	next(h(norwegian,_,_,_,_,_), h(_,_,_,_,blue,_), Street),   %clue14	
	next(h(_,_,blend,_,_,_), h(_,_,_,water,_,_), Street),    %clue15	
	member(h(_,fish,_,_,_,_), Street).		% the fish is added	

left(A, B, Cs):- append(_, [A,B|_], Cs).

next(A, B, Cs):-
		left(A, B, Cs);
		left(B, A, Cs).

where_is_the_fish:-           %print where is the fish
	clues(Street),
	member(h(Nat,fish,_,_,_,_), Street),
	write('\nThe fish is at '),
	write(Nat),
	write('\'s house.\n\n').

print_house(Pr, Pt, Cg, Dr, Cl, Nb):-
	write('\nNb of the house: '), write(Nb),
	write('\nPerson: '), write(Pr),
	write('\nPer: '), write(Pt),
	write('\nCigaret: '), write(Cg),
	write('\nDrink: '), write(Dr),
	write('\nColor: '), write(Cl),
	write('\n\n').

ask(A,B,C,D,E,F):-	 %let user search the basadate
	clues(Street),
	member(h(A,B,C,D,E,F), Street).

houses:-				%print the houses with the data
	clues(Street), 
	member(h(Person,Pet,Cig,Drink,Color,1), Street),
	print_house(Person, Pet, Cig, Drink, Color, 1),
	member(h(Person2,Pet2,Cig2,Drink2,Color2,2), Street),
	print_house(Person2, Pet2, Cig2, Drink2, Color2, 2),
	member(h(Person3,Pet3,Cig3,Drink3,Color3,3), Street),
	print_house(Person3, Pet3, Cig3, Drink3, Color3, 3),
	member(h(Person4,Pet4,Cig4,Drink4,Color4,4), Street),
	print_house(Person4, Pet4, Cig4, Drink4, Color4, 4),
	member(h(Person5,Pet5,Cig5,Drink5,Color5,5), Street),
	print_house(Person5, Pet5, Cig5, Drink5, Color5, 5).

