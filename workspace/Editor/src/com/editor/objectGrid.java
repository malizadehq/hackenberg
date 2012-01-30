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
	private TileEditor			pOwner;
	
	public objectGrid(TileEditor pOwner)
	{
		this.pOwner = pOwner;
		iSelectedTile= -1;
	}

	public void render(SpriteBatch SpriteDrawer)
	{
		int i = 0;
		for(int y = 0; y < TileEditor.TILES_HEIGHT;y++)
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
		int iRemCam = 0;
		iRemCam+=pOwner.pTileCamera.getxPos();
		iRemCam+=pOwner.pTileCamera.getyPos()*TileEditor.TILES_WIDTH;
		iSelectedTile -= iRemCam;
	}

	public void MakeGrid(assets MyAssets) 
	{
		texture 		= MyAssets.pGridTexture;
		regionGrid		= new TextureRegion(texture,0,0,50,50);
		regionSelect	= new TextureRegion(texture,50,0,50,50);
	}
}
