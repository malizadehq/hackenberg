package com.editor;

import java.util.ArrayList;
import java.util.Random;

import com.badlogic.gdx.ApplicationListener;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.GL10;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.sun.opengl.impl.windows.BITMAPINFO;

enum eTileState
{
	eTileState_Create,
	eTileState_Fixup,
	eTileState_Render
};

public class TileEditor implements ApplicationListener
{
	private SpriteBatch SpriteDrawer;
	
	private ArrayList<objectUi> 	vUi;
	private ArrayList<objectText> 	vText;
	private ArrayList<objectTile> 	vTiles;
	
	public eTileState eCurTileState;
	
	public static final int TILES_WIDTH		=	16;
	public static final int TILES_HEIGHT	=	12;
	
	@Override
	public void create() 
	{
		// TODO Auto-generated method stub
		SpriteDrawer = new SpriteBatch();
		
		vTiles 	= new ArrayList<objectTile>();
		vText 	= new ArrayList<objectText>();
		vUi 	= new ArrayList<objectUi>();
		
		eCurTileState = eTileState.eTileState_Create;		
		vText.add( new objectText("Creating Tiles..") );
	}
	
	public void createTiles()
	{
		FileHandle fHandler = new FileHandle("res/maps/editor_map.png");
		Pixmap newPixMap = new Pixmap(fHandler);
		
		for(int x = 0; x < TILES_WIDTH;x++)
		{
			for(int y = 0; y < TILES_HEIGHT;y++)
			{
				objectTile newTile = null;
				newTile = new objectTile(x,y);
				
				int iPixelValue = newPixMap.getPixel(x, y);
				
				if(iPixelValue > 0)
					newTile.setTileType(1);
				
				if(newTile != null)
					vTiles.add(newTile);
			}
		}
	}
	
	public void fixupTiles()
	{
		for(int i = 0; i < vTiles.size();i++)
		{
			for(int j = 0; j < 8; j++)
			{
				vTiles.get(i).FriendIsLand( j,IsLand(FriendToIndex(i,j)) );
			}
			vTiles.get(i).FindMatchingTiles(i);
		}
	}
	
	public int	FriendToIndex(int iIndex,int iClock)
	{
		int iTestIndex = 0;
		
		switch(iClock)
		{
		case 0:
		case 8:
			iTestIndex = iIndex - TILES_WIDTH;
			break;
		case 1:
			iTestIndex = iIndex - TILES_WIDTH + 1;
			break;
		case 2:
			iTestIndex = iIndex + 1;
			break;
		case 3:
			iTestIndex = iIndex + TILES_WIDTH + 1;
			break;
		case 4:
			iTestIndex = iIndex + TILES_WIDTH;
			break;
		case 5:
			iTestIndex = iIndex + TILES_WIDTH - 1;
			break;
		case 6:
			iTestIndex = iIndex - 1;
			break;
		case 7:
			iTestIndex = iIndex - TILES_WIDTH + 1;
			break;
		}
		
		if(iTestIndex > vTiles.size())
			iTestIndex = iTestIndex - TILES_WIDTH*TILES_HEIGHT;
		else if(iTestIndex < 0)
			iTestIndex = iTestIndex + TILES_WIDTH*TILES_HEIGHT;
		
		return iTestIndex;
	}
	public int IsLand(int index)
	{
		if(vTiles.size() > index && index >= 0 && vTiles.get(index).getTileType() > 0)
			return 1;
		
		return 0;
	}
	@Override
	public void dispose() 
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public void pause() 
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public void render() 
	{
		Gdx.gl.glClearColor(0.25f,0.458f,0.654f,1);
		Gdx.gl.glClear(GL10.GL_COLOR_BUFFER_BIT);
		
		SpriteDrawer.begin();
		switch(eCurTileState)
		{
		case eTileState_Create:
			createTiles();
			eCurTileState = eTileState.eTileState_Fixup;
			vText.get(0).SetDrawString("Running fixup...");
			break;
		case eTileState_Fixup:
			fixupTiles();
			eCurTileState = eTileState.eTileState_Render;
			vText.get(0).SetDrawString("Render...");
			break;
		case eTileState_Render:
			renderTiles();
			break;
		}
		
		renderUi();
		renderText();
		SpriteDrawer.end();
	}

	@Override
	public void resize(int arg0, int arg1) 
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public void resume() 
	{
		// TODO Auto-generated method stub
		
	}
	
	public void renderTiles()
	{
		for(int i = 0; i < vTiles.size();i++)
		{
			vTiles.get(i).render(SpriteDrawer);
		}
	}
	public void renderUi()
	{
		//for(int i = 0; i < vUi.size();i++)
		//{
		//	vUi.get(i).render();
		//}		
	}
	public void renderText()
	{
		for(int i = 0; i < vText.size();i++)
		{
			vText.get(i).render(SpriteDrawer);
		}
	}
}
