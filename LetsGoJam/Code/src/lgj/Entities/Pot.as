package lgj.Entities 
{
	import lgj.Entities.Entity;
	import lgj.Util.Resource;
	import lgj.Settings;

	public class Pot extends Entity
	{
		private var X_collisionClose:int;
		private var X_collisionFar:int;
		private var Y_collision:int;
		
		public function Pot(x:Number, y:Number) 
		{
			super(x, y, Resource.POT);
			load(Resource.POT, 256, 256);
			X_collisionClose = globalX;
			X_collisionFar = globalX + width;
			Y_collision = globalY + 90;
		}
		
		public function getXCollisionClose():int {
			return new int(X_collisionClose);
		}
		
		public function getXCollisionFar():int {
			return new int(X_collisionFar);
		}
		
		public function getYCollision():int {
			return new int(Y_collision);
		}
	}

}