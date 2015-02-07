package lgj.Entities {
    import org.axgl.AxSprite;
	import org.axgl.AxRect;
	
	import lgj.Resource;
	import lgj.Settings;
	
    public class Player extends AxSprite {
        public function Player(x:Number, y:Number, worldWidth:Number, worldHeight:Number) {
			super(x, y);

			acceleration.y = Settings.GRAVITY;
			worldBounds = new AxRect(0, 0, worldWidth, worldHeight + 100);

            load(Resource.PLAYER, 32, 32);
			addAnimations();
        }
        
        override public function update():void {
            super.update();
        }
		
		private function addAnimations():void {
			addAnimation("stand", [0, 4, 0, 5], 4, true);
            addAnimation("walk", [1,2,3,4, 5], 16, true);
            addAnimation("jump", [2], 1, false);
            addAnimation("fall", [3], 1, false);
		}
    }
}