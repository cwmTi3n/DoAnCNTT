package com.tpt.model;

public class Xa
{
	private int maxa;
	private String tenxa;
	private Huyen huyen;
	public Xa()
	{
	}
	public Xa(int maxa, String tenxa, Huyen huyen)
	{
		super();
		this.maxa = maxa;
		this.tenxa = tenxa;
		this.huyen = huyen;
	}
	public int getMaxa()
	{
		return maxa;
	}
	public void setMaxa(int maxa)
	{
		this.maxa = maxa;
	}
	public String getTenxa()
	{
		return tenxa;
	}
	public void setTenxa(String tenxa)
	{
		this.tenxa = tenxa;
	}
	public Huyen getHuyen()
	{
		return huyen;
	}
	public void setHuyen(Huyen huyen)
	{
		this.huyen = huyen;
	}
	
}
