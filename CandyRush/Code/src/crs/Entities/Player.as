package crs.Entities{
	import adobe.utils.CustomActions;
	import org.axgl.Ax;
	import org.axgl.AxPoint;
	import org.axgl.AxRect;
	import org.axgl.AxSprite;
	import org.axgl.AxVector;
	import org.axgl.input.AxKey;
	
	import crs.GameStates.GameOverState;
	import crs.Util.Resource;
	import crs.Util.RNG;

	public class Player extends AxSprite {
		
		public var m_isDashing:Boolean = false;		
		private var m_hasJumped:Boolean = true;
		private var m_hasDoubleJumped:Boolean = true;
		private var m_originalGravity:int = 650;		
		private var m_curGravity:int = 650;
		private var m_dashFrameCounter:int = 0;
		private var m_dashMaxFrames:int = 20;	
		private var m_isDazed:Boolean = false;
		private var m_footstepFrameCounter:uint = 0;
		//50, 50, 0, 20 are the "real" bounds
		private var m_playerBounds:AxPoint = new AxPoint(30, 30);
		private var m_playerBoundOffset:AxPoint = new AxPoint(10, 40);
		
		public function Player(x:Number, y:Number, worldWidth:Number, worldHeight:Number) {
			super(x, y);

			loadRunAnim();
			
			drag.x = 300;
			acceleration.y = m_curGravity;
			worldBounds = new AxRect(0, 0, worldWidth, worldHeight + 100);
			setPlayerRunBounds();
		}
		
		override public function update():void 
		{
			if (m_isDazed)
			{
				return;
			}
				
			if (isTouching(DOWN))
			{
				if(m_hasJumped || m_hasDoubleJumped)
					Ax.sound(Resource.SOUND_JUMP_1, 1.0);
				m_hasJumped = false;
				m_hasDoubleJumped = false;
				
			}

			if (!m_isDashing)
			{
				if (Ax.keys.pressed(AxKey.Z))
				{
					var isAllowedToJump:Boolean = false;
					if (!m_hasJumped)
					{
						isAllowedToJump = true;
						m_hasJumped = true;
						Ax.sound(Resource.SOUND_JUMP_0, 0.45);
					} else if (!m_hasDoubleJumped)
					{
						isAllowedToJump = true;
						m_hasDoubleJumped = true;
						Ax.sound(Resource.SOUND_JUMP_2, 0.45);
					}
					
					if (isAllowedToJump)
					{
						velocity.y = -360;
					}
				}
				
				if (Ax.keys.pressed(AxKey.X))
				{
					dash();
				}
				
				if (!isTouching(DOWN) && Ax.keys.held(AxKey.Z) && velocity.y > 0)
				{
					acceleration.y = m_curGravity * 0.5;
				}else
				{
					acceleration.y = m_curGravity;
				}			
				
				if (velocity.y < 0) {
					//setPlayerJumpBounds();
					animate("jump");
					m_footstepFrameCounter = 0;
				} else if (velocity.y > 0) {
					//setPlayerJumpBounds();
					animate("fall");
					m_footstepFrameCounter = 0;
				} else
				{
					//setPlayerRunBounds();
					if (++m_footstepFrameCounter == 1)
					{
						//Ax.sound(Resource.SOUND_FOOTSTEP, 0.11);
					} else if (m_footstepFrameCounter == 13)
					{
						m_footstepFrameCounter = 0;
					}
					animate("run");	
				}				
			} else
			{
				++m_dashFrameCounter;
				animate("dash");				
				if (m_dashFrameCounter >= m_dashMaxFrames)
				{
					endDash();
				}
			}
			super.update();
		}
		
		public function eat():void
		{
			destroy();
		}
		
		private function dash():void
		{
			if (m_isDazed)
				return;
				
			load(Resource.ANIM_DASH, 100, 70);
			setPlayerRunBounds();
			addAnimation("dash", [0, 1, 2, 3], 8, true);
			m_hasJumped = false;
			m_hasDoubleJumped = true;
			
			m_isDashing = true;
			m_curGravity = 0;
			acceleration.y = 0;
			velocity.y = 0;
			
			switch(RNG.generateNumber(0, 3))
			{
				case 0:
					Ax.sound(Resource.SOUND_DASH_START_0);
				break;
				case 1:
					Ax.sound(Resource.SOUND_DASH_START_1);
				break;
				case 2:
					Ax.sound(Resource.SOUND_DASH_START_2);
				break;
				case 3:
					Ax.sound(Resource.SOUND_DASH_START_3);
				break;
			}
			
			Ax.camera.shake(0.33, 1);
		}
		
		private function endDash():void
		{
			if (m_isDazed)
				return;
				
			loadRunAnim();
			
			m_isDashing = false;
			m_curGravity = m_originalGravity;
			m_dashFrameCounter = 0;
		}
		
		public function animateDashHit():void
		{
			if (m_isDazed)
				return;
				
			load(Resource.ANIM_DASH_HIT, 100, 70);
			setPlayerRunBounds();
			addAnimation("dashHit", [0, 1, 2, 3, 4, 5, 6, 7], 8, false, function():void 
			{
				loadRunAnim();
				animate("run")
			});
			animate("dashHit");
		}
		
		public function loadRunAnim():void
		{
			if (m_isDazed)
				return;
				
			load(Resource.ANIM_RUN, 70, 70);
			setPlayerRunBounds();
			addAnimation("run", [0,1,2,3,4,5,6], 11, true);
			addAnimation("jump", [3], 1, false);
			addAnimation("fall", [4], 1, false);
		}
		
		public function fall():void
		{
			daze();
			Ax.pushState(new GameOverState());			
		}
		
		public function isDazed():Boolean
		{
			return m_isDazed;
		}
		
		public function daze():void
		{
			if (m_isDazed)
				return;
			m_isDazed = true;
			x = 100;
			velocity.x = 0;
			velocity.y = 0;
				
			Ax.sound(Resource.SOUND_COMMON_SPLAT_0);
			Ax.camera.shake(0.35, 8);
		}
		
		private function setPlayerRunBounds():void
		{
			bounds(m_playerBounds.x, m_playerBounds.y, m_playerBoundOffset.x, m_playerBoundOffset.y);
		}
		
		private function setPlayerJumpBounds():void
		{
			bounds(m_playerBounds.x, m_playerBounds.y - 20, m_playerBoundOffset.x, m_playerBoundOffset.y);
		}		
	}
}
