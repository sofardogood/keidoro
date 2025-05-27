/**
* Name: Policeperson
* Based on the internal empty template. 
* Author: oosan
* Tags: 
*/


model Policeperson

import "Main.gaml"

species policeperson parent:person{
	thief target_thief; //agentを型として持つことができるthiefを追いかける
	
	init{
		step <- 0.1;
		speed <- 3.5;
		color <- #blue;
		
		target_thief <- one_of(thief); //１つのなかの
	}
	
	//追いかける
	reflex chase when:target_thief != nil{//nilは空
		do goto target:target_thief.location speed:speed;
	}
	
	//捕まえる
	reflex arrest when:distance_to(self, target_thief) = 0 {
		//selfでtarget_thiefの人物に問いかける。警察が条件文に合った人に問いかける
//		ask thief where(each = self.target_thief){//theifの中でeachの属性を持っている
//			is_arrested <- true;
//			color <- #green;
//		}
//		
//		target_theif.is_arrested <- true;
		
		ask target_thief{
			self.is_arrested <- true;
			self.color <- #green;
			//何箇所あるかわからないのでone_of
			location <- any_location_in(one_of(prison).shape);
			ask policeperson where(each.target_thief = self){
				if one_of(thief where (each.is_arrested != true)) = nil {
					do tell("You are now leaving this experiment. Hope you enjoyed it ! ", false);
					ask thief {
						do escape;
					}
				} else {
					target_thief <- one_of(thief where (each.is_arrested != true)); //１つのなかの
				}
				
			}
		}
		
		
	}
	
}
