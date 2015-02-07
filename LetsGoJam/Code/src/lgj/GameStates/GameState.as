package lgj.GameStates 
{
	import flash.events.MouseEvent;
	
	import org.axgl.AxSprite;
	import org.axgl.AxState;
	import org.axgl.Ax;
	import org.axgl.input.AxMouse;
	import org.axgl.input.AxMouseButton;

	import lgj.VectorHelper;
	import lgj.Entities.Player;
	import lgj.Input.InputHandler;
	import lgj.Resource;
	import lgj.Settings;

	public class GameState extends AxState
	{
		private var m_background:AxSprite;
		private var m_mouse:AxMouse;
		private var m_inputHandler:InputHandler;
		
		private var m_player:Player;
		
		public function GameState() 
		{
			
		}
		
        override public function create():void {
            super.create();
            trace("GameState Created");
			
			m_inputHandler = new InputHandler();

			m_background = new AxSprite(0, 0, null, Settings.WINDOW_WIDTH, Settings.WINDOW_HEIGHT);
			m_background.load(Resource.BACKGROUND, 600, 400);
			add(m_background);
			
			Ax.stage2D.addEventListener(MouseEvent.MOUSE_DOWN, m_inputHandler.onMouseDownHandler);
			Ax.stage2D.addEventListener(MouseEvent.MOUSE_UP, m_inputHandler.onMouseUpHandler);
			
			m_player = new Player(150, 150, Settings.WINDOW_WIDTH, Settings.WINDOW_HEIGHT);
			add(m_player);
        }
        
        override public function update():void {
            super.update();
			
			if(m_inputHandler.hasInputToProcess()) {
				m_player.startDash(VectorHelper.addAxVectorToAxVector(m_inputHandler.getAndResetInputForce(), m_player.velocity));	
			}
		}
		
	}

}