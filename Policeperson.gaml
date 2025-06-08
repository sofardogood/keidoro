model Policeperson

import "Main.gaml"

species policeperson parent:person{ // personを親とするpoliceperson種を定義
	thief target_thief; //agentを型として持つことができるthiefを追いかける
	
	init{
		step <- 0.1; // 初期ステップサイズを0.1に設定
		speed <- 3.5; // 初期速度を3.5に設定
		color <- #blue; // 初期色を青に設定
		
		target_thief <- one_of(thief); // thiefの中から1つを選んでtarget_thiefに設定
	}
	
	//追いかける
	reflex chase when:target_thief != nil{ // target_thiefがnilでないときに追いかける
		do goto target:target_thief.location speed:speed; // target_thiefの位置に向かって速度speedで移動
	}
	
	//捕まえる
	reflex arrest when:distance_to(self, target_thief) = 0 {  // selfとtarget_thiefの距離が0のときに捕まえる
		//selfでtarget_thiefの人物に問いかける。警察が条件文に合った人に問いかける
//		ask thief where(each = self.target_thief){//theifの中でeachの属性を持っている
//			is_arrested <- true;
//			color <- #green;
//		}
//		
//		target_theif.is_arrested <- true;
		
		ask target_thief{
			self.is_arrested <- true;  // 逮捕フラグをtrueに設定
			self.color <- #green;  // 色を緑に変更
			//何箇所あるかわからないのでone_of
			location <- any_location_in(one_of(prison).shape); // prisonの中の任意の位置に移動
			ask policeperson where(each.target_thief = self){ // target_thiefがselfであるpolicepersonに問いかける
				if one_of(thief where (each.is_arrested != true)) = nil { // 逮捕されていないthiefがいない場合
					do tell("Completed!!!", false); // "Completed!!!"と表示
					ask thief {
						do escape; // 逃げる
					}
				} else {
					target_thief <- one_of(thief where (each.is_arrested != true)); // 逮捕されていないthiefの中から1つを選んでtarget_thiefに設定
}
					
				}
				
			}
		}
		
		
	}