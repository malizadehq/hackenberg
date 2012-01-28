package com.editor;

import java.util.ArrayList;
import com.badlogic.gdx.ApplicationListener;
import com.badlogic.gdx.Game;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.backends.openal.Wav.Sound;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.GL10;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.badlogic.gdx.scenes.scene2d.Stage;
import com.badlogic.gdx.scenes.scene2d.ui.Skin;

enum eTileState
{
	eTileState_Create,
	eTileState_Fixup,
	eTileState_Render
};

public class TileEditor extends Game
{
	private SpriteBatch SpriteDrawer;
	
	private ArrayList<objectUi> 	vUi;
	private ArrayList<objectText> 	vText;
	private ArrayList<objectTile> 	vTiles;
	private objectGrid				pGrid;
	private objectUiSideBar			pSideBar;
	private assets					pMyAssets;
	private int						iSelectedTile;
	private Stage					pStage;
	
	public eTileState eCurTileState;
	
	public static final int TILES_WIDTH		=	16;
	public static final int TILES_HEIGHT	=	12;
	
	public int iDebugRender;
	
	private	Boolean bShowGrid;

	public void create() 
	{
		// TODO Auto-generated method stub		
		SpriteDrawer = new SpriteBatch();
		setStage(new Stage(Gdx.graphics.getWidth(), Gdx.graphics.getHeight(), true));
		Gdx.input.setInputProcessor(getStage());
		pMyAssets = new assets();
		pMyAssets.load();
		
		vTiles 	= new ArrayList<objectTile>();
		vText 	= new ArrayList<objectText>();
		vUi 	= new ArrayList<objectUi>();
		pGrid	= new objectGrid();
		
		eCurTileState = eTileState.eTileState_Create;	
			
		vText.add( new objectText("Creating Tiles..",0,Gdx.graphics.getHeight(),pMyAssets.defaultFont));
		vText.add( new objectText("Mouse Pos",0,Gdx.graphics.getHeight()-15,pMyAssets.defaultFont));
		
		pSideBar = new objectUiSideBar(this); 
		iDebugRender = 0;
		bShowGrid = true;
	}
	
	public void createTiles()
	{
		FileHandle fHandler = new FileHandle("res/maps/editor_map.png");
		Pixmap newPixMap = new Pixmap(fHandler);
		
		for(int y = 0; y < TILES_HEIGHT;y++)
		{
			for(int x = 0; x < TILES_WIDTH;x++)
			{
				int iPixelValue = newPixMap.getPixel(x, y);
				
				objectTile newTile = null;
				newTile = new objectTile(x,TILES_HEIGHT-y-1,(iPixelValue > 0));
				vTiles.add(newTile);
			}
		}
	}
	
	public void fixupTiles()
	{
		for(int i = 0; i < vTiles.size();i++)
		{
			if(vTiles.get(i).bIsLand)
			{
				for(int j = 0; j < 4; j++)
				{
					vTiles.get(i).FriendIsLand( j,IsLand(FriendToIndex(i,j)) );
				}
				vTiles.get(i).FindMatchingTiles();
			}
		}
	}
	
	public int	FriendToIndex(int iIndex,int iClock)
	{
		int iTestIndex = 0;
		
		switch(iClock)
		{
		case 0:
			iTestIndex = iIndex - TILES_WIDTH;
			break;
		case 1:
			iTestIndex = iIndex + 1;
			break;
		case 2:
			iTestIndex = iIndex + TILES_WIDTH;
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
			break;
		case eTileState_Render:
			renderTiles();
			vText.get(0).SetDrawString("Render...FPS["+(int) (1.0/Gdx.graphics.getDeltaTime())+"]");
			break;
		}
		
		renderUi();
		renderText();
		SpriteDrawer.end();
		getStage().act(Gdx.graphics.getDeltaTime());
		getStage().draw();
		handleInput();
	}
	
	public void handleInput()
	{
		if(!IsTouchingMenu())
		{
			if (Gdx.input.justTouched()) 
			{
				iSelectedTile = getClosestTile(Gdx.input.getX(),Gdx.input.getY());
				pSelectSound.play(0.1f);
				vText.get(1).SetDrawString("Touch X["+Gdx.input.getX()+"] Y["+Gdx.input.getY()+"] idx ["+iSelectedTile+"]");
			}
		}
	}

	public Boolean IsTouchingMenu()
	{
		if(Gdx.input.getX() > Gdx.graphics.getWidth()-100)		
			return true;
		return false;
	}
	public int getClosestTile(float X,float Y)
	{
		int GridX = (int) (X/50);
		int GridY = (int) (Y/50);
		GridY = (GridY*TILES_WIDTH);
		return (GridX + GridY);
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

	public void RemTile()
	{
		vTiles.get(iSelectedTile).bIsLand = false;
		vTiles.get(iSelectedTile).setTileType(0);
		eCurTileState = eTileState.eTileState_Fixup;
		pMyAssets.pDeleteSound.play(1.0f);
	}

	public void AddTile()
	{
		vTiles.get(iSelectedTile).bIsLand = true;
		vTiles.get(iSelectedTile).setTileType(1);
		eCurTileState = eTileState.eTileState_Fixup;
		pMyAssets.pAddSound.play(1.0f);
	}
}
