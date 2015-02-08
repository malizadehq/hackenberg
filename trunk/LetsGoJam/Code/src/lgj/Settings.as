package lgj 
{
	import org.axgl.AxPoint;
	import org.axgl.AxVector;
	/**
	 * ...
	 * @author CuriousCarl
	 */
	public class Settings 
	{
		//Common settings
		public static var WINDOW_WIDTH:int = 600;
		public static var WINDOW_HEIGHT:int = 400;
		public static var CAMERAFADE_BETWEEN_STATES_DURATION:Number = 0.5;
		public static var GRAVITY:int = 300;
		public static var DOLPHIN_MIN_SPAWN_RATE:uint = 25;
		public static var DOLPHIN_MAX_SPAWN_RATE:uint = 100;
		public static var MIN_SPAWN_VELOCITY:AxVector = new AxVector(100, -100, 0);
		public static var MAX_SPAWN_VELOCITY:AxVector = new AxVector(200, -500, 0);
		public static var FLOOR_HEIGHT:int = 50;
		public static var FLOOR_HEIGHT_RANDOM_MIN:int = -15;
		public static var FLOOR_HEIGHT_RANDOM_MAX:int = 60;
		public static var SLOWMOTION_RATE:uint = 5;
		public static var HIT_COOLDOWN_FRAMES:uint = 20;
		public static var HIT_SOUND_COOLDOWN_FRAMES:uint = 20;
		
		//Pot settings
		public static var POT_POSITION:AxPoint = new AxPoint(WINDOW_WIDTH - 175, WINDOW_HEIGHT - 225);
		public static var POT_Y_COLLISION_ALLOWANCE:int = 5;
		
		//Title state settings
		public static var TITLE_FRAME_DURATION:int = 120;
		
		//Player settings
		public static var DASH_SPEED:Number = 1000;
		public static var DASH_DRAG_TO_FRAMES_CONVERSION_RATE:Number = 0.05;
		
		//Dolphin and giblets settings
		public static var BOUNCE_VELOCITY_DECREASE:AxVector = new AxVector(15, 10, 0);
		public static var BOUNCE_COOLDOWN_FRAMES:uint = 5;

		//Score settings
		public static var SCORE_TEXT_POSITION:AxPoint = new AxPoint(533, 4);
		public static var SCORE_TEXT:String = "@[229,229,229] ";
	}

}