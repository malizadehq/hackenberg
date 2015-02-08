package lgj.Util
{
	import lgj.GameStates.GameState;
	import lgj.Entities.Player;
	
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
		/** Score texts that pop up when the player collects points **/
		//public static var floatingScoreTexts:AxGroup;
		/** The music handler **/
		//public static var musicHandler:MusicHandler;
	}
}