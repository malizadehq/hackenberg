package crs.Util 
{
	/**
	 * ...
	 * @author Sone
	 */
	public class RNG 
	{
		
		public function RNG() 
		{
			
		}
		
		public static function generateNumber(minNum:uint, maxNum:uint):uint
		{
			return new uint((Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum));
		}
		
	}

}