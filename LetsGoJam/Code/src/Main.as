package
{
	import org.axgl.Ax;
	import org.axgl.render.AxColor;
	
	import lgj.GameStates.TitleState;
	
	public class Main extends Ax
	{
		public function Main() 
		{
			super(TitleState);
		}
		
		override public function create():void {
			Ax.background = AxColor.fromHex(0xf1e2f1);
		}
	}
	
}