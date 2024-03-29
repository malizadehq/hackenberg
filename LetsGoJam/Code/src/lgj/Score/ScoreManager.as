package lgj.Score 
{
	public class ScoreManager 
	{
		private var m_finishedGibletsInPot:uint = 0;
		private var m_unfinishedGibletsInPot:uint = 0;
		private var m_wholeDolphinsInPot:uint = 0;
		private var m_targetScore:uint = 100;
		
		public function ScoreManager() 
		{
			
		}
		
		//Setters
		public function addEntireDolphin():void {
			++m_wholeDolphinsInPot;
		}
		
		public function addFinishedGiblet():void {
			++m_finishedGibletsInPot;
		}
		
		public function addUnfinishedGiblet():void {
			++m_unfinishedGibletsInPot;
		}
		
		//Getters
		public function getFinishedGibletsInPot():uint {
			return new uint(m_finishedGibletsInPot);
		}
		
		public function getUnfinishedGibletsInPot():uint {
			return new uint(m_unfinishedGibletsInPot);
		}

		public function getWholeDolphinsInPot():uint {
			return new uint(m_wholeDolphinsInPot);
		}		
		
		public function getTargetScore():uint {
			return new uint(m_targetScore);
		}
	}
}