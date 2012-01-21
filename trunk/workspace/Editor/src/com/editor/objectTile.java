package com.editor;

import java.util.ArrayList;
import java.util.Random;

import com.badlogic.gdx.Gdx;
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
	private int					iTileType;
	private int[][]				mFriends;
	private ArrayList<int[][]>	mTilePresets;
	
	public objectTile(int iTilePosX,int iTilePosY)
	{
		texture = new Texture(Gdx.files.internal("res/tiles/tile_grass_01.png"));
		
		cordX 			= iTilePosX;
		cordY 			= iTilePosY;
		mFriends 		= new int[3][3];
		mTilePresets	= new ArrayList<int[][]>();
		
		// Add the presets to the list
		int[][]	mPresetA = {{0,0,0},{0,1,0},{0,0,0}}; // this one is un-used since 0 means water
		mTilePresets.add(mPresetA);
		int[][]	mPresetB = {{1,1,1},{1,0,1},{1,1,1}}; // land on all sides
		mTilePresets.add(mPresetB);
		int[][]	mPresetC = {{0,0,0},{0,0,0},{0,0,0}}; // water on all sides
		mTilePresets.add(mPresetC);
		int[][]	mPresetD = {{0,1,0},{0,0,0},{0,0,0}}; // land at 0 clock
		mTilePresets.add(mPresetD);
		int[][]	mPresetE = {{0,1,0},{0,0,0},{0,1,0}}; // land at 0 and 4 clock
		mTilePresets.add(mPresetE);
	}

	public void setTileType(int iNewTileType)
	{
		iTileType = iNewTileType;
		
		if(getTileType() > 0 )
		{
			int xSpace = getTileType() * 50;
			int ySpace = 0;
			region	= new TextureRegion(texture,xSpace,ySpace,50,50);
		}
	}
	public void render(SpriteBatch SpriteDrawer)
	{
		if(getTileType() > 0)
		{
			SpriteDrawer.draw(region, cordX*50, cordY*50);
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
			mFriends[1][0] = bIsLand;
			break;
		case 1:
			mFriends[2][0] = bIsLand;
			break;	
		case 2:
			mFriends[2][1] = bIsLand;
			break;
		case 3:
			mFriends[2][2] = bIsLand;
			break;
		case 4:
			mFriends[1][2] = bIsLand;
			break;
		case 5:
			mFriends[0][2] = bIsLand;
			break;
		case 6:
			mFriends[0][1] = bIsLand;
			break;
		case 7:
			mFriends[0][0] = bIsLand;
			break;
		}
	}
	void FindMatchingTiles(int myIndex)
	{
		if(iTileType != 0)
		{
			myIndex = 10;
		}
		for(int i = 0; i < mTilePresets.size(); i++)
		{
			Boolean bMatch = true;
			
			for(int j = 0; j < 3; j++)
			{
				for(int k = 0; k < 3; k++)
				{
					if(mTilePresets.get(i)[j][k] != mFriends[j][k])
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
