package lgj.GameStates 
{
	import flash.events.MouseEvent;
	import lgj.Entities.DolphinGiblet;
	import lgj.Entities.Pot;
	import lgj.Score.ScoreManager;
	import org.axgl.AxGroup;
	import org.axgl.AxVector;
	import org.axgl.AxEntity;
	import org.axgl.AxSprite;
	import org.axgl.AxState;
	import org.axgl.Ax;
	import org.axgl.collision.AxGrid;
	import org.axgl.input.AxMouse;
	import org.axgl.input.AxMouseButton;
	import org.axgl.collision.AxCollisionGroup;
	import org.axgl.text.AxText;
	import org.axgl.util.AxRange;
	import org.axgl.input.AxKey;
	import org.axgl.render.AxColor;
	import org.axgl.particle.AxParticleSystem;
	import org.axgl.particle.AxParticleEffect;
	
	import lgj.Util.VectorHelper;
	import lgj.Entities.Player;
	import lgj.Input.InputHandler;
	import lgj.Util.Resource;
	import lgj.Settings;
	import lgj.Util.RNG;
	import lgj.Entities.Dolphin;
	import lgj.Util.Registry;
	import lgj.Entities.Entity;

	public class GameState extends AxState
	{
		private var m_background:AxSprite;
		private var m_player:Player;
		private var m_pot:Pot;
		private var m_scoreManager:ScoreManager;
		private var m_scoreText:AxText;
		private var m_TimeBarBg:AxSprite;
		private var m_TimeBar:AxSprite;
		private var m_iFrameLeft:int = 3;// 3000;
		private var m_hitSoundCooldown:uint;
		
		public var ParticleSystemsGroup:AxGroup;
		//Handles mouse input
		private var m_inputHandler:InputHandler;
		
		//Collider group for dolphins and player
		private var m_playerDolphinCollider:AxGroup = new AxGroup();
		
		//Collider group for objects that will not be interacted with
		//private var m_finishedGiblets:AxGroup = new AxGroup();

		//Decals that will always be furtherst behind in z order
		private var m_backgroundDecals:AxGroup = new AxGroup();
		//Dolphin group
		private var m_spawnedObjects:AxGroup = new AxGroup();
		
		//The pre-allocated collision grid
		private static const COLLISION_GRID:AxCollisionGroup = new AxGrid(Settings.WINDOW_WIDTH,
																		  Settings.WINDOW_HEIGHT,
																		  15,
																		  10);		
		
		private var m_frameCounter:uint = 0;
		private var m_framesUntilDolphinSpawn:int = 0;
		private var m_clearDestroyedGibletsCounter:uint = 120;
			
		public function GameState() 
		{
			
		}
		
        override public function create():void 
		{
            super.create();
            trace("GameState Created");
			
			m_inputHandler = new InputHandler();
			Ax.stage2D.addEventListener(MouseEvent.MOUSE_DOWN, m_inputHandler.onMouseDownHandler);
			Ax.stage2D.addEventListener(MouseEvent.MOUSE_UP, m_inputHandler.onMouseUpHandler);			
			
			addObjects();
			
			Registry.gameState = this;
			Registry.player = m_player;
			Registry.scoreManager = m_scoreManager;
			Ax.soundVolume = 0.3;
        }
        
        override public function update():void 
		{
			m_iFrameLeft--;
			//m_TimeBar.scale.x = ( Number(m_iFrameLeft) / Number(3000) );
			m_TimeBar.grow(0.01, ( Number(m_iFrameLeft) / Number(3000) ), 1.0);
			if (m_iFrameLeft < 0)
			{
				Ax.pushState(new ScoreCardState(5, 3, 7));
				/*Ax.pushState(new ScoreCardState(m_scoreManager.getFinishedGibletsInPot(),
												m_scoreManager.getUnfinishedGibletsInPot(),
												m_scoreManager.getWholeDolphinsInPot()));*/
				return;
			}
			
			if (!Ax.keys.held(AxKey.SPACE) || m_frameCounter >= Settings.SLOWMOTION_RATE)
			{
				super.update();
				checkForDolphinSpawn();
				m_frameCounter = 0;
			} 
			else 
			{
				m_player.update();
			}
				++m_frameCounter;
				--m_clearDestroyedGibletsCounter;
				if(m_hitSoundCooldown > 0) {
					--m_hitSoundCooldown;
				}
				
				if(m_inputHandler.hasInputToProcess()) {
					m_player.startDash(VectorHelper.addAxVectorToAxVector(m_inputHandler.getAndResetInputForce(), m_player.velocity));	
				}
				
				if(m_clearDestroyedGibletsCounter <= 0) {
					//m_finishedGiblets
				}
				
				collidePlayerAndDolphins();
				
				collideEntityGroupAndPot(m_spawnedObjects);	
		}
		
		private function collidePlayerAndDolphins():void {
			//Overlap the player with enemies, enemy bullets, and powerups.
			Ax.overlap(m_player, m_playerDolphinCollider, onPlayerHit, COLLISION_GRID);
		}
		
		private function collideEntityGroupAndPot(group:AxGroup):void {
			var numElements:int = group.members.length;
			for (var i:int = 0; i < numElements; ++i ) {
				//Don't care if they've already been cooked
				if (!(group.members[i] as Entity).HasBeenCooked)
				{
					//Above Y collision plane
					if (group.members[i].globalY < m_pot.getYCollision()) {
						//To the right of close X-plane
						if (group.members[i].globalX > m_pot.getXCollisionClose()) {
							//close enough to water to hit. DO IT!
							if (Math.abs(m_pot.getYCollision() - group.members[i].globalY) <= Settings.POT_Y_COLLISION_ALLOWANCE) {
								//giblet is inside far x-bound as well. We have a hit!
								if (group.members[i].globalX < m_pot.getXCollisionFar()) {
									cookEntity(group.members[i] as Entity);
								}
							}
						}
					}
				}
			}
		}
		
		private function cookEntity(entity:Entity):void {
			AxParticleSystem.emit("waterSplashEffect", entity.globalX + entity.width * 0.5, m_pot.getYCollision());
			
			if((entity as Dolphin) != null) {
				(entity as Dolphin).HasBeenCooked = true;
				(entity as Dolphin).hit();
				m_scoreManager.addEntireDolphin();
			} else if((entity as DolphinGiblet) != null) {
				(entity as DolphinGiblet).HasBeenCooked = true;
				(entity as DolphinGiblet).hit();
				if ((entity as DolphinGiblet).getGibletPartNumber() == 0 ||
					(entity as DolphinGiblet).getGibletPartNumber() == 3) {
					m_scoreManager.addUnfinishedGiblet();		
				} else {
					m_scoreManager.addFinishedGiblet();
				}
			}

			m_scoreManager.addFinishedGiblet();
		}
		
		private function checkForDolphinSpawn():void {
			--m_framesUntilDolphinSpawn;
			if (m_framesUntilDolphinSpawn <= 0) {
				spawnDolphin();
				calculateNextDolphinSpawn();
			}
		}
		
		private function calculateNextDolphinSpawn():void {
			m_framesUntilDolphinSpawn = RNG.generateNumber(Settings.DOLPHIN_MIN_SPAWN_RATE, Settings.DOLPHIN_MAX_SPAWN_RATE);
		}
		
		/**
		 * Callback function when overlapping the player with enemies, bullets, and powerups.
		 *
		 * @param player Our player
		 * @param target The object our player collided with
		 */
		private function onPlayerHit(player:Player, target:Entity):void
		{
			if (player.isDashing() && target.canBeHit())
			{
				if((target as Dolphin) != null) {
					(target as Dolphin).hit();
					player.hit();
					spawnDolphinGiblets(target.globalX, target.globalY, target.velocity);
				} else if ((target as DolphinGiblet) != null) {
					if(!(target as DolphinGiblet).canBeGibbedAgain()) {
						return;
					} else {
						(target as DolphinGiblet).hit();
						player.hit();
						spawnDolphinGiblets(target.globalX, target.globalY, target.velocity, (target as DolphinGiblet).getGibletPartNumber());
					}
				}
				
				cameraShakeEffect();
				
				if(m_hitSoundCooldown == 0) {
					switch(RNG.generateNumber(0, 1))
					{
						case 0:
							Ax.sound(Resource.HIT_SWORDIMPACT_SOUND_0);
						break;
						case 1:
							Ax.sound(Resource.HIT_SWORDIMPACT_SOUND_0);
						break;
					}
					
					switch(RNG.generateNumber(0, 3))
					{
						case 0:
							Ax.sound(Resource.HIT_GOREIMPACT_SOUND_0);
						break;
						case 1:
							Ax.sound(Resource.HIT_GOREIMPACT_SOUND_1);
						break;
						case 2:
							Ax.sound(Resource.HIT_GOREIMPACT_SOUND_2);
						break;
						case 3:
							Ax.sound(Resource.HIT_GOREIMPACT_SOUND_1);
						break;
					}
					m_hitSoundCooldown = Settings.HIT_SOUND_COOLDOWN_FRAMES;
				}

				AxParticleSystem.emit("bloodEffect", target.x + target.width * 0.5, target.y + target.height * 0.5);
			}
		}
		
		private function cameraShakeEffect():void
		{
			Ax.camera.shake(0.35, 8, null, true);
		}
		
		private function setupParticleEffects():void 
		{
			ParticleSystemsGroup = new AxGroup;
			add(ParticleSystemsGroup);
			
			var bloodEffect:AxParticleEffect = new AxParticleEffect("bloodEffect", Resource.RED_PARTICLE, 2);
			bloodEffect.xVelocity = new AxRange(-100, 100);
			bloodEffect.yVelocity = new AxRange(-100, 100);
			bloodEffect.lifetime = new AxRange(0.5, 0.75);
			bloodEffect.amount = 100;
			bloodEffect.color(new AxColor(0.3, 0.3, 0.3), new AxColor(0.7, 0.7, 0.7), new AxColor(0.3, 0.3, 0.3), new AxColor(1, 1, 1));			
			ParticleSystemsGroup.add(AxParticleSystem.register(bloodEffect));
			
			var waterSplashEffect:AxParticleEffect = new AxParticleEffect("waterSplashEffect", Resource.BLUE_PARTICLE, 2);
			waterSplashEffect.xVelocity = new AxRange(-100, 100);
			waterSplashEffect.yVelocity = new AxRange(-100, 0);
			waterSplashEffect.lifetime = new AxRange(0.5, 0.75);
			waterSplashEffect.amount = 200;
			waterSplashEffect.color(new AxColor(0.3, 0.3, 0.3), new AxColor(0.7, 0.7, 0.7), new AxColor(0.3, 0.3, 0.3), new AxColor(1, 1, 1));			
			ParticleSystemsGroup.add(AxParticleSystem.register(waterSplashEffect));
			
			//TODO: Fix this one later.
			var dashEffect:AxParticleEffect = new AxParticleEffect("dashEffect", Resource.YELLOW_PARTICLE, 2);
			dashEffect.xVelocity = new AxRange(-100, 100);
			dashEffect.yVelocity = new AxRange(-100, 0);
			dashEffect.lifetime = new AxRange(0.5, 0.75);
			dashEffect.amount = 100;
			dashEffect.color(new AxColor(0.3, 0.3, 0.3), new AxColor(0.7, 0.7, 0.7), new AxColor(0.3, 0.3, 0.3), new AxColor(1, 1, 1));
			ParticleSystemsGroup.add(AxParticleSystem.register(dashEffect));			
		}
		
		private function spawnDolphin():void 
		{
			var dolphin:Dolphin = new Dolphin(-20, Settings.WINDOW_HEIGHT - 100);
			dolphin.velocity = new AxVector(RNG.generateNumber(Settings.MIN_SPAWN_VELOCITY.x, Settings.MAX_SPAWN_VELOCITY.x), 
											RNG.generateNumber(Settings.MIN_SPAWN_VELOCITY.y, Settings.MAX_SPAWN_VELOCITY.y),
											RNG.generateNumber(Settings.MIN_SPAWN_VELOCITY.a, Settings.MAX_SPAWN_VELOCITY.a));
			
			switch(RNG.generateNumber(0, 6))
			{
				case 0:
					Ax.sound(Resource.HIT_DOLPHINSPEAK_SOUND_1);
				break;
				case 1:
					Ax.sound(Resource.HIT_DOLPHINSPEAK_SOUND_2);
				break;
				case 2:
					Ax.sound(Resource.HIT_DOLPHINSPEAK_SOUND_3);
				break;
				case 3:
				case 4:
				case 5:
				break;
			}
			m_spawnedObjects.add(dolphin);
		}
		
		private function spawnDolphinGiblets(x:int, y:int, parentVelocity:AxVector, gibletNumber:int = -1):void {
			if (gibletNumber == -1) {
				m_spawnedObjects.add(createSingleGiblet(x, y, parentVelocity, m_player.velocity, 0));
				m_spawnedObjects.add(createSingleGiblet(x, y, parentVelocity, m_player.velocity, 3));
			} else {
				var newGibletNumber1:uint;
				var newGibletNumber2:uint;
				if(gibletNumber == 1) {
					newGibletNumber1 = 2;
					newGibletNumber2 = 3;
				} else {
					newGibletNumber1 = 4;
					newGibletNumber2 = 5;					
				}
				m_spawnedObjects.add(createSingleGiblet(x, y, parentVelocity, m_player.velocity, newGibletNumber1));
				m_spawnedObjects.add(createSingleGiblet(x, y, parentVelocity, m_player.velocity, newGibletNumber2));
			}
		}
		
		private function createSingleGiblet(x:int, y:int, parentVelocity:AxVector, playerVelocity:AxVector, gibletNumber:int):DolphinGiblet {
			var giblet:DolphinGiblet;
			var velocityModifier:AxVector = new AxVector(RNG.generateNumber( -50, 50),
														 RNG.generateNumber( -50, 50), 0);
			
			giblet = new DolphinGiblet(x, y, gibletNumber);
			giblet.velocity = new AxVector(parentVelocity.x + velocityModifier.x, parentVelocity.y + velocityModifier.y);
			giblet.giveVelocityBasedRotation(parentVelocity);
			
			//Calculate extra velocity boost from players velocity
			giblet.velocity = VectorHelper.addAxVectorToAxVector(giblet.velocity, VectorHelper.multiplyVectorWithNumber(playerVelocity, 0.3));
			return giblet;
		}
		
		public function spawnBloodDecal(x:int, y:int, resource:Class):void 
		{
			switch(RNG.generateNumber(0, 3))
			{
				case 0:
					Ax.sound(Resource.HIT_GOREIMPACT_SOUND_0);
				break;
				case 1:
					Ax.sound(Resource.HIT_GOREIMPACT_SOUND_1);
				break;
				case 2:
					Ax.sound(Resource.HIT_GOREIMPACT_SOUND_2);
				break;
				case 3:
					Ax.sound(Resource.HIT_GOREIMPACT_SOUND_3);
				break;
			}
			m_backgroundDecals.add(new AxSprite(x, y, resource, 64, 64));
		}
			
		private function setupScoreUI():void
		{
			m_TimeBarBg = new AxSprite(Settings.WINDOW_WIDTH - 125, 0, Resource.TIME_BAR_BG, Settings.WINDOW_WIDTH, Settings.WINDOW_HEIGHT);
			add(m_TimeBarBg);
			
			m_TimeBar = new AxSprite(Settings.WINDOW_WIDTH - 125, 0, Resource.TIME_BAR, 128, 64);
			add(m_TimeBar);
			//m_scoreText = new AxText(Settings.SCORE_TEXT_POSITION.x,
									// Settings.SCORE_TEXT_POSITION.y,
									 //null,
									 //Settings.SCORE_TEXT + 0);
			//add(m_scoreText);			
		}
		
		private function addObjects():void 
		{
			m_background = new AxSprite(0, 0, null, Settings.WINDOW_WIDTH, Settings.WINDOW_HEIGHT);
			m_background.load(Resource.BACKGROUND, 600, 400);
			add(m_background);
			add(m_backgroundDecals);
		
			calculateNextDolphinSpawn();
			add(m_spawnedObjects);

			m_pot = new Pot(Settings.POT_POSITION.x, Settings.POT_POSITION.y);
			add(m_pot);
			
			m_player = new Player(450, 150, Settings.WINDOW_WIDTH, Settings.WINDOW_HEIGHT);
			add(m_player);
		
			m_playerDolphinCollider.add(m_spawnedObjects).add(m_player);
			
			setupParticleEffects();
		
			m_scoreManager = new ScoreManager();
			setupScoreUI();
		}
		
		public function emitParticleEffect(x:int, y:int, effectName:String):void {
			AxParticleSystem.emit(effectName, x, y);
		}
	}

}