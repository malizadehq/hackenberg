package com.editor;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
    
public class objectGrid extends object
{
	private Texture 			texture;
	private TextureRegion		regionGrid;	
	private TextureRegion		regionSelect;	
	private int					iSelectedTile;
	
	public objectGrid()
	{
		//pCreateSound = (Sound) Gdx.audio.newSound(Gdx.files.internal("res/sound/blip.wav"));
		texture 		= new Texture(Gdx.files.internal("res/tiles/tile_grid_01.png"));
		regionGrid		= new TextureRegion(texture,0,0,50,50);
		regionSelect	= new TextureRegion(texture,50,0,50,50);
		iSelectedTile= -1;
	}

	public void render(SpriteBatch SpriteDrawer)
	{
		int i = 0;
		for(int y = TileEditor.TILES_HEIGHT-1; y >= -1;y--)
		{
			for(int x = 0; x < TileEditor.TILES_WIDTH;x++)
			{
				if(i == iSelectedTile)
					SpriteDrawer.draw(regionSelect, x*50, y*50);
				else
					SpriteDrawer.draw(regionGrid, x*50, y*50);
				i++;
			}
		}		
	}

	public void SetSelectedTile(int iNewSelectedTile) 
	{
		iSelectedTile = iNewSelectedTile;		
	}
}
