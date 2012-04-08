package com.editor;

import com.badlogic.gdx.graphics.g2d.BitmapFont;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.scenes.scene2d.ui.Button;
import com.badlogic.gdx.scenes.scene2d.ui.Skin;

public class FoeButton extends Button 
{
	protected TextureRegion 	UnPressed;
	protected TextureRegion 	Pressed;
	private BitmapFont			myFont;
	private BitmapFont			myFontPressed;
	private String				myLabel;
	public 	Boolean				bToggleButton;
	public 	Boolean				bToggled;
	
	protected TextureRegion 	UL,UM,UR,ML,MM,MR,LL,LM,LR;
	protected TextureRegion 	UL_P,UM_P,UR_P,ML_P,MM_P,MR_P,LL_P,LM_P,LR_P;
	
	public FoeButton(String text, Skin skin) 
	{
		super(text, skin);
	}

	public void initTexture(assets myAssets,String sText)
	{
		initTexture(myAssets,sText,0.0f);
	}
	public void initTexture(assets myAssets,String sText,float fFixedWidth)
	{
		Pressed			= new TextureRegion(myAssets.pEditorUiTexture,0,0,103,32);
		UnPressed		= new TextureRegion(myAssets.pEditorUiTexture,0,32,103,32);
		myFont			= myAssets.pixelHeaderFont;
		myFontPressed	= myAssets.pixelMainFont;
		myLabel 		= sText;
		
		if(fFixedWidth == 0.0f)
		{
			width 			= myLabel.length() * myFont.getSpaceWidth();
			width*=0.5f;
		}
		else
			width = fFixedWidth;
		
		width+=32;		// Padding
		height 			= 34;
		
		isPressed		= false;
		bToggled		= false;
		bToggleButton	= false;
		
		UL	= new TextureRegion(myAssets.pEditorUiTiles,0,34,6,6);
		UM	= new TextureRegion(myAssets.pEditorUiTiles,6,34,6,6);
		UR	= new TextureRegion(myAssets.pEditorUiTiles,12,34,6,6);
		ML	= new TextureRegion(myAssets.pEditorUiTiles,0,40,6,6);
		MM	= new TextureRegion(myAssets.pEditorUiTiles,6,40,6,6);
		MR	= new TextureRegion(myAssets.pEditorUiTiles,12,40,6,6);
		LL	= new TextureRegion(myAssets.pEditorUiTiles,0,46,6,6);
		LM	= new TextureRegion(myAssets.pEditorUiTiles,6,46,6,6);
		LR	= new TextureRegion(myAssets.pEditorUiTiles,12,46,6,6);
		
		UL_P	= new TextureRegion(myAssets.pEditorUiTiles,0+18,34,6,6);
		UM_P	= new TextureRegion(myAssets.pEditorUiTiles,6+18,34,6,6);
		UR_P	= new TextureRegion(myAssets.pEditorUiTiles,12+18,34,6,6);
		ML_P	= new TextureRegion(myAssets.pEditorUiTiles,0+18,40,6,6);
		MM_P	= new TextureRegion(myAssets.pEditorUiTiles,6+18,40,6,6);
		MR_P	= new TextureRegion(myAssets.pEditorUiTiles,12+18,40,6,6);
		LL_P	= new TextureRegion(myAssets.pEditorUiTiles,0+18,46,6,6);
		LM_P	= new TextureRegion(myAssets.pEditorUiTiles,6+18,46,6,6);
		LR_P	= new TextureRegion(myAssets.pEditorUiTiles,12+18,46,6,6);
	}

	public void fixPos(float fHeight,float fWidth,Boolean bFitRight)
	{
		if(bFitRight)
		{
			x += (fWidth/2) - width; 
			x -= 24;
		}
		else
		{
			x -= (fWidth/2);// + width; 
			x -= 3;
		}
		
		y-=fHeight/2;
		y+=height;
		y+=6;
	}
	public void draw (SpriteBatch batch, float parentAlpha) 
	{
		if(isPressed && bToggleButton)
			bToggled = !bToggled;
		
		if (isPressed || (bToggleButton && bToggled)) 
		{
			batch.draw(UL_P,x				,y+height);
			batch.draw(UM_P,x+6			,y+height,width,6);
			batch.draw(UR_P,x+width+6		,y+height);
			batch.draw(ML_P,x				,y,6,height);
			batch.draw(MM_P,x+6			,y,width,height);
			batch.draw(MR_P,x+width+6		,y,6,height);
			batch.draw(LL_P,x				,y-6);
			batch.draw(LM_P,x+6			,y-6,width,6);
			batch.draw(LR_P,x+width+6		,y-6);
			myFontPressed.draw(batch, myLabel, x+16, y+(height*0.5f)+(myFont.getCapHeight()/2));
		} 
		else 
		{
			batch.draw(UL,x				,y+height);
			batch.draw(UM,x+6			,y+height,width,6);
			batch.draw(UR,x+width+6		,y+height);
			batch.draw(ML,x				,y,6,height);
			batch.draw(MM,x+6			,y,width,height);
			batch.draw(MR,x+width+6		,y,6,height);
			batch.draw(LL,x				,y-6);
			batch.draw(LM,x+6			,y-6,width,6);
			batch.draw(LR,x+width+6		,y-6);
			myFont.draw(batch, myLabel, x+16, y+(height*0.5f)+(myFont.getCapHeight()/2));
		}
	}
}