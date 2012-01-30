package com.editor;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.backends.openal.Wav.Sound;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.BitmapFont;

public class assets 
{
	public BitmapFont 	defaultFont;
	public BitmapFont 	pixelFont;
	public BitmapFont 	pixelFontButton;
	public Sound		pSelectSound;
	public Sound		pAddSound;
	public Sound		pDeleteSound;
	public Sound		pCreateSound;
	public Texture		pGridTexture;
	public Texture		pGrassTexture;
	public Texture		pEditorUiTexture;
	public Pixmap 		MapPixmap;
	
	public void load()
	{
		defaultFont 		= new BitmapFont(Gdx.files.internal("res/skins/default.fnt"), Gdx.files.internal("res/skins/default.png"), false);
		pixelFont			= new BitmapFont(Gdx.files.internal("res/fonts/basic_white.fnt"), Gdx.files.internal("res/fonts/basic_white.png"), false);
		pixelFontButton		= new BitmapFont(Gdx.files.internal("res/fonts/button_black.fnt"), Gdx.files.internal("res/fonts/button_black.png"), false);
		
		pSelectSound 		= (Sound) Gdx.audio.newSound(Gdx.files.internal("res/sound/select.wav"));
		pAddSound			= (Sound) Gdx.audio.newSound(Gdx.files.internal("res/sound/add_tile.wav"));
		pDeleteSound		= (Sound) Gdx.audio.newSound(Gdx.files.internal("res/sound/destroy.wav"));
		
		pGridTexture 		= new Texture(Gdx.files.internal("res/tiles/tile_grid_01.png"));
		pGrassTexture		= new Texture(Gdx.files.internal("res/tiles/tile_grass_01.png"));
		pEditorUiTexture	= new Texture(Gdx.files.internal("res/ui/editor_ui.png"));
		
		FileHandle fHandler = new FileHandle("res/maps/editor_map.png");
		MapPixmap		 	= new Pixmap(fHandler);
		pCreateSound 		= (Sound) Gdx.audio.newSound(Gdx.files.internal("res/sound/poff.wav"));
		
	}
}
