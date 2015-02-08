package lgj.Entities
{
	import org.axgl.AxSprite;
	import lgj.Settings;

	/**
	 * The base entity class
	 */
	public class Entity extends AxSprite 
	{
		public var HasBeenCooked:Boolean = false;
				
		public function Entity(x:Number, y:Number, graphic:Class) 
		{
			super(x, y, graphic);
		}
		
		protected function isAtBottom():Boolean {
			return globalY + height >= worldBounds.bottom;
		}
	}
}