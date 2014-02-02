package crs.Model 
{
	import org.axgl.AxGroup;
	import org.axgl.text.AxText;
	
	import crs.Entities.Lawyer;
	import crs.Util.GameSettings;
	import crs.Util.FloatingScoreText;
	import crs.Util.Registry;

	/**
	 * ...
	 * @author Sone
	 */
	public class ScoreCounter 
	{
		public function ScoreCounter() 
		{
		}
		
		public function pickedUpPowerup():void
		{
			Registry.playerModel.addToCombo();
			Registry.playerModel.addToScore(GameSettings.powerupScore * Registry.playerModel.getComboCount());
			
			spawnFloatingScoreText(GameSettings.powerupScore * Registry.playerModel.getComboCount());
		}
		
		public function killedLawyer(lawyerHitArea:int):void
		{
			var baseScore:int = 0;
			switch(lawyerHitArea)
			{
				case Lawyer.HEAD_SHOT:
					baseScore = 75;
					break;
				case Lawyer.TORSO_SHOT:
					baseScore = 100;
					break;
				case Lawyer.LEG_SHOT:
					baseScore = 50;
					break;					
			}
			
			if (Registry.playerModel.getComboCount() == 0)
			{
				Registry.playerModel.addToCombo();
				Registry.playerModel.addToScore(baseScore);
				spawnFloatingScoreText(baseScore);
			} else
			{
				Registry.playerModel.addToCombo();
				Registry.playerModel.addToScore(baseScore * Registry.playerModel.getComboCount());				
				spawnFloatingScoreText(baseScore * Registry.playerModel.getComboCount());
			}
		}
		
		private function spawnFloatingScoreText(score:int):void
		{
			var floatingText:FloatingScoreText = new FloatingScoreText(Registry.player.x + Registry.player.width * 0.5,
																	   Registry.player.y - 20,
																	   null,
																	   "@[0,0,0]" + score);
			Registry.floatingScoreTexts.add(floatingText);
		}
		
		public function missedPowerup():void
		{
			Registry.playerModel.resetCombo();
		}
	}

}