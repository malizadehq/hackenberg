package crs.Entities{
	import adobe.utils.CustomActions;
	import org.axgl.Ax;
	import org.axgl.AxRect;
	import org.axgl.AxSprite;
	import org.axgl.AxVector;
	import org.axgl.input.AxKey;
	
	import crs.Util.Resource;

	//TODO: Subclass from Entity
	public class Player extends AxSprite {
		
		private var hasJumped:Boolean = false;
		private var hasDoubleJumped:Boolean = false;
		public var isDashing:Boolean = false;
		private var originalGravity:int = 650;		
		private var curGravity:int = 650;
		private var dashFrameCounter:int = 0;
		private var dashMaxFrames:int = 20;		
		
		public function Player(x:Number, y:Number, worldWidth:Number, worldHeight:Number) {
			super(x, y);

			loadRunAnim();
			
			drag.x = 300;
			acceleration.y = curGravity;
			worldBounds = new AxRect(0, 0, worldWidth, worldHeight);
			bounds(50, 50, 0, 20);
		}
		
		override public function update():void 
		{
			if (isTouching(DOWN))
			{
				hasJumped = false;
				hasDoubleJumped = false;
			}

			if (!isDashing)
			{
				if (Ax.keys.pressed(AxKey.Z))
				{
					var isAllowedToJump:Boolean = false;
					if (!hasJumped)
					{
						isAllowedToJump = true;
						hasJumped = true;
					} else if (!hasDoubleJumped)
					{
						isAllowedToJump = true;
						hasDoubleJumped = true;					
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
					acceleration.y = curGravity * 0.5;
				}else
				{
					acceleration.y = curGravity;
				}			
				
				if (velocity.y < 0) {
					animate("jump");
				} else if (velocity.y > 0) {
					animate("fall");
				} else
				{
					animate("run");	
				}				
			} else
			{
				++dashFrameCounter;
				animate("dash");				
				if (dashFrameCounter >= dashMaxFrames)
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
			load(Resource.ANIM_DASH, 100, 70);
			addAnimation("dash", [0, 1, 2, 3], 8, true);
			bounds(50, 50, 0, 20);
			hasJumped = false;
			hasDoubleJumped = true;
			
			isDashing = true;
			curGravity = 0;
			acceleration.y = 0;
			velocity.y = 0;
			
			Ax.camera.shake(0.33, 1);
		}
		
		private function endDash():void
		{
			load(Resource.ANIM_RUN, 70, 70);
			addAnimation("run", [0,1,2,3,4,5,6], 11, true);
			addAnimation("jump", [3], 1, false);
			addAnimation("fall", [4], 1, false);
			bounds(50, 50, 0, 20);
			
			isDashing = false;
			curGravity = originalGravity;
			dashFrameCounter = 0;
		}
		
		public function animateDashHit():void
		{
			load(Resource.ANIM_DASH_HIT, 100, 70);
			addAnimation("dashHit", [0, 1, 2, 3, 4, 5, 6, 7], 8, false, function():void 
			{
				loadRunAnim();
				animate("run")
			});
			animate("dashHit");
		}
		
		public function loadRunAnim():void
		{
			load(Resource.ANIM_RUN, 70, 70);
			addAnimation("run", [0,1,2,3,4,5,6], 11, true);
			addAnimation("jump", [3], 1, false);
			addAnimation("fall", [4], 1, false);
		}
		
		public function hurt():void
		{
			flash(0.2, 0xffff0000, null);
		}
	}
}
