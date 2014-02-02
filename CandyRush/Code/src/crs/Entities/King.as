package crs.Entities 
{
	/**
	 * ...
	 * @author Sone
	 */
	
	import crs.Util.Resource;
	import crs.Util.Registry;
	import crs.Util.VectorHelper;
	import crs.Util.GameSettings;
	import crs.GameStates.GameOverState;
	
	import org.axgl.Ax;
	import org.axgl.AxPoint;
	import org.axgl.AxVector;
	import org.axgl.effect.sprite.AxFlickerSpriteEffect;
	
	public class King extends Entity 
	{
		private var m_highVel:int = 200;
		private var m_mediumVel:int = 120;
		private var m_lowVel:int = 30;
		private var m_state:uint = STATE_IDLE;
		private var m_scale:Number = 1;
		private var m_frameCounterSinceLastScale:uint = 0;

		private static var STATE_START:uint = 0;
		private static var STATE_IDLE:uint = 1;
		private static var STATE_EATING:uint = 2;
		private static var STATE_CHASE_PLAYER:uint = 3;
		private static var STATE_CAUGHT_PLAYER:uint = 4;
		private static var STATE_EAT_PLAYER:uint = 5;
		private static var STATE_ATE_PLAYER:uint = 6;
		
		public function King()
		{
			super(-300, GameSettings.kingStartYPos, Resource.KING_IDLE);
			
			startKing();
		}
		
		public override function update():void
		{
			switch(m_state)
			{
				case STATE_START:
					if (x < GameSettings.kingStartXPos)
					{
						if (Math.abs(x - GameSettings.kingStartXPos) > m_mediumVel)
						{
							velocity.x = m_mediumVel;	
						} else
						{
							//5 min vel just to make the anim stop at some point.
							velocity.x = Math.abs(x - GameSettings.kingStartXPos) < 5 ? 5 : Math.abs(x - GameSettings.kingStartXPos);
						}
					} else
					{
						m_state = STATE_IDLE;
						velocity.x = 0;
					}
					
					calculateShrinkKing();
					break;
				case STATE_IDLE:
					var closestCandyPos:AxPoint = Registry.gameState.getPosOfLeftMostPowerup();

					//Oh! Piece of candy.			
					if (closestCandyPos != null)
					{
						//-70 to match up to roughly the position of King's mouth.
						var yDistanceToCandy:int = ((closestCandyPos.y - 70) - y);
						var yVel:int = 0;
						if (Math.abs(yDistanceToCandy) > 70)
						{
							yVel = m_highVel
						} else if (Math.abs(yDistanceToCandy) > 30)
						{
							yVel = m_mediumVel;
						} else 
						{
							yVel = m_lowVel;
						}
						
						if (yDistanceToCandy > 10)
						{
							//Candy is below targetPos by >10px, move down towards it.
							velocity.y = yVel;
						} else if (yDistanceToCandy < -10)
						{
							//Candy is above targetPos by 10px, move up against it.
							velocity.y = -yVel;
						}
						
						//Candy is within eating distance. NOM IT!
						if (m_state != STATE_EATING && closestCandyPos.x < (x + width))
						{
							eatCandy();
							Registry.gameState.destroyLeftMostCandy();
						}
					}
					
					calculateShrinkKing();
					break;
				case STATE_EATING:
					break;
				case STATE_CHASE_PLAYER:
					var kingPos:AxVector = new AxVector(center.x, center.y);
					var playerPos:AxVector = new AxVector(Registry.player.x, Registry.player.y);
					var directionVec:AxVector = getDirectionBetweenVectors(kingPos, playerPos);
					
					velocity.x = directionVec.x * m_mediumVel;
					velocity.y = directionVec.y * m_mediumVel;
					
					var vectorToPlayer:AxVector = VectorHelper.deductAxVectorFromAxVector(playerPos, kingPos);
					if (VectorHelper.getLength(vectorToPlayer) < 10)
					{
						catchPlayer();
					}
					break;
				case STATE_CAUGHT_PLAYER:
					var kingPos1:AxVector = new AxVector(center.x, center.y);
					var centerPos1:AxVector = new AxVector(GameSettings.windowWidth * 0.5 - width * 0.5, 100);
					var directionVec1:AxVector = getDirectionBetweenVectors(kingPos1, centerPos1);
					
					velocity.x = directionVec1.x * m_mediumVel;
					velocity.y = directionVec1.y * m_mediumVel;
					
					var vectorToCenter1:AxVector = VectorHelper.deductAxVectorFromAxVector(centerPos1, kingPos1);
					if (VectorHelper.getLength(vectorToCenter1) < 10)
					{
						velocity.x = 0;
						velocity.y = 0;
						eatPlayer();
					}
					break;
				case STATE_EAT_PLAYER:
					break;
				case STATE_ATE_PLAYER:
					Ax.pushState(new GameOverState())
					break;
			}
			
			super.update();
		}
		
		//Grow 10%, play anim and reset frameCounterSinceLastScale.
		private function eatCandy():void
		{
			m_scale += 0.1;
			grow(1, m_scale, m_scale);
			Registry.playerModel.setKingCurScale(m_scale);
			Registry.playerModel.resetCombo();
			
			var blinkCallback:Function = blinkCallback;
			startFlicker(0.5, null, 2, AxFlickerSpriteEffect.FLICKER);
			m_frameCounterSinceLastScale = 0;
			playEatCandyAnim();
		}
		
		private function eatPlayer():void
		{
			m_state = STATE_EAT_PLAYER;
			animate("eatPlayer");
			Ax.camera.shake(0.35, 8);
			Ax.sound(Resource.SOUND_EAT_1);
			Ax.sound(Resource.SOUND_COMMON_SPLAT_0);
		}
		
		private function catchPlayer():void
		{
			m_state = STATE_CAUGHT_PLAYER;
			Registry.player.eat();
			playCaughtPlayerAnim();
			Ax.camera.shake(0.35, 2);
			Ax.sound(Resource.SOUND_EAT_0);
		}
		
		public function startKing():void
		{
			playIdleAnim();
			m_state = STATE_START;
		}
		
		public function playIdleAnim():void
		{
			m_state = STATE_IDLE;
			load(Resource.KING_IDLE, 128, 128)
			addAnimation("idle", [0, 1, 2, 3, 4, 5, 6, 7], 4, true);
			animate("idle");
		}
		
		public function playEatCandyAnim():void
		{
			m_state = STATE_EATING;
			load(Resource.KING_EAT, 128, 128)
			var doneEatingCallback:Function = doneEating;
			addAnimation("eatCandy", [0, 1, 2, 3, 4, 5, 6, 7], 8, false, doneEating);
			animate("eatCandy");	
		}
		
		public function playCaughtPlayerAnim():void
		{
			load(Resource.KING_EAT_DUDE, 128, 128)
			addAnimation("eatPlayer", [0, 1, 2, 3, 4, 5, 6], 5, true, function():void {
				playPlayerDeadAnim();
			});
			addAnimation("caughtPlayer", [0], 1, true);
			animate("caughtPlayer");
		}		
		
		public function playPlayerDeadAnim():void
		{
			m_state = STATE_ATE_PLAYER;
			load(Resource.KING_IDLE, 128, 128)
			addAnimation("idle", [0, 1, 2, 3, 4, 5, 6, 7], 4, true);
			animate("idle");			
		}
		
		private function blinkCallback():void
		{
			stopFlicker();
		}
		
		private function doneEating():void
		{
			playIdleAnim();
		}
		
		private function getDirectionBetweenVectors(fromVec:AxVector, toVec:AxVector):AxVector 
		{
			var vecToTarget:AxVector = VectorHelper.deductAxVectorFromAxVector(toVec, fromVec);
			return VectorHelper.normalizeAxVector(vecToTarget);
		}
		
		private function calculateShrinkKing():void 
		{
			++m_frameCounterSinceLastScale;	
			//Make king shrink 1% every 10s
			if (m_frameCounterSinceLastScale >= 60)
			{
				m_scale = m_scale > 1 ? m_scale - 0.01 : 1;
				grow(0.5, m_scale, m_scale);
				m_frameCounterSinceLastScale = 0;
				Registry.playerModel.setKingCurScale(m_scale);
				// TODO: check if king is below the eat player limit and revert to idle state?
			}
			
			if (m_scale >= GameSettings.kingScaleTilPlayerEat)
			{
				m_state = STATE_CHASE_PLAYER;
			}
		}
	}
}