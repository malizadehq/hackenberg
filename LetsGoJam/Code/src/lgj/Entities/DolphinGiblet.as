package lgj.Entities 
{
	import flash.display.Bitmap;
	
	import org.axgl.AxRect;
	
	import lgj.Util.RNG;
	import lgj.Util.Resource;
	import lgj.Settings;
	
	public class DolphinGiblet extends Entity
	{
		/**
		 * 0 = 0
		 * 1 = 0_0
		 * 2 = 0_1
		 * 3 = 1
		 * 4 = 1_0
		 * 5 = 1_1
		 * */
		private var m_gibletPart:uint = 0;
		private var m_canBeHitAgain:Boolean = false;
		private var m_bounceCooldown:uint = 0;
		
		/*
		 * If gibletFamily isn't set, this constructor will set it and spawn the equivalent giblet.
		 * if gibletFamily is set, this constructor will create sub level giblet of that family.
		 * */
		public function DolphinGiblet(x:Number, y:Number, gibletPart:uint)
		{
			var resource:Class;
			m_gibletPart = gibletPart;
			switch(m_gibletPart) {
				case 0:
					resource = Resource.DOLPHIN_GIB_0;
					m_canBeHitAgain = true;
					break;
				case 1:
					resource = Resource.DOLPHIN_GIB_0_0;
					break;
				case 2:
					resource = Resource.DOLPHIN_GIB_0_1;
					break;
				case 3:
					resource = Resource.DOLPHIN_GIB_1;
					m_canBeHitAgain = true;
					break;
				case 4:
					resource = Resource.DOLPHIN_GIB_1_0;
					break;
				case 5:
					resource = Resource.DOLPHIN_GIB_1_1;
					break;
				default:
					break;
			}
			
			super(x, y, resource);
			
			worldBounds = new AxRect(-100, 0, Settings.WINDOW_WIDTH + 150, Settings.WINDOW_HEIGHT - Settings.FLOOR_HEIGHT);
			acceleration.y = Settings.GRAVITY;
		}		
		
		public override function update():void {
			super.update();
			
			if(m_bounceCooldown > 0) {
				--m_bounceCooldown;
			}
			
			if(isAtBottom() && m_bounceCooldown == 0) {
				bounce();
			}
		}
		
		private function bounce():void {
			m_bounceCooldown = Settings.BOUNCE_COOLDOWN_FRAMES;
			if(velocity.y > 0) {
				velocity.y = -velocity.y;
				if(velocity.y > -Settings.BOUNCE_VELOCITY_DECREASE.y) {
					velocity.y = 0;
				} else {
					velocity.y += Settings.BOUNCE_VELOCITY_DECREASE.y;
				}				
			}
			
			if(velocity.x < Settings.BOUNCE_VELOCITY_DECREASE.x) {
				velocity.x = 0;
			} else {
				velocity.x -= Settings.BOUNCE_VELOCITY_DECREASE.x;	
			}
		}
		
		public function hit():void {
			m_canBeHitAgain = false;
			destroy();
		}
		
		public function getGibletPartNumber():uint {
			return new uint(m_gibletPart);
		}
		
		public function canBeGibbedAgain():Boolean {
			return new Boolean(m_canBeHitAgain);
		}
	}

}