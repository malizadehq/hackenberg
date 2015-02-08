package lgj.Util
{
	import lgj.GameStates.GameState;
	import lgj.Entities.Player;
	import lgj.Score.ScoreManager;
	import lgj.Util.MusicHandler;
	
	/**
	 * A very simple registry to get the game state and player, without having to constantly
	 * cast the state.
	 */
	public class Registry 
	{
		/** Our main game state **/
		public static var gameState:GameState;
		/** The player instance **/
		public static var player:Player;
		/** The score manager **/
		public static var scoreManager:ScoreManager;
		/** The music handler **/
		public static var musicHandler:MusicHandler;
	}
}