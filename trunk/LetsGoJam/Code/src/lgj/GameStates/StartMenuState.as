package lgj.GameStates 
{
	import org.axgl.AxSprite;
	import org.axgl.render.AxColor;	
	import org.axgl.AxState;
	import org.axgl.Ax;
	import org.axgl.input.AxKey;
	
	import lgj.Util.Resource;
	import lgj.Settings;
	import lgj.Util.RNG;
	
	/**
	 * ...
	 * @author CuriousCarl
	 */
	public class StartMenuState extends AxState 
	{
		private var m_LogoCounter:uint = 0;
		private var m_frameCounter:uint = 0;
		private var m_iStartGameTimer:int = 0;
		private var m_introSpriteA:AxSprite;
		private var m_introSpriteB:AxSprite;
		private var m_introSpriteC:AxSprite;
		private var m_introSpriteD:AxSprite;
		private var m_introSpriteBG:AxSprite;
		
		private var m_fadeTime:Number = 0.5;
		private var m_skipLogoSpawning:Boolean = false;
		
		override public function create():void
		{
			super.create();
			m_introSpriteA = new AxSprite(0, -100, null, Settings.WINDOW_WIDTH, Settings.WINDOW_HEIGHT);
			m_introSpriteB = new AxSprite(0, -100, null, Settings.WINDOW_WIDTH, Settings.WINDOW_HEIGHT);
			m_introSpriteC = new AxSprite(0, -100, null, Settings.WINDOW_WIDTH, Settings.WINDOW_HEIGHT);
			m_introSpriteD = new AxSprite(0, -100, null, Settings.WINDOW_WIDTH, Settings.WINDOW_HEIGHT);
			m_introSpriteBG = new AxSprite(0, 0, null, Settings.WINDOW_WIDTH, Settings.WINDOW_HEIGHT);
			
			if (m_skipLogoSpawning) {
				//Set to something high to skip logo spawning sequence.
				m_LogoCounter = 10;
				
				m_introSpriteA.load(Resource.TITLE_0, 600, 400);
				add(m_introSpriteA);
				m_introSpriteB.load(Resource.TITLE_1, 600, 400);
				add(m_introSpriteB);
				m_introSpriteC.load(Resource.TITLE_2, 600, 400);
				add(m_introSpriteC);
				m_introSpriteD.load(Resource.TITLE_3, 600, 400);
				add(m_introSpriteD);
			}			
		}
		
		public function StartMenuState(skipLogos:Boolean = false) 
		{
			m_introSpriteBG = new AxSprite(0, 0, null, Settings.WINDOW_WIDTH, Settings.WINDOW_HEIGHT);
			m_introSpriteBG.load(Resource.BACKGROUND_INSIDE, 600, 400);
			add(m_introSpriteBG);
			
			m_skipLogoSpawning = skipLogos;
		}
		override public function update():void 
		{
			++m_frameCounter;
			
			if (m_iStartGameTimer == 0)
			{
				switch(m_LogoCounter)
				{
					case 0:
						if (m_frameCounter > 10)
						{
							m_introSpriteA.load(Resource.TITLE_0, 600, 400);
							add(m_introSpriteA);
							m_introSpriteA.visible = false;
							++m_LogoCounter;
							Ax.camera.shake(0.35, 8, null, true);
						}
					break;
					case 1:
						if (m_frameCounter > 10)
						{
							m_introSpriteB.load(Resource.TITLE_1, 600, 400);
							add(m_introSpriteB);
							++m_LogoCounter;
							Ax.camera.shake(0.35, 8, null, true);
							Ax.sound(Resource.SUPER_SOUND);
						}
					break;
					case 2:
						if (m_frameCounter > 60)
						{
							m_introSpriteC.load(Resource.TITLE_2, 600, 400);
							add(m_introSpriteC);
							++m_LogoCounter;
							Ax.camera.shake(0.35, 8, null, true);
							Ax.sound(Resource.FUKUSHIMA_SOUND);
						}
					break;
					case 3:
						if (m_frameCounter > 110)
						{
							m_introSpriteD.load(Resource.TITLE_3, 600, 400);
							add(m_introSpriteD);
							m_introSpriteA.visible = true;
							++m_LogoCounter;
							Ax.camera.shake(0.35, 8, null, true);
							Ax.sound(Resource.SOUPSHACK_SOUND);
						}
					break;
				}
			}
		
			if (m_iStartGameTimer > 0)
			{
				if ( m_iStartGameTimer == 150 )
				{
					Ax.sound(Resource.START_SOUND_CAT_0);
					m_introSpriteBG.load(Resource.BACKGROUND_INSIDE_B, 600, 400);
					add(m_introSpriteBG);
				}
					
				if ( m_iStartGameTimer == 130 )
				{
					switch(RNG.generateNumber(0, 2))
					{
						case 0:
							Ax.sound(Resource.START_SOUND_OK_0);
						break;
						case 1:
							Ax.sound(Resource.START_SOUND_OK_1);
						break;
						case 2:
							Ax.sound(Resource.START_SOUND_OK_2);
						break;
					}
				}
					
				m_iStartGameTimer -= 1;
				if (m_iStartGameTimer <= 0)
				{
					startGame();
					m_iStartGameTimer = -1;
				}
			}
			
			if (Ax.keys.pressed(AxKey.ANY) || Ax.mouse.down(0))
			{
			//	if(m_iStartGameTimer == 0)
				if(m_iStartGameTimer == 0)
					m_iStartGameTimer = 150;
			//	else
			//		startGame();
			}
		}
		
		private function startGame():void 
		{
			Ax.camera.fadeOut(m_fadeTime, 0xff000000, function():void {
				Ax.camera.reset();
				Ax.camera.fadeIn(m_fadeTime);
				Ax.popState();
				Ax.pushState(new GameState());
				Ax.pushState(new ReadyState());
			});
		}
	}
}