package lgj.GameStates 
{
	//import crs.Entities.Entity;
	import lgj.Settings;
	//import crs.Util.MusicHandler;
	import lgj.Util.Resource;
	import lgj.Util.Registry;
	import lgj.Util.MusicHandler;
	
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
		private var m_frameThreshold_1:uint = 300;
		private var m_frameThreshold_2:uint = 500;
		private var m_frameThreshold_3:uint = 620;
		private var m_frameThreshold_4:uint = 740;
		private var m_frameThreshold_5:uint = 860;
		private var m_frameThreshold_6:uint = 980;
		private var m_frameThreshold_7:uint = 1000;
				
		private var m_loadIntroFrameFunction:Function;
		private var m_introSprite:AxSprite;
		
		private var m_introState:uint;
		private static var STATE_UNSTARTED:uint = 0;
		private static var STATE_FRAME_0:uint = 1;
		private static var STATE_FRAME_1:uint = 2;
		private static var STATE_FRAME_2:uint = 3;
		private static var STATE_FRAME_3:uint = 4;
		private static var STATE_FRAME_4:uint = 5;
		private static var STATE_FRAME_5:uint = 6;
		private static var STATE_START_NEXT:uint = 7;
		
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
			m_introSprite = new AxSprite(0, 0, null, Settings.WINDOW_WIDTH, Settings.WINDOW_HEIGHT);
			
			Registry.musicHandler = new MusicHandler();
		}
		
		override public function update():void 
		{
			++m_frameCounter;
			
			if (m_frameCounter >= m_frameThreshold_7)
			{
				if (m_introState != STATE_START_NEXT)
				{
					startGame();
				}
			} 
			else if (m_frameCounter >= m_frameThreshold_5)
			{
				if (m_introState != STATE_FRAME_5)
				{
					m_introState = STATE_FRAME_5;
					Ax.camera.fadeOut(m_fadeTime, 0xff000000, function():void {
						Ax.camera.reset();
						Ax.camera.fadeIn(m_fadeTime);
						m_introSprite.load(Resource.INTRO_5, 600, 400);
						add(m_introSprite);					
					 });
				}
			} 
			else if (m_frameCounter >= m_frameThreshold_4)
			{
				if (m_introState != STATE_FRAME_4)
				{
					m_introState = STATE_FRAME_4;
					Ax.camera.fadeOut(m_fadeTime, 0xff000000, function():void {
						Ax.camera.reset();
						Ax.camera.fadeIn(m_fadeTime);
						m_introSprite.load(Resource.INTRO_4, 600, 400);
						add(m_introSprite);					
					 });
				}
			} 
			else if (m_frameCounter >= m_frameThreshold_3)
			{
				if (m_introState != STATE_FRAME_3)
				{
					m_introState = STATE_FRAME_3;
					Ax.camera.fadeOut(m_fadeTime, 0xff000000, function():void {
						Ax.camera.reset();
						Ax.camera.fadeIn(m_fadeTime);
						m_introSprite.load(Resource.INTRO_3, 600, 400);
						add(m_introSprite);		
						Ax.sound(Resource.SOUND_CARL_HELLO);
					 });
				}
			} 
			else if (m_frameCounter >= m_frameThreshold_2)
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
			} 
			else if (m_frameCounter >= m_frameThreshold_1)
			{
				if (m_introState != STATE_FRAME_1)
				{
					m_introState = STATE_FRAME_1;
					Ax.camera.fadeOut(m_fadeTime, 0xff000000, function():void {
						Ax.camera.reset();
						Ax.camera.fadeIn(m_fadeTime);
						m_introSprite.load(Resource.INTRO_1, 600, 400);
						add(m_introSprite);	
						
					 });
				}
			} 
			else
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
			
			if (Ax.keys.pressed(AxKey.ANY) || Ax.mouse.down(0))
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
			m_frameCounter = m_frameThreshold_7;
			Ax.camera.fadeOut(m_fadeTime, 0xff000000, function():void {
				Ax.camera.reset();
				Ax.camera.fadeIn(m_fadeTime);
				Ax.popState();
				Ax.pushState(new StartMenuState());
				Registry.musicHandler.playMusic(Resource.MUSIC);
			});
		}
	}

}