package com.editor;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.BitmapFont;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;

public class objectText extends object
{
	String 		sDrawString;
	BitmapFont 	font;
	
	public objectText(String string) 
	{
		sDrawString = string;
		font = new BitmapFont();
		font.setColor(Color.WHITE);
	}
	public void SetDrawString(String sNewString)
	{
		sDrawString = sNewString;
	}
	public void render(SpriteBatch SpriteDrawer)
	{
		font.draw(SpriteDrawer, sDrawString, 0, Gdx.graphics.getHeight());
	}
}
