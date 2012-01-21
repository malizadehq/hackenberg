package com.editor;

import com.badlogic.gdx.backends.jogl.JoglApplication;

public class DesktopStarter {
	public static void main(String[] args)
	{
		new JoglApplication(new TileEditor(),"TileEditor",800,600,false);
	}
}
