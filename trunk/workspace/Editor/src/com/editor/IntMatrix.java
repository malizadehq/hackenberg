package com.editor;

final public class IntMatrix 
{
    private final int M;            // number of rows
    private final int N;            // number of columns
    private final int[][] data;   	// M-by-N array

    // create M-by-N matrix of 0's
    public IntMatrix(int M, int N) 
    {
        this.M = M;
        this.N = N;
        data = new int[M][N];
    }
	public static IntMatrix IntMatrix(int i, int j) 
	{
		return IntMatrix(i,j);
	}
    // create matrix based on 2d array
    public IntMatrix(int[][] data) 
    {
        M = data.length;
        N = data[0].length;
        this.data = new int[M][N];
        for (int i = 0; i < M; i++)
            for (int j = 0; j < N; j++)
                    this.data[i][j] = data[i][j];
    }
}
