/**
* Name: Main
* Based on the internal empty template. 
* Author: oosan
* Tags: 
*/

//まず"gama platform"を検索
//shapeで検索(GAMAに表示させる図形の選択)


model Main

import "./Thief.gaml"
import "./Prison.gaml"
import "./Person.gaml"
import "./Policeperson.gaml"
import "./Person.gaml"

global {
	geometry shape <- square(100);
		
	init{
		create thief number:5;
		create prison;
		create policeperson number:2;
	}
	
}

experiment test type:gui  {
	float minimum_cycle_duration <- 0.02;
	output{
		display ground type:3d{
			species prison;
			species thief;
			species policeperson;
		}
	}

}

