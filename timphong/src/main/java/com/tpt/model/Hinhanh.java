package com.tpt.model;

public class Hinhanh
{
	private int id_p;
	private int stt;
	private String hinhanh;
	public Hinhanh()
	{
		// TODO Auto-generated constructor stub
	}
	public Hinhanh(int id_p, int stt, String hinhanh)
	{
		super();
		this.id_p = id_p;
		this.stt = stt;
		this.hinhanh = hinhanh;
	}
	public int getId_p()
	{
		return id_p;
	}
	public void setId_p(int id_p)
	{
		this.id_p = id_p;
	}
	public int getStt()
	{
		return stt;
	}
	public void setStt(int stt)
	{
		this.stt = stt;
	}
	public String getHinhanh()
	{
		return hinhanh;
	}
	public void setHinhanh(String hinhanh)
	{
		this.hinhanh = hinhanh;
	}
	
	
}
