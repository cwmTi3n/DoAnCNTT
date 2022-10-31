package com.tpt.model;

public class Theodoi
{
	private int id_dc;
	private int id_td;
	private Taikhoan nguoiTheodoi;
	private Taikhoan duocTheodoi;
	public Theodoi()
	{
	}
	public Theodoi(int id_dc, int id_td, Taikhoan nguoiTheodoi, Taikhoan duocTheodoi)
	{
		super();
		this.id_dc = id_dc;
		this.id_td = id_td;
		this.nguoiTheodoi = nguoiTheodoi;
		this.duocTheodoi = duocTheodoi;
	}
	public int getId_dc()
	{
		return id_dc;
	}
	public void setId_dc(int id_dc)
	{
		this.id_dc = id_dc;
	}
	public int getId_td()
	{
		return id_td;
	}
	public void setId_td(int id_td)
	{
		this.id_td = id_td;
	}
	public Taikhoan getNguoiTheodoi()
	{
		return nguoiTheodoi;
	}
	public void setNguoiTheodoi(Taikhoan nguoiTheodoi)
	{
		this.nguoiTheodoi = nguoiTheodoi;
	}
	public Taikhoan getDuocTheodoi()
	{
		return duocTheodoi;
	}
	public void setDuocTheodoi(Taikhoan duocTheodoi)
	{
		this.duocTheodoi = duocTheodoi;
	}
	
	
}
