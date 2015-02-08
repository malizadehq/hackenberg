package lgj.GameStates 
{
	import lgj.Settings;
	import org.axgl.AxState;
	import org.axgl.Ax;
	import lgj.Util.Resource;
	import lgj.Settings;
	import org.axgl.AxSprite;
	
	public class ReadyState extends AxState
	{
		private var m_frameCounter:int = 0;
		private var m_ReadSprite_00:AxSprite;
		private var m_ReadSprite_01:AxSprite;
		private var m_ReadSprite_BG:AxSprite;
		
        override public function create():void 
		{
			m_ReadSprite_00 = new AxSprite(0, 0, null, Settings.WINDOW_WIDTH, Settings.WINDOW_HEIGHT);
			m_ReadSprite_01 = new AxSprite(0, 0, null, Settings.WINDOW_WIDTH, Settings.WINDOW_HEIGHT);
			m_ReadSprite_00.origin.x = 300;
			m_ReadSprite_00.origin.y = 200;
			m_ReadSprite_01.origin.x = 300;
			m_ReadSprite_01.origin.y = 200;
			
			m_ReadSprite_BG = new AxSprite(0, 0, null, Settings.WINDOW_WIDTH, Settings.WINDOW_HEIGHT);
			m_ReadSprite_BG.load(Resource.READY_BG, 600, 400);
			m_ReadSprite_BG.origin.x = 300;
			m_ReadSprite_BG.origin.y = 200;
			m_ReadSprite_BG.scale.x = 2.0;
			m_ReadSprite_BG.scale.y = 2.0;
			add(m_ReadSprite_BG);
            super.create();
        }
        
        override public function update():void 
		{
			if (m_frameCounter == 0)
			{
				//m_ReadSprite_BG.grow(5, 0.98, 0.98);
			}
			m_ReadSprite_BG.angle += 1;
			
			++m_frameCounter;
			
			if (m_frameCounter == 20)
			{
				Ax.sound(Resource.READY_SOUND_0);
				m_ReadSprite_00.load(Resource.READY_0, 600, 400);
				m_ReadSprite_00.scale.x = 4.0;
				m_ReadSprite_00.scale.y = 4.0;
				add(m_ReadSprite_00);
				m_ReadSprite_00.fadeIn(0.25, 1);
				m_ReadSprite_00.grow(0.5, 0.5, 0.5);
			}
				
			if (m_frameCounter == 80)
			{
				m_ReadSprite_00.fadeOut(0.25, 0);
				m_ReadSprite_00.grow(1, 0.01, 0.01);
				m_ReadSprite_01.scale.x = 4.0;
				m_ReadSprite_01.scale.y = 4.0;
				Ax.sound(Resource.READY_SOUND_1);
				m_ReadSprite_01.load(Resource.READY_1, 600, 400);
				add(m_ReadSprite_01);
				m_ReadSprite_01.fadeIn(0.25, 1);
				m_ReadSprite_01.grow(0.5, 0.5, 0.5);
			}
				
			if (m_frameCounter > 120)
			{
				m_ReadSprite_BG.fadeOut(0.25, 0);
				m_ReadSprite_BG.grow(0.25, 3, 3);
				m_ReadSprite_01.fadeOut(0.25, 0);
				m_ReadSprite_01.grow(1, 0.01, 0.01);
				Ax.popState();
			}
			super.update();
        }
	}
}