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
		
		//Entities
		[Embed(source = "/img/player.png")] public static const PLAYER:Class;
		[Embed(source = "/img/Dolphin0000.png")] public static const DOLPHIN:Class;
		
		//Particle effects
		[Embed(source = "/img/2x2_red_shaded.png")] public static const RED_PARTICLE:Class;
		
		//Hit sounds
		[Embed(source = "/sound/dash_hit_0.mp3")] public static const HIT_DOLPHIN_SOUND_0:Class;
		[Embed(source = "/sound/dash_hit_1.mp3")] public static const HIT_DOLPHIN_SOUND_1:Class;
		[Embed(source = "/sound/dash_hit_2.mp3")] public static const HIT_DOLPHIN_SOUND_2:Class;
		[Embed(source = "/sound/dash_hit_3.mp3")] public static const HIT_DOLPHIN_SOUND_3:Class;
	}

}