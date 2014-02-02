package crs.Util 
{
	import org.axgl.AxGroup;
	import org.axgl.AxSprite;

	/**
	 * A scrolling starfield that repeats itself.
	 */
	public class ScrollingBackground extends AxGroup {
		/**
		 * The top of the two sprites.
		 */
		private var leftField:AxSprite;
		/**
		 * The bottom of the two sprites
		 */
		private var rightField:AxSprite;

		/**
		 * Create a new starfield using the passed graphic. Speed indicates how fast this starfield should scroll,
		 * and alpha indicates the opacity it should have. Used to create parallax star background.
		 */
		public function ScrollingBackground(graphic:Class, speed:Number, alpha:Number) {
			super();

			// Stack two copies of the graphic on top each other
			leftField = new AxSprite(0, 0, graphic);
			rightField = new AxSprite(-leftField.width, 0, graphic);

			this.add(leftField).add(rightField);

			// Set their speed and alpha
			leftField.velocity.x = rightField.velocity.x = -speed;
			leftField.alpha = rightField.alpha = alpha;
		}

		override public function update():void {
			// If they scroll too far down, move them both up, to simulate seamless repeating
			if (rightField.x <= -rightField.width) {
				rightField.x += rightField.width;
				leftField.x += rightField.width;
			}

			super.update();
		}
	}
}