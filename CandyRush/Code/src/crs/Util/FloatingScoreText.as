package crs.Util 
{
	import org.axgl.text.AxFont;
	import org.axgl.text.AxText;
	
	/**
	 * ...
	 * @author Sone
	 */
	public class FloatingScoreText extends AxText 
	{
		/**Keeps count of how many frames this text has existed. **/
		private var m_frameCounter:int = 0;
		
		public function FloatingScoreText(x:Number, y:Number, font:AxFont, text:String, width:uint=0, align:String="left") 
		{
			super(x, y, font, text, width, align);
			
			velocity.y = GameSettings.floatingScoreTextYVelocity;
		}
		
		public override function update():void
		{
			super.update();
			
			++m_frameCounter;
			if (m_frameCounter >= GameSettings.floatingScoreTextMaxFrames)
			{
				destroy();
			}
		}
	}

}