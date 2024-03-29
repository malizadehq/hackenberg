package crs.GameStates 
{
	import adobe.utils.CustomActions;
	import org.axgl.Ax;
	import org.axgl.AxState;
	import org.axgl.AxSprite;
	import org.axgl.render.AxColor;
	import org.axgl.input.AxKey;
	
	import crs.GameStates.GameState;
	import crs.Util.Resource;
	import crs.Util.GameSettings;
	import crs.Util.Registry;
	
	/**
	 * ...
	 * @author Sone
	 */
	public class StartGameState extends AxState 
	{
		private var m_startGameAnim:AxSprite;
		private var m_computerAnim:AxSprite;
		private var m_startBackdrop:AxSprite;
		
		private var m_state:uint = STATE_CHOOSE;
		private var m_instantStart:Boolean = false;
		
		private static var STATE_CHOOSE:uint = 0;
		private static var STATE_START:uint = 1;
		private static var STATE_HELP:uint = 2;
		
		public function StartGameState(instantStart:Boolean) 
		{
			super();
			
			m_instantStart = instantStart;
		}
		
		override public function create():void
		{
			super.create();

			Ax.background = AxColor.fromHex(0xf1e2f1);
			Registry.musicHandler.playMusic(Resource.MUSIC_START);
			
			m_startBackdrop = new AxSprite(0.0, 0.0, null, GameSettings.windowWidth, GameSettings.windowHeight);
			m_startBackdrop.load(Resource.INTRO_BACKDROP, 600, 400);
			add(m_startBackdrop);
			
			m_startGameAnim = new AxSprite((GameSettings.windowWidth - 429) * 0.5, (GameSettings.windowHeight - 147) * 0.5, null, GameSettings.windowWidth, GameSettings.windowHeight);
			m_startGameAnim.load(Resource.START_GAME_INTRO, 429, 147);
			m_startGameAnim.addAnimation("play", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11,12,13,14,15], 11, false, function():void {
				Ax.camera.flash(0.5, 0xFFFFFFFF);
				Registry.musicHandler.playMusic(Resource.MUSIC_GAME);
				Ax.popState();
			});
			m_startGameAnim.addAnimation("keypress", [0, 1, 2, 3, 4], 11, false)
			add(m_startGameAnim);
			
			m_computerAnim = new AxSprite((GameSettings.windowWidth - 285) * 0.5, m_startGameAnim.y - 140, null, GameSettings.windowWidth, GameSettings.windowHeight);
			m_computerAnim.load(Resource.START_COMPUTER, 285, 140);
			m_computerAnim.addAnimation("choose", [0, 1, 2, 3, 4, 5], 3, true);
			add(m_computerAnim);
			
			if (m_instantStart)
			{
				startGame();
			}
		}
		
		override public function update():void
		{
			Ax.background = AxColor.fromHex(0xf1e2f1);
			switch(m_state)
			{
				case STATE_HELP:
					m_computerAnim.animate("help");
					if (Ax.keys.pressed(AxKey.Z) || Ax.keys.pressed(AxKey.X))
					{
						m_state = STATE_CHOOSE;
						Ax.sound(Resource.SOUND_INTRO_KEYPRESS);
						m_computerAnim.load(Resource.START_COMPUTER, 285, 140);
						m_computerAnim.addAnimation("choose", [0, 1, 2, 3, 4, 5], 3, true);
						m_startGameAnim.animate("keypress",true);
					}				
				break;
				case STATE_CHOOSE:
					m_computerAnim.animate("choose");
					
					if (Ax.keys.pressed(AxKey.Z))
					{
						startGame();
					}
					if (Ax.keys.pressed(AxKey.X))
					{
						m_state = STATE_HELP;
						Ax.sound(Resource.SOUND_INTRO_KEYPRESS);
						m_computerAnim.load(Resource.START_COMPUTER_HELP, 285, 140);
						m_computerAnim.addAnimation("help", [0, 1, 2, 3, 4, 5], 3, true);
						m_startGameAnim.animate("keypress",true);
					}
					break;
				case STATE_START:
					m_startGameAnim.animate("play");
					m_startGameAnim.velocity.x = -200;
					m_computerAnim.velocity.x = -200;
					m_startBackdrop.velocity.x = -200;
					break;
			}
			
			super.update();
		}
		
		private function startGame():void 
		{
			m_state = STATE_START;
			Ax.sound(Resource.SOUND_INTRO_KEYPRESS);
			Ax.sound(Resource.SOUND_INTRO_EXPLOSION);
		}
	}

}