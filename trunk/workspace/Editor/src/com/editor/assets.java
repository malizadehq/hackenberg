package com.editor;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.backends.openal.Wav.Sound;
import com.badlogic.gdx.graphics.g2d.BitmapFont;

public class assets 
{
	public BitmapFont 	defaultFont;
	public Sound		pSelectSound;
	public Sound		pAddSound;
	public Sound		pDeleteSound;
	
	public void load()
	{
		defaultFont 	= new BitmapFont(Gdx.files.internal("res/skins/default.fnt"), Gdx.files.internal("res/skins/default.png"), false);
		pSelectSound 	= (Sound) Gdx.audio.newSound(Gdx.files.internal("res/sound/select.wav"));
		pAddSound		= (Sound) Gdx.audio.newSound(Gdx.files.internal("res/sound/add_tile.wav"));
		pDeleteSound	= (Sound) Gdx.audio.newSound(Gdx.files.internal("res/sound/destroy.wav"));
	}
}
