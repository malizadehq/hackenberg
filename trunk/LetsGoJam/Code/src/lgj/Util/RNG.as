package lgj.Util 
{
	public class RNG 
	{
		
		public function RNG() 
		{
			
		}
		
		public static function generateNumber(minNum:int, maxNum:int):int
		{
			return new int((Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum));
		}
		
	}

}