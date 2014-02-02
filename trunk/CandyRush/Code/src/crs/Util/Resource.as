package crs.Util{
	public class Resource {
		[Embed(source = "/Sprites/2x2_red_shaded.png")] public static const PARTICLE:Class;
		[Embed(source = "/Sprites/Candy.png")] public static const POWERUP:Class;
		
		[Embed(source = "/Tiles/tilemap.png")] public static const TILES:Class;
		
		[Embed(source = "/Animations/Candy/Destroy.png")] public static const POWERUP_DESTROY:Class;		
		[Embed(source = "/Animations/Dude/anim_run.png")] public static const ANIM_RUN:Class;
		[Embed(source = "/Animations/Dude/anim_dash.png")] public static const ANIM_DASH:Class;
		[Embed(source = "/Animations/Dude/anim_dash_hit.png")] public static const ANIM_DASH_HIT:Class;
		[Embed(source = "/Animations/Lawyer/lawyer_idle.png")] public static const LAWYER_IDLE:Class;
		[Embed(source = "/Animations/Lawyer/lawyer_death_head.png")] public static const LAWYER_DEATH_HEAD:Class;
		[Embed(source = "/Animations/Lawyer/lawyer_death_torso.png")] public static const LAWYER_DEATH_TORSO:Class;
		[Embed(source = "/Animations/Lawyer/lawyer_death_legs.png")] public static const LAWYER_DEATH_LEG:Class;
		[Embed(source = "/Animations/King/theking_idle.png")] public static const KING_IDLE:Class;
		[Embed(source = "/Animations/King/theking_eat.png")] public static const KING_EAT:Class;
		[Embed(source = "/Animations/King/theking_eatdude.png")] public static const KING_EAT_DUDE:Class;
		[Embed(source = "/Animations/Intro/intro0000.png")] public static const INTRO_0:Class;
		[Embed(source = "/Animations/Intro/intro0001.png")] public static const INTRO_1:Class;
		[Embed(source = "/Animations/Intro/intro0002.png")] public static const INTRO_2:Class;
		[Embed(source = "/Animations/Intro/intro0003.png")] public static const INTRO_3:Class;
		[Embed(source = "/Animations/Intro/start.png")] public static const START_GAME_INTRO:Class;
		[Embed(source = "/Animations/Intro/start_computer.png")] public static const START_COMPUTER:Class;
		[Embed(source = "/Animations/UI/gameover.png")] public static const GAME_OVER_DIALOGUE:Class;
		
		[Embed(source = "/Backdrop/backdrop_ground.png")] public static const BACKDROP_GROUND_A:Class;
		[Embed(source = "/Backdrop/backdrop_groundB.png")] public static const BACKDROP_GROUND_B:Class;
		[Embed(source = "/Backdrop/backdrop_cloudA.png")] public static const CLOUD_A:Class;
		[Embed(source = "/Backdrop/backdrop_cloudB.png")] public static const CLOUD_B:Class;
		[Embed(source = "/Backdrop/backdrop_cloudC.png")] public static const CLOUD_C:Class;

		[Embed(source = "/UI/gameoverHighscore.png")] public static const HIGH_SCORE:Class;		
		[Embed(source = "/UI/TopUI.png")] public static const CHASE_BAR:Class;
		[Embed(source = "/UI/TopUI_bar.png")] public static const CHASE_BAR_METER:Class;
		[Embed(source = "/UI/MainUI.png")] public static const COMBO_UI:Class;
		[Embed(source = "/UI/MainUI0000.png")] public static const SCORE_UI:Class;
		
		
		//Sound
		// Combo Sounds
		[Embed(source = "/Sound/combo_0.mp3")] public static const SOUND_COMBO_0:Class;
		[Embed(source = "/Sound/combo_1.mp3")] public static const SOUND_COMBO_1:Class;
		[Embed(source = "/Sound/combo_2.mp3")] public static const SOUND_COMBO_2:Class;
		[Embed(source = "/Sound/combo_3.mp3")] public static const SOUND_COMBO_3:Class;
		[Embed(source = "/Sound/combo_4.mp3")] public static const SOUND_COMBO_4:Class;
		[Embed(source = "/Sound/combo_5.mp3")] public static const SOUND_COMBO_5:Class;
		[Embed(source = "/Sound/combo_6.mp3")] public static const SOUND_COMBO_6:Class;
		[Embed(source = "/Sound/combo_7.mp3")] public static const SOUND_COMBO_7:Class;
		
		//Dash
		[Embed(source="../../../res/Sound/dash_start_0.mp3")] public static const SOUND_DASH_START_0:Class;
		[Embed(source="../../../res/Sound/dash_start_1.mp3")] public static const SOUND_DASH_START_1:Class;
		[Embed(source="../../../res/Sound/dash_start_2.mp3")] public static const SOUND_DASH_START_2:Class;
		[Embed(source="../../../res/Sound/dash_start_3.mp3")] public static const SOUND_DASH_START_3:Class;
		
		[Embed(source="../../../res/Sound/dash_hit_0.mp3")] public static const SOUND_DASH_HIT_0:Class;
		[Embed(source="../../../res/Sound/dash_hit_1.mp3")] public static const SOUND_DASH_HIT_1:Class;
		[Embed(source="../../../res/Sound/dash_hit_2.mp3")] public static const SOUND_DASH_HIT_2:Class;
		[Embed(source="../../../res/Sound/dash_hit_3.mp3")] public static const SOUND_DASH_HIT_3:Class;
		
		//EAT 
		[Embed(source="../../../res/Sound/eat_candy_0.mp3")] public static const SOUND_EAT_0:Class;
		[Embed(source="../../../res/Sound/eat_candy_1.mp3")] public static const SOUND_EAT_1:Class;
		[Embed(source="../../../res/Sound/eat_candy_2.mp3")] public static const SOUND_EAT_2:Class;
		//[Embed(source = "/Font/8BITWONDER.TTF", fontFamily = "8BITWONDER", embedAsCFF = "true")] public static const FONT:String;
		
		//[Embed(source = "/Sound/Driven.mp3")] public static const MUSIC:Class;
		
		
		public static const START_ISLAND:String =  		"7,2,5,5,2,2,2,5,2,3\n" +
														"27,22,25,25,22,22,22,25,22,23\n" +
														"81,42,42,42,45,42,42,42,42,46\n" +
														"44,42,42,42,82,42,42,42,42,46\n" +
														"61,42,62,42,42,82,42,42,42,43\n" +
														"41,42,42,42,42,42,42,42,42,43\n";

		public static const ISLAND_0:String =  			"1,2,5,5,2,2,2,5,2,9\n" +
														"24,25,25,25,22,22,25,25,22,26\n" +
														"81,42,42,42,82,42,42,42,42,43\n" +
														"61,42,42,42,102,102,42,42,42,43\n" +
														"61,42,102,42,42,102,42,42,42,43\n" +
														"41,42,42,42,42,42,42,42,42,43\n";
		public static const ISLAND_0_POWERUPS:Array = [0,-2];
		public static const ISLAND_0_LAWYERS:Array = [5,-1];

		public static const ISLAND_1:String =   		"4,5,5,2,8,8,5,5,2,6\n" +
														"24,25,25,22,28,28,25,25,22,26\n" +
														"44,42,42,42,82,42,42,42,42,63\n" +
														"44,42,42,42,102,102,42,42,42,83\n" +
														"44,42,102,42,42,102,62,42,42,46\n" +
														"41,42,42,42,42,42,42,42,42,43\n";
		public static const ISLAND_1_POWERUPS:Array = [1,-1];
		public static const ISLAND_1_LAWYERS:Array = [7, -1];
		
		public static const ISLAND_2:String =   		"4,5,5,2,8,8,5,5,2,6\n" +
														"24,25,25,22,28,28,25,25,22,26\n" +
														"44,42,42,42,82,42,42,42,42,63\n" +
														"44,42,42,42,102,102,42,42,42,83\n" +
														"44,42,102,42,42,102,62,42,42,46\n" +
														"41,42,42,42,42,42,42,42,42,43\n";
		public static const ISLAND_2_POWERUPS:Array = [1,-1];
		public static const ISLAND_2_LAWYERS:Array = [7, -1];			
		
		public static const ISLAND_3:String =   		"1,8,2,2,8,8,5,5,2,9\n" +
														"21,28,25,25,28,28,25,25,25,29\n" +
														"61,42,42,42,42,42,62,42,42,46\n" +
														"61,42,42,42,102,102,42,42,42,63\n" +
														"81,42,102,82,42,102,42,42,42,83\n" +
														"121,42,42,42,42,42,42,42,42,83\n";
		public static const ISLAND_3_POWERUPS:Array = [1,-1];
		public static const ISLAND_3_LAWYERS:Array = [7, -1];			
		
		public static const ISLAND_4:String =   		"1,8,19,1,8,3,19,19,4,9\n" +
														"21,23,8,21,28,29,19,19,24,29\n" +
														"101,42,28,42,42,46,19,103,103,104\n" +
														"81,42,42,42,103,104,103,104,104,104\n" +
														"121,42,102,82,42,102,28,28,42,83\n" +
														"121,42,42,42,42,42,42,42,42,83\n";
		public static const ISLAND_4_POWERUPS:Array = [1,-1];
		public static const ISLAND_4_LAWYERS:Array = [7, -1];			
		
		public static const ISLAND_5:String =   		"1,2,9,19,19,19,19,19,1,9\n" +
														"21,22,29,19,4,5,6,19,21,29\n" +
														"101,42,46,19,21,22,26,19,41,43\n" +
														"81,42,46,19,44,62,46,19,41,103\n" +
														"121,42,103,19,44,42,63,19,44,123\n" +
														"121,42,43,19,41,42,43,19,44,43\n";
		public static const ISLAND_5_POWERUPS:Array = [1,-1];
		public static const ISLAND_5_LAWYERS:Array = [7, -1];			
		
		public static const ISLAND_6:String =   		"1,8,9,19,19,19,19,19,1,9\n" +
														"21,28,29,19,19,19,4,6,21,29\n" +
														"101,42,46,1,5,19,24,26,81,43\n" +
														"81,45,46,21,29,19,41,63,41,103\n" +
														"121,42,103,44,43,19,81,63,44,123\n" +
														"121,42,43,44,63,19,41,43,44,43\n";
		public static const ISLAND_6_POWERUPS:Array = [1,-1];
		public static const ISLAND_6_LAWYERS:Array = [7, -1];			
		
		public static const ISLAND_7:String =   		"1,2,5,5,8,3,19,19,19,19\n" +
														"21,22,25,25,28,23,19,19,7,9\n" +
														"44,42,42,45,42,43,19,19,27,29\n" +
														"81,42,42,42,42,103,19,19,41,103\n" +
														"44,42,42,42,42,43,19,19,44,123\n" +
														"41,42,42,42,42,103,19,19,44,43\n";
		public static const ISLAND_7_POWERUPS:Array = [1,-1];
		public static const ISLAND_7_LAWYERS:Array = [7, -1];			
		
		public static const ISLAND_8:String =   		"19,19,19,19,19,19,19,19,7,6\n" +
														"7,8,2,2,8,9,19,19,27,26\n" +
														"27,28,22,22,28,29,19,19,41,46\n" +
														"61,42,42,42,42,123,19,19,44,123\n" +
														"61,42,42,42,42,123,19,19,44,123\n" +
														"81,42,42,42,42,46,19,19,44,46\n";
		public static const ISLAND_8_POWERUPS:Array = [1,-1];
		public static const ISLAND_8_LAWYERS:Array = [7, -1];
		
		public static const ISLAND_9:String =   		"4,6,19,19,19,19,19,19,19,19\n" +
														"24,26,19,19,19,19,19,7,8,6\n" +
														"44,63,7,2,8,9,19,27,28,26\n" +
														"44,46,27,22,28,63,19,44,62,46\n" +
														"61,63,61,42,42,63,19,61,62,123\n" +
														"81,63,61,42,42,46,19,44,62,46\n";

		public static const ISLAND_9_POWERUPS:Array = [1,-1];
		public static const ISLAND_9_LAWYERS:Array = [7, -1];	
		
		public static const ISLAND_10:String =   		"1,6,19,19,19,19,19,19,1,9\n" +
														"21,26,4,3,19,19,7,3,21,29\n" +
														"121,63,24,23,1,9,27,23,41,83\n" +
														"121,46,41,83,21,26,41,83,41,83\n" +
														"61,103,41,103,44,63,41,43,41,43\n" +
														"81,63,61,83,41,46,44,43,41,43\n";

		public static const ISLAND_10_POWERUPS:Array = [1,-1];
		public static const ISLAND_10_LAWYERS:Array = [7, -1];	
	}
}
