package com.tpt.model;

import java.sql.Date;

public class Danhgia
{
	private int id_dg;
	private int id_p;
	private int id_tk;
	private Date ngay;
	private int sosao;
	private String noidung;
	private Taikhoan taikhoan;
	private Phong phong;
	public Danhgia(int id_dg, int id_p, int id_tk, Date ngay, int sosao, String noidung, Taikhoan taikhoan, Phong phong)
	{
		super();
		this.id_dg = id_dg;
		this.id_p = id_p;
		this.id_tk = id_tk;
		this.ngay = ngay;
		this.sosao = sosao;
		this.noidung = noidung;
		this.taikhoan = taikhoan;
		this.phong = phong;
	}
	public int getId_dg()
	{
		return id_dg;
	}
	public void setId_dg(int id_dg)
	{
		this.id_dg = id_dg;
	}
	public int getId_p()
	{
		return id_p;
	}
	public void setId_p(int id_p)
	{
		this.id_p = id_p;
	}
	public int getId_tk()
	{
		return id_tk;
	}
	public void setId_tk(int id_tk)
	{
		this.id_tk = id_tk;
	}
	public Date getNgay()
	{
		return ngay;
	}
	public void setNgay(Date ngay)
	{
		this.ngay = ngay;
	}
	public int getSosao()
	{
		return sosao;
	}
	public void setSosao(int sosao)
	{
		this.sosao = sosao;
	}
	public String getNoidung()
	{
		return noidung;
	}
	public void setNoidung(String noidung)
	{
		this.noidung = noidung;
	}
	public Taikhoan getTaikhoan()
	{
		return taikhoan;
	}
	public void setTaikhoan(Taikhoan taikhoan)
	{
		this.taikhoan = taikhoan;
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
