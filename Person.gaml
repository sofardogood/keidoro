model Person  // モデルファイルの名前を "Person" と定義

// "person" という speciesを定義し、"moving" スキルを持たせる
species person skills:[moving] {
	geometry shape <- circle(3);  // エージェントの形状を半径3の円に設定
	
	float speed <- 3.0;           // 移動速度を3.0に設定
	
	rgb color;                    // 色を表す変数（初期化は別途必要）
	
	point location;               // エージェントの位置を保持する変数
	
	init {
	    // 初期化時に、ワールド内のランダムな位置を location に設定
	    location <- any_location_in (one_of(world.shape));
	}
	
	aspect default {
	    // デフォルトの描画方法：指定された色で形状を location に描画
	    draw shape color:color at:location;
	}
}