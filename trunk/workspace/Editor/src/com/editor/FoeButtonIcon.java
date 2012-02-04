package com.editor;

import com.badlogic.gdx.audio.analysis.FFT;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.BitmapFont;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.scenes.scene2d.ui.Button;
import com.badlogic.gdx.scenes.scene2d.ui.Skin;

public class FoeButtonIcon extends FoeButton 
{
	public FoeButtonIcon(String text, Skin skin) {
		super(text, skin);
		// TODO Auto-generated constructor stub
	}

	public void initTexture(assets myAssets,int xCord,int yCord)
	{
		UnPressed	= new TextureRegion(myAssets.pEditorUiTexture,xCord,yCord,32,32);
		Pressed		= new TextureRegion(myAssets.pEditorUiTexture,xCord+32,yCord,32,32);
		width 		= 32;
		height 		= 32;
		isPressed	= false;
	}

	public void draw (SpriteBatch batch, float parentAlpha) 
	{
		if (isPressed) 
		{
			batch.draw(Pressed, x, y);
		} 
		else 
		{
			batch.draw(UnPressed, x, y);
		}
	}
}