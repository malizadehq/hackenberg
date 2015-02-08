package lgj.Entities 
{
	import flash.display.Bitmap;
	
	import org.axgl.AxVector;
	import org.axgl.AxRect;
	
	import lgj.Util.RNG;
	import lgj.Util.Resource;
	import lgj.Settings;
	import lgj.Util.VectorHelper;
	import lgj.Util.Registry;
	
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
		private var m_rotation:Number = 0;
		private var m_hasSpawnedBounceBlood:Boolean = false;
		private var m_hasSpawnedStationaryBlood:Boolean = false;
		private var m_isStationary:Boolean = false;
		
		public var HasBeenCooked:Boolean = false;

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
			
			var floorHeight:int = Settings.WINDOW_HEIGHT - Settings.FLOOR_HEIGHT + (-RNG.generateNumber(Settings.FLOOR_HEIGHT_RANDOM_MIN, Settings.FLOOR_HEIGHT_RANDOM_MAX));
			worldBounds = new AxRect( -100, 0, Settings.WINDOW_WIDTH, floorHeight);
									 
			acceleration.y = Settings.GRAVITY;
		}		
		
		public override function update():void {
			super.update();
			
			if(m_bounceCooldown > 0) {
				--m_bounceCooldown;
			}
			
			if(isAtBottom() && m_bounceCooldown == 0) {
				bounce();
				m_rotation = 0;
				if(angle >= 90 || angle <= -90) {
					angle = 180;
				} else {
					angle = 0;
				}
			}
			
			if (velocity.x == 0 && velocity.y == 0) {
				m_isStationary = true;
			}
			
			if (m_isStationary) {
				if(!m_hasSpawnedStationaryBlood) {
					spawnBlood(false);
					m_hasSpawnedStationaryBlood = true;
				}
				
				if(globalX > Settings.POT_POSITION.x) {
					hit();
				}
			}
			
			angle += m_rotation;
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
			
			if (!m_hasSpawnedBounceBlood) {
				spawnBlood(true);
				m_hasSpawnedBounceBlood = true;
			}
		}
		
		private function spawnBlood(small:Boolean):void {
			var resource:Class;
			var rngNum:uint = RNG.generateNumber(0, 1);
			if(small) {
				if (rngNum == 0) {
					resource = Resource.BLOOD_DECAL_SMALL_0;
				} else {
					resource = Resource.BLOOD_DECAL_SMALL_1;
				}				
			} else {
				if (rngNum == 0) {
					resource = Resource.BLOOD_DECAL_LARGE_0;
				} else {
					resource = Resource.BLOOD_DECAL_LARGE_1;
				}								
			}

			Registry.gameState.spawnBloodDecal(globalX, globalY, resource);
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
		
		public function giveVelocityBasedRotation(parentVelocity:AxVector):void {
			var speed:Number = VectorHelper.getLength(parentVelocity);
			var maxSpeed:int = 500;
			var minSpeed:int = 10;
			var maxAngle:int = 10;
			
			//cap speed to max
			speed = speed > maxSpeed ? maxSpeed : speed;
			//get factor of speed vs max speed
			m_rotation = speed / maxSpeed;
			//apply the same factor to angle;
			m_rotation = maxAngle * m_rotation;

			if(m_gibletPart == 0 || m_gibletPart == 3) {
				m_rotation * 0.5;
			}
		}
	}

}