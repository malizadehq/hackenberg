package crs.Model 
{
	/**
	 * ...
	 * @author Sone
	 */
	
	 import crs.Util.GameSettings;
	 import crs.Util.Registry;
	 import flash.display.NativeMenuItem;
	 
	public class PlayerModel 
	{
		private var m_score:uint = 0;
		private var m_comboCount:uint = 0;
		private var m_comboLevel:uint = 0;
		private var m_kingWillEatYouPercent:Number = 0;
		private var m_kingCurScale:Number = 1;
		
		public static var COMBOLVL_NONE:uint = 0;
		public static var COMBOLVL_D:uint = 3;
		public static var COMBOLVL_C:uint = 6;
		public static var COMBOLVL_B:uint = 10;
		public static var COMBOLVL_A:uint = 15;
		public static var COMBOLVL_S:uint = 20;
		public static var COMBOLVL_SS:uint = 30;
		public static var COMBOLVL_SSS:uint = 50;
		
		public function PlayerModel() 
		{
			
		}

		public function setKingCurScale(kingCurScale:Number):void
		{
			m_kingCurScale = kingCurScale;
			var totalSpan:Number = GameSettings.kingScaleTilPlayerEat - 1;
			m_kingWillEatYouPercent = (kingCurScale - 1) / totalSpan;
			
			Registry.gameState.updateChaseBarUI();
		}
		
		public function addToScore(addScore:int):void
		{
			m_score += addScore;
			Registry.gameState.updateScoreUI();
		}
		
		public function addToCombo():void
		{
			++m_comboCount;
			calculateComboLevel();
		}
		
		private function calculateComboLevel():void
		{
			var curComboLevel:uint = new uint(m_comboLevel);
			if (m_comboCount >= COMBOLVL_SSS)
			{
				m_comboLevel = COMBOLVL_SSS;
			} else if (m_comboCount >= COMBOLVL_SS)
			{
				m_comboLevel = COMBOLVL_SS;
			} else if (m_comboCount >= COMBOLVL_S)
			{
				m_comboLevel = COMBOLVL_S;
			} else if (m_comboCount >= COMBOLVL_A)
			{
				m_comboLevel = COMBOLVL_A;
			} else if (m_comboCount >= COMBOLVL_B)
			{
				m_comboLevel = COMBOLVL_B;
			} else if (m_comboCount >= COMBOLVL_C)
			{
				m_comboLevel = COMBOLVL_C;
			} else if (m_comboCount >= COMBOLVL_D)
			{
				m_comboLevel = COMBOLVL_D;
			} else 
			{
				m_comboLevel = COMBOLVL_NONE;
			}
			
			if (curComboLevel != m_comboLevel)
			{
				Registry.gameState.setNewComboLevel(m_comboLevel);
			}
			
			Registry.gameState.updateComboUI();			
		}
		
		public function resetCombo():void
		{
			m_comboCount = 0;
			calculateComboLevel();
		}
		
		public function getScore():uint
		{
			return m_score;
		}
		
		public function getComboCount():uint
		{
			return m_comboCount;
		}
		
		public function getComboLevel():uint
		{
			return m_comboLevel;
		}
		
		public function getKingWillEatYouPercent():Number
		{
			return m_kingWillEatYouPercent;
		}
	}

}