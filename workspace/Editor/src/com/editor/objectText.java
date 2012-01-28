package com.editor;

import com.badlogic.gdx.graphics.g2d.BitmapFont;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;

public class objectText extends object
{
	String 		sDrawString;
	BitmapFont 	font;
	float		xPos;
	float		yPos;
	BitmapFont	pFont; 
	
	public objectText(String string,float xNewPos,float yNewPos,BitmapFont pNewFont) 
	{
		sDrawString = string;
		font = pNewFont;
		xPos = xNewPos;
		yPos = yNewPos;
	}
	public void SetDrawString(String sNewString)
	{
		sDrawString = sNewString;
	}
	public void render(SpriteBatch SpriteDrawer)
	{
		font.draw(SpriteDrawer, sDrawString, xPos, yPos);
	}
}
