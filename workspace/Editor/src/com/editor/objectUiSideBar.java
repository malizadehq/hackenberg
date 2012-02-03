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
		NewBtn.x = Gdx.graphics.getWidth() - 100;
		NewBtn.y = Gdx.graphics.getHeight() - 50;
		NewBtn.initTexture(pMainEditor.pMyAssets,"Add Tile");
		NewBtn.setClickListener(new ClickListener() 
		{
			@Override
			public void click(Actor arg0) 
			{
				pMainEditor.AddTile();
			}			
		});
		pMainEditor.getStage().addActor(NewBtn);
		
		NewBtn = new FoeButton("Rem Tile",sSkin);
		NewBtn.x = Gdx.graphics.getWidth() - 100;
		NewBtn.y = Gdx.graphics.getHeight() - 100;
		NewBtn.initTexture(pMainEditor.pMyAssets,"Rem Tile");
		NewBtn.setClickListener(new ClickListener() 
		{
			@Override
			public void click(Actor arg0) 
			{
				pMainEditor.RemTile();
			}			
		});
		pMainEditor.getStage().addActor(NewBtn);
		
		NewBtn = new FoeButton("Fixup",sSkin);
		NewBtn.x = Gdx.graphics.getWidth() - 100;
		NewBtn.y = Gdx.graphics.getHeight() - 150;
		NewBtn.initTexture(pMainEditor.pMyAssets,"Fixup");
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
		NewBtn.x = Gdx.graphics.getWidth() - 100;
		NewBtn.y = Gdx.graphics.getHeight() - 300;
		NewBtn.initTexture(pMainEditor.pMyAssets,"Toggle Grid");
		NewBtn.setClickListener(new ClickListener() 
		{
			@Override
			public void click(Actor arg0) 
			{
				pMainEditor.ToggleGrid();
			}			
		});
		pMainEditor.getStage().addActor(NewBtn);        

		FoeButtonIcon NewBtnIcon = new FoeButtonIcon("",sSkin);
		NewBtnIcon.x = Gdx.graphics.getWidth() - 32;
		NewBtnIcon.y = 64;
		NewBtnIcon.initTexture(pMainEditor.pMyAssets,0,64);
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
		NewBtnIcon.x = Gdx.graphics.getWidth() - 64;
		NewBtnIcon.y = 64;
		NewBtnIcon.initTexture(pMainEditor.pMyAssets,128,64);
		NewBtnIcon.setClickListener(new ClickListener() 
		{
			@Override
			public void click(Actor arg0) 
			{
				pMainEditor.Scroll(0,-68);
			}			
		});
		pMainEditor.getStage().addActor(NewBtnIcon);
		
		NewBtnIcon = new FoeButtonIcon("",sSkin);
		NewBtnIcon.x = Gdx.graphics.getWidth() - 96;
		NewBtnIcon.y = 64;
		NewBtnIcon.initTexture(pMainEditor.pMyAssets,64,64);
		NewBtnIcon.setClickListener(new ClickListener() 
		{
			@Override
			public void click(Actor arg0) 
			{
				pMainEditor.Zoom(false);
			}				
		});
		pMainEditor.getStage().addActor(NewBtnIcon);
   
		NewBtnIcon = new FoeButtonIcon("",sSkin);
		NewBtnIcon.x = Gdx.graphics.getWidth() - 64;
		NewBtnIcon.y = 32;
		NewBtnIcon.initTexture(pMainEditor.pMyAssets,64,96);
		NewBtnIcon.setClickListener(new ClickListener() 
		{
			@Override
			public void click(Actor arg0) 
			{
				pMainEditor.Scroll(0,68);
			}			
		});
		pMainEditor.getStage().addActor(NewBtnIcon);
		
		NewBtnIcon = new FoeButtonIcon("",sSkin);
		NewBtnIcon.x = Gdx.graphics.getWidth()-96;
		NewBtnIcon.y = 32;
		NewBtnIcon.initTexture(pMainEditor.pMyAssets,0,96);
		NewBtnIcon.setClickListener(new ClickListener() 
		{
			@Override
			public void click(Actor arg0) 
			{
				pMainEditor.Scroll(68,0);
			}			
		});
		pMainEditor.getStage().addActor(NewBtnIcon);
		
		NewBtnIcon = new FoeButtonIcon("",sSkin);
		NewBtnIcon.x = Gdx.graphics.getWidth()-32;
		NewBtnIcon.y = 32;
		NewBtnIcon.initTexture(pMainEditor.pMyAssets,128,96);
		NewBtnIcon.setClickListener(new ClickListener() 
		{
			@Override
			public void click(Actor arg0) 
			{
				pMainEditor.Scroll(-68,0);
			}			
		});
		pMainEditor.getStage().addActor(NewBtnIcon);
	}
}
