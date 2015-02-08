package lgj.Util 
{
	import org.axgl.sound.AxMusic;
	import org.axgl.Ax;
	import org.axgl.sound.AxSound;

	public class MusicHandler 
	{
		private var m_sound:AxSound = null;
		private var m_musicVolume:Number = 0.2;
		
		public function MusicHandler() 
		{
			
		}
		
		public function playMusic(music:Class):void
		{
			if (m_sound != null)
			{
				m_sound.destroy();
				m_sound = null;
			}
			
			setSound(Ax.music(music, m_musicVolume));			
		}
		
		private function setSound(sound:AxSound):void
		{
			m_sound = sound;
		}
		
		public function getSound():AxSound
		{
			return m_sound;
		}
		
	}

}