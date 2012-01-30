package com.editor;

import com.badlogic.gdx.audio.analysis.FFT;
import com.badlogic.gdx.graphics.g2d.BitmapFont;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.scenes.scene2d.ui.Button;
import com.badlogic.gdx.scenes.scene2d.ui.Skin;

public class FoeButton extends Button 
{
	private TextureRegion 	UnPressed;
	private TextureRegion 	Pressed;
	private BitmapFont		myFont;
	private String			myLabel;
	
	public FoeButton(String text, Skin skin) 
	{
		super(text, skin);
	}

	public void initTexture(assets myAssets,String sText)
	{
		UnPressed	= new TextureRegion(myAssets.pEditorUiTexture,0,0,103,32);
		Pressed		= new TextureRegion(myAssets.pEditorUiTexture,0,32,103,32);
		myFont		= myAssets.pixelFontButton;
		myLabel 	= sText;
		width 		= 103;
		height 		= 32;
	}

	public void draw (SpriteBatch batch, float parentAlpha) 
	{
		if (isPressed) 
		{
			batch.draw(UnPressed, x, y);
		} 
		else 
		{
			batch.draw(Pressed, x, y);
		}
		myFont.draw(batch, myLabel, x+4, y+(height*0.5f)+8);
	}
}