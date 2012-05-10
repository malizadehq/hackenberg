package com.editor;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;

enum eLoadingState
{
	eAssets,
	eGeneratingGrid,
	eGeneratingTiles,
	eFixupTiles,
	eDone
};

public class objectLoadingManager 
{
	private TileEditor 		pOwner;
	private eLoadingState	LoadingState;
	private objectText		pLoadingText;
	private int				iStartIndex;
	
	objectLoadingManager(TileEditor pOwner)
	{
		this.pOwner 	= pOwner;
		LoadAssets();
		pLoadingText 	= new objectText("Loading assets",0f,Gdx.graphics.getHeight()*0.5f,pOwner.pMyAssets.pixelFont);
		iStartIndex 	= 0;
		LoadingState	= eLoadingState.eAssets;
	}
	
	Boolean DoLoading(SpriteBatch spriteDrawer)
	{
		switch(LoadingState)
		{
		case eAssets:
			LoadingState = eLoadingState.eGeneratingGrid;
			pOwner.pGrid = new objectGrid(pOwner);
			pLoadingText.render(spriteDrawer);
			return true;
		case eGeneratingGrid:
			GenerateGrid();
			pLoadingText.render(spriteDrawer);
			return true;
		case eGeneratingTiles:
			GenerateTiles();
			pLoadingText.render(spriteDrawer);
			return true;
		case eFixupTiles:
			FixupTiles();
			pLoadingText.render(spriteDrawer);
			return true;
		case eDone:
			return false;
		}
		return false;
	}
	void LoadAssets()
	{
		pOwner.pTileCamera 		= new objectTileCamera(pOwner);	
		pOwner.pMyAssets 		= new assets();
		pOwner.pMyAssets.load();
		pOwner.pSideBar 		= new objectUiSideBar(pOwner); 
	}
	void GenerateGrid()
	{
		pLoadingText.SetDrawString("Loading Grid");
		LoadingState = eLoadingState.eGeneratingTiles;
		pOwner.pGrid.MakeGrid(pOwner.pMyAssets);
	}
	void GenerateTiles()
	{
		pLoadingText.SetDrawString("Loading Tiles [ "+iStartIndex*TileEditor.TILES_WIDTH+" / "+TileEditor.TILES_HEIGHT*TileEditor.TILES_WIDTH+" ]");
		
		for(int y = iStartIndex; y < TileEditor.TILES_HEIGHT;y++)
		{
			for(int x = 0; x < TileEditor.TILES_WIDTH;x++)
			{
				int iPixelValue = pOwner.pMyAssets.MapPixmap.getPixel(x, TileEditor.TILES_HEIGHT - y - 1);
				
				objectTile newTile = null;
				newTile = new objectTile(x,y,(iPixelValue > 0),pOwner);
				
				if(pOwner.pMyAssets.MapPixmap_Borders_A.getPixel(x, TileEditor.TILES_HEIGHT - y - 1) > 0)
					newTile.setCountryID(1);
				pOwner.addTile(newTile);
			}
			iStartIndex++;
			return;
		}
		
		LoadingState = eLoadingState.eFixupTiles;
		iStartIndex = 0;
	}
	void FixupTiles()
	{
		int iNrFixed = 0;
		
		pLoadingText.SetDrawString("Fixing Tiles [ "+iStartIndex+" / "+pOwner.GetNrTiles()+" ]");
		
		for(int i = iStartIndex; i < pOwner.GetNrTiles();i++)
		{
			if(pOwner.GetTile(i).bIsLand)
			{
				for(int j = 0; j < 4; j++)
				{
					pOwner.GetTile(i).FriendIsLand( j,pOwner.IsLand(pOwner.FriendToIndex(i,j)) );
				}
				pOwner.GetTile(i).FindMatchingTiles();
			}
			
			if(pOwner.GetTile(i).getCountryID() != 0)
			{
				for(int j = 0; j < 4; j++)
				{
					pOwner.GetTile(i).FriendIsSameCountry( j,pOwner.IsCountry(pOwner.FriendToIndex(i,j),pOwner.GetTile(i).getCountryID()) );
				}
				pOwner.GetTile(i).FindMatchingBorders();
			}
			
			iNrFixed++;
			iStartIndex++;
			
			if(iNrFixed > 100)
				return;
		}
		
		pLoadingText.SetDrawString("Fixup Tiles");
		LoadingState = eLoadingState.eDone;
	}
	public void ReFixTiles()
	{
		LoadingState 	= eLoadingState.eFixupTiles;
		iStartIndex 	= 0;
	}
}
