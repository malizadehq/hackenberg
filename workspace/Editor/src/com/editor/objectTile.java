package com.editor;

import java.util.ArrayList;
import java.util.Random;
import java.util.logging.FileHandler;
import java.util.logging.LogRecord;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.backends.openal.Wav.Sound;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.math.Matrix3;
import com.badlogic.gdx.math.Vector2;
    
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
	
	public objectTile(int iTilePosX,int iTilePosY,Boolean bLand)
	{
		bIsLand = bLand;
		if(!bIsLand)
			return; 		// Water currently only blue so
		
		pCreateSound = (Sound) Gdx.audio.newSound(Gdx.files.internal("res/sound/blip.wav"));
		texture = new Texture(Gdx.files.internal("res/tiles/tile_grass_01.png"));
		region	= new TextureRegion(texture,50,0,50,50);
		
		cordX 			= iTilePosX;
		cordY 			= iTilePosY;

		fPosX			= cordX * 50;
		fPosY			= cordY * 50;
		
		Random Rand = new Random();
		fLandingTimerMax	= cordY*0.1f;
		fLandingTimerMax	+= cordX*0.1f;
		fLandingTimer		= 0.0f;
		
		mFriends 		= new int[3][3];
		mTilePresets	= new ArrayList<int[][]>();
		
		// Add the presets to the list
		int[][]	mPresetA = {{0,0,0},{0,0,0},{0,0,0}}; // water on all sides
		mTilePresets.add(mPresetA); // 0
		int[][]	mPresetB = {{0,1,0},{1,0,1},{0,1,0}}; // land on all sides
		mTilePresets.add(mPresetB); // 1
		int[][]	mPresetC = {{0,1,0},{0,0,0},{0,0,0}}; // water on all sides but bottom
		mTilePresets.add(mPresetC); // 2
		int[][]	mPresetD = {{0,0,0},{0,0,0},{0,1,0}}; // water on all sides but top
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
		if(fLandingTimer >= fLandingTimerMax)
			return;
		
		fLandingTimer += fDeltaTime;
		
		float fPct		= fLandingTimer/fLandingTimerMax;
		fPosY			= (cordY * 50.0f);
		fPosY			+= Gdx.graphics.getHeight() - (Gdx.graphics.getHeight()*fPct);
		
		if(fLandingTimer >= fLandingTimerMax)
		{
			PlayLandedSound();
			fPosY = cordY * 50;
		}
	}
	public void PlayLandedSound()
	{
		pCreateSound.play(0.1f);
	}
	public void render(SpriteBatch SpriteDrawer)
	{
		if(bIsLand)
		{
			TickLanding(Gdx.graphics.getDeltaTime());
			SpriteDrawer.draw(region, fPosX, fPosY);
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
		if(bIsLand == 1)
			iClock = iClock;
	}
	void FindMatchingTiles()
	{
		if(!bIsLand)
			return;
		
		for(int i = 0; i < mTilePresets.size(); i++)
		{
			Boolean bMatch = true;
			
			for(int y = 0; y < 3; y++)
			{
				for(int x = 0; x < 3; x++)
				{
					if(mTilePresets.get(i)[y][x] != mFriends[y][x])
					{
						bMatch = false;
					}
				}
			}
			if(bMatch)
			{
				setTileType(i);
				return;
			}
			
		}
	}
}
