package com.tpt.util;

import java.sql.ResultSet;

import com.tpt.dao.IHinhanhDao;
import com.tpt.dao.ILoaiphongDao;
import com.tpt.dao.IPhongDao;
import com.tpt.dao.IQuanHuyenDao;
import com.tpt.dao.ITaikhoanDao;
import com.tpt.dao.ITinhDao;
import com.tpt.dao.IXaphuongDao;
import com.tpt.dao.impl.HinhanhDaoImpl;
import com.tpt.dao.impl.LoaiphongDaoImpl;
import com.tpt.dao.impl.PhongDaoImpl;
import com.tpt.dao.impl.QuanhuyenDaoImpl;
import com.tpt.dao.impl.TaikhoanDaoImpl;
import com.tpt.dao.impl.TinhDaoImpl;
import com.tpt.dao.impl.XaphuongDaoImpl;
import com.tpt.model.Danhgia;
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
	
	public Danhgia mapDanhgia(ResultSet rSet)
	{
		Danhgia danhgia = new Danhgia();
		ITaikhoanDao taikhoanDao = new TaikhoanDaoImpl();
		try
		{
			int id_p = rSet.getInt("id_p");
			int id_tk = rSet.getInt("id_tk");
			danhgia.setId_dg(rSet.getInt("id_dg"));
			danhgia.setId_p(id_p);
			danhgia.setId_tk(id_tk);
			danhgia.setNgay(rSet.getDate("ngay"));
			danhgia.setSosao(rSet.getInt("sosao"));
			danhgia.setNoidung(rSet.getString("noidung"));
			danhgia.setTaikhoan(taikhoanDao.getTaikhoan(id_tk));
			return danhgia;
		} catch (Exception e)
		{
			// TODO: handle exception
		}
		return null;
	}
	
	public Phong mapPhong(ResultSet rSet)
	{
		ILoaiphongDao loaiphongDao = new LoaiphongDaoImpl();
		IHinhanhDao hinhanhDao = new HinhanhDaoImpl();
		IXaphuongDao xaphuongDao = new XaphuongDaoImpl();
		ITaikhoanDao taikhoanDao = new TaikhoanDaoImpl();
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
			phong.setSonguoi(rSet.getInt("songuoi"));
			phong.setDcchitiet(rSet.getString("dcchitiet"));
			phong.setMota(rSet.getString("mota"));
			phong.setId_lp(id_lp);
			phong.setId_tk(rSet.getInt("id_tk"));
			phong.setMaxa(rSet.getInt("id_x"));
			phong.setNgaydang(rSet.getDate("ngaydang"));
			Xa xa = xaphuongDao.getXa(phong.getMaxa());
			Taikhoan taikhoan = taikhoanDao.getTaikhoan(phong.getId_tk());
			phong.setTaikhoan(taikhoan);
			phong.setXa(xa);
			phong.setLoaiphong(loaiphongDao.getLoaiphong(id_lp));
			phong.setHinhanhs(hinhanhDao.getHinhanhP(id_p));
			
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
			taikhoan.setAnhdaidien(rSet.getString("anhdaidien"));
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
		ITinhDao tinhDao = new TinhDaoImpl();
		Huyen huyen = new Huyen();
		try
		{
			huyen.setMahuyen(rSet.getInt("ID"));
			huyen.setTenhuyen(rSet.getString("tenquanhuyen"));
			huyen.setMatinh(rSet.getInt("tinhThanhPhoId"));
			Tinh tinh = tinhDao.getTinh(huyen.getMatinh());
			huyen.setTinh(tinh);
			return huyen;
		} catch (Exception e)
		{
			// TODO: handle exception
		}
		return null;
	}
	
	public Xa mapXa(ResultSet rSet)
	{
		IQuanHuyenDao quanHuyenDao = new QuanhuyenDaoImpl();
		Xa xa = new Xa();
		try
		{
			xa.setMaxa(rSet.getInt("ID"));
			xa.setTenxa(rSet.getString("tenxaphuong"));
			xa.setMahuyen(rSet.getInt("quanHuyenId"));
			Huyen huyen = quanHuyenDao.getHuyen(xa.getMahuyen());
			xa.setHuyen(huyen);
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
			int id_p = rSet.getInt("id_p");
			int id_tk = rSet.getInt("id_tk");
			dathen.setId_dh(rSet.getInt("id_dh"));
			dathen.setId_tk(id_tk);
			dathen.setId_p(id_p);
			dathen.setTrangthai(rSet.getInt("trangthai"));
			dathen.setNgay(rSet.getDate("ngay"));
			dathen.setGio(rSet.getTime("gio"));
			IPhongDao phongDao = new PhongDaoImpl();
			ITaikhoanDao taikhoanDao = new TaikhoanDaoImpl();
			dathen.setPhong(phongDao.getPhong(id_p));
			dathen.setNguoidat(taikhoanDao.getTaikhoan(id_tk));
			return dathen;
		} catch (Exception e)
		{
		}
		return null;
	}
}
