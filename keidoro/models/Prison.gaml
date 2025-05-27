/**
* Name: Prison
* Based on the internal empty template. 
* Author: oosan
* Tags: 
*/


model Prison

import "Main.gaml"

species prison  {
	geometry shape <- circle(20);
	
	init {
		location <- {world.shape.width / 2, world.shape.height / 2};
	}
	
	aspect default{
		draw shape at:{world.shape.width/2, world.shape.height/2} color:#yellow;
	}
}


