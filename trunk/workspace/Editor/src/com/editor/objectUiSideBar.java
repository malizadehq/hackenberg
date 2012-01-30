package com.editor;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.ui.Button;
import com.badlogic.gdx.scenes.scene2d.ui.ClickListener;
import com.badlogic.gdx.scenes.scene2d.ui.Skin;

public class objectUiSideBar
{	
	objectUiSideBar(final TileEditor pMainEditor)
	{
		FileHandle fHandler 	= new FileHandle("res/skins/uiskin.json");
		FileHandle fHandlerB 	= new FileHandle("res/skins/uiskin.png");
		Skin sSkin = new Skin(fHandler, fHandlerB);
		
		FoeButton AddTiles = new FoeButton("Add Tile",sSkin);
		AddTiles.x = Gdx.graphics.getWidth() - 100;
		AddTiles.y = Gdx.graphics.getHeight() - 50;
		AddTiles.initTexture(pMainEditor.pMyAssets,"Add Tile");
		AddTiles.setClickListener(new ClickListener() 
		{
			@Override
			public void click(Actor arg0) 
			{
				pMainEditor.AddTile();
			}			
		});
		pMainEditor.getStage().addActor(AddTiles);
		
		FoeButton RemTiles = new FoeButton("Rem Tile",sSkin);
		RemTiles.x = Gdx.graphics.getWidth() - 100;
		RemTiles.y = Gdx.graphics.getHeight() - 100;
		RemTiles.initTexture(pMainEditor.pMyAssets,"Rem Tile");
		RemTiles.setClickListener(new ClickListener() 
		{
			@Override
			public void click(Actor arg0) 
			{
				pMainEditor.RemTile();
			}			
		});
		pMainEditor.getStage().addActor(RemTiles);
		
		FoeButton FixTiles = new FoeButton("Fixup",sSkin);
		FixTiles.x = Gdx.graphics.getWidth() - 100;
		FixTiles.y = Gdx.graphics.getHeight() - 150;
		FixTiles.initTexture(pMainEditor.pMyAssets,"Fixup");
		FixTiles.setClickListener(new ClickListener() 
		{
			@Override
			public void click(Actor arg0) 
			{
				pMainEditor.getLoadingManager().ReFixTiles();
			}			
		});
		pMainEditor.getStage().addActor(FixTiles);
		
		FoeButton ToggleGrid = new FoeButton("Toggle Grid",sSkin);
		ToggleGrid.x = Gdx.graphics.getWidth() - 100;
		ToggleGrid.y = Gdx.graphics.getHeight() - 300;
		ToggleGrid.initTexture(pMainEditor.pMyAssets,"Toggle Grid");
		ToggleGrid.setClickListener(new ClickListener() 
		{
			@Override
			public void click(Actor arg0) 
			{
				pMainEditor.ToggleGrid();
			}			
		});
		pMainEditor.getStage().addActor(ToggleGrid);    
		
		FoeButton ZoomIn = new FoeButton("Zoom In",sSkin);
		ZoomIn.x = Gdx.graphics.getWidth() - 100;
		ZoomIn.y = Gdx.graphics.getHeight() - 250;
		ZoomIn.initTexture(pMainEditor.pMyAssets,"Zoom In");
		ZoomIn.setClickListener(new ClickListener() 
		{
			@Override
			public void click(Actor arg0) 
			{
				pMainEditor.Zoom(true);
			}			
		});
		pMainEditor.getStage().addActor(ZoomIn);    
		
		FoeButton ZoomOut = new FoeButton("Zoom Out",sSkin);
		ZoomOut.x = Gdx.graphics.getWidth() - 100;
		ZoomOut.y = Gdx.graphics.getHeight() - 200;
		ZoomOut.initTexture(pMainEditor.pMyAssets,"Zoom Out");
		ZoomOut.setClickListener(new ClickListener() 
		{
			@Override
			public void click(Actor arg0) 
			{
				pMainEditor.Zoom(false);
			}			
		});
		pMainEditor.getStage().addActor(ZoomOut);      

	}
}
