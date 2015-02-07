package lgj.GameStates 
{
	import flash.events.MouseEvent;
	import lgj.Entities.Player;
	import org.axgl.AxSprite;
	import org.axgl.AxState;
	import org.axgl.Ax;
	import org.axgl.input.AxMouse;
	import org.axgl.input.AxMouseButton;
	
	import lgj.Resource;
	import lgj.Settings;

	public class GameState extends AxState
	{
		private var m_background:AxSprite;
		private var m_mouse:AxMouse;
		
		private var m_player:Player;
		
		public function GameState() 
		{
			
		}
		
        override public function create():void {
            super.create();
            trace("GameState Created");
			
			m_background = new AxSprite(0, 0, null, Settings.WINDOW_WIDTH, Settings.WINDOW_HEIGHT);

			m_background.load(Resource.BACKGROUND, 600, 400);
			add(m_background);
			
			Ax.stage2D.addEventListener(MouseEvent.MOUSE_UP, onMouseDownHandler);
			Ax.stage2D.addEventListener(MouseEvent.MOUSE_UP, onMouseUpHandler);
			
			m_player = new Player(150, 150, Settings.WINDOW_WIDTH, Settings.WINDOW_HEIGHT);
			add(m_player);
        }
        
        override public function update():void {
            super.update();
		}
		
		private function onMouseDownHandler(event:MouseEvent):void {
			trace("Mouse down");
		}
		
		private function onMouseUpHandler(event:MouseEvent):void {
			trace("Mouse up");
		}		
		
	}

}