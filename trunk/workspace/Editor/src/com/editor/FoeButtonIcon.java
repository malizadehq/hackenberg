package com.editor;

import com.badlogic.gdx.graphics.g2d.BitmapFont;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.scenes.scene2d.ui.Button;
import com.badlogic.gdx.scenes.scene2d.ui.Skin;

public class FoeButtonIcon extends Button 
{
	protected TextureRegion 	UnPressed;
	protected TextureRegion 	Pressed;
	
	protected TextureRegion 	UnPressedIcon;
	protected TextureRegion 	PressedIcon;
	
	public FoeButtonIcon(String text, Skin skin) 
	{
		super(text, skin);
	}

	public void initTexture(assets myAssets,int iIconIndex)
	{
		Pressed			= new TextureRegion(myAssets.pButtonsTexture,64,0,64,64);
		UnPressed		= new TextureRegion(myAssets.pButtonsTexture,0,0,64,64);
		PressedIcon		= new TextureRegion(myAssets.pIconsTexture,0,64*iIconIndex,64,64);
		UnPressedIcon	= new TextureRegion(myAssets.pIconsTexture,64,64*iIconIndex,64,64);
		width 			= 64;
		height 			= 64;
		isPressed		= false;
	}

	public void draw (SpriteBatch batch, float parentAlpha) 
	{	
		if (isPressed) 
		{
			batch.draw(Pressed, x, y);
			batch.draw(PressedIcon, x, y);
		} 
		else 
		{
			batch.draw(UnPressed, x, y);
			batch.draw(UnPressedIcon, x, y);
		}
	}
}