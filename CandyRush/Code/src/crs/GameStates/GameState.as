package crs.GameStates{
	import crs.Entities.King;
	import crs.Model.PlayerModel;
	import crs.Util.RandomIslandGenerator;
	import org.axgl.Ax;
	import org.axgl.AxGroup;
	import org.axgl.AxRect;
	import org.axgl.AxSprite;
	import org.axgl.AxState;
	import org.axgl.camera.effect.AxCameraShakeEffect;
	import org.axgl.collision.AxCollider;
	import org.axgl.collision.AxCollisionGroup;
	import org.axgl.collision.AxGrid;
	import org.axgl.text.AxFont;
	import org.axgl.text.AxText;
	import org.axgl.tilemap.AxTilemap;
	import org.axgl.AxPoint;
	import org.axgl.camera.effect.AxCameraEffect;
	import org.axgl.particle.AxParticleSystem;
	import org.axgl.particle.AxParticleEffect;
	import org.axgl.render.AxColor;
	import org.axgl.util.AxPauseState;
	import org.axgl.util.AxRange;
	import org.axgl.render.AxBlendMode;
	import org.axgl.AxEntity;

	import crs.Model.ScoreCounter;	
	import crs.Util.GameSettings;
	import crs.Util.ScrollingBackground;
	import crs.Util.Registry;
	import crs.Util.Resource;
	import crs.Entities.Powerup;
	import crs.Entities.Player;
	import crs.Entities.Lawyer;
	import crs.Util.RNG;
	
	public class GameState extends AxState {
		/** The tilemap collider **/
		private static var TILEMAP_COLLIDER:AxCollisionGroup;
		/** The pre-allocated collision grid */
		private static const COLLISION_GRID:AxCollisionGroup = new AxGrid(GameSettings.windowWidth,
																		  GameSettings.windowHeight,
																		  15,
																		  10);
		
		/** Takes care of generating new tilemaps islands **/
		private var m_islandGenerator:RandomIslandGenerator;
		
		/** Helper group for colliding against multiple other groups **/
		public var m_collidersGroup:AxGroup = new AxGroup;
		
		/** Game UI **/
		private var m_chaseBarUI:AxSprite;
		private var m_chaseBarMeter:AxSprite;
		private var m_comboUI:AxSprite;
		private var m_scoreUI:AxSprite;
		
		/** Spawnables groups **/
		private var m_particles:AxGroup;
		private var m_powerups:AxGroup = new AxGroup;
		private var m_lawyers:AxGroup = new AxGroup;
		private var m_tilemaps:AxGroup = new AxGroup;
		
		/** The object that keeps track of score and combos **/
		private var m_scoreCounter:ScoreCounter = new ScoreCounter;
		
		/** The object that displays our score text **/
		private var m_scoreText:AxText;
		private var m_comboText:AxText;
		private var m_font:AxFont;
		
		/** Game model **/
		private var m_gameModel:PlayerModel;

		//TODO: move to settings
		private var tilemap:AxTilemap;
		private var player:Player;
		private var king:King;
		private var m_acceleration:Number = -0.1;
		private var m_velocityMultiplier:int = 1;
		
		public static var gameVelocity:Number = 0;
 
		override public function create():void 
		{
			super.create();

			Ax.background = AxColor.fromHex(0xf1e2f1);
			setupScrollingBGs();
			
			// Add powerups and lawyers to the colliders group, which we collide with the player
			m_collidersGroup.add(m_powerups).add(m_lawyers);
			add(m_collidersGroup);			
			
			setupStartTilemaps();			
			
			player = new Player(150, 100, GameSettings.windowWidth, GameSettings.windowHeight);
			add(player);
			king = new King();
			add(king);
			Registry.player = player;
			Registry.gameState = this;
			gameVelocity = GameSettings.gameStartSpeed;

            setupParticleEffects();
			
			Registry.floatingScoreTexts = new AxGroup;
			add(Registry.floatingScoreTexts);
			m_gameModel = Registry.playerModel = new PlayerModel();

			setupChaseBarUI();
			setupComboUI();
			setupScoreUI();
			setupScoreText();
			//Ax.music(Resource.MUSIC);
			
			TILEMAP_COLLIDER = new AxCollider;
		}
		
		override public function update():void
		{
			Ax.background = AxColor.fromHex(0xf1e2f1);
			if (player.isDashing) 
			{
				m_velocityMultiplier = 3;
				AxParticleSystem.emit("dashEffect", player.center.x, player.center.y);
			} else
			{
				m_velocityMultiplier = 1;
			}
			
			spawnNewIslandIfNeeded();
			updateGameObjects();
			lookForMissedPowerups();
			
			//Overlap the player with enemies, enemy bullets, and powerups.
			Ax.overlap(player, m_collidersGroup, onPlayerHit, COLLISION_GRID);

			//HACK!!! Player isn't colliding RIGHT since he doesn't have a velocity. So give him a velocity before update and reset his position
			//to fool the engine that he has a vel but still not move the player.
			if (player.isTouching(RIGHT | UP))
			{
				player.hurt();
			} else 
			{
				player.x = 100;
				player.velocity.x = 1;
			}

			super.update();

			//Let's the player walk on the tilemaps.
			for (var i:int = 0; i < m_tilemaps.members.length; ++i )
			{
				Ax.collide(player, m_tilemaps.members[i], null, TILEMAP_COLLIDER);
			}
		}
		
		public function updateChaseBarUI():void
		{
			var kingWillEatYouPercent:Number = Registry.playerModel.getKingWillEatYouPercent();
			kingWillEatYouPercent = kingWillEatYouPercent > 1 ? 1 : kingWillEatYouPercent;
			m_chaseBarMeter.grow(1, kingWillEatYouPercent, 1);
		}
		
		private function cameraShakeEffect():void
		{
			Ax.camera.shake(0.35, 8, null, true);
		}
		
		private function spawnNewIslandIfNeeded():void
		{
			if (m_tilemaps.members.length > 0)
			{
				if ((m_tilemaps.members[m_tilemaps.members.length - 1].x + m_tilemaps.members[m_tilemaps.members.length - 1].width) < GameSettings.windowWidth - 100)
				{
					var rightMostIslandEndPoint:AxPoint = new AxPoint(m_tilemaps.members[m_tilemaps.members.length - 1].x + m_tilemaps.members[m_tilemaps.members.length - 1].width,
																	  m_tilemaps.members[m_tilemaps.members.length - 1].y);
					m_tilemaps.add(m_islandGenerator.createIsland(rightMostIslandEndPoint));
				}	
			}
		}
		
		/**
		 * Callback function when overlapping the player with enemies, bullets, and powerups.
		 *
		 * @param player Our player
		 * @param target The object our player collided with
		 */
		private function onPlayerHit(player:Player, target:AxEntity):void
		{
			if (target is Powerup && !(target as Powerup).isCollected())
			{
				// If we collided with a powerup, collect it
				(target as Powerup).collect();
				m_scoreCounter.pickedUpPowerup();
			} else if (target is Lawyer && (target as Lawyer).isAlive())
			{
				if (player.isDashing)
				{
					var fistYPos:int = (player.y + GameSettings.dashFistYPosition) - target.y;
					var lawyerHitArea:int = Lawyer.HEAD_SHOT;

					if (fistYPos < Lawyer.HEAD_SHOT_MIN_YPOS)
					{
						lawyerHitArea = Lawyer.HEAD_SHOT;
					}else if (fistYPos < Lawyer.TORSO_SHOT_MIN_YPOS)
					{
						lawyerHitArea = Lawyer.TORSO_SHOT;
					}else
					{
						lawyerHitArea = Lawyer.LEG_SHOT;
					}
			
					(target as Lawyer).hitLawyer(lawyerHitArea);
					m_scoreCounter.killedLawyer(lawyerHitArea);
					cameraShakeEffect();
					
					player.animateDashHit();
					switch(RNG.generateNumber(0, 3))
					{
						case 0:
							Ax.sound(Resource.SOUND_DASH_HIT_0);
						break;
						case 1:
							Ax.sound(Resource.SOUND_DASH_HIT_1);
						break;
						case 2:
							Ax.sound(Resource.SOUND_DASH_HIT_2);
						break;
						case 3:
							Ax.sound(Resource.SOUND_DASH_HIT_3);
						break;
					}
					AxParticleSystem.emit("bloodEffect", target.x, target.y + fistYPos);
				} else
				{
					//You got sued and died in Gulag.
					player.hurt();
				}
			}
		}		
		
		/** Update x acceleration and set all game objects' x velocity. **/
		private function updateGameObjects():void 
		{
			gameVelocity += m_acceleration;
			
			//Update tilemaps
			for (var i:int = 0; i < m_tilemaps.members.length; ++i )
			{
				if ((m_tilemaps.members[i].x + m_tilemaps.members[i].width) < 0)
				{
					m_tilemaps.members[i] = null;
				} else
				{
					m_tilemaps.members[i].velocity.x = gameVelocity * m_velocityMultiplier;	
				}				
			}			
			//Update powerups
			for (var j:int = 0; j < m_powerups.members.length; ++j )
			{
				if ((m_powerups.members[j].x + m_powerups.members[j].width) < 0)
				{
					m_powerups.members[j] = null;
				} else
				{				
					m_powerups.members[j].velocity.x = gameVelocity * m_velocityMultiplier;
				}
			}
			//Update lawyers
			for (var k:int = 0; k < m_lawyers.members.length; ++k )
			{
				if ((m_lawyers.members[k].x + m_lawyers.members[k].width) < 0)
				{
					m_lawyers.members[k] = null;
				} else
				{				
					m_lawyers.members[k].velocity.x = gameVelocity * m_velocityMultiplier;
				}
			}
			
			m_tilemaps.cleanup();
			m_powerups.cleanup();
			m_lawyers.cleanup();		
		}
		
		private function lookForMissedPowerups():void
		{
			for (var i:int = 0; i < m_powerups.members.length; ++i )
			{
				// Is powerups x-pos + width further back than player? We missed it.
				if (!(m_powerups.members[i] as Powerup).isCollected())
				{
					if ((m_powerups.members[i].x + m_powerups.members[i].width) < player.x)
					{
						Registry.playerModel.resetCombo();		
					}
				}
			}
		}
		
		public function updateScoreUI():void
		{
			m_scoreText.text = GameSettings.scoreText + Registry.playerModel.getScore();
		}
		
		public function updateComboUI():void
		{
			m_comboText.text = GameSettings.comboText + Registry.playerModel.getComboCount();
		}
		
		private function setupScrollingBGs():void 
		{
			add(new ScrollingBackground(Resource.CLOUD_C, 20 * m_velocityMultiplier, 1));
			add(new ScrollingBackground(Resource.CLOUD_A, 80 * m_velocityMultiplier, 1));
			add(new ScrollingBackground(Resource.CLOUD_B, 50 * m_velocityMultiplier, 1));
			add(new ScrollingBackground(Resource.BACKDROP_GROUND_B, 30 * m_velocityMultiplier, 1));			
			add(new ScrollingBackground(Resource.BACKDROP_GROUND_A, 60 * m_velocityMultiplier, 1));
		}
		
		private function setupParticleEffects():void 
		{
			m_particles = new AxGroup;
			add(m_particles);
			
			var effect:AxParticleEffect = new AxParticleEffect("bloodEffect", Resource.PARTICLE, 2);
			effect.xVelocity = new AxRange(0, 200);
			effect.yVelocity = new AxRange(-30, 30);
			effect.lifetime = new AxRange(0.5, 0.75);
			effect.amount = 50;
			effect.color(new AxColor(0.3, 0.3, 0.3), new AxColor(0.7, 0.7, 0.7), new AxColor(0.3, 0.3, 0.3), new AxColor(1, 1, 1));			
			m_particles.add(AxParticleSystem.register(effect));
		}
		
		private function setupChaseBarUI():void
		{
			m_chaseBarUI = new AxSprite((GameSettings.windowWidth * 0.5) - 85, -1, Resource.CHASE_BAR, GameSettings.windowWidth, GameSettings.windowHeight);
			add(m_chaseBarUI);
			
			m_chaseBarMeter = new AxSprite((GameSettings.windowWidth * 0.5) - 85 + 19, -1, Resource.CHASE_BAR_METER, GameSettings.windowWidth, GameSettings.windowHeight);
			m_chaseBarMeter.grow(0.01, 0.01, 1);
			add(m_chaseBarMeter);
		}
		
		private function setupScoreUI():void
		{
			m_scoreUI = new AxSprite(GameSettings.windowWidth - 79, 0, Resource.SCORE_UI, GameSettings.windowWidth, GameSettings.windowHeight);
			add(m_scoreUI);			
		}
		
		private function setupComboUI():void
		{
			m_comboUI = new AxSprite(GameSettings.windowWidth - 79, 0, null, GameSettings.windowWidth, GameSettings.windowHeight);
			m_comboUI.load(Resource.COMBO_UI, 79, 74);
			m_comboUI.addAnimation("comboState_None", [8], 1, true);
			m_comboUI.addAnimation("comboState_D", [1], 1, true);
			m_comboUI.addAnimation("comboState_C", [2], 1, true);
			m_comboUI.addAnimation("comboState_B", [3], 1, true);
			m_comboUI.addAnimation("comboState_A", [4], 1, true);
			m_comboUI.addAnimation("comboState_S", [5], 1, true);
			m_comboUI.addAnimation("comboState_SS", [6], 1, true);
			m_comboUI.addAnimation("comboState_SSS", [7], 1, true);
			
			add(m_comboUI);
		}
		
		public function setNewComboLevel(comboLevel:uint):void
		{
			var animationString:String = "";
			
			switch(Registry.playerModel.getComboLevel())
			{
				case PlayerModel.COMBOLVL_NONE:
					animationString = "comboState_None";
					break;
				case PlayerModel.COMBOLVL_D:
					animationString = "comboState_D";
					Ax.sound(Resource.SOUND_COMBO_0);
					break;
				case PlayerModel.COMBOLVL_C:
					animationString = "comboState_C";	
					Ax.sound(Resource.SOUND_COMBO_1);
					break;
				case PlayerModel.COMBOLVL_B:
					animationString = "comboState_B";
					Ax.sound(Resource.SOUND_COMBO_2);
					break;
				case PlayerModel.COMBOLVL_A:
					animationString = "comboState_A";
					Ax.sound(Resource.SOUND_COMBO_3);
					break;
				case PlayerModel.COMBOLVL_S:
					animationString = "comboState_S";
					Ax.sound(Resource.SOUND_COMBO_4);
					break;
				case PlayerModel.COMBOLVL_SS:
					animationString = "comboState_SS";
					Ax.sound(Resource.SOUND_COMBO_5);
					break;
				case PlayerModel.COMBOLVL_SSS:
					animationString = "comboState_SSS";
					Ax.sound(Resource.SOUND_COMBO_6);
					break;
			}
			
			m_comboUI.animate(animationString);
			if (Registry.playerModel.getComboLevel() != PlayerModel.COMBOLVL_NONE)
			{
				m_comboUI.grow(0.3, 1.5, 1.5, function():void
				{
					m_comboUI.grow(0.3, 1, 1);
				});
			}
		}		
		
		private function setupStartTilemaps():void
		{
			m_islandGenerator = new RandomIslandGenerator();
			
			m_tilemaps.add(new AxTilemap(0, 232).build(	Resource.START_ISLAND,
														Resource.TILES,
														GameSettings.tileSize,
														GameSettings.tileSize,
														GameSettings.solidTilesStartIndex));
			m_tilemaps.members[0].velocity.x = gameVelocity;
			
			add(m_tilemaps);
			Registry.tilemaps = m_tilemaps;
		}
		
		private function setupScoreText():void
		{
			//m_font = AxFont.fromFont("8BITWONDER", true, 10, false, false, 0, 2, "0123456789");
			m_scoreText = new AxText(GameSettings.scoreTextPosition.x,
									 GameSettings.scoreTextPosition.y,
									 null,
									 GameSettings.scoreText + 0);
			add(m_scoreText);
			
			m_comboText = new AxText(GameSettings.comboTextPosition.x,
									 GameSettings.comboTextPosition.y,
									 null,
									 GameSettings.comboText + 0);
			add(m_comboText);
		}
		
		public function getPosOfLeftMostPowerup():AxPoint
		{
			var leftMostPosition:AxPoint = new AxPoint(1000, 1000);
			for (var i:int = 0; i < m_powerups.members.length; ++i)
			{
				if (!(m_powerups.members[i] as Powerup).isCollected())
				{
					if (leftMostPosition.x > m_powerups.members[i].x)
					{
						leftMostPosition = new AxPoint(m_powerups.members[i].x, m_powerups.members[i].y)
					}			
				}
			}
			
			if (leftMostPosition.x == 1000)
			{
				return null;
			}
			return leftMostPosition;
		}
		
		public function destroyLeftMostCandy():void
		{
			if (m_powerups.members.length > 0)
			{
				(m_powerups.members[0] as Powerup).collect();	
			}			
		}
		
		public function addPowerup(newPowerup:Powerup):void
		{
			m_powerups.add(newPowerup);
		}
		
		public function addLawyer(newLawyer:Lawyer):void
		{
			m_lawyers.add(newLawyer);
		}
	}
}
