package crs.GameStates 
{
	import crs.Entities.Entity;
	import crs.Util.GameSettings;
	import crs.Util.MusicHandler;
	import crs.Util.Resource;
	import crs.Util.Registry;
	
	import org.axgl.AxSprite;
	import org.axgl.render.AxColor;	
	import org.axgl.AxState;
	import org.axgl.Ax;
	import org.axgl.input.AxKey;
	
	/**
	 * ...
	 * @author Sone
	 */
	public class IntroGameState extends AxState 
	{
		private var m_frameCounter:uint = 0;
		private var m_frameThreshold_1:uint = 120;
		private var m_frameThreshold_2:uint = 240;
		private var m_frameThreshold_3:uint = 360;
		private var m_frameThreshold_4:uint = 480;
		private var m_frameThreshold_5:uint = 600;
		
		private var m_loadIntroFrameFunction:Function;
		private var m_introSprite:AxSprite;
		
		private var m_introState:uint;
		private static var STATE_UNSTARTED:uint = 0;
		private static var STATE_FRAME_0:uint = 1;
		private static var STATE_FRAME_1:uint = 2;
		private static var STATE_FRAME_2:uint = 3;
		private static var STATE_FRAME_3:uint = 4;
		private static var STATE_START_NEXT:uint = 5;
		
		private var m_fadeTime:Number = 0.5;
		
		public function IntroGameState() 
		{
			super();
		}
		
		override public function create():void
		{
			super.create();
			m_introState = STATE_UNSTARTED;
			m_loadIntroFrameFunction = loadIntroFrame;
			m_introSprite = new AxSprite(0, 0, null, GameSettings.windowWidth, GameSettings.windowHeight);
			
			Registry.musicHandler = new MusicHandler();
			Registry.highScore = new Array();
		}
		
		override public function update():void 
		{
			++m_frameCounter;
			
			if (m_frameCounter >= m_frameThreshold_4)
			{
				if (m_introState != STATE_START_NEXT)
				{
					startGame();
				}
			} else if (m_frameCounter >= m_frameThreshold_3)
			{
				if (m_introState != STATE_FRAME_3)
				{
					m_introState = STATE_FRAME_3;
					Ax.camera.fadeOut(m_fadeTime, 0xff000000, function():void {
						Ax.camera.reset();
						Ax.camera.fadeIn(m_fadeTime);
						m_introSprite.load(Resource.INTRO_3, 600, 400);
						add(m_introSprite);					
					 });
				}
			} else if (m_frameCounter >= m_frameThreshold_2)
			{
				if (m_introState != STATE_FRAME_2)
				{
					m_introState = STATE_FRAME_2;
					Ax.camera.fadeOut(m_fadeTime, 0xff000000, function():void {
						Ax.camera.reset();
						Ax.camera.fadeIn(m_fadeTime);
						m_introSprite.load(Resource.INTRO_2, 600, 400);
						add(m_introSprite);
						
					 });
				}
			} else if (m_frameCounter >= m_frameThreshold_1)
			{
				if (m_introState != STATE_FRAME_1)
				{
					m_introState = STATE_FRAME_1;
					Ax.camera.fadeOut(m_fadeTime, 0xff000000, function():void {
						Ax.camera.reset();
						Ax.camera.fadeIn(m_fadeTime);
						m_introSprite.load(Resource.INTRO_1, 600, 400);
						add(m_introSprite);	
						Ax.sound(Resource.SOUND_CARL_HELLO);
					 });
				}
			} else
			{
				if (m_introState != STATE_FRAME_0)
				{
					m_introState = STATE_FRAME_0;
					Ax.camera.fadeOut(m_fadeTime, 0xff000000, function():void {
						Ax.camera.reset();
						Ax.camera.fadeIn(m_fadeTime);
						m_introSprite.load(Resource.INTRO_0, 600, 400);
						add(m_introSprite);					
					 });
				}				
			}
			
			if (Ax.keys.pressed(AxKey.ANY))
			{
				startGame();
			}			
			
			super.update();
		}
		
		private function loadIntroFrame(frameNumber:uint):void
		{
			Ax.camera.reset();
			Ax.camera.fadeIn(m_fadeTime);
			switch(frameNumber)
			{
				case 0:

					break;
				case 1:
					m_introSprite.load(Resource.INTRO_1, 600, 400);
					add(m_introSprite);
					break;
				case 2:
					m_introSprite.load(Resource.INTRO_2, 600, 400);
					add(m_introSprite);
					break;
				case 3:
					m_introSprite.load(Resource.INTRO_3, 600, 400);
					add(m_introSprite);
					break;
				case 4:
					m_introSprite.load(Resource.INTRO_0, 600, 400);
					add(m_introSprite);					
					break;
			}
		}
		
		private function startGame():void 
		{
			m_introState = STATE_START_NEXT;
			m_frameCounter = m_frameThreshold_5;
			Ax.camera.fadeOut(m_fadeTime, 0xff000000, function():void {
				Ax.camera.reset();
				Ax.camera.fadeIn(m_fadeTime);
				Ax.popState();
				Ax.pushState(new GameState());
				Ax.pushState(new StartGameState(false));
			});
		}
	}

}