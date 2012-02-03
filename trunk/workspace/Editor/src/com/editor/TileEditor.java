package com.editor;

import java.util.ArrayList;

import org.lwjgl.openal.Util;

import com.badlogic.gdx.ApplicationListener;
import com.badlogic.gdx.Game;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.backends.openal.Wav.Sound;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.GL10;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.scenes.scene2d.Stage;
import com.badlogic.gdx.scenes.scene2d.ui.Skin;

public class TileEditor extends Game
{
	private SpriteBatch SpriteDrawer;
	
	private ArrayList<objectUi> 	vUi;
	private ArrayList<objectText> 	vText;
	private ArrayList<objectTile> 	vTiles;
	public  objectGrid				pGrid;
	public  objectUiSideBar			pSideBar;
	public  assets					pMyAssets;
	public  objectTileCamera		pTileCamera;
	private objectLoadingManager	pLoadingManager;
	private int						iSelectedTile;
	private Stage					pStage;
	private Boolean					bTouching;
	private Vector2					vLastTouch;
	
	public static final int TILES_WIDTH		=	100;
	public static final int TILES_HEIGHT	=	60;
	
	public int iDebugRender;
	
	private	Boolean bShowGrid;

	public void create() 
	{
		// TODO Auto-generated method stub		
		SpriteDrawer = new SpriteBatch();
		setStage(new Stage(Gdx.graphics.getWidth(), Gdx.graphics.getHeight(), true));
		Gdx.input.setInputProcessor(getStage());
		
		setLoadingManager(new objectLoadingManager(this));
		vTiles 			= new ArrayList<objectTile>();
		vText 			= new ArrayList<objectText>();
		vUi 			= new ArrayList<objectUi>();		
			
		vText.add( new objectText("Creating Tiles..",0,Gdx.graphics.getHeight(),pMyAssets.pixelFont));
		vText.add( new objectText("Mouse Pos",0,Gdx.graphics.getHeight()-15,pMyAssets.pixelFont));
		vText.add( new objectText("Cam Pos",0,Gdx.graphics.getHeight()-30,pMyAssets.pixelFont));
 
		iDebugRender 	= 0;
		bShowGrid 		= true;
		bTouching 		= false;
		vLastTouch 		= new Vector2();
	}
	
	public int	FriendToIndex(int iIndex,int iClock)
	{
		int iTestIndex = 0;
		
		switch(iClock)
		{
		case 0:
			iTestIndex = iIndex + TILES_WIDTH;
			break;
		case 1:
			iTestIndex = iIndex + 1;
			break;
		case 2:
			iTestIndex = iIndex - TILES_WIDTH;
			break;
		case 3:
			iTestIndex = iIndex - 1;
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
		if(vTiles.size() > index && index >= 0 && vTiles.get(index).bIsLand)
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
		vText.get(0).SetDrawString("Render...FPS["+(int) (1.0/Gdx.graphics.getDeltaTime())+"]");
		
		if(getLoadingManager().DoLoading(SpriteDrawer))
		{	
			vText.get(0).render(SpriteDrawer);
			SpriteDrawer.end();
		}
		else
		{		
			Gdx.gl11.glScalef(pTileCamera.fViewZoom, pTileCamera.fViewZoom, pTileCamera.fViewZoom);
			renderTiles();
			SpriteDrawer.end();
			SpriteDrawer.begin();
			Gdx.gl11.glScalef(1.0f, 1.0f, 1.0f);
			renderUi();
			renderText();
			SpriteDrawer.end();
			getStage().act(Gdx.graphics.getDeltaTime());
			getStage().draw();
			handleInput();
			pTileCamera.TickCamera(Gdx.graphics.getDeltaTime());
		}
	}
	
	public void handleInput()
	{
		/*
		if(!IsTouchingMenu())
		{
			vText.get(1).SetDrawString("Idle X["+Gdx.input.getX()+"] Y["+Gdx.input.getY()+"] idx ["+iSelectedTile+"]");
			
			if (Gdx.input.justTouched()) 
			{
				iSelectedTile = getClosestTile(Gdx.input.getX(),Gdx.input.getY());
				pMyAssets.pSelectSound.play(0.1f);
				vText.get(1).SetDrawString("Touch X["+Gdx.input.getX()+"] Y["+Gdx.input.getY()+"] idx ["+iSelectedTile+"]");
				bTouching = true;
				vLastTouch.x = Gdx.input.getX();
				vLastTouch.y = Gdx.input.getY();
				pTileCamera.StopTween();
			}
			else if(bTouching && Gdx.input.isTouched())
			{
				vText.get(1).SetDrawString("Dragging X["+Gdx.input.getX()+"] Y["+Gdx.input.getY()+"] idx ["+iSelectedTile+"]");
				
				Boolean bAdded = false;
				if(Math.abs(Gdx.input.getX() - vLastTouch.x) > GetTileSize())
				{
					pTileCamera.AddPosTgt((int)(vLastTouch.x - Gdx.input.getX()),0);
					bAdded = true;
				}
				if(Math.abs(Gdx.input.getY() - vLastTouch.y) > GetTileSize())
				{
					pTileCamera.AddPosTgt(0,(int)(Gdx.input.getY() - vLastTouch.y));
					bAdded = true;
				}
				if(bAdded)
				{
					vLastTouch.x = Gdx.input.getX();
					vLastTouch.y = Gdx.input.getY();
				}
			}
			else
				bTouching = false;
			vText.get(2).SetDrawString("Cam X["+pTileCamera.getxPos()+" / "+pTileCamera.getxPosTgt()+"] Y["+pTileCamera.getyPos()+" / "+pTileCamera.getyPosTgt()+"]");
			
		}
		else
			bTouching = false;
			*/ 
	}

	public Boolean IsTouchingMenu()
	{
		if(Gdx.input.getX() > Gdx.graphics.getWidth() - 100)		
			return true;
		return false;
	}
	public int getClosestTile(float X,float Y)
	{
		/*
		Y = Gdx.graphics.getHeight()-Y;
		int GridX = (int) (X/GetTileSize());
		GridX+= pTileCamera.getxPos();
		int GridY = (int) (Y/GetTileSize());
		GridY+= pTileCamera.getyPos();
		GridY = (GridY*TILES_WIDTH);
		*/
		return 1;//(GridX + GridY);
	}
	public float GetTileSize()
	{
		if(pTileCamera != null)
			return pTileCamera.fViewZoom * 50.0f;
		else
			return 50.0f;
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
		for(int i = vTiles.size()-1; i > 0;i--)
		{
			vTiles.get(i).render(SpriteDrawer);
		}
		pGrid.SetSelectedTile(iSelectedTile);
		if(bShowGrid)
			pGrid.render(SpriteDrawer);
	}
	public void renderUi()
	{
		for(int i = 0; i < vUi.size();i++)
		{
			vUi.get(i).render(SpriteDrawer);
		}		
	}
	public void renderText()
	{
		for(int i = 0; i < vText.size();i++)
		{
			vText.get(i).render(SpriteDrawer);
		}
	}

	public void ToggleGrid() 
	{
		bShowGrid = !bShowGrid;
	}

	public Stage getStage() 
	{
		return pStage;
	}

	public void setStage(Stage pStage) 
	{
		this.pStage = pStage;
		
	}

	public void addTile(objectTile newTiles)
	{
		vTiles.add(newTiles);
	}
	
	public void RemTile()
	{
		vTiles.get(iSelectedTile).bIsLand = false;
		vTiles.get(iSelectedTile).setTileType(0);
		pMyAssets.pDeleteSound.play(1.0f);
	}

	public void AddTile()
	{
		vTiles.get(iSelectedTile).bIsLand = true;
		vTiles.get(iSelectedTile).setTileType(1);
		pMyAssets.pAddSound.play(1.0f);
	}

	public objectTile GetTile(int i) 
	{
		return vTiles.get(i);
	}

	public int GetNrTiles() 
	{
		return vTiles.size();
	}

	public void Zoom(boolean b)
	{
		if(b)
			pTileCamera.fViewZoom+=0.10f;
		else
			pTileCamera.fViewZoom-=0.10f;
	}

	public objectLoadingManager getLoadingManager() {
		return pLoadingManager;
	}

	public void setLoadingManager(objectLoadingManager pLoadingManager) {
		this.pLoadingManager = pLoadingManager;
	}

	public void Scroll(int x, int y) 
	{
		pTileCamera.AddScroll(x,y);		
	}
}
