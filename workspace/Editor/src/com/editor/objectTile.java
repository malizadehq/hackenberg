package com.editor;

import java.util.ArrayList;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.backends.openal.Wav.Sound;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
    
public class objectTile extends object
{
	private Texture 			texture;
	private TextureRegion		region;	
	
	private int					cordX;	
	private int					cordY;
	
	private float				fPosX;
	private float				fPosY;
	
	private int					iTileType;
	private int[][]				mFriends;
	private ArrayList<int[][]>	mTilePresets;
	public Boolean				bIsLand;
	private Sound				pCreateSound;
	private float				fLandingTimer;
	private float				fLandingTimerMax;
	private TileEditor			pOwner;
	
	public objectTile(int iTilePosX,int iTilePosY,Boolean bLand,TileEditor pOwner)
	{
		bIsLand = bLand;
		
		this.pOwner		= pOwner;
		pCreateSound 	= pOwner.pMyAssets.pCreateSound;
		texture 		= pOwner.pMyAssets.pIsoTexture;
		region			= new TextureRegion(texture,0,0,68,68);
		
		cordX 			= iTilePosX;
		cordY 			= iTilePosY;

		fPosX			= cordX * 68;
		fPosY			= cordY * 32;
		
		//fLandingTimerMax	= cordY*0.01f;
		setLandingTimer(0.0f);
		
		mFriends 		= new int[3][3];
		mTilePresets	= new ArrayList<int[][]>();
		
		if(!bIsLand)
			return; 		// Water currently only blue so
		
		// Add the presets to the list
		int[][]	mPresetA = {{0,0,0},{0,0,0},{0,0,0}}; // water on all sides
		mTilePresets.add(mPresetA); // 0
		int[][]	mPresetB = {{0,1,0},{1,0,1},{0,1,0}}; // land on all sides
		mTilePresets.add(mPresetB); // 1
		int[][]	mPresetC = {{0,0,0},{0,0,0},{0,1,0}}; // water on all sides but bottom
		mTilePresets.add(mPresetC); // 2
		int[][]	mPresetD = {{0,1,0},{0,0,0},{0,0,0}}; // water on all sides but top
		mTilePresets.add(mPresetD); // 3
		int[][]	mPresetE = {{0,1,0},{0,0,0},{0,1,0}}; // land at top and bottom
		mTilePresets.add(mPresetE); // 4
		int[][]	mPresetF = {{0,1,0},{1,0,1},{0,0,0}}; // land on all sides but bottom
		mTilePresets.add(mPresetF); // 5
		int[][]	mPresetG = {{0,0,0},{1,0,1},{0,1,0}}; // land on all sides but top
		mTilePresets.add(mPresetG); // 6
		int[][]	mPresetH = {{0,1,0},{0,0,1},{0,1,0}}; // land on all sides but left
		mTilePresets.add(mPresetH); // 7
		int[][]	mPresetI = {{0,1,0},{1,0,0},{0,1,0}}; // land on all sides but right
		mTilePresets.add(mPresetI); // 8
		int[][]	mPresetJ = {{0,0,0},{1,0,0},{0,1,0}}; // water top and right
		mTilePresets.add(mPresetJ); // 9
		int[][]	mPresetK = {{0,0,0},{0,0,1},{0,1,0}}; // water top and right
		mTilePresets.add(mPresetK); // 10
		int[][]	mPresetL = {{0,1,0},{1,0,0},{0,0,0}}; // water bottom and right
		mTilePresets.add(mPresetL); // 11
		int[][]	mPresetM = {{0,1,0},{0,0,1},{0,0,0}}; // water bottom and left
		mTilePresets.add(mPresetM); // 12
		int[][]	mPresetN = {{0,0,0},{0,0,1},{0,0,0}}; // land right
		mTilePresets.add(mPresetN); // 13
		int[][]	mPresetO = {{0,0,0},{1,0,1},{0,0,0}}; // land right and left
		mTilePresets.add(mPresetO); // 14
		int[][]	mPresetP = {{0,0,0},{1,0,0},{0,0,0}}; // land left
		mTilePresets.add(mPresetP); // 15
	}

	public int[] CoordsToXY()
	{
	    int totalRows 		= TileEditor.TILES_HEIGHT;
	    int totalColumns 	= TileEditor.TILES_WIDTH;
	    int width = (totalRows + totalColumns) * (68/2);
	         
	    int y = cordX*(34/2) + cordY*(34/2); 
	    int x = cordX*(68/2) - cordY*(68/2)+width/2;
		int[] xy = new int[2];
	    xy[0] = x;
	    xy[1] = y;
	         
	    xy[0] += pOwner.pTileCamera.GetX();
	    xy[1] += pOwner.pTileCamera.GetY();
	    return xy;	
	}
	public void setTileType(int iNewTileType)
	{
		iTileType = iNewTileType;
		
		int xSpace = getTileType() * 50;
		int ySpace = 0;
	
		if(bIsLand)
			region	= new TextureRegion(texture,xSpace,ySpace,50,50);
		else
			region	= new TextureRegion(texture,0,0,50,50);
	}
	public void TickLanding(float fDeltaTime)
	{
		if(getLandingTimer() >= fLandingTimerMax)
			return;
		
		setLandingTimer(getLandingTimer() + fDeltaTime);
		
		float fPct		= getLandingTimer()/fLandingTimerMax;
		fPosY			= (GetCordY() * 50.0f);
		fPosY			+= Gdx.graphics.getHeight() - (Gdx.graphics.getHeight()*fPct);
		
		if(getLandingTimer() >= fLandingTimerMax)
		{
			PlayLandedSound();
			fPosY = GetCordY() * 50;
		}
	}
	public int GetCordX()
	{
		return cordX/* - pOwner.pTileCamera.getxPos()*/;
	}
	public int GetCordY()
	{
		return cordY/* - pOwner.pTileCamera.getyPos()*/;
	}
	public void PlayLandedSound()
	{
		pCreateSound.play(0.1f);
	}
	public void render(SpriteBatch SpriteDrawer)
	{
		if(bIsLand)
		{
			int[] pos = CoordsToXY(); 
			SpriteDrawer.draw(region, pos[0], pos[1]);
		}
	}
	public int getTileType() 
	{
		return iTileType;
	}

	public void FriendIsLand(int iClock,int bIsLand)
	{
		switch(iClock)
		{
		case 0:
			mFriends[0][1] = bIsLand;
			break;
		case 1:
			mFriends[1][2] = bIsLand;
			break;	
		case 2:
			mFriends[2][1] = bIsLand;
			break;
		case 3:
			mFriends[1][0] = bIsLand;
			break;
		}
	}

	void FindMatchingTiles()
	{
		if(!bIsLand || bIsLand)
			return;
		
		for(int i = 0; i < mTilePresets.size(); i++)
		{
			Boolean bMatch = true;
			
			if(mTilePresets.get(i)[0][1] != mFriends[0][1]
			|| mTilePresets.get(i)[1][0] != mFriends[1][0]
			|| mTilePresets.get(i)[1][2] != mFriends[1][2]
			|| mTilePresets.get(i)[2][1] != mFriends[2][1])
			{
				bMatch = false;
			}
			if(bMatch)
			{
				setTileType(i);
				break;
			}
		}
		AddCorners();
	}
	void AddCorners()
	{
		
	}
	
	public float getLandingTimer() 
	{
		return fLandingTimer;
	}

	public void setLandingTimer(float fLandingTimer) 
	{
		this.fLandingTimer = fLandingTimer;
	}
}
