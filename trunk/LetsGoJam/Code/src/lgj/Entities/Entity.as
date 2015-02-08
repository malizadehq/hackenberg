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
		protected var m_canBeHitCooldown:int = Settings.HIT_COOLDOWN_FRAMES;
				
		public function Entity(x:Number, y:Number, graphic:Class) 
		{
			super(x, y, graphic);
		}
		
		public override function update():void {
			if(m_canBeHitCooldown > 0) {
				--m_canBeHitCooldown;
			}
			
			super.update();
		}
		
		protected function isAtBottom():Boolean {
			return globalY + height >= worldBounds.bottom;
		}
		
		public function hit():void {
			m_canBeHitCooldown = Settings.HIT_COOLDOWN_FRAMES;
		}
		
		public function canBeHit():Boolean {
			return m_canBeHitCooldown == 0;
		}
	}
}