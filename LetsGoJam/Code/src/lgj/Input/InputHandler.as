package lgj.Input 
{
	import org.axgl.AxVector;
	import flash.events.MouseEvent;
	import lgj.Util.VectorHelper;
	
	public class InputHandler 
	{
		private var m_clickedPos:AxVector = new AxVector();;
		private var m_releasedPos:AxVector = new AxVector();;
		private var m_inputForce:AxVector = new AxVector();;
		
		private var m_hasInputToProcess:Boolean = false;
		
		public function InputHandler() 
		{
		}
		
		public function onMouseDownHandler(event:MouseEvent):void {
			m_clickedPos = new AxVector(event.stageX, event.stageY, 0);
		}
		
		public function onMouseUpHandler(event:MouseEvent):void {
			m_releasedPos = new AxVector(event.stageX, event.stageY, 0);
			m_inputForce = calculateInputForce();
			m_hasInputToProcess = true;
		}
		
		private function calculateInputForce():AxVector {
			return VectorHelper.deductAxVectorFromAxVector(m_releasedPos, m_clickedPos);
		}
		
		public function getAndResetInputForce():AxVector {
			var returnValue:AxVector = new AxVector(m_inputForce.x, m_inputForce.y, 0);
			m_inputForce = new AxVector(0, 0, 0);
			m_hasInputToProcess = false;
			return returnValue;
		}
		
		public function hasInputToProcess():Boolean {
			return m_hasInputToProcess;
		}
	}
}