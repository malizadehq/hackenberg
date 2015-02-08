package lgj.GameStates 
{
	import org.axgl.AxPoint;
	import org.axgl.AxSprite;
	import org.axgl.AxState;
	import org.axgl.particle.AxParticleEffect;
	import org.axgl.util.AxRange;
	import org.axgl.render.AxColor;
	import org.axgl.particle.AxParticleSystem;
	import org.axgl.text.AxText;
	import org.axgl.Ax;
	import org.axgl.input.AxKey;
	
	import lgj.Util.Resource;
	import lgj.Util.RNG;
	import lgj.Settings;
	
	public class ScoreCardState extends AxState
	{
		private var m_finishedGibletsStartPoint:AxPoint = new AxPoint(170, 120);
		private var m_finishedGibletsEndPoint:AxPoint = new AxPoint(410, 120);
		private var m_unfinishedGibletsStartPoint:AxPoint = new AxPoint(182, 165);
		private var m_unfinishedGibletsEndPoint:AxPoint = new AxPoint(400, 165);
		private var m_wholeDolphinsStartPoint:AxPoint = new AxPoint(160, 220);
		private var m_wholeDolphinsEndPoint:AxPoint = new AxPoint(330, 220);
		
		private var m_finishedGibletOffset:uint = 0;
		private var m_unfinishedGibletOffset:uint = 0;
		private var m_wholeDolphinOffset:uint = 0;
		
		private var m_finishedGiblets_counter:uint = 0;
		private var m_finishedGiblets:uint = 0;
		
		private var m_unfinishedGiblets_counter:uint = 0;
		private var m_unfinishedGiblets:uint = 0;
		
		private var m_wholeDolphins_counter:uint = 0;
		private var m_wholeDolphins:uint = 0;
		
		private var m_framesBetweenScoreCount:int = 10;
		private var m_frameCounter:int = 0;
		private var m_scoreEffect:AxParticleEffect;
		
		private var m_resource:Class;
		
		private var m_ScoreCardStamp:AxSprite;
		private var m_ScoreCardSprite_00:AxSprite;
		private var m_ScoreCardSprite_01:AxSprite;
		private var m_rng:int = 0;
		
		private var m_FinalStamp:int 		= -1;
		private var m_FinalScore:int 		= 0;
		private var m_ScoreGibSmall:int 	= 1000;
		private var m_ScoreGibMedium:int 	= 500;
		private var m_ScoreGibLarge:int 	= -500;
		
		private var m_scoreText:AxText;
		private var m_scoreTextB:AxText;
		
		private var m_cameraShakeIntensity:Number = 1; 
		private var m_cameraShakeIntensityIncrease:Number = 0.3;
		private var m_cameraShakeDuration:Number = 0.1;
		private var m_cameraShakeDurationIncrease:Number = 0.1;
		
		private var m_scoreTickFrequency:int = 30;
		private var m_scoreTickFrequencyMax:int = 2;
		private var m_scoreTickFrequencyIncreaseInterval:int = 30;
		private var m_scoreTickFrequencyIncrease:int = 3;
		private var m_scoreTickFrameCounter:int = 0;
		private var m_scoreTickFrequencyIncreaseFrameCounter:int = 0;
		private var m_countingScore:Boolean = true;
		
		override public function create():void
		{
			m_ScoreCardStamp = new AxSprite( 150, 250, null,128,128 );
			
			m_ScoreCardSprite_00 = new AxSprite(0, 0, null, Settings.WINDOW_WIDTH, Settings.WINDOW_HEIGHT);
			m_ScoreCardSprite_00.load(Resource.BACKGROUND_REPORTCARD, 600, 400);
			m_ScoreCardSprite_01 = new AxSprite(0, 0, null, Settings.WINDOW_WIDTH, Settings.WINDOW_HEIGHT);
			m_ScoreCardSprite_01.load(Resource.READY_BG, 600, 400);
			m_ScoreCardSprite_01.origin.x = 300;
			m_ScoreCardSprite_01.origin.y = 200;
			m_ScoreCardSprite_01.scale.x = 2.0;
			m_ScoreCardSprite_01.scale.y = 2.0;
			add(m_ScoreCardSprite_01);
			add(m_ScoreCardSprite_00);
			
			m_scoreEffect = new AxParticleEffect("scoreEffect", Resource.YELLOW_PARTICLE, 2);
			m_scoreEffect.xVelocity = new AxRange(-100, 100);
			m_scoreEffect.yVelocity = new AxRange(-100, 100);
			m_scoreEffect.lifetime = new AxRange(0.5, 0.75);
			m_scoreEffect.amount = 100;
			m_scoreEffect.color(new AxColor(0.3, 0.3, 0.3), new AxColor(0.7, 0.7, 0.7), new AxColor(0.3, 0.3, 0.3), new AxColor(1, 1, 1));
			add(AxParticleSystem.register(m_scoreEffect));			
			
			m_scoreTextB = new AxText((Settings.WINDOW_WIDTH / 2) - 2, Settings.WINDOW_HEIGHT - 80, null, Settings.SCORE_TEXT + 0);
			m_scoreTextB.scale.x = 2.2;
			m_scoreTextB.scale.y = 2.2;
			m_scoreTextB.setColor(0, 0, 0, 0.2);
			add(m_scoreTextB);	
			
			m_scoreText = new AxText(Settings.WINDOW_WIDTH / 2, Settings.WINDOW_HEIGHT - 80, null, Settings.SCORE_TEXT + 0);
			m_scoreText.scale.x = 2.0;
			m_scoreText.scale.y = 2.0;
			add(m_scoreText);	
			
			super.create();
		}
		
		public function ScoreCardState(numFinishedGiblets:uint, numUnfinishedGiblets:uint, numWholeDolphins:uint) 
		{
			m_finishedGiblets = numFinishedGiblets;
			m_unfinishedGiblets = numUnfinishedGiblets;
			m_wholeDolphins = numWholeDolphins;
			
			m_finishedGibletOffset = (m_finishedGibletsEndPoint.x - m_finishedGibletsStartPoint.x) / numFinishedGiblets;
			m_unfinishedGibletOffset = (m_unfinishedGibletsEndPoint.x - m_unfinishedGibletsStartPoint.x) / numUnfinishedGiblets;
			m_wholeDolphinOffset = (m_wholeDolphinsEndPoint.x - m_wholeDolphinsStartPoint.x) / numWholeDolphins;
			
			m_cameraShakeDuration = m_framesBetweenScoreCount * 0.1;
		}
		
		override public function update():void 
		{
			super.update();
			
			if (m_countingScore) 
			{
				++m_frameCounter;
				++m_scoreTickFrameCounter;
				++m_scoreTickFrequencyIncreaseFrameCounter;
				
				if(m_scoreTickFrameCounter >= m_scoreTickFrequency) {
					Ax.sound(Resource.SCORE_TICK);
					m_scoreTickFrameCounter = 0;
				}
				
				if(m_scoreTickFrequencyIncreaseFrameCounter >= m_scoreTickFrequencyIncreaseInterval) {
					m_scoreTickFrequency -= m_scoreTickFrequencyIncrease;
					if(m_scoreTickFrequency < m_scoreTickFrequencyMax) {
						m_scoreTickFrequency = m_scoreTickFrequencyMax;
					}
					m_scoreTickFrequencyIncreaseFrameCounter = 0;
				}
				
				m_ScoreCardSprite_01.angle += 1;
				var newFinalStamp:int = -1;
				
				switch(m_FinalStamp)
				{
					case -1:
					case 0:
						m_framesBetweenScoreCount = 20;
					break;
					case 1:
						m_framesBetweenScoreCount = 17;
					break;
					case 2:
						m_framesBetweenScoreCount = 15;
					break;
					case 3:
						m_framesBetweenScoreCount = 13;
					break;
					case 4:
						m_framesBetweenScoreCount = 8;
					break;
					case 5:
						m_framesBetweenScoreCount = 5;
					break;
					case 6:
						m_framesBetweenScoreCount = 2;
					break;
				}
				
				if (m_frameCounter >= m_framesBetweenScoreCount) {
					m_frameCounter = 0;
					if (m_finishedGiblets_counter < m_finishedGiblets) {
						m_rng = RNG.generateNumber(0, 3);
						switch(m_rng) {
							case 0:
								m_resource = Resource.DOLPHIN_GIB_0_0;
								break;
							case 1:
								m_resource = Resource.DOLPHIN_GIB_0_1;
								break;
							case 2:
								m_resource = Resource.DOLPHIN_GIB_1_0;
								break;
							case 3:
								m_resource = Resource.DOLPHIN_GIB_1_1;
								break;
							default:
								break;
						}
						
						spawnScoreImage(m_finishedGibletsStartPoint.x + (m_finishedGiblets_counter * m_finishedGibletOffset), m_finishedGibletsStartPoint.y, m_resource, 64, 64);
						++m_finishedGiblets_counter;
						m_FinalScore += m_ScoreGibSmall;
					} else if(m_unfinishedGiblets_counter < m_unfinishedGiblets) {
						m_rng = RNG.generateNumber(0, 1);
						switch(m_rng) {
							case 0:
								m_resource = Resource.DOLPHIN_GIB_0;
								break;
							case 1:
								m_resource = Resource.DOLPHIN_GIB_0;
								break;
							default:
								break;
						}
						
						spawnScoreImage(m_unfinishedGibletsStartPoint.x + (m_unfinishedGiblets_counter * m_unfinishedGibletOffset), m_unfinishedGibletsStartPoint.y, m_resource, 64, 64);
						++m_unfinishedGiblets_counter;
						m_FinalScore += m_ScoreGibMedium;
					} else if (m_wholeDolphins_counter < m_wholeDolphins) 
					{
						m_resource = Resource.DOLPHIN_BAD;
						spawnScoreImage(m_wholeDolphinsStartPoint.x + (m_wholeDolphins_counter * m_wholeDolphinOffset), m_wholeDolphinsStartPoint.y, Resource.DOLPHIN_BAD, 128, 64);
						++m_wholeDolphins_counter;
						m_FinalScore += m_ScoreGibLarge;
					} else {
						m_countingScore = false;
					}
				}
			} else {
				if (Ax.keys.pressed(AxKey.ANY) || Ax.mouse.down(0))
				{
					Ax.soundVolume = 1;
					Ax.popState();
					Ax.pushState(new StartMenuState(true));
				}
			}
			
			m_scoreText.angle = RNG.generateNumber( -5, 5);
			m_scoreTextB.angle = RNG.generateNumber( -5, 5);
			m_scoreText.text = m_FinalScore.toString();
			m_scoreTextB.text = m_FinalScore.toString();
			
			m_scoreText.scale.x = 2.0 + Number(RNG.generateNumber( -0.55, 0.55));
			m_scoreText.scale.y = 2.0 + Number(RNG.generateNumber( -0.55, 0.55));
			
			m_scoreText.scale.x += Number(m_FinalScore) / Number(40000);
			m_scoreText.scale.y += Number(m_FinalScore) / Number(40000);
			
			m_scoreTextB.scale.x = 2.0 + Number(RNG.generateNumber( -0.55, 0.55));
			m_scoreTextB.scale.y = 2.0 + Number(RNG.generateNumber( -0.55, 0.55));
			
			m_scoreTextB.scale.x += Number(m_FinalScore) / Number(40000);
			m_scoreTextB.scale.y += Number(m_FinalScore) / Number(40000);
			
			if (m_FinalScore > 1000)
			{
				newFinalStamp = 0;
				if (m_FinalScore > 8000)
					newFinalStamp = 1;
				if (m_FinalScore > 15000)
					newFinalStamp = 2;
				if (m_FinalScore > 30000)
					newFinalStamp = 3;
				if (m_FinalScore > 50000)
					newFinalStamp = 4;
				if (m_FinalScore > 100000)
					newFinalStamp = 5;
				if (m_FinalScore > 200000)
					newFinalStamp = 6;
			}
			
			if (newFinalStamp != m_FinalStamp)
			{
				m_FinalStamp = newFinalStamp;
				m_ScoreCardStamp.scale.x = 4.0;
				m_ScoreCardStamp.scale.y = 4.0;
				m_ScoreCardStamp.grow(0.5, 1.0, 1.0);
				
				switch(m_FinalStamp)
				{
					case 0:
						m_ScoreCardStamp.load(Resource.STAMP_0, 128, 128);
						add(m_ScoreCardStamp);
						Ax.sound(Resource.SCORE_SOUND_0,4.0);
					break;
					case 1:
						m_ScoreCardStamp.load(Resource.STAMP_1, 128, 128);
						add(m_ScoreCardStamp);
						Ax.sound(Resource.SCORE_SOUND_1,4.0);
					break;
					case 2:
						m_ScoreCardStamp.load(Resource.STAMP_2, 128, 128);
						add(m_ScoreCardStamp);
						Ax.sound(Resource.SCORE_SOUND_2,4.0);
					break;
					case 3:
						m_ScoreCardStamp.load(Resource.STAMP_3, 128, 128);
						add(m_ScoreCardStamp);
						Ax.sound(Resource.SCORE_SOUND_3,4.0);
					break;
					case 4:
						m_ScoreCardStamp.load(Resource.STAMP_4, 128, 128);
						add(m_ScoreCardStamp);
						Ax.sound(Resource.SCORE_SOUND_4,4.0);
					break;
					case 5:
						m_ScoreCardStamp.load(Resource.STAMP_5, 128, 128);
						add(m_ScoreCardStamp);
						Ax.sound(Resource.SCORE_SOUND_5,4.0);
					break;
					case 6:
						m_ScoreCardStamp.load(Resource.STAMP_6, 128, 128);
						add(m_ScoreCardStamp);
						Ax.sound(Resource.SCORE_SOUND_6,4.0);
					break;
				}
			}
		}
		
		private function spawnScoreImage(x:int, y:int, resource:Class, frameWidth:int, frameHeight:int):void
		{
			var m_NewSprite:AxSprite = new AxSprite(x, y, resource, frameWidth, frameHeight);
			m_NewSprite.angle += RNG.generateNumber( -30, 30);
			add(m_NewSprite);
			AxParticleSystem.emit("scoreEffect", x + 32, y + 32);
			
			Ax.camera.shake(m_cameraShakeDuration, m_cameraShakeIntensity, null, false);
			//m_cameraShakeDuration += m_cameraShakeDurationIncrease;
			m_cameraShakeIntensity += m_cameraShakeIntensityIncrease;
		}
	}
}