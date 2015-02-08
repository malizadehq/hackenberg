package lgj.Entities 
{
	import lgj.Settings;
	import lgj.Util.Resource;
	import lgj.Util.RNG;
	
	import org.axgl.AxPoint;	
	import org.axgl.AxVector;
	import org.axgl.AxRect;
	import org.axgl.AxSprite;
	
	public class Dolphin extends Entity
	{
		private var m_state:uint;
		
		private var m_flyingState:uint = 0;
		private var m_floppingState:uint = 1;
		private var m_scaleY:int = 1;
		
		private var m_frameCounter:int = 0;
		private var m_flopMinJumpSpeed:AxVector = new AxVector(10, 200, 0);
		private var m_flopMaxJumpSpeed:AxVector = new AxVector(100, 300, 0);
		private var m_flopMinTime:uint = 10;
		private var m_flopMaxTime:uint = 20;
		
		private var m_maxRotation:int = 60;
		
		public function Dolphin(x:Number, y:Number) 
		{
			super(x, y, Resource.DOLPHIN);
			load(Resource.DOLPHIN, 128, 32);
			addAnimation("flying", [0], 1, true);
			worldBounds = new AxRect(-100, 0, Settings.WINDOW_WIDTH + 150, Settings.WINDOW_HEIGHT - Settings.FLOOR_HEIGHT);
			acceleration.y = Settings.GRAVITY;
			
			m_state = m_flyingState;
		}
		
		public override function update():void {
			if(globalX > Settings.WINDOW_WIDTH + width + 10) {
				dispose();
			}
			
			switch(m_state) {
				case m_flyingState:
					animate("flying");
					handleRotation();
					if (isAtBottom()) {
						m_frameCounter = RNG.generateNumber(m_flopMinTime, m_flopMaxTime);
						setFlopSpeeds();
						m_state = m_floppingState;
					}
					break;
				case m_floppingState:
					--m_frameCounter;
					angle = 0;
					if (m_frameCounter < 0) {
						m_frameCounter = RNG.generateNumber(m_flopMinTime, m_flopMaxTime);
						m_scaleY *= -1;
						scale = new AxPoint(1, m_scaleY);
						if(isAtBottom()) {
							setFlopSpeeds();
						}						
					}
					break;
				default:
					break;
			}
			
			acceleration.y = Settings.GRAVITY;
			super.update();								
		}
		
		//if velocity is larger than 180, rotate to max degrees. Else tween it between -max/+max depending on velocity.
		private function handleRotation():void {
			if(velocity.y < -180) {
				angle = -m_maxRotation;
			} else if(velocity.y > 180) {
				angle = m_maxRotation;
			} else {
				angle = m_maxRotation * (Math.abs(velocity.y) / 180);
				angle = velocity.y < 0 ? angle * -1 : angle;
			}
		}
		
		private function setFlopSpeeds():void 
		{
			velocity.y = RNG.generateNumber(-m_flopMinJumpSpeed.y, -m_flopMaxJumpSpeed.y);
			velocity.x = RNG.generateNumber(m_flopMinJumpSpeed.x, m_flopMaxJumpSpeed.x);
		}
		
		public function hit():void {
			destroy();
		}
	}

}