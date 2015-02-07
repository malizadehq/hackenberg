package lgj.GameStates 
{
	import lgj.Settings;
	import org.axgl.AxState;
	import org.axgl.Ax;

	public class TitleState extends AxState
	{
		private var m_frameCounter:int = 0;
		
        override public function create():void {
            super.create();
            trace("TitleState Created");
        }
        
        override public function update():void {
			++m_frameCounter;
			if (m_frameCounter >= Settings.TITLE_FRAME_DURATION) {
				startGame();
			}
			
			super.update();
        }
		
		private function startGame():void {
			Ax.popState();
			Ax.pushState(new GameState());
			/*
			Ax.camera.fadeOut(Settings.CAMERAFADE_BETWEEN_STATES_DURATION, 0xff000000, function():void {
				Ax.camera.reset();
				Ax.camera.fadeIn(Settings.CAMERAFADE_BETWEEN_STATES_DURATION);
				Ax.popState();
				Ax.pushState(new GameState());
			});
			*/
		}
	}

}