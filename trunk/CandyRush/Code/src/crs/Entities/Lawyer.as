package crs.Entities 
{
	/**
	 * ...
	 * @author Sone
	 */
	
	import crs.Util.Resource;
	
	import org.axgl.AxPoint;
	
	public class Lawyer extends Entity 
	{
		public static var HEAD_SHOT:int = 0;
		public static var TORSO_SHOT:int = 1;
		public static var LEG_SHOT:int = 2;
		
		public static var HEAD_SHOT_MIN_YPOS:int = 46;
		public static var TORSO_SHOT_MIN_YPOS:int = 76;
		
		private var m_isAlive:Boolean = true;
		
		public function Lawyer(x:Number, y:Number) 
		{
			super(x, y, null);
			load(Resource.LAWYER_IDLE, 100, 100);
			addAnimation("idle", [0, 1, 2, 3, 4, 5, 6, 7, 8], 4, true);
		}
		
		public override function update():void
		{
			super.update();
			if (m_isAlive)
			{
				animate("idle");
			}else
			{
				animate("death");
			}
			
			//destroy lawyer if he moves outside game window.
			if (x < 0 - width)
			{
				destroy();
			}
		}
		
		public function hitLawyer(hitArea:int):void
		{
			switch(hitArea)
			{
				case HEAD_SHOT:
					load(Resource.LAWYER_DEATH_HEAD, 200, 100);
					addAnimation("death", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], 20, false);
					break;
				case TORSO_SHOT:
					load(Resource.LAWYER_DEATH_TORSO, 200, 100);
					addAnimation("death", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], 20, false);
					break;
				case LEG_SHOT:
					load(Resource.LAWYER_DEATH_LEG, 200, 100);
					addAnimation("death", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9], 10, false);
					break;
			}

			//Death tiles are larger than life tiles so we need to move the lawyer back.
			x -= 50;			
			m_isAlive = false;
		}
		
		public function isAlive():Boolean
		{
			return m_isAlive;
		}
	}

}