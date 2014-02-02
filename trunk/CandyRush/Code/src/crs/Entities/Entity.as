package crs.Entities
{
	import org.axgl.AxSprite;

	/**
	 * The base entity class
	 */
	public class Entity extends AxSprite 
	{
		public function Entity(x:Number, y:Number, graphic:Class) 
		{
			super(x, y, graphic);
		}
	}
}