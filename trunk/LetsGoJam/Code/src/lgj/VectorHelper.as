package lgj 
{
	import org.axgl.AxVector;
	/**
	 * ...
	 * @author Sone
	 */
	public class VectorHelper 
	{
		
		public function VectorHelper() 
		{
			
		}
		
		public static function normalizeAxVector(vec:AxVector):AxVector
		{
			var length:Number = getLength(vec);
			var returnValue:AxVector = new AxVector(vec.x, vec.y);
			returnValue.x /= length;
			returnValue.y /= length;
			
			return returnValue;
		}
		
		public static function deductAxVectorFromAxVector(lhs:AxVector, rhs:AxVector):AxVector
		{
			return new AxVector(lhs.x - rhs.x, lhs.y - rhs.y, lhs.a - rhs.a);
		}
		
		public static function addAxVectorToAxVector(lhs:AxVector, rhs:AxVector):AxVector
		{
			return new AxVector(lhs.x + rhs.x, lhs.y + rhs.y, lhs.a + rhs.a);
		}
		
		public static function getLength(vec:AxVector):uint
		{
			return Math.sqrt((vec.x * vec.x) + (vec.y * vec.y));
		}
		
		public static function multiplyVectorWithNumber(vector:AxVector, number:Number):AxVector {
			return new AxVector(vector.x * number, vector.y * number, vector.a * number);
		}
	}

}