package crs.GameStates 
{
	import org.axgl.Ax;
	import org.axgl.AxSprite;
	import org.axgl.AxState;
	import org.axgl.render.AxColor;
	import org.axgl.input.AxKey;
	
	import crs.Util.GameSettings;
	import crs.Util.Registry;
	import crs.Util.Resource;
	
	/**
	 * ...
	 * @author Sone
	 */
	public class GameOverState extends AxState 
	{
		private var m_gameOverDialogue:AxSprite;
		private var m_highScoreList:AxSprite;
		
		public function GameOverState() 
		{
			super();
			
		}
		
		override public function create():void
		{
			super.create();

			Ax.background = AxColor.fromHex(0xf1e2f1);			
			
			m_gameOverDialogue = new AxSprite(GameSettings.windowWidth * 0.5 - 150, 100, null, GameSettings.windowWidth, GameSettings.windowHeight);
			m_gameOverDialogue.load(Resource.GAME_OVER_DIALOGUE, 300, 100);
			m_gameOverDialogue.addAnimation("play", [0, 1, 2, 3], 12, true);
			add(m_gameOverDialogue);
			
			m_highScoreList = new AxSprite(m_gameOverDialogue.x + (m_gameOverDialogue.width - 135) * 0.5, m_gameOverDialogue.y + 80, null, GameSettings.windowWidth, GameSettings.windowHeight);
			m_highScoreList.load(Resource.HIGH_SCORE, 135, 160);
			add(m_highScoreList);
		}
		
		override public function update():void
		{
			Ax.background = AxColor.fromHex(0xf1e2f1);

			m_gameOverDialogue.animate("play");

			if (Ax.keys.pressed(AxKey.Z))
			{
				Ax.camera.fadeOut(0.5, 0xff000000, function():void {
					Ax.camera.reset();
					Ax.camera.fadeIn(0.5);
					Ax.popState();
					Ax.popState();
					Registry.gameState = new GameState();
					Ax.pushState(Registry.gameState);
					Ax.pushState(new StartGameState());
				});				
			}
			
			super.update();
		}		
		
	}

}