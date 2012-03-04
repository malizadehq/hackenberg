package com.editor;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.g2d.BitmapFont;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.ui.Button;
import com.badlogic.gdx.scenes.scene2d.ui.ClickListener;
import com.badlogic.gdx.scenes.scene2d.ui.Skin;

public class FoeUiBase extends object 
{
	protected TextureRegion 	Top_UL,Top_UR,Top_M;
	protected TextureRegion 	Main_L,Main_R,Main_M,Main_LR,Main_LM,Main_LL;
	protected TextureRegion 	Pressed;
	private BitmapFont			myHeaderFont,myMainFont;
	private String				myHeaderLabel,myMainLabel;
	public	float				x,y;
	public	float				width,height;	
	public	FoeButton			pOkButton,pCancelButton;	
	public	TileEditor			pMainEditor;
	
	public void initUi(assets myAssets,final TileEditor pMainEditor,float x,float y,String label,String main)
	{
		this.x 	= x;
		this.y 	= y;
		
		this.pMainEditor = pMainEditor;
		
		myHeaderLabel 	= label;
		myMainLabel		= main;
		
		if(myMainLabel.length() > myHeaderLabel.length())
			width = myMainLabel.length() * 10;
		else
			width = myHeaderLabel.length() * 10;
		if(width > 400)
			width = 400;
		
		height = (myMainLabel.length() * 10)/width;
		height+=1;
		height*=18;
		// if button
		height+=50;
		this.x -= (width/2) + 9;
		this.y -= height/2;
		
		Top_UL	= new TextureRegion(myAssets.pEditorUiTiles,0,0,3,28);
		Top_M	= new TextureRegion(myAssets.pEditorUiTiles,3,0,3,28);
		Top_UR	= new TextureRegion(myAssets.pEditorUiTiles,6,0,3,28);
		
		Main_L	= new TextureRegion(myAssets.pEditorUiTiles,0,28,3,3);
		Main_M	= new TextureRegion(myAssets.pEditorUiTiles,3,28,3,3);
		Main_R	= new TextureRegion(myAssets.pEditorUiTiles,6,28,3,3);
		
		Main_LL	= new TextureRegion(myAssets.pEditorUiTiles,0,31,3,3);
		Main_LM	= new TextureRegion(myAssets.pEditorUiTiles,3,31,3,3);
		Main_LR	= new TextureRegion(myAssets.pEditorUiTiles,6,31,3,3);
		
		myHeaderFont 	= myAssets.pixelHeaderFont;
		myMainFont 		= myAssets.pixelMainFont;
		
		FileHandle fHandler 	= new FileHandle("res/skins/uiskin.json");
		FileHandle fHandlerB 	= new FileHandle("res/skins/uiskin.png");
		Skin sSkin = new Skin(fHandler, fHandlerB);
		
		pOkButton = new FoeButton("",sSkin);
		pOkButton.x = x;
		pOkButton.y = y;
		pOkButton.initTexture(myAssets,"I Know DO IT");
		pOkButton.fixPos(height, width,false);
		pOkButton.setClickListener(new ClickListener() 
		{
			@Override
			public void click(Actor arg0) 
			{
				pMainEditor.CloseWindow();
			}			
		});
		pMainEditor.getStage().addActor(pOkButton); 
	
		pCancelButton = new FoeButton("",sSkin);
		pCancelButton.x = x;
		pCancelButton.y = y;
		pCancelButton.initTexture(myAssets,"I like gay mm...gay");
		pCancelButton.fixPos(height, width,true);
		pCancelButton.setClickListener(new ClickListener() 
		{
			@Override
			public void click(Actor arg0) 
			{
				pMainEditor.CloseWindow();
			}			
		});
		pMainEditor.getStage().addActor(pCancelButton);
	}
	
	public void destroy()
	{
		pMainEditor.getStage().removeActor(pCancelButton);
		pMainEditor.getStage().removeActor(pOkButton);
	}
	
	public void render(SpriteBatch SpriteDrawer)
	{
		SpriteDrawer.draw(Main_L, 	x, 		y+29,3,height);
		SpriteDrawer.draw(Main_M, 	x+3,	y+29,width,height);
		SpriteDrawer.draw(Main_R, 	x+width,y+29,3,height);
		
		SpriteDrawer.draw(Top_UL, 	x, 		y+height+29);
		SpriteDrawer.draw(Top_M, 	x+3,	y+height+29,width,28);
		SpriteDrawer.draw(Top_UR, 	x+width,y+height+29);
				
		SpriteDrawer.draw(Main_LL, 	x, 		y+26);
		SpriteDrawer.draw(Main_LM, 	x+3,	y+26,width,3);
		SpriteDrawer.draw(Main_LR, 	x+width,y+26);
		
		myHeaderFont.draw(SpriteDrawer,myHeaderLabel,x+9,y+height+50);
		myMainFont.drawWrapped(SpriteDrawer,myMainLabel,x+9,y+height+26,width - 18);
	}
}