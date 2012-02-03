package com.editor;

public class objectTileCamera 
{
	private int 		xPos;
	private int 		yPos;
	private int 		xPosTgt;
	private int 		yPosTgt;
	private float 		fSpeed;
	private TileEditor	pOwner;
	private float		fScrollSpeed;
	public  float		fViewZoom;
	
	objectTileCamera(TileEditor pOwner)
	{
		this.pOwner 	= pOwner;
		fScrollSpeed 	= 0.05f;	// max speed scroll
		fSpeed 		 	= 50.0f; 	// tween per sec 
		fViewZoom	 	= 1.0f;
		xPos = 0;
		yPos = 0;
	}
	public void TickCamera(float fDeltaTime)
	{

	}
	public void AddScroll(int xAdd,int yAdd)
	{
		xPos+=xAdd;
		yPos+=yAdd;
	}
	public int GetX()
	{
		return xPos;
	}
	public int GetY()
	{
		return yPos;
	}
	public float getfViewZoom() 
	{
		return fViewZoom;
	}
	public void setfViewZoom(float fViewZoom)
	{
		this.fViewZoom = fViewZoom;
	}
}
