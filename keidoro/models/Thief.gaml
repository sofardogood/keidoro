/**
* Name: Thief
* Based on the internal empty template. 
* Author: oosan
* Tags: 
*/


model Thief

import "Main.gaml"

species thief parent:person {
	
	bool is_arrested <- false; //捉えられているかどうか
	bool is_rescuing <- false; //助けられているかどうか
	
	init{
		speed <- 3.0;
		color <- #black;
		
		is_arrested <- false;
	}
	
	reflex move_freely when: !is_arrested{ //毎回の動作を決める
			do wander speed:speed amplitude:45.0; //amplitude:煩雑さの度合い。数字が小さいほど直進。大きいほど曲がりまくる
	}
	
	reflex rescue_friends when: !is_arrested{
		thief friend <- one_of(thief where (each.is_arrested and (each != self)));
		
		if (friend != nil) and (self distance_to(friend) < 0.1) {
			friend.is_arrested <- false;
			friend.color <- #black;
		} else {
			do wander speed:speed amplitude:45.0;
		}
	}
	
	action escape {
		is_arrested <- false;
		color <- #black;
	}
	
}