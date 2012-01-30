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
		setxPos(0);				// cur pos in tiles will be rounded on get
		setyPos(0);				// cur pos in tiles will be rounded on get
		setxPosTgt(0);			// target tiles
		setyPosTgt(0);			// target tiles
	}
	public void TickCamera(float fDeltaTime)
	{
		int xPosTgtAdd = (int) (getxPosTgt() / (fSpeed*fDeltaTime));
		int yPosTgtAdd = (int) (getyPosTgt() / (fSpeed*fDeltaTime));
		
		if(xPosTgtAdd != 0)
		{
			setxPos(xPos+xPosTgtAdd);
			xPosTgt-=xPosTgtAdd;
		}
			
		if(yPosTgtAdd != 0)
		{
			setyPos(yPos+yPosTgtAdd);
			yPosTgt-=yPosTgtAdd;
		}
	}
	public int getxPos() 
	{
		return (int) xPos;
	}
	public int getyPos() 
	{
		return (int) yPos;
	}
	public void setxPos(int xPos) 
	{
		this.xPos = xPos;
		if(this.xPos > TileEditor.TILES_WIDTH)
			this.xPos = (int) (TileEditor.TILES_WIDTH);
		if(this.xPos < 0)
			this.xPos = 0;
	}

	public void setyPos(int yPos) 
	{
		this.yPos = yPos;
		if(this.yPos > TileEditor.TILES_HEIGHT)
			this.yPos = (int) (TileEditor.TILES_HEIGHT);
		if(this.yPos < 0)
			this.yPos = 0;
	}
	public void AddPosTgt(int x, int y) 
	{
		x *= fScrollSpeed;
		y *= fScrollSpeed;
		setxPosTgt(getxPosTgt() + x);
		setyPosTgt(getyPosTgt() + y); 
	}
	public void StopTween() 
	{
		setxPosTgt(0);
		setxPosTgt(0);
	}

	public int getxPosTgt() 
	{
		return xPosTgt;
	}

	public void setxPosTgt(int xPosTgt) 
	{
		this.xPosTgt = xPosTgt;
	}

	public int getyPosTgt() 
	{
		return yPosTgt;
	}

	public void setyPosTgt(int yPosTgt) 
	{
		this.yPosTgt = yPosTgt;
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
