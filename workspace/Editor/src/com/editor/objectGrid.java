package com.editor;

import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
    
public class objectGrid extends object
{
	private Texture 			texture;
	private TextureRegion		regionGrid;	
	private TextureRegion		regionSelect;	
	private TextureRegion		regionHover;
	private int					iSelectedTile;
	private int					iHoverTile;
	private TileEditor			pOwner;
	
	public objectGrid(TileEditor pOwner)
	{
		this.pOwner 	= pOwner;
		iSelectedTile	= -1;
		iHoverTile		= -1;
	}

	public void render(SpriteBatch SpriteDrawer)
	{
		int i = 0;
		for(int y = 0; y < TileEditor.TILES_HEIGHT;y++)
		{
			for(int x = 0; x < TileEditor.TILES_WIDTH;x++)
			{
				int[] pos = pOwner.CoordsToXY(x,y);
				if(i == iSelectedTile)
					SpriteDrawer.draw(regionSelect, pos[0], pos[1]);
				else if(i == iHoverTile)
					SpriteDrawer.draw(regionHover, pos[0], pos[1]);
				else
					SpriteDrawer.draw(regionGrid, pos[0], pos[1]);
				i++;
			}
		}		
	}

	public void SetSelectedTile(int iNewSelectedTile) 
	{
		iSelectedTile = iNewSelectedTile;
	}
	
	public void SetHoverTile(int iNewHoverTile)
	{
		iHoverTile = iNewHoverTile;
	}
	public void MakeGrid(assets MyAssets) 
	{
		texture 		= MyAssets.pGridTexture;
		regionGrid		= new TextureRegion(texture,0,0,68,68);
		regionSelect	= new TextureRegion(texture,136,0,68,68);
		regionHover		= new TextureRegion(texture,68,0,68,68);
	}
}
