package lgj 
{
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
		public static var DOLPHIN_MIN_SPAWN_RATE:uint = 50;
		public static var DOLPHIN_MAX_SPAWN_RATE:uint = 200;
		public static var MIN_SPAWN_VELOCITY:AxVector = new AxVector(100, -100, 0);
		public static var MAX_SPAWN_VELOCITY:AxVector = new AxVector(200, -500, 0);
		public static var FLOOR_HEIGHT:int = 50;
		public static var FLOOR_HEIGHT_RANDOM_MIN:int = -10;
		public static var FLOOR_HEIGHT_RANDOM_MAX:int = 40;
		
		//Title state settings
		public static var TITLE_FRAME_DURATION:int = 120;
		
		//Player settings
		public static var DASH_SPEED:Number = 1000;
		public static var DASH_DRAG_TO_FRAMES_CONVERSION_RATE:Number = 0.05;
		public static var HIT_COOLDOWN_FRAMES:uint = 20;
		
		//Dolphin and giblets settings
		public static var BOUNCE_VELOCITY_DECREASE:AxVector = new AxVector(15, 10, 0);
		public static var BOUNCE_COOLDOWN_FRAMES:uint = 5;
	}

}