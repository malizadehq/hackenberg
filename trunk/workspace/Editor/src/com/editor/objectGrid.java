package com.editor;

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

	public int[] CoordsToXY(int cordX,int cordY)
	{
	    int totalRows 		= TileEditor.TILES_HEIGHT;
	    int totalColumns 	= TileEditor.TILES_WIDTH;
	    int width = (totalRows + totalColumns) * (68/2);
	         
	    int y = cordX*(34/2) + cordY*(34/2); 
	    int x = cordX*(68/2) - cordY*(68/2)+width/2;
		int[] xy = new int[2];
	    xy[0] = x;
	    xy[1] = y;
	         
	    return xy;	
	}
	public void render(SpriteBatch SpriteDrawer)
	{
		int i = 0;
		for(int y = 0; y < TileEditor.TILES_HEIGHT;y++)
		{
			for(int x = 0; x < TileEditor.TILES_WIDTH;x++)
			{
				int[] pos = CoordsToXY(x,y);
				if(i == iSelectedTile)
					SpriteDrawer.draw(regionSelect, pos[0], pos[1]);
				else
					SpriteDrawer.draw(regionGrid, pos[0], pos[1]);
				i++;
			}
		}		
	}

	public void SetSelectedTile(int iNewSelectedTile) 
	{
		/*
		iSelectedTile = iNewSelectedTile;
		int iRemCam = 0;
		iRemCam+=pOwner.pTileCamera.getxPos();
		iRemCam+=pOwner.pTileCamera.getyPos()*TileEditor.TILES_WIDTH;
		iSelectedTile -= iRemCam;
		*/
	}

	public void MakeGrid(assets MyAssets) 
	{
		texture 		= MyAssets.pGridTexture;
		regionGrid		= new TextureRegion(texture,0,0,68,68);
		regionSelect	= new TextureRegion(texture,68,0,68,68);
	}
}
