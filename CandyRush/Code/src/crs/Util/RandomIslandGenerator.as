package crs.Util 
{
	import org.axgl.tilemap.AxTile;
	import org.axgl.tilemap.AxTilemap;
	import org.axgl.AxPoint;
	
	import crs.Entities.Powerup;
	import crs.Entities.Lawyer;
	import crs.Util.RNG;
	/**
	 * ...
	 * @author Sone
	 */
	public class RandomIslandGenerator 
	{
		private var m_tileMapString:String = "";
		private var m_tileMapPowerups:Array;
		private var m_tileMapLawyers:Array;
		
		public function RandomIslandGenerator() 
		{
			
		}
		
		public function createIsland(referencePosition:AxPoint):AxTilemap
		{
			var islandPosition:AxPoint = generateNewIslandPosition(referencePosition);
			pickRandomIslandTileMap();
			
			var newTileMap:AxTilemap = new AxTilemap(islandPosition.x, islandPosition.y).build(	m_tileMapString,
																								Resource.TILES,
																								GameSettings.tileSize,
																								GameSettings.tileSize,
																								GameSettings.solidTilesStartIndex);
			addLawyersAndPowerups(newTileMap);
			
			return newTileMap;
		}
		
		private function generateNewIslandPosition(referencePosition:AxPoint):AxPoint
		{
			var xPosAdd:uint = RNG.generateNumber(100, 300);
			var yPos:uint = generateValidYPos(referencePosition);
			return new AxPoint(referencePosition.x + xPosAdd, yPos);
		}
		
		private function generateValidYPos(referencePosition:AxPoint):int
		{
			var maxHeightBetweenIslands:uint = 150;
			var yPos:uint = RNG.generateNumber(30, GameSettings.windowHeight - 130);
			
			
			
			return yPos;
		}
		
		private function addLawyersAndPowerups(tileMapToUse:AxTilemap):void 
		{
			var powerupPos:AxPoint = new AxPoint;
			var lawyerPos:AxPoint = new AxPoint;
			if (m_tileMapPowerups.length != 0)
			{
				powerupPos = new AxPoint(m_tileMapPowerups[0] * GameSettings.tileSize + tileMapToUse.x,
										 m_tileMapPowerups[1] * GameSettings.tileSize + tileMapToUse.y);
										 
				if (powerupPos.y < 10)
				{
					var iTestX:int = 0;
					var iTestY:int = 0;
					var iTestIndex:int = tileMapToUse.getTileIndexAt(0, 0);
					
					for (iTestY = 0; iTestY < 7; iTestY++ )
					{
						for (iTestX = 0; iTestX < 9; iTestX++ )
						{
							iTestIndex = tileMapToUse.getTileIndexAt(iTestX, iTestY);
							if (iTestIndex != 0 && iTestIndex < 17 )
							{
								powerupPos = new AxPoint(iTestX * GameSettings.tileSize + tileMapToUse.x,
								iTestY * GameSettings.tileSize + tileMapToUse.y);
								iTestY = 7; // Hack to break..omg
								iTestX = 9;// Hack to break..omg
								break;
							}
						}
					}
				}
			}
		
			if (m_tileMapLawyers.length != 0)
			{	
				var iSpawnX:int = m_tileMapLawyers[0];
				var iSpawnY:int = m_tileMapLawyers[1];
				if (iSpawnY < 0)
					iSpawnY = 0;
				if (iSpawnX < 0)
					iSpawnX = 0;
				var iIndex:int = tileMapToUse.getTileIndexAt(iSpawnX, iSpawnY);
				
				while (iIndex == 0 || iIndex > 18)
				{
					iSpawnX = RNG.generateNumber(0, 8);
					iSpawnY = RNG.generateNumber(0, 6);
					iIndex = tileMapToUse.getTileIndexAt(iSpawnX, iSpawnY)
				}
				
				lawyerPos = new AxPoint(iSpawnX * GameSettings.tileSize + tileMapToUse.x,
						iSpawnY * GameSettings.tileSize + tileMapToUse.y);
						
				if (lawyerPos.y > 400)
					return;
			} 
			
			
			var newPowerup:Powerup = new Powerup(new int(powerupPos.x), new int(powerupPos.y));
			Registry.gameState.addPowerup(newPowerup);
			
			var newLawyer:Lawyer = new Lawyer(new int(lawyerPos.x), new int(lawyerPos.y));
			Registry.gameState.addLawyer(newLawyer);
		}
		
		private function pickRandomIslandTileMap():void
		{
			var randomNumber:uint = RNG.generateNumber(0, 16);
			switch(randomNumber)
			{
				case 0:
					m_tileMapPowerups = Resource.ISLAND_0_POWERUPS;
					m_tileMapLawyers = Resource.ISLAND_0_LAWYERS;
					m_tileMapString = Resource.ISLAND_0;
					break;
				case 1:
					m_tileMapPowerups = Resource.ISLAND_1_POWERUPS;
					m_tileMapLawyers = Resource.ISLAND_1_LAWYERS;					
					m_tileMapString = Resource.ISLAND_1;
					break;
				case 2:
					m_tileMapPowerups = Resource.ISLAND_2_POWERUPS;
					m_tileMapLawyers = Resource.ISLAND_2_LAWYERS;					
					m_tileMapString = Resource.ISLAND_2;
					break;
				case 3:
					m_tileMapPowerups = Resource.ISLAND_3_POWERUPS;
					m_tileMapLawyers = Resource.ISLAND_3_LAWYERS;					
					m_tileMapString = Resource.ISLAND_3;
					break;
				case 4:
					m_tileMapPowerups = Resource.ISLAND_4_POWERUPS;
					m_tileMapLawyers = Resource.ISLAND_4_LAWYERS;					
					m_tileMapString = Resource.ISLAND_4;
					break;
				case 5:
					m_tileMapPowerups = Resource.ISLAND_5_POWERUPS;
					m_tileMapLawyers = Resource.ISLAND_5_LAWYERS;					
					m_tileMapString = Resource.ISLAND_5;
					break;
				case 6:
					m_tileMapPowerups = Resource.ISLAND_6_POWERUPS;
					m_tileMapLawyers = Resource.ISLAND_6_LAWYERS;					
					m_tileMapString = Resource.ISLAND_6;
					break;
				case 7:
					m_tileMapPowerups = Resource.ISLAND_7_POWERUPS;
					m_tileMapLawyers = Resource.ISLAND_7_LAWYERS;					
					m_tileMapString = Resource.ISLAND_7;
					break;
				case 8:
					m_tileMapPowerups = Resource.ISLAND_8_POWERUPS;
					m_tileMapLawyers = Resource.ISLAND_8_LAWYERS;					
					m_tileMapString = Resource.ISLAND_8;
					break;
				case 9:
					m_tileMapPowerups = Resource.ISLAND_9_POWERUPS;
					m_tileMapLawyers = Resource.ISLAND_9_LAWYERS;					
					m_tileMapString = Resource.ISLAND_9;
					break;
				case 10:
					m_tileMapPowerups = Resource.ISLAND_10_POWERUPS;
					m_tileMapLawyers = Resource.ISLAND_10_LAWYERS;					
					m_tileMapString = Resource.ISLAND_10;
					break;
				case 11:
					m_tileMapPowerups = Resource.ISLAND_11_POWERUPS;
					m_tileMapLawyers = Resource.ISLAND_11_LAWYERS;					
					m_tileMapString = Resource.ISLAND_11;
					break;
				case 12:
					m_tileMapPowerups = Resource.ISLAND_12_POWERUPS;
					m_tileMapLawyers = Resource.ISLAND_12_LAWYERS;					
					m_tileMapString = Resource.ISLAND_12;
					break;
				case 13:
					m_tileMapPowerups = Resource.ISLAND_13_POWERUPS;
					m_tileMapLawyers = Resource.ISLAND_13_LAWYERS;					
					m_tileMapString = Resource.ISLAND_13;
					break;
				case 14:
					m_tileMapPowerups = Resource.ISLAND_14_POWERUPS;
					m_tileMapLawyers = Resource.ISLAND_14_LAWYERS;					
					m_tileMapString = Resource.ISLAND_14;
					break;
				case 15:
					m_tileMapPowerups = Resource.ISLAND_15_POWERUPS;
					m_tileMapLawyers = Resource.ISLAND_15_LAWYERS;					
					m_tileMapString = Resource.ISLAND_15;
					break;
				case 16:
					m_tileMapPowerups = Resource.ISLAND_16_POWERUPS;
					m_tileMapLawyers = Resource.ISLAND_16_LAWYERS;					
					m_tileMapString = Resource.ISLAND_16;
					break;					
			}
		}		
	}

}