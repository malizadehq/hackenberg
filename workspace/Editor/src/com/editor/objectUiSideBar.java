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
		
		FoeButton NewBtn = new FoeButton("Add Tile",sSkin);
		NewBtn.x = Gdx.graphics.getWidth() - 120;
		NewBtn.y = Gdx.graphics.getHeight() - 50;
		NewBtn.initTexture(pMainEditor.pMyAssets,"Add Tile",70.0f);
		NewBtn.bToggleButton = true;
		NewBtn.setClickListener(new ClickListener() 
		{
			@Override
			public void click(Actor arg0) 
			{
				pMainEditor.SetEditMode("Add");
			}			
		});
		pMainEditor.getStage().addActor(NewBtn);
		
		NewBtn = new FoeButton("Rem Tile",sSkin);
		NewBtn.x = Gdx.graphics.getWidth() - 120;
		NewBtn.y = Gdx.graphics.getHeight() - 100;
		NewBtn.initTexture(pMainEditor.pMyAssets,"Rem Tile",70.0f);
		NewBtn.bToggleButton = true;
		NewBtn.setClickListener(new ClickListener() 
		{
			@Override
			public void click(Actor arg0) 
			{
				pMainEditor.SetEditMode("Rem");
			}			
		});
		pMainEditor.getStage().addActor(NewBtn);
		
		NewBtn = new FoeButton("Fixup",sSkin);
		NewBtn.x = Gdx.graphics.getWidth() - 120;
		NewBtn.y = Gdx.graphics.getHeight() - 150;
		NewBtn.initTexture(pMainEditor.pMyAssets,"Fixup",70.0f);
		NewBtn.setClickListener(new ClickListener() 
		{
			@Override
			public void click(Actor arg0) 
			{
				pMainEditor.getLoadingManager().ReFixTiles();
			}			
		});
		pMainEditor.getStage().addActor(NewBtn);
		
		NewBtn = new FoeButton("Toggle Grid",sSkin);
		NewBtn.x = Gdx.graphics.getWidth() - 120;
		NewBtn.y = Gdx.graphics.getHeight() - 200;
		NewBtn.initTexture(pMainEditor.pMyAssets,"Toggle Grid",70.0f);
		NewBtn.setClickListener(new ClickListener() 
		{
			@Override
			public void click(Actor arg0) 
			{
				pMainEditor.ToggleGrid();
			}			
		});
		pMainEditor.getStage().addActor(NewBtn);        

		NewBtn = new FoeButton("Save",sSkin);
		NewBtn.x = Gdx.graphics.getWidth() - 120;
		NewBtn.y = Gdx.graphics.getHeight() - 250;
		NewBtn.initTexture(pMainEditor.pMyAssets,"Save",70.0f);
		NewBtn.setClickListener(new ClickListener() 
		{
			@Override
			public void click(Actor arg0) 
			{
				pMainEditor.SaveMap();
			}			
		});
		pMainEditor.getStage().addActor(NewBtn);     
		
		NewBtn = new FoeButton("Load",sSkin);
		NewBtn.x = Gdx.graphics.getWidth() - 120;
		NewBtn.y = Gdx.graphics.getHeight() - 300;
		NewBtn.initTexture(pMainEditor.pMyAssets,"Load",70.0f);
		NewBtn.setClickListener(new ClickListener() 
		{
			@Override
			public void click(Actor arg0) 
			{
				pMainEditor.LoadMap();
			}			
		});
		pMainEditor.getStage().addActor(NewBtn);    
		
		FoeButtonIcon NewBtnIcon = new FoeButtonIcon("",sSkin);
		NewBtnIcon.x = Gdx.graphics.getWidth() - 60;
		NewBtnIcon.y = 64;
		NewBtnIcon.initTexture(pMainEditor.pMyAssets,0);
		NewBtnIcon.setClickListener(new ClickListener() 
		{
			@Override
			public void click(Actor arg0) 
			{
				pMainEditor.Zoom(true);
			}			
		});
		pMainEditor.getStage().addActor(NewBtnIcon);
		
		NewBtnIcon = new FoeButtonIcon("",sSkin);
		NewBtnIcon.x = Gdx.graphics.getWidth() - 120;
		NewBtnIcon.y = 64;
		NewBtnIcon.initTexture(pMainEditor.pMyAssets,1);
		NewBtnIcon.setClickListener(new ClickListener() 
		{
			@Override
			public void click(Actor arg0) 
			{
				pMainEditor.Zoom(false);
			}				
		});
		pMainEditor.getStage().addActor(NewBtnIcon);
   
	}
}
