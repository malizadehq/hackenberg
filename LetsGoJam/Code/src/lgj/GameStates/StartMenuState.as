package lgj.GameStates 
{
	import org.axgl.AxSprite;
	import org.axgl.render.AxColor;	
	import org.axgl.AxState;
	import org.axgl.Ax;
	import org.axgl.input.AxKey;
	
	import lgj.Resource;
	import lgj.Settings;
	
	/**
	 * ...
	 * @author CuriousCarl
	 */
	public class StartMenuState extends AxState 
	{
		private var m_LogoCounter:uint = 0;
		private var m_frameCounter:uint = 0;
		private var m_introSpriteA:AxSprite;
		private var m_introSpriteB:AxSprite;
		private var m_introSpriteC:AxSprite;
		private var m_introSpriteD:AxSprite;
		private var m_introSpriteBG:AxSprite;
		
		private var m_fadeTime:Number = 0.5;
		
		override public function create():void
		{
			super.create();
			m_introSpriteA = new AxSprite(0, -100, null, Settings.WINDOW_WIDTH, Settings.WINDOW_HEIGHT);
			m_introSpriteB = new AxSprite(0, -100, null, Settings.WINDOW_WIDTH, Settings.WINDOW_HEIGHT);
			m_introSpriteC = new AxSprite(0, -100, null, Settings.WINDOW_WIDTH, Settings.WINDOW_HEIGHT);
			m_introSpriteD = new AxSprite(0, -100, null, Settings.WINDOW_WIDTH, Settings.WINDOW_HEIGHT);
			m_introSpriteBG = new AxSprite(0, 0, null, Settings.WINDOW_WIDTH, Settings.WINDOW_HEIGHT);
		}
		public function StartMenuState() 
		{
			m_introSpriteBG = new AxSprite(0, 0, null, Settings.WINDOW_WIDTH, Settings.WINDOW_HEIGHT);
			m_introSpriteBG.load(Resource.BACKGROUND_INSIDE, 600, 400);
			add(m_introSpriteBG);
		}
		override public function update():void 
		{
			++m_frameCounter;
			
			switch(m_LogoCounter)
			{
				case 0:
					if (m_frameCounter > 10)
					{
						m_introSpriteA.load(Resource.TITLE_0, 600, 400);
						add(m_introSpriteA);
						++m_LogoCounter;
						Ax.camera.shake(0.35, 8, null, true);
					}
				break;
				case 1:
					if (m_frameCounter > 30)
					{
						m_introSpriteB.load(Resource.TITLE_1, 600, 400);
						add(m_introSpriteB);
						++m_LogoCounter;
						Ax.camera.shake(0.35, 8, null, true);
					}
				break;
				case 2:
					if (m_frameCounter > 50)
					{
						m_introSpriteC.load(Resource.TITLE_2, 600, 400);
						add(m_introSpriteC);
						++m_LogoCounter;
						Ax.camera.shake(0.35, 8, null, true);
					}
				break;
				case 3:
					if (m_frameCounter > 80)
					{
						m_introSpriteD.load(Resource.TITLE_3, 600, 400);
						add(m_introSpriteD);
						++m_LogoCounter;
						Ax.camera.shake(0.35, 8, null, true);
					}
				break;
			}
		
			if (Ax.keys.pressed(AxKey.ANY) || Ax.mouse.down(0))
			{
				startGame();
			}
		}
		
		private function startGame():void 
		{
			Ax.camera.fadeOut(m_fadeTime, 0xff000000, function():void {
				Ax.camera.reset();
				Ax.camera.fadeIn(m_fadeTime);
				Ax.popState();
			});
		}
	}
}