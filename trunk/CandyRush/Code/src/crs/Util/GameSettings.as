package crs.Util 
{
	import org.axgl.AxPoint;
	/**
	 * ...
	 * @author Sone
	 */
	public class GameSettings 
	{
		public static var windowWidth:int = 600;
		public static var windowHeight:int = 400;
		
		public static var tileSize:uint = 100;
		public static var solidTilesStartIndex:uint = 20;
		
		public static var scoreTextPosition:AxPoint = new AxPoint(533, 4);
		public static var comboTextPosition:AxPoint = new AxPoint(568, 19);
		
		public static var scoreText:String = "@[229,229,229] ";
		public static var comboText:String = "@[229,229,229] ";
		
		public static var floatingScoreTextMaxFrames:int = 60;
		public static var floatingScoreTextYVelocity:int = -15;
		
		public static var powerupScore:int = 10;
		public static var lawyerScore:int = 100;
		public static var gameStartSpeed:int = -200;
		
		public static var dashFistYPosition:int = 35;
		
		public static var kingScaleTilPlayerEat:Number = 1.4;
		public static var kingStartXPos:int = -30;
		public static var kingStartYPos:int = 220;
	}

}