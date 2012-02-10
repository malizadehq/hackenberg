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
	private String				myLabel;
	public 	Boolean				bToggleButton;
	public 	Boolean				bToggled;
	
	public FoeButton(String text, Skin skin) 
	{
		super(text, skin);
	}

	public void initTexture(assets myAssets,String sText)
	{
		Pressed		= new TextureRegion(myAssets.pEditorUiTexture,0,0,103,32);
		UnPressed	= new TextureRegion(myAssets.pEditorUiTexture,0,32,103,32);
		myFont		= myAssets.pixelFontButton;
		myLabel 	= sText;
		width 		= 103;
		height 		= 32;
		isPressed	= false;
		bToggled	= false;
		bToggleButton	= false;
	}

	public void draw (SpriteBatch batch, float parentAlpha) 
	{
		if(isPressed && bToggleButton)
			bToggled = !bToggled;
		
		if (isPressed || (bToggleButton && bToggled)) 
		{
			batch.draw(Pressed, x, y);
		} 
		else 
		{
			batch.draw(UnPressed, x, y);
		}
		myFont.draw(batch, myLabel, x+4, y+(height*0.5f)+8);
	}
}