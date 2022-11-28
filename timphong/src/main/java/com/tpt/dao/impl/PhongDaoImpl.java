package com.tpt.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.eclipse.jdt.internal.compiler.ast.ReturnStatement;
import org.hibernate.cfg.annotations.ListBinder;

import com.tpt.connection.DBConnection;
import com.tpt.dao.IPhongDao;
import com.tpt.dao.ITaikhoanDao;
import com.tpt.model.Hinhanh;
import com.tpt.model.Phong;
import com.tpt.model.Taikhoan;
import com.tpt.util.mapAttributeSQL;

public class PhongDaoImpl extends DBConnection implements IPhongDao
{
	Connection connection = null;
	PreparedStatement pStatement = null;
	ResultSet rSet = null;
	@Override
	public List<Phong> getPhongSeller(int id_tk)
	{
		String sql = "select * from phong where id_tk = ?";
		List<Phong> phongSeller = new ArrayList<Phong>();
		try
		{
			connection = super.getConnection();
			pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1, id_tk);
			rSet = pStatement.executeQuery();
			mapAttributeSQL mapPhong = new mapAttributeSQL();
			while (rSet.next())
			{
				Phong phong = mapPhong.mapPhong(rSet);
				phongSeller.add(phong);
			}
		} catch (Exception e)
		{
			// TODO: handle exception
		}
		return phongSeller;
	}
	@Override
	public List<Phong> getPhongLoaiphong(int id_lp)
	{
		String sql = "select * from phong where id_lp=?";
		List<Phong> phongs = new ArrayList<Phong>();
		try
		{
			connection = super.getConnection();
			pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1, id_lp);
			rSet = pStatement.executeQuery();
			mapAttributeSQL mapPhong = new mapAttributeSQL();
			while(rSet.next())
			{
				phongs.add(mapPhong.mapPhong(rSet));
			}
			return phongs;
		} catch (Exception e)
		{
			// TODO: handle exception
		}
		return null;
	}
	@Override
	public Phong getPhong(int id_p)
	{
		String sql = "select * from phong where id_p=?";
		try
		{
			Connection connection = super.getConnection();
			PreparedStatement pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1, id_p);
			ResultSet rSet = pStatement.executeQuery();
			mapAttributeSQL mapPhong = new mapAttributeSQL();
			while (rSet.next())
			{
				Phong phong = mapPhong.mapPhong(rSet);
				ITaikhoanDao taikhoanDao = new TaikhoanDaoImpl();
				Taikhoan taikhoan = taikhoanDao.getTaikhoan(phong.getId_tk());
				phong.setTaikhoan(taikhoan);
				return phong;
			}
		} catch (Exception e)
		{
			// TODO: handle exception
		}
		return null;
	}

	@Override
	public boolean insertPhong(Phong newPhong)
	{
		String sql = "insert into phong(ten, anhchinh, trangthai, chieudai, chieurong, gia, yeuthich, dcchitiet, mota, id_lp, id_x, id_tk) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try
		{
			connection = super.getConnection();
			pStatement = connection.prepareStatement(sql);
			pStatement.setString(1, newPhong.getTen());
			pStatement.setString(2, newPhong.getAnhchinh());
			pStatement.setInt(3, newPhong.getTrangthai());
			pStatement.setFloat(4, newPhong.getChieudai());
			pStatement.setFloat(5, newPhong.getChieurong());
			pStatement.setInt(6, newPhong.getGia());
			pStatement.setInt(7, newPhong.getYeuthich());
			pStatement.setString(8, newPhong.getDcchitiet());
			pStatement.setString(9, newPhong.getMota());
			pStatement.setInt(10, newPhong.getId_lp());
			pStatement.setInt(11, newPhong.getMaxa());
			pStatement.setInt(12, newPhong.getId_tk());
			pStatement.executeUpdate();
			return true;
		} catch (Exception e)
		{
			System.out.println(e.getMessage());
		}
		return false;
	}

	@Override
	public boolean deletePhong(int id_p)
	{
		String sql = "delete phong where id_p=?";
		try
		{
			connection = super.getConnection();
			pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1, id_p);
			pStatement.executeUpdate();
			return true;
		} catch (Exception e)
		{
			// TODO: handle exception
		}
		return false;
	}

	@Override
	public boolean editPhong(Phong newPhong)
	{
		String sql = "update phong set ten=?, anhchinh=?, trangthai=?, chieudai=?, chieurong=?, gia=?, yeuthich=?, dcchitiet=?, mota=?, id_tk=?, id_lp=?, id_x=? where id_p=?";
		try
		{
			connection = super.getConnection();
			pStatement = connection.prepareStatement(sql);
			pStatement.setString(1, newPhong.getTen());
			pStatement.setString(2, newPhong.getAnhchinh());
			pStatement.setInt(3, newPhong.getTrangthai());
			pStatement.setFloat(4, newPhong.getChieudai());
			pStatement.setFloat(5, newPhong.getChieurong());
			pStatement.setInt(6, newPhong.getGia());
			pStatement.setInt(7, newPhong.getYeuthich());
			pStatement.setString(8, newPhong.getDcchitiet());
			pStatement.setString(9, newPhong.getMota());
			pStatement.setInt(10, newPhong.getId_tk());
			pStatement.setInt(11, newPhong.getId_lp());
			pStatement.setInt(12, newPhong.getMaxa());
			pStatement.setInt(13, newPhong.getId_p());
			pStatement.executeUpdate();
			return true;
		} catch (Exception e)
		{
			System.out.println(e.getMessage());
		}
		return false;
	}
	
	@Override
	public List<Phong> get9Phong()
	{
		String sql = "select top 9 * from phong left join (select COUNT(id_tk) as quantam, id_p as id from Dathen group by id_p) qt on phong.id_p = qt.id where trangthai=1";
		List<Phong> phongs = new ArrayList<Phong>();
		try
		{
			connection = super.getConnection();
			pStatement = connection.prepareStatement(sql);
			rSet = pStatement.executeQuery();
			mapAttributeSQL map = new mapAttributeSQL();
			while(rSet.next())
			{
				Phong phong = map.mapPhong(rSet);
				phong.setQuantam(rSet.getInt("quantam") + 30);
				phongs.add(phong);
			}
			return phongs;
		} catch (Exception e)
		{
			// TODO: handle exception
		}
		return null;
	}
	@Override
	public List<Phong> pagingPhong(int index, String keyword, int loc[])
	{
		List<Phong> phongs = new ArrayList<>();
		String sql = "select phong.id_p, phong.ten, phong.anhchinh, phong.trangthai, phong.chieudai, \r\n"
				+ "	   phong.chieurong, phong.gia, phong.yeuthich, phong.dcchitiet, \r\n"
				+ "	   phong.mota, phong.ngaydang, phong.id_lp, phong.id_x, phong.id_tk, qt.quantam from phong join XaPhuong on phong.id_x = XaPhuong.ID \r\n"
				+ "					join QuanHuyen on XaPhuong.quanHuyenId = QuanHuyen.ID \r\n"
				+ "					join TinhThanhPho on QuanHuyen.tinhThanhPhoId = TinhThanhPho.ID left join (select COUNT(id_tk) as quantam, id_p as id from Dathen group by id_p) qt on phong.id_p = qt.id where trangthai=1 and (ten like ? or mota like ?) \r\n";
		if(loc[0] != 0)
		{
			
			sql += "and id_lp = ? ";
		}
		if(loc[1] != 0)
		{
			sql += "and tinhThanhPhoId = ? ";
			
		}
		if(loc[2] != 0)
		{
			sql += "and quanHuyenId = ? ";
		}
		if(loc[3] != 0)
		{
			sql += "and id_x = ? ";
		}
		sql += " order by id_p OFFSET ? row fetch next 3 row only";
		try
		{
			connection = super.getConnection();
			pStatement = connection.prepareStatement(sql);
			pStatement.setString(1, "%" + keyword + "%");
			pStatement.setString(2, "%" + keyword + "%");
			int count = 2;
			if(loc[0] != 0)
			{
				count++;
				pStatement.setInt(count, loc[0]);
			}
			if(loc[1] != 0)
			{
				count++;
				pStatement.setInt(count, loc[1]);
			}
			if(loc[2] != 0)
			{
				count++;
				pStatement.setInt(count, loc[2]);
			}
			if(loc[3] != 0)
			{
				count++;
				pStatement.setInt(count, loc[3]);
			}
			count++;
			pStatement.setInt(count, index);
			rSet = pStatement.executeQuery();
			mapAttributeSQL map = new mapAttributeSQL();
			while(rSet.next())
			{
				Phong phong = map.mapPhong(rSet);
				phong.setQuantam(rSet.getInt("quantam") + 30);
				phongs.add(phong);
			}
			return phongs;
		} catch (Exception e)
		{
			System.out.println(e.getMessage());
		}
		return null;
		
		//Làm lại
		
//		String sql = "select * from phong where trangthai=1 and (ten like ? or mota like ?) order by id_p OFFSET ? row fetch next 3 row only";
//		List<Phong> phongs = new ArrayList<Phong>();
//		try
//		{
//			connection = super.getConnection();
//			pStatement = connection.prepareStatement(sql);
//			pStatement.setString(1, "%" + keyword + "%");
//			pStatement.setString(2, "%" + keyword + "%");
//			pStatement.setInt(3, index);
//			rSet = pStatement.executeQuery();
//			mapAttributeSQL mapPhong = new mapAttributeSQL();
//			while(rSet.next())
//			{
//				phongs.add(mapPhong.mapPhong(rSet));
//			}
//			return phongs;
//		} catch (Exception e)
//		{
//			// TODO: handle exception
//		}
//		return null;
	}
	
	@Override
	public List<Phong> getAll() 
	{
		String sql = "select * from phong";
		List<Phong> phongs = new ArrayList<Phong>();
		try {
			connection = super.getConnection();
			pStatement = connection.prepareStatement(sql);
			rSet = pStatement.executeQuery();
			mapAttributeSQL map = new mapAttributeSQL();
			while(rSet.next()) {
				phongs.add(map.mapPhong(rSet));
			}
			return phongs;
		} catch(Exception e)
		{
			// TODO: handle exception
		}
		return null;
	}
	
	public int getIdPhong(String anhchinh)
	{
		String sql = "select id_p from phong where anhchinh=?";
		try
		{
			connection = super.getConnection();
			pStatement = connection.prepareStatement(sql);
			pStatement.setString(1, anhchinh);
			rSet = pStatement.executeQuery();
			while(rSet.next())
			{
				return rSet.getInt("id_p");
			}
		} catch (Exception e)
		{
			// TODO: handle exception
		}
		return 0;
	}
	@Override
	public List<Phong> searchPhong(String keyword)
	{
		List<Phong> phongs = new ArrayList<Phong>();
		String sql = "select top 9 * from Phong left join (select COUNT(id_tk) as quantam, id_p as id from Dathen group by id_p) qt on phong.id_p = qt.id where trangthai=1 and (ten like ? or mota like ?)";
		try
		{
			connection = super.getConnection();
			pStatement = connection.prepareStatement(sql);
			pStatement.setString(1, "%" + keyword + "%");
			pStatement.setString(2, "%" + keyword + "%");
			rSet = pStatement.executeQuery();
			mapAttributeSQL map = new mapAttributeSQL();
			while(rSet.next())
			{
				Phong phong = map.mapPhong(rSet);
				phong.setQuantam(rSet.getInt("quantam") + 30);
				phongs.add(phong);
			}
			return phongs;
		} catch (Exception e)
		{
			// TODO: handle exception
		}
		return null;
	}
	@Override
	public boolean sellerUpdatePhong(Phong newPhong)
	{
		String sql = "update phong set ten=?, anhchinh=?, chieudai=?, chieurong=?, gia=?, dcchitiet=?, mota=?, id_lp=?, id_x=? where id_p=?";
		try
		{
			connection = super.getConnection();
			pStatement = connection.prepareStatement(sql);
			pStatement.setString(1, newPhong.getTen());
			pStatement.setString(2, newPhong.getAnhchinh());
			pStatement.setFloat(3, newPhong.getChieudai());
			pStatement.setFloat(4, newPhong.getChieurong());
			pStatement.setInt(5, newPhong.getGia());
			pStatement.setString(6, newPhong.getDcchitiet());
			pStatement.setString(7, newPhong.getMota());
			pStatement.setInt(8, newPhong.getId_lp());
			pStatement.setInt(9, newPhong.getMaxa());
			pStatement.setInt(10, newPhong.getId_p());
			pStatement.executeUpdate();
			return true;
		} catch (Exception e)
		{
			System.out.println(e.getMessage());
		}
		return false;
	}
	
	@Override
	public List<Phong> locPhong(String keyword, int loc[])
	{
		List<Phong> phongs = new ArrayList<>();
		String sql = "select top 9 phong.id_p, phong.ten, phong.anhchinh, phong.trangthai, phong.chieudai, \r\n"
				+ "	   phong.chieurong, phong.gia, phong.yeuthich, phong.dcchitiet, \r\n"
				+ "	   phong.mota, phong.ngaydang, phong.id_lp, phong.id_x, phong.id_tk, qt.quantam from phong join XaPhuong on phong.id_x = XaPhuong.ID \r\n"
				+ "					join QuanHuyen on XaPhuong.quanHuyenId = QuanHuyen.ID \r\n"
				+ "					join TinhThanhPho on QuanHuyen.tinhThanhPhoId = TinhThanhPho.ID left join (select COUNT(id_tk) as quantam, id_p as id from Dathen group by id_p) qt on phong.id_p = qt.id where trangthai=1 and (ten like ? or mota like ?) \r\n";
		if(loc[0] != 0)
		{
			
			sql += "and id_lp = ? ";
		}
		if(loc[1] != 0)
		{
			sql += "and tinhThanhPhoId = ? ";
			
		}
		if(loc[2] != 0)
		{
			sql += "and quanHuyenId = ? ";
		}
		if(loc[3] != 0)
		{
			sql += "and id_x = ? ";
		}
		System.out.println(sql);
		try
		{
			connection = super.getConnection();
			pStatement = connection.prepareStatement(sql);
			pStatement.setString(1, "%" + keyword + "%");
			pStatement.setString(2, "%" + keyword + "%");
			int count = 2;
			if(loc[0] != 0)
			{
				count++;
				pStatement.setInt(count, loc[0]);
			}
			if(loc[1] != 0)
			{
				count++;
				pStatement.setInt(count, loc[1]);
			}
			if(loc[2] != 0)
			{
				count++;
				pStatement.setInt(count, loc[2]);
			}
			if(loc[3] != 0)
			{
				count++;
				pStatement.setInt(count, loc[3]);
			}
			rSet = pStatement.executeQuery();
			mapAttributeSQL map = new mapAttributeSQL();
			while(rSet.next())
			{
				Phong phong = map.mapPhong(rSet);
				phong.setQuantam(rSet.getInt("quantam") + 30);
				phongs.add(phong);
			}
			return phongs;
		} catch (Exception e)
		{
			System.out.println(e.getMessage());
		}
		return null;
	}
//	public static void main(String[] args)
//	{
//		int[] loc = {1, 50, 0, 0};
//		IPhongDao phongDao = new PhongDaoImpl();
//		System.out.println(phongDao.get9Phong().get(1).getQuantam());
//	}
}
