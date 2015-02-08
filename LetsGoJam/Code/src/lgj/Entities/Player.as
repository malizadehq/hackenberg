package lgj.Entities {
    import org.axgl.AxSprite;
	import org.axgl.AxRect;
	import org.axgl.AxVector;
	
	import lgj.Util.VectorHelper;
	import lgj.Util.Resource;
	import lgj.Settings;
	
    public class Player extends AxSprite {
		private var m_dashFramesRemaining:int = 0;
		private var m_dashVector:AxVector = new AxVector();
		
		private var m_idleState:uint = 0;
		private var m_readyState:uint = 1;
		private var m_dashingState:uint = 2;
		private var m_state:uint;
		
		private var m_hitCooldown:uint = 0;
		
        public function Player(x:Number, y:Number, worldWidth:Number, worldHeight:Number) {
			super(x, y);

			worldBounds = new AxRect(0, 0, worldWidth, worldHeight - 50);

            load(Resource.PLAYER_IDLE, 64, 64);
			addAnimations();
			
			m_state = m_readyState;
        }
        
        override public function update():void {
			super.update();
			switch(m_state) {
				case m_idleState:
					break;
				case m_readyState:
					acceleration.y = Settings.GRAVITY * 2;
					break;
				case m_dashingState:
					--m_dashFramesRemaining;
					if(m_dashFramesRemaining <= 0/* || willBeAtEndOfWorld()*/) {
						stopDash();
					}
					break;
				default:
					break;
			}
			
			animate("idle");
			if (m_hitCooldown > 0) {
				--m_hitCooldown;
			}
			
			if (velocity.y == 0) {
				velocity.x = 0;
			}
        }
		
		//returns whether the player will be at the end of the world at the next tick or not.
		private function willBeAtEndOfWorld():Boolean {
			//TODO: Calc vel per frame isntead of whatever this is.
			var nextX:int = globalX + velocity.x;
			var nextY:int = globalY + velocity.y;
			
			if (nextX <= 0 || nextY <= 0 || (nextX + width) >= worldBounds.right || (nextY + height) >= worldBounds.bottom) {
				trace("isAtEndOfWorld");
				return true;
			}
			return false;
		}
		
		public function startDash(inputForce:AxVector):void {
			var vectorLength:Number = VectorHelper.getLength(inputForce);
			m_dashFramesRemaining = vectorLength * Settings.DASH_DRAG_TO_FRAMES_CONVERSION_RATE;
			
			var normalizedVector:AxVector = VectorHelper.normalizeAxVector(inputForce);
			velocity = VectorHelper.multiplyVectorWithNumber(normalizedVector, Settings.DASH_SPEED);
			
			m_state = m_dashingState;
			acceleration.y = 0;
			
			flip = velocity.x < 0 ? LEFT : RIGHT;
		}
		
		private function stopDash():void {
			m_state = m_readyState;
			velocity = VectorHelper.multiplyVectorWithNumber(VectorHelper.normalizeAxVector(velocity), 100); // new AxVector();
			m_dashFramesRemaining = 0;
		}
		
		private function addAnimations():void {
			addAnimation("idle", [0, 1, 2, 3, 4, 5], 6, true);
		}
		
		public function canHit():Boolean {
			return !(m_hitCooldown > 0);
		}
		
		public function isDashing():Boolean {
			return new Boolean(m_state == m_dashingState);
		}
		
		public function hit():void {
			m_hitCooldown = Settings.HIT_COOLDOWN_FRAMES;
		}
    }
}