package com.tpt.util;

public class Constant
{
	public static final String DIR="E://upload";
	public static final int SoHinh = 3;
	public static void main(String[] args)
	{
		String realFileName= "1667891697068.jpg";
		int index = realFileName.lastIndexOf(".");
		String ext = realFileName.substring(index+1);
		System.out.println(ext.length());
	}
}
