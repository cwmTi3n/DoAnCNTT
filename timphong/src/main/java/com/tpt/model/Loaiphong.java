package com.tpt.model;

import java.util.List;

public class Loaiphong
{
	private int id_lp;
	private String tenloai;
	List<Phong> phongs;
	public Loaiphong()
	{
	}
	public Loaiphong(int id_lp, String tenloai, List<Phong> phongs)
	{
		super();
		this.id_lp = id_lp;
		this.tenloai = tenloai;
		this.phongs = phongs;
	}
	public int getId_lp()
	{
		return id_lp;
	}
	public void setId_lp(int id_lp)
	{
		this.id_lp = id_lp;
	}
	public String getTenloai()
	{
		return tenloai;
	}
	public void setTenloai(String tenloai)
	{
		this.tenloai = tenloai;
	}
	public List<Phong> getPhongs()
	{
		return phongs;
	}
	public void setPhongs(List<Phong> phongs)
	{
		this.phongs = phongs;
	}
	
	
}
