package crs.Entities 
{
	import org.axgl.Ax;
	import org.axgl.AxU;
	import org.axgl.particle.AxParticleSystem;
	import org.axgl.resource.AxResource;
	
	import crs.Util.RNG;
	import crs.Util.Resource;

	/**
	 * A powerup.
	 */
	public class Powerup extends Entity 
	{
		private var m_frameCounter:int = 0;		
		private var m_isCollected:Boolean = false;
		private var m_pendingDestruction:Boolean = false;		
		private var m_isBobbing:Boolean = true;
		
		private static var NUM_TYPES:uint = 5;
		
		public static var TYPE_RANDOM:uint = 0;
		public static var TYPE_RED:uint = 1;
		public static var TYPE_BLUE:uint = 2;
		public static var TYPE_GREEN:uint = 3;
		public static var TYPE_PURPLE:uint = 4;
		public static var TYPE_YELLOW:uint = 5;
		
		/**
		 * Creates a new powerup.
		 */
		public function Powerup(x:Number, y:Number, type:uint = 0)
		{
			super(x, y, Resource.POWERUP);
			
			load(Resource.POWERUP, 24, 24);
			var randomType:uint = type;
			if (randomType == TYPE_RANDOM)
			{
				randomType = RNG.generateNumber(1, 5);
			}
			
			setPowerupType(randomType);
		}

		public override function update():void
		{
			if (x < -width)
			{
				setPendingDestruction(true);
			}
			
			if (m_pendingDestruction)
			{
				onDestroy();
			}
			
			//bob the powerups
			++m_frameCounter;
			if (m_isBobbing)
			{
				if ((m_frameCounter % 200) <= 100)
				{
					velocity.y = 25
				} else 
				{
					velocity.y = -25;
				}				
			} else 
			{
				velocity.y = 0;
			}
			
			super.update();
		}		
		
		/**
		 * Called when the player hits this powerup.
		 */
		public function collect():void 
		{
			setCollected(true);
			load(Resource.POWERUP_DESTROY, 24, 24);
			var onDestroyFunction:Function = onDestroy;
			addAnimation("destroy", [0, 1, 2, 3, 4, 5, 6, 7, 8], 12, false, onDestroyFunction);
			animate("destroy");
			m_isBobbing = false;
		}
		
		public function onDestroy():void
		{
			destroy();
		}
		
		public function setCollected(collectible:Boolean):void
		{
			m_isCollected = collectible;
		}
		
		public function isCollected():Boolean
		{
			return m_isCollected;
		}
		
		private function setPowerupType(type:uint):void
		{
			switch(type)
			{
				case TYPE_RED:
					addAnimation("powerup", [TYPE_RED - 1], 1, false);
					break;
				case TYPE_GREEN:
					addAnimation("powerup", [TYPE_GREEN - 1], 1, false);
					break;
				case TYPE_BLUE:
					addAnimation("powerup", [TYPE_BLUE - 1], 1, false);
					break;
				case TYPE_PURPLE:
					addAnimation("powerup", [TYPE_PURPLE - 1], 1, false);
					break;
				case TYPE_YELLOW:
					addAnimation("powerup", [TYPE_YELLOW - 1], 1, false);
					break;					
			}
			animate("powerup");
		}
		
		public function setPendingDestruction(pendingDestruction:Boolean):void
		{
			m_pendingDestruction = true;
		}
	}
}