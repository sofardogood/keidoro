model Prison

import "Main.gaml"

species prison  { // prisonを定義
	geometry shape <- circle(20); // 形状を半径20の円に設定
	
	init {
		location <- {world.shape.width / 2, world.shape.height / 2}; // 初期位置を世界の中心に設定
	}
	
	aspect default{
		draw shape at:{world.shape.width/2, world.shape.height/2} color:#yellow; // 世界の中心に黄色で形状を描画
	}
}