model Thief

import "Main.gaml"

species thief parent:person {
	
	bool is_arrested <- false; // 捕まっているかどうかを示すフラグ
	bool is_rescuing <- false; // 助けられているかどうかを示すフラグ
	
	init{
		speed <- 3.0;
		color <- #black;
		
		is_arrested <- false; // 初期状態では捕まっていない
	}
	
	reflex move_freely when: !is_arrested{ //毎回の動作を決める.捕まっていないときに自由に動く
			do wander speed:speed amplitude:45.0; //amplitude:煩雑さの度合い。数字が小さいほど直進。大きいほど曲がりまくる
	}
	
	reflex rescue_friends when: !is_arrested{ // 捕まっていないときに仲間を助ける
		//each != selfは、選ばれるエージェントが自分自身ではないことを示す
		thief friend <- one_of(thief where (each.is_arrested and (each != self))); //eachは条件に合うエージェントの選択に利用する.where句を使用して集合内の各エージェントの属性や状態にアクセスし、条件に合うエージェントを選ぶ
		
		if (friend != nil) and (self distance_to(friend) < 0.1) {
			friend.is_arrested <- false; // 仲間を解放
			friend.color <- #black; // 仲間の色を黒に戻す
		} else {
			do wander speed:speed amplitude:45.0;
		}
	}
	
	action escape {
		is_arrested <- false; // 捕まっていない状態に設定
		color <- #black; // 色を黒に戻す
	}
	
}