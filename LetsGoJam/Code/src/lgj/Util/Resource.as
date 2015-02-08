package lgj.Util 
{
	/**
	 * ...
	 * @author CuriousCarl
	 */
	public class Resource 
	{
		//Backgrounds
		[Embed(source = "/img/Main.png")] public static const BACKGROUND:Class;
		[Embed(source = "/img/MainUI0000.png")] public static const SCORE_UI:Class;
		[Embed(source = "/img/InsideFull.png")] public static const BACKGROUND_INSIDE:Class;
		[Embed(source = "/img/InsideFullB.png")] public static const BACKGROUND_INSIDE_B:Class;
		
		//Entities
		[Embed(source = "/img/cook_idle.png")] public static const PLAYER_IDLE:Class;
		[Embed(source = "/img/Dolphin_0.png")] public static const DOLPHIN_GIB_0:Class;
		[Embed(source = "/img/Dolphin_0_0.png")] public static const DOLPHIN_GIB_0_0:Class;
		[Embed(source = "/img/Dolphin_0_1.png")] public static const DOLPHIN_GIB_0_1:Class;
		[Embed(source = "/img/Dolphin_1.png")] public static const DOLPHIN_GIB_1:Class;
		[Embed(source = "/img/Dolphin_1_0.png")] public static const DOLPHIN_GIB_1_0:Class;
		[Embed(source = "/img/Dolphin_1_1.png")] public static const DOLPHIN_GIB_1_1:Class;
		[Embed(source = "/img/Animations/Dolphin/Dolphin.png")] public static const DOLPHIN:Class;
		[Embed(source = "/img/Pot.png")] public static const POT:Class;
		
		//Particle effects
		[Embed(source = "/img/2x2_red_shaded.png")] public static const RED_PARTICLE:Class;
		[Embed(source = "/img/2x2_blue_shaded.png")] public static const BLUE_PARTICLE:Class;
		[Embed(source = "/img/2x2_yellow_shaded.png")] public static const YELLOW_PARTICLE:Class;
		
		//Decals
		[Embed(source = "/img/BloodDecal_00.png")] public static const BLOOD_DECAL_LARGE_0:Class;
		[Embed(source = "/img/BloodDecal_02.png")] public static const BLOOD_DECAL_LARGE_1:Class;
		[Embed(source = "/img/BloodDecal_01.png")] public static const BLOOD_DECAL_SMALL_0:Class;
		[Embed(source = "/img/BloodDecal_03.png")] public static const BLOOD_DECAL_SMALL_1:Class;		
		
		// Intro
		[Embed(source = "/sound/carl_hello.mp3")] public static const SOUND_CARL_HELLO:Class;
		[Embed(source = "/img/Animations/Intro/intro0000.png")] public static const INTRO_0:Class;
		[Embed(source = "/img/Animations/Intro/intro0001.png")] public static const INTRO_1:Class;
		[Embed(source = "/img/Animations/Intro/intro0002.png")] public static const INTRO_2:Class;
		[Embed(source = "/img/Animations/Intro/intro0003.png")] public static const INTRO_3:Class;
		
		// Title
		[Embed(source = "/img/Animations/Title/Logo_BG.png")] public static const TITLE_0:Class;
		[Embed(source = "/img/Animations/Title/Logo_Super.png")] public static const TITLE_1:Class;
		[Embed(source = "/img/Animations/Title/Logo_Fukushima.png")] public static const TITLE_2:Class;
		[Embed(source = "/img/Animations/Title/Logo_DolphinSoupShack.png")] public static const TITLE_3:Class;
		
		// Ready
		[Embed(source = "/img/Ready.png")] public static const READY_0:Class;
		[Embed(source = "/img/Cook.png")] public static const READY_1:Class;
		[Embed(source = "/img/ReadyByg.png")] public static const READY_BG:Class;
		/**  Sounds  **/
		
		//Hit sounds
		[Embed(source = "/sound/dash_hit_0.mp3")] public static const HIT_DOLPHIN_SOUND_0:Class;
		[Embed(source = "/sound/dash_hit_1.mp3")] public static const HIT_DOLPHIN_SOUND_1:Class;
		[Embed(source = "/sound/dash_hit_2.mp3")] public static const HIT_DOLPHIN_SOUND_2:Class;
		[Embed(source = "/sound/dash_hit_3.mp3")] public static const HIT_DOLPHIN_SOUND_3:Class;
		//[Embed(source = "/sound/GoreImpact_00.mp3")] public static const GORE_IMPACT_0:Class;
		
		[Embed(source = "/sound/GoreImpact_01.mp3")] public static const HIT_GOREIMPACT_SOUND_0:Class;
		[Embed(source = "/sound/GoreImpact_01.mp3")] public static const HIT_GOREIMPACT_SOUND_1:Class;
		[Embed(source = "/sound/GoreImpact_02.mp3")] public static const HIT_GOREIMPACT_SOUND_2:Class;
		[Embed(source = "/sound/GoreImpact_03.mp3")] public static const HIT_GOREIMPACT_SOUND_3:Class;
		
		[Embed(source = "/sound/DolphinSpeak_00.mp3")] public static const HIT_DOLPHINSPEAK_SOUND_1:Class;
		[Embed(source = "/sound/DolphinSpeak_01.mp3")] public static const HIT_DOLPHINSPEAK_SOUND_2:Class;
		[Embed(source = "/sound/DolphinSpeak_02.mp3")] public static const HIT_DOLPHINSPEAK_SOUND_3:Class;
	
		[Embed(source = "/sound/SwordImpact_00.mp3")] public static const HIT_SWORDIMPACT_SOUND_0:Class;
		[Embed(source = "/sound/SwordImpact_01.mp3")] public static const HIT_SWORDIMPACT_SOUND_1:Class;
		
		[Embed(source = "/sound/order_mjau.mp3")] public static const START_SOUND_CAT_0:Class;
		
		[Embed(source = "/sound/order_soup_0.mp3")] public static const START_SOUND_OK_0:Class;
		[Embed(source = "/sound/order_soup_1.mp3")] public static const START_SOUND_OK_1:Class;
		[Embed(source = "/sound/order_soup_2.mp3")] public static const START_SOUND_OK_2:Class;
		
		[Embed(source = "/sound/ready.mp3")] public static const READY_SOUND_0:Class;
		[Embed(source = "/sound/cook.mp3")] public static const READY_SOUND_1:Class;
		
		//Intro
		[Embed(source = "/sound/super.mp3")] public static const SUPER_SOUND:Class;
		[Embed(source = "/sound/fukushima.mp3")] public static const FUKUSHIMA_SOUND:Class;
		[Embed(source = "/sound/soupshack.mp3")] public static const SOUPSHACK_SOUND:Class;		

	}

}