package
{
	import org.axgl.Ax;
	import org.axgl.render.AxColor;
	
	import lgj.GameStates.ReadyState;
	import lgj.GameStates.IntroGameState;
	
	public class Main extends Ax
	{
		public function Main() 
		{
			super(IntroGameState);
		}
		
		override public function create():void {
			Ax.background = AxColor.fromHex(0xf1e2f1);
		}
	}
}