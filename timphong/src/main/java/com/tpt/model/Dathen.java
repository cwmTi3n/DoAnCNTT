package com.tpt.model;

import java.sql.Date;
import java.sql.Time;

public class Dathen
{
	private String tentk;
	private int id_p;
	private Boolean luu;
	private Boolean xacnhan;
	private Date ngay;
	private Time gio;
	private Taikhoan nguoidat;
	private Phong phong;
	public Dathen()
	{
	}
	public Dathen(String tentk, int id_p, Boolean luu, Boolean xacnhan, Date ngay, Time gio, Taikhoan nguoidat,
			Phong phong)
	{
		super();
		this.tentk = tentk;
		this.id_p = id_p;
		this.luu = luu;
		this.xacnhan = xacnhan;
		this.ngay = ngay;
		this.gio = gio;
		this.nguoidat = nguoidat;
		this.phong = phong;
	}
	public String getTentk()
	{
		return tentk;
	}
	public void setTentk(String tentk)
	{
		this.tentk = tentk;
	}
	public int getId_p()
	{
		return id_p;
	}
	public void setId_p(int id_p)
	{
		this.id_p = id_p;
	}
	public Boolean getLuu()
	{
		return luu;
	}
	public void setLuu(Boolean luu)
	{
		this.luu = luu;
	}
	public Boolean getXacnhan()
	{
		return xacnhan;
	}
	public void setXacnhan(Boolean xacnhan)
	{
		this.xacnhan = xacnhan;
	}
	public Date getNgay()
	{
		return ngay;
	}
	public void setNgay(Date ngay)
	{
		this.ngay = ngay;
	}
	public Time getGio()
	{
		return gio;
	}
	public void setGio(Time gio)
	{
		this.gio = gio;
	}
	public Taikhoan getNguoidat()
	{
		return nguoidat;
	}
	public void setNguoidat(Taikhoan nguoidat)
	{
		this.nguoidat = nguoidat;
	}
	public Phong getPhong()
	{
		return phong;
	}
	public void setPhong(Phong phong)
	{
		this.phong = phong;
	}
	
	
}
