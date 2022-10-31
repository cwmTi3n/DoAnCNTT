package com.tpt.model;

import java.util.List;

public class Huyen
{
	private int mahuyen;
	private String tenhuyen;
	private int matinh;
	Tinh tinh;
	List<Xa> xas;
	public Huyen()
	{
	}
	public Huyen(int mahuyen, String tenhuyen, int matinh, Tinh tinh, List<Xa> xas)
	{
		super();
		this.mahuyen = mahuyen;
		this.tenhuyen = tenhuyen;
		this.matinh = matinh;
		this.tinh = tinh;
		this.xas = xas;
	}
	public int getMahuyen()
	{
		return mahuyen;
	}
	public void setMahuyen(int mahuyen)
	{
		this.mahuyen = mahuyen;
	}
	public String getTenhuyen()
	{
		return tenhuyen;
	}
	public void setTenhuyen(String tenhuyen)
	{
		this.tenhuyen = tenhuyen;
	}
	public int getMatinh()
	{
		return matinh;
	}
	public void setMatinh(int matinh)
	{
		this.matinh = matinh;
	}
	public Tinh getTinh()
	{
		return tinh;
	}
	public void setTinh(Tinh tinh)
	{
		this.tinh = tinh;
	}
	public List<Xa> getXas()
	{
		return xas;
	}
	public void setXas(List<Xa> xas)
	{
		this.xas = xas;
	}
	
}
