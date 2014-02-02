package crs.Util
{
	import crs.Model.PlayerModel;
	import org.axgl.AxGroup;
	import org.axgl.tilemap.AxTilemap;
	
	import crs.Entities.Player;
	import crs.GameStates.GameState;
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
		public static var floatingScoreTexts:AxGroup;
		/** The game model instance **/
		public static var playerModel:PlayerModel;
		/** The Active tilemaps **/
		public static var tilemaps:AxGroup;
		/** The music handler **/
		public static var musicHandler:MusicHandler;
	}
}