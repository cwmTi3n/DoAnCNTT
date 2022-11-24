package com.tpt.model;

import java.sql.Date;
import java.sql.Time;

public class Dathen
{
	private int id_tk;
	private int id_p;
	private int trangthai;
	private Date ngay;
	private Time gio;
	private Taikhoan nguoidat;
	private Phong phong;
	public Dathen()
	{
	}
	public Dathen(int id_tk, int id_p, int trangthai, Date ngay, Time gio, Taikhoan nguoidat, Phong phong)
	{
		super();
		this.id_tk = id_tk;
		this.id_p = id_p;
		this.trangthai = trangthai;
		this.ngay = ngay;
		this.gio = gio;
		this.nguoidat = nguoidat;
		this.phong = phong;
	}
	public int getId_tk()
	{
		return id_tk;
	}
	public void setId_tk(int id_tk)
	{
		this.id_tk = id_tk;
	}
	public int getId_p()
	{
		return id_p;
	}
	public void setId_p(int id_p)
	{
		this.id_p = id_p;
	}
	public int getTrangthai()
	{
		return trangthai;
	}
	public void setTrangthai(int trangthai)
	{
		this.trangthai = trangthai;
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
