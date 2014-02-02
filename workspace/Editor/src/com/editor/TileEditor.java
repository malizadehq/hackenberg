package com.editor;

import java.io.IOException;
import java.io.OutputStream;
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
	private int						iBrush;
	private int						iCountry;
	
	private FoeUiBase				pWindow;
	
	public static final int TILES_WIDTH		=	100;
	public static final int TILES_HEIGHT	=	60;
	public static final int TILE_WIDTH		=	64;
	public static final int TILE_HEIGHT		=	32;
	
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
	public int IsCountry(int index,int iCountry)
	{
		if(vTiles.size() > index && index >= 0 && vTiles.get(index).getCountryID() == iCountry)
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
		Gdx.gl.glClearColor(0.68f,0.75f,0.81f,1);
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
			if(pWindow != null)
				pWindow.render(SpriteDrawer);	
			SpriteDrawer.end();
			getStage().act(Gdx.graphics.getDeltaTime());
			getStage().draw();
			handleInput();
			pTileCamera.TickCamera(Gdx.graphics.getDeltaTime());
			
		}
	}
	
	public void handleInput()
	{	
		if(pWindow != null)
			return;
		
		if(!IsTouchingMenu())
		{
			vText.get(1).SetDrawString("Idle X["+Gdx.input.getX()+"] Y["+Gdx.input.getY()+"] idx ["+iSelectedTile+"]");
			
			if (Gdx.input.justTouched()) 
			{
				iSelectedTile = getClosestTile(Gdx.input.getX(),Gdx.input.getY());
				pGrid.SetSelectedTile(iSelectedTile);
				
				pMyAssets.pSelectSound.play(0.1f);
				vText.get(1).SetDrawString("Touch X["+Gdx.input.getX()+"] Y["+Gdx.input.getY()+"] idx ["+iSelectedTile+"]");
				bTouching = true;
				vLastTouch.x = Gdx.input.getX();
				vLastTouch.y = Gdx.input.getY();				
			}
			else if(bTouching && Gdx.input.isTouched())
			{
				if(iBrush == 1)
				{
					int iNewSelectTile = getClosestTile(Gdx.input.getX(),Gdx.input.getY());
					if(iNewSelectTile != iSelectedTile)
					{
						iSelectedTile = iNewSelectTile;
						pGrid.SetSelectedTile(iSelectedTile);
						AddTile();
					}
				}
				else if(iBrush == 2)
				{
					int iNewSelectTile = getClosestTile(Gdx.input.getX(),Gdx.input.getY());
					if(iNewSelectTile != iSelectedTile)
					{
						iSelectedTile = iNewSelectTile;
						pGrid.SetSelectedTile(iSelectedTile);
						RemTile();
					}
				}
				else
				{
					int xNewScroll = (int) ((vLastTouch.x-Gdx.input.getX())/10)*-1;
					int yNewScroll = (int) ((vLastTouch.y-Gdx.input.getY())/10);
					Scroll(xNewScroll,yNewScroll);
				}
				vText.get(1).SetDrawString("Dragging X["+Gdx.input.getX()+"] Y["+Gdx.input.getY()+"] idx ["+iSelectedTile+"]");
			}
			else if(bTouching)
			{

				bTouching = false;
			}
		}
		else
			bTouching = false;
		vText.get(2).SetDrawString("Cam X["+pTileCamera.GetX()+"] Y["+pTileCamera.GetY()+"]");
		pGrid.SetHoverTile(getClosestTile(Gdx.input.getX(),Gdx.input.getY()));
	}

	public Boolean IsTouchingMenu()
	{
		if(Gdx.input.getX() > Gdx.graphics.getWidth() - 100)		
			return true;
		return false;
	}
	public float GetTileSize()
	{
		if(pTileCamera != null)
			return pTileCamera.fViewZoom * 50.0f;
		else
			return 50.0f;
	}
	public int[] CoordsToXY(int cordX,int cordY)
	{	         
        int offx = TILE_WIDTH / 2;
        int offy = TILE_HEIGHT / 2;
        offx+=pTileCamera.GetX();
        offy+=pTileCamera.GetY();
        int x = cordX -cordY;
        int y = cordX + cordY;
        x = x * TILE_WIDTH / 2;
        y = y * TILE_HEIGHT / 2;
        x+=offx;
        y+=offy;
	        
		int[] xy = new int[2];
	    xy[0] = x;
	    xy[1] = y;
	    
	    return xy;	
	}
	public int getClosestTile(float x,float y)
	{		
		y = Gdx.graphics.getHeight() - y;
		x*=1/pTileCamera.fViewZoom;
		y*=1/pTileCamera.fViewZoom;
	    x-=TILE_WIDTH/2;
	    y+=TILE_WIDTH/2;
	    x+=TILE_WIDTH>>1;
        int offx = TILE_WIDTH / 2;
        int offy = TILE_HEIGHT / 2;
        offx+=pTileCamera.GetX();
        offy+=pTileCamera.GetY();
	    y-=offy;
	    x-=offx;
	    int y1=(int) (y*2-x);
	    int x1=(int) (x*2+y1);
	    x1/=TILE_WIDTH;
	    y1/=TILE_WIDTH;
	    
	    return x1 + (y1*TILES_WIDTH);
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

	public objectLoadingManager getLoadingManager() 
	{
		return pLoadingManager;
	}

	public void setLoadingManager(objectLoadingManager pLoadingManager) 
	{
		this.pLoadingManager = pLoadingManager;
	}

	public void Scroll(int x, int y) 
	{
		pTileCamera.AddScroll(x,y);		
	}
	
	public void CloseWindow()
	{
		pWindow.destroy();
		pWindow = null;
	}

	public void SaveMap() 
	{
		String sMap = GenerateTileString();
		FileHandle file = Gdx.files.external("Map.foe");
		OutputStream out = file.write(false);
		try 
		{
			for(int i = 0; i < sMap.length(); i++)
				out.write(sMap.charAt(i));
		} 
		catch (IOException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			try 
			{
				out.close();
			} 
			catch (IOException e) 
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		String sPopUp = "Map Saved [";
		sPopUp+=file.length();
		sPopUp+=" bytes ]";
		pWindow			= new FoeUiBase();
		pWindow.initUi(pMyAssets,this,Gdx.graphics.getWidth()*0.5f,Gdx.graphics.getHeight()*0.5f,"Saved Map",sPopUp);
	}

	public void LoadMap() 
	{
		FileHandle file = Gdx.files.external("Map.foe");
		String sLoadedMap = file.readString();
		
		int iLastComma			= 0;
		int	iTileIndex			= 0;

		for(int i = 1; i < sLoadedMap.length();i++)
		{
			if(sLoadedMap.charAt(i) == ',')
			{
				Boolean bSetToLand = sLoadedMap.charAt(iLastComma+1) == '1';
				int iAmount= Integer.parseInt(sLoadedMap.substring(iLastComma+2, i));
				for(int j = 0; j <= iAmount; j++)
				{
					vTiles.get(j+iTileIndex).bIsLand = bSetToLand;
				}
				iTileIndex+=iAmount;
				iLastComma = i;
			}
		}
		getLoadingManager().ReFixTiles();
		String sPopUp = "Map Loaded [";
		sPopUp+=file.length();
		sPopUp+=" bytes ]";
		pWindow			= new FoeUiBase();
		pWindow.initUi(pMyAssets,this,Gdx.graphics.getWidth()*0.5f,Gdx.graphics.getHeight()*0.5f,"Loaded Map",sPopUp);
	}

	public String GenerateTileString()
	{
		String sSaveString 	= ",";
		boolean bLastLand 	= false;
		int		iCount 		= 1;
		
		if(vTiles.get(0).bIsLand)
		{
			bLastLand = true;
		}
		for(int i = 1; i < vTiles.size()-1;i++)
		{
			if(vTiles.get(i).bIsLand && bLastLand)			// Matching add to counter
				iCount++;	
			else if(!vTiles.get(i).bIsLand && !bLastLand)	// Matching add to counter
				iCount++;
			else											// NOT matching finish count
			{
				if(bLastLand)
				{
					sSaveString+="1";
				}
				else
				{
					sSaveString+="0";
				}
				sSaveString+=iCount;
				sSaveString+=",";
				iCount = 1;
				bLastLand = !bLastLand;
			}
		}
		
		return sSaveString;	
	}

	public void SetBrush(int iNewBrush,int iNewCountry) 
	{
		if(iBrush == i && iNewCountry == iCountry)
			iBrush = 0;
		else
			iBrush = i;
	}
}
