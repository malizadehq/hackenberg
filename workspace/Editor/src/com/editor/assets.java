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
	
	// borders
	public Texture		pIsoBorder_A;
	public Texture		pIsoBorder_B;
	public Texture		pIsoBorder_C;
	public Texture		pIsoBorder_D;
	public Texture		pIsoBorder_E;
	
	public Texture		pIsoLandMask;
	
	public Pixmap 		MapPixmap;
	public Pixmap 		MapPixmap_Borders_A;
	public Pixmap 		MapPixmap_Borders_B;
	public Pixmap 		MapPixmap_Borders_C;
	public Pixmap 		MapPixmap_Borders_D;
	public Pixmap 		MapPixmap_Borders_E;
	
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
		
		pIsoBorder_A		= new Texture(Gdx.files.internal("res/tiles/iso_borders_A.png"));
		pIsoBorder_B		= new Texture(Gdx.files.internal("res/tiles/iso_borders_B.png"));
		pIsoBorder_C		= new Texture(Gdx.files.internal("res/tiles/iso_borders_C.png"));
		pIsoBorder_D		= new Texture(Gdx.files.internal("res/tiles/iso_borders_D.png"));
		pIsoBorder_E		= new Texture(Gdx.files.internal("res/tiles/iso_borders_E.png"));
		
		pIsoLandMask		= new Texture(Gdx.files.internal("res/tiles/iso_land_mask.png"));
		
		pButtonsTexture		= new Texture(Gdx.files.internal("res/ui/buttons.png"));
		pIconsTexture		= new Texture(Gdx.files.internal("res/ui/icons.png"));
		pEditorUiTiles		= new Texture(Gdx.files.internal("res/ui/UI_Tiles.png"));
		
		FileHandle fHand	= new FileHandle("res/maps/editor_map.png");
		MapPixmap		 	= new Pixmap(fHand);
	
		FileHandle fHandBoA	= new FileHandle("res/maps/editor_map_borders_A.png");
		MapPixmap_Borders_A = new Pixmap(fHandBoA);
		
		FileHandle fHandBoB	= new FileHandle("res/maps/editor_map_borders_B.png");
		MapPixmap_Borders_B = new Pixmap(fHandBoB);
		
		FileHandle fHandBoC	= new FileHandle("res/maps/editor_map_borders_C.png");
		MapPixmap_Borders_C = new Pixmap(fHandBoC);
		
		FileHandle fHandBoD	= new FileHandle("res/maps/editor_map_borders_D.png");
		MapPixmap_Borders_D = new Pixmap(fHandBoD);
		
		FileHandle fHandBoE	= new FileHandle("res/maps/editor_map_borders_E.png");
		MapPixmap_Borders_E = new Pixmap(fHandBoE);
		
		
		pCreateSound 		= (Sound) Gdx.audio.newSound(Gdx.files.internal("res/sound/poff.wav"));
		
	}
}
