package lgj.GameStates 
{
	import org.axgl.AxPoint;
	import org.axgl.AxSprite;
	import org.axgl.AxState;
	import org.axgl.particle.AxParticleEffect;
	import org.axgl.util.AxRange;
	import org.axgl.render.AxColor;
	import org.axgl.particle.AxParticleSystem;
	
	import lgj.Util.Resource;
	import lgj.Util.RNG;
	
	public class ScoreCardState extends AxState
	{
		private var m_finishedGibletsStartPoint:AxPoint = new AxPoint(100, 100);
		private var m_unfinishedGibletsStartPoint:AxPoint = new AxPoint(112, 145);
		private var m_WholeDolphinsStartPoint:AxPoint = new AxPoint(100, 200);
		
		private var m_finishedGiblets_counter:uint = 0;
		private var m_finishedGiblets:uint = 0;
		
		private var m_unfinishedGiblets_counter:uint = 0;
		private var m_unfinishedGiblets:uint = 0;
		
		private var m_wholeDolphins_counter:uint = 0;
		private var m_wholeDolphins:uint = 0;
		
		private var m_framesBetweenScoreCount:int = 25;
		private var m_frameCounter:int = 0;
		private var m_scoreEffect:AxParticleEffect;
		
		private var m_resource:Class;
		
		public function ScoreCardState(numFinishedGiblets:uint, numUnfinishedGiblets:uint, numWholeDolphins:uint) 
		{
			m_finishedGiblets = numFinishedGiblets;
			m_unfinishedGiblets = numUnfinishedGiblets;
			m_wholeDolphins = numWholeDolphins;
			
			m_scoreEffect = new AxParticleEffect("scoreEffect", Resource.YELLOW_PARTICLE, 2);
			m_scoreEffect.xVelocity = new AxRange(-100, 100);
			m_scoreEffect.yVelocity = new AxRange(-100, 100);
			m_scoreEffect.lifetime = new AxRange(0.5, 0.75);
			m_scoreEffect.amount = 100;
			m_scoreEffect.color(new AxColor(0.3, 0.3, 0.3), new AxColor(0.7, 0.7, 0.7), new AxColor(0.3, 0.3, 0.3), new AxColor(1, 1, 1));
			add(AxParticleSystem.register(m_scoreEffect));
		}
		
		override public function update():void 
		{
			super.update();
			++m_frameCounter;
			
			if (m_frameCounter >= m_framesBetweenScoreCount) {
				m_frameCounter = 0;
				if (m_finishedGiblets_counter < m_finishedGiblets) {
					var rng:int = RNG.generateNumber(0, 3);
					switch(rng) {
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
					
					spawnScoreImage(m_finishedGibletsStartPoint.x + (m_finishedGiblets_counter * 32), m_finishedGibletsStartPoint.y, m_resource, 64, 64);
					++m_finishedGiblets_counter;
				} else if(m_unfinishedGiblets_counter < m_unfinishedGiblets) {
					var rng:int = RNG.generateNumber(0, 1);
					switch(rng) {
						case 0:
							m_resource = Resource.DOLPHIN_GIB_0;
							break;
						case 1:
							m_resource = Resource.DOLPHIN_GIB_0;
							break;
						default:
							break;
					}
					
					spawnScoreImage(m_unfinishedGibletsStartPoint.x + (m_unfinishedGiblets_counter * 52), m_unfinishedGibletsStartPoint.y, m_resource, 64, 64);
					++m_unfinishedGiblets_counter;
				} else if (m_wholeDolphins_counter < m_wholeDolphins) {
					m_resource = Resource.DOLPHIN;
					spawnScoreImage(m_WholeDolphinsStartPoint.x + (m_wholeDolphins_counter * 95), m_WholeDolphinsStartPoint.y, Resource.DOLPHIN, 128, 64);
					++m_wholeDolphins_counter;
				}
			}
		}
		
		private function spawnScoreImage(x:int, y:int, resource:Class, frameWidth:int, frameHeight:int):void
		{
			add(new AxSprite(x, y, resource, frameWidth, frameHeight));
			AxParticleSystem.emit("scoreEffect", x + 32, y + 32);
		}
	}
}