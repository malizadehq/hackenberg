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
		
		Button AddTiles = new Button("Add Tile",sSkin);
		AddTiles.x = Gdx.graphics.getWidth() - 100;
		AddTiles.y = Gdx.graphics.getHeight() - 50;
		AddTiles.width = 100;
		AddTiles.height = 40;
		AddTiles.setClickListener(new ClickListener() 
		{
			@Override
			public void click(Actor arg0) 
			{
				pMainEditor.AddTile();
			}			
		});
		pMainEditor.getStage().addActor(AddTiles);
		
		Button RemTiles = new Button("Rem Tile",sSkin);
		RemTiles.x = Gdx.graphics.getWidth() - 100;
		RemTiles.y = Gdx.graphics.getHeight() - 100;
		RemTiles.width = 100;
		RemTiles.height = 40;
		RemTiles.setClickListener(new ClickListener() 
		{
			@Override
			public void click(Actor arg0) 
			{
				pMainEditor.RemTile();
			}			
		});
		pMainEditor.getStage().addActor(RemTiles);
		
		Button ToggleGrid = new Button("Toggle Grid",sSkin);
		ToggleGrid.x = Gdx.graphics.getWidth() - 100;
		ToggleGrid.y = Gdx.graphics.getHeight() - 300;
		ToggleGrid.width = 100;
		ToggleGrid.height = 40;
		ToggleGrid.setClickListener(new ClickListener() 
		{
			@Override
			public void click(Actor arg0) 
			{
				pMainEditor.ToggleGrid();
			}			
		});
		pMainEditor.getStage().addActor(ToggleGrid);    
	}
}
