package com.tpt.util;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tpt.dao.IHinhanhDao;
import com.tpt.dao.ILoaiphongDao;
import com.tpt.dao.IPhongDao;
import com.tpt.dao.impl.HinhanhDaoImpl;
import com.tpt.dao.impl.LoaiphongDaoImpl;
import com.tpt.dao.impl.PhongDaoImpl;
import com.tpt.model.Dathen;
import com.tpt.model.Huyen;
import com.tpt.model.Loaiphong;
import com.tpt.model.Phong;
import com.tpt.model.Taikhoan;
import com.tpt.model.Theodoi;
import com.tpt.model.Tinh;
import com.tpt.model.Xa;

public class mapAttributeSQL
{
	public mapAttributeSQL()
	{
	}

	public Phong mapPhong(ResultSet rSet)
	{
		ILoaiphongDao loaiphongDao = new LoaiphongDaoImpl();
		IHinhanhDao hinhanhDao = new HinhanhDaoImpl();
		Phong phong = new Phong();
		try
		{
			int id_lp = rSet.getInt("id_lp");
			int id_p = rSet.getInt("id_p");
			phong.setId_p(id_p);
			phong.setTen(rSet.getString("ten"));
			phong.setAnhchinh(rSet.getString("anhchinh"));
			phong.setTrangthai(rSet.getInt("trangthai"));
			phong.setChieudai(rSet.getFloat("chieudai"));
			phong.setChieurong(rSet.getFloat("chieurong"));
			phong.setGia(rSet.getInt("gia"));
			phong.setYeuthich(rSet.getInt("yeuthich"));
			phong.setDcchitiet(rSet.getString("dcchitiet"));
			phong.setMota(rSet.getString("mota"));
			phong.setId_lp(id_lp);
			phong.setId_tk(rSet.getInt("id_tk"));
			phong.setLoaiphong(loaiphongDao.getLoaiphong(id_lp));
			phong.setHinhanhs(hinhanhDao.getHinhanhP(id_p));
			//Chưa có ngaydang và maxa
			return phong;
		} catch (Exception e)
		{
		}
		return null;
	}
	
	public Taikhoan mapTaikhoan(ResultSet rSet)
	{
		Taikhoan taikhoan = new Taikhoan();
		try
		{
			taikhoan.setId_tk(rSet.getInt("id_tk"));
			taikhoan.setTentk(rSet.getString("tentk"));
			taikhoan.setMatkhau(rSet.getString("matkhau"));
			taikhoan.setQuyen(rSet.getInt("quyen"));
			taikhoan.setEmail(rSet.getString("email"));
			taikhoan.setSdt(rSet.getString("sdt"));
			taikhoan.setHo(rSet.getString("ho"));
			taikhoan.setTen(rSet.getString("ten"));
			return taikhoan;
		} catch (Exception e)
		{
			return null;
		}
	}
	
	public Loaiphong mapLoaiphong(ResultSet rSet)
	{
		Loaiphong loaiphong = new Loaiphong();
		try
		{
			int id_lp = rSet.getInt("id_lp");
			loaiphong.setId_lp(id_lp);
			loaiphong.setTenloai(rSet.getString("tenloai"));
			return loaiphong;
		} catch (Exception e)
		{
		}
		return null;
	}
	
	public Theodoi mapTheodoi(ResultSet rSet)
	{
		Theodoi theodoi = new Theodoi();
		try
		{
			theodoi.setId_dc(rSet.getInt("id_dc"));
			theodoi.setId_td(rSet.getInt("id_td"));
			return theodoi;
		} catch (Exception e)
		{
			// TODO: handle exception
		}
		return null;
	}
	
	public Tinh mapTinh(ResultSet rSet)
	{
		Tinh tinh = new Tinh();
		try
		{
			tinh.setMatinh(rSet.getInt("ID"));
			tinh.setTentinh(rSet.getString("tentinhthanhpho"));
			return tinh;
		} catch (Exception e)
		{
		}
		return null;
	}
	
	public Huyen mapHuyen(ResultSet rSet)
	{
		Huyen huyen = new Huyen();
		try
		{
			huyen.setMahuyen(rSet.getInt("ID"));
			huyen.setTenhuyen(rSet.getString("tenquanhuyen"));
			return huyen;
		} catch (Exception e)
		{
			// TODO: handle exception
		}
		return null;
	}
	
	public Xa mapXa(ResultSet rSet)
	{
		Xa xa = new Xa();
		try
		{
			xa.setMaxa(rSet.getInt("ID"));
			xa.setTenxa(rSet.getString("tenxaphuong"));
			return xa;
		} catch (Exception e)
		{
		}
		return null;
	}
	
	public Dathen mapDathen(ResultSet rSet)
	{
		Dathen dathen = new Dathen();
		try
		{
			dathen.setTentk(rSet.getString("tentk"));
			dathen.setId_p(rSet.getInt("id_p"));
			dathen.setLuu(rSet.getBoolean("luu"));
			dathen.setXacnhan(rSet.getBoolean("xacnhan"));
			dathen.setNgay(rSet.getDate("ngay"));
			dathen.setGio(rSet.getTime("gio"));
			return dathen;
		} catch (Exception e)
		{
		}
		return null;
	}
}
