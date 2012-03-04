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
	public BitmapFont	pixelHeaderFont;
	public BitmapFont	pixelMainFont;
	public BitmapFont	pixelButtonFont;
	
	public Sound		pSelectSound;
	public Sound		pAddSound;
	public Sound		pDeleteSound;
	public Sound		pCreateSound;
	public Texture		pGridTexture;
	public Texture		pGrassTexture;
	public Texture		pIsoTexture;
	public Texture		pEditorUiTexture;
	public Texture		pEditorUiTiles;
	public Texture		pIsoGrassTexture;
	public Pixmap 		MapPixmap;
	
	public Texture		pIconsTexture;
	public Texture		pButtonsTexture;
	
	public void load()
	{
		defaultFont 		= new BitmapFont(Gdx.files.internal("res/skins/default.fnt"), Gdx.files.internal("res/skins/default.png"), false);
		pixelFont			= new BitmapFont(Gdx.files.internal("res/fonts/basic_white.fnt"), Gdx.files.internal("res/fonts/basic_white.png"), false);
		pixelFontButton		= new BitmapFont(Gdx.files.internal("res/fonts/button_black.fnt"), Gdx.files.internal("res/fonts/button_black.png"), false);
		pixelHeaderFont		= new BitmapFont(Gdx.files.internal("res/fonts/header.fnt"), Gdx.files.internal("res/fonts/header.png"), false);
		pixelMainFont		= new BitmapFont(Gdx.files.internal("res/fonts/header.fnt"), Gdx.files.internal("res/fonts/main.png"), false);
		pixelButtonFont		= new BitmapFont(Gdx.files.internal("res/fonts/button_large.fnt"), Gdx.files.internal("res/fonts/button_large.png"), false);
		
		pSelectSound 		= (Sound) Gdx.audio.newSound(Gdx.files.internal("res/sound/select.wav"));
		pAddSound			= (Sound) Gdx.audio.newSound(Gdx.files.internal("res/sound/add_tile.wav"));
		pDeleteSound		= (Sound) Gdx.audio.newSound(Gdx.files.internal("res/sound/destroy.wav"));
		
		pIsoTexture 		= new Texture(Gdx.files.internal("res/tiles/isotest.png"));
		pGridTexture 		= new Texture(Gdx.files.internal("res/tiles/isogrid.png"));
		pIsoGrassTexture	= new Texture(Gdx.files.internal("res/tiles/iso_grass.png"));
		pGrassTexture		= new Texture(Gdx.files.internal("res/tiles/tile_grass_01.png"));
		pEditorUiTexture	= new Texture(Gdx.files.internal("res/ui/editor_ui.png"));
		
		pButtonsTexture		= new Texture(Gdx.files.internal("res/ui/buttons.png"));
		pIconsTexture		= new Texture(Gdx.files.internal("res/ui/icons.png"));
		pEditorUiTiles		= new Texture(Gdx.files.internal("res/ui/UI_Tiles.png"));
		
		FileHandle fHandler = new FileHandle("res/maps/editor_map.png");
		MapPixmap		 	= new Pixmap(fHandler);
		pCreateSound 		= (Sound) Gdx.audio.newSound(Gdx.files.internal("res/sound/poff.wav"));
		
	}
}
