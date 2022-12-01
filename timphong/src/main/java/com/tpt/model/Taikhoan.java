package com.tpt.model;

import java.util.List;

public class Taikhoan
{
	private int id_tk;
	private String anhdaidien;
	private String tentk;
	private String matkhau;
	private int quyen; // admin: 1, user: 2, seller: 3
	private String email;
	private String sdt;
	private String ho;
	private String ten;
	List<Phong> chuPhongs;
	List<Phong> datPhongs;
	List<Taikhoan> dangTheodoi;
	List<Taikhoan> nguoiTheodoi;
	public Taikhoan()
	{
		// TODO Auto-generated constructor stub
	}
	public Taikhoan(int id_tk, String anhdaidien, String tentk, String matkhau, int quyen, String email, String sdt,
			String ho, String ten, List<Phong> chuPhongs, List<Phong> datPhongs, List<Taikhoan> dangTheodoi,
			List<Taikhoan> nguoiTheodoi)
	{
		super();
		this.id_tk = id_tk;
		this.anhdaidien = anhdaidien;
		this.tentk = tentk;
		this.matkhau = matkhau;
		this.quyen = quyen;
		this.email = email;
		this.sdt = sdt;
		this.ho = ho;
		this.ten = ten;
		this.chuPhongs = chuPhongs;
		this.datPhongs = datPhongs;
		this.dangTheodoi = dangTheodoi;
		this.nguoiTheodoi = nguoiTheodoi;
	}
	public int getId_tk()
	{
		return id_tk;
	}
	public void setId_tk(int id_tk)
	{
		this.id_tk = id_tk;
	}
	public String getAnhdaidien()
	{
		return anhdaidien;
	}
	public void setAnhdaidien(String anhdaidien)
	{
		this.anhdaidien = anhdaidien;
	}
	public String getTentk()
	{
		return tentk;
	}
	public void setTentk(String tentk)
	{
		this.tentk = tentk;
	}
	public String getMatkhau()
	{
		return matkhau;
	}
	public void setMatkhau(String matkhau)
	{
		this.matkhau = matkhau;
	}
	public int getQuyen()
	{
		return quyen;
	}
	public void setQuyen(int quyen)
	{
		this.quyen = quyen;
	}
	public String getEmail()
	{
		return email;
	}
	public void setEmail(String email)
	{
		this.email = email;
	}
	public String getSdt()
	{
		return sdt;
	}
	public void setSdt(String sdt)
	{
		this.sdt = sdt;
	}
	public String getHo()
	{
		return ho;
	}
	public void setHo(String ho)
	{
		this.ho = ho;
	}
	public String getTen()
	{
		return ten;
	}
	public void setTen(String ten)
	{
		this.ten = ten;
	}
	public List<Phong> getChuPhongs()
	{
		return chuPhongs;
	}
	public void setChuPhongs(List<Phong> chuPhongs)
	{
		this.chuPhongs = chuPhongs;
	}
	public List<Phong> getDatPhongs()
	{
		return datPhongs;
	}
	public void setDatPhongs(List<Phong> datPhongs)
	{
		this.datPhongs = datPhongs;
	}
	public List<Taikhoan> getDangTheodoi()
	{
		return dangTheodoi;
	}
	public void setDangTheodoi(List<Taikhoan> dangTheodoi)
	{
		this.dangTheodoi = dangTheodoi;
	}
	public List<Taikhoan> getNguoiTheodoi()
	{
		return nguoiTheodoi;
	}
	public void setNguoiTheodoi(List<Taikhoan> nguoiTheodoi)
	{
		this.nguoiTheodoi = nguoiTheodoi;
	}
	
}
