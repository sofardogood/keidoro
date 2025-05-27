/**
* Name: Person
* Based on the internal empty template. 
* Author: oosan
* Tags: 
*/


model Person

species person skills:[moving]{
	geometry shape <- circle(3); 
	float speed <- 3.0; 
	rgb color ;
	point location;
	
	init {
		location <- any_location_in (one_of(world.shape));
	}
	
	aspect default{
		draw shape color:color at:location;
	}
}


