package 
{
	import org.axgl.Ax;
	import org.axgl.render.AxColor;
	import crs.GameStates.IntroGameState;
	import crs.GameStates.GameState;
	import crs.GameStates.StartGameState;
	
	/**
	 * ...
	 * @author Sone
	 */
	public class Main extends Ax 
	{
		public function Main():void 
		{
			super(IntroGameState);
			//super(StartGameState);
			//super(GameState);			
		}
		
		override public function create():void {
			Ax.background = AxColor.fromHex(0xf1e2f1);
		}
	}	
}