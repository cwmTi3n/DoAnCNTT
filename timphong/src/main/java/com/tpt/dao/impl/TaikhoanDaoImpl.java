package com.tpt.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tpt.connection.DBConnection;
import com.tpt.dao.ITaikhoanDao;
import com.tpt.model.Taikhoan;
import com.tpt.util.mapAttributeSQL;

public class TaikhoanDaoImpl extends DBConnection implements ITaikhoanDao
{
	
	@Override
	public List<Taikhoan> getAll()
	{
		String sql = "select * from taikhoan";
		List<Taikhoan> taikhoans = new ArrayList<Taikhoan>();
		{
		};
		try
		{
			Connection connection = super.getConnection();
			PreparedStatement pStatement = connection.prepareStatement(sql);
			ResultSet rSet = pStatement.executeQuery();
			mapAttributeSQL mapTaikhoan = new mapAttributeSQL();
			while (rSet.next())
			{
				Taikhoan taikhoan = mapTaikhoan.mapTaikhoan(rSet);
				taikhoans.add(taikhoan);
			}
		} catch (Exception e)
		{
			// TODO: handle exception
		}
		return taikhoans;
	}
	@Override
	public List<Taikhoan> getAllUser()
	{
		String sql = "select * from taikhoan where quyen = ?";
		List<Taikhoan> users = new ArrayList<Taikhoan>();
		try
		{
			Connection connection = super.getConnection();
			PreparedStatement pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1, 2);
			ResultSet rSet = pStatement.executeQuery();
			mapAttributeSQL mapUser = new mapAttributeSQL();
			while (rSet.next())
			{
				Taikhoan user = mapUser.mapTaikhoan(rSet);
				users.add(user);
			}
		} catch (Exception e)
		{
			// TODO: handle exception
		}
		return users;
	}
	@Override
	public List<Taikhoan> getAllSeller()
	{
		String sql = "select * from taikhoan where quyen = ?";
		List<Taikhoan> sellers = new ArrayList<Taikhoan>();
		try
		{
			Connection connection = super.getConnection();
			PreparedStatement pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1, 3);
			ResultSet rSet = pStatement.executeQuery();
			mapAttributeSQL mapUser = new mapAttributeSQL();
			while (rSet.next())
			{
				Taikhoan seller = mapUser.mapTaikhoan(rSet);
				sellers.add(seller);
			}
		} catch (Exception e)
		{
			// TODO: handle exception
		}
		return sellers;
	}
	@Override
	public Taikhoan getTaikhoan(int id_tk)
	{
		String sql = "select * from taikhoan where id_tk = ?";
		try
		{
			Connection connection = super.getConnection();
			PreparedStatement pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1, id_tk);
			ResultSet rSet = pStatement.executeQuery();
			mapAttributeSQL mapTK = new mapAttributeSQL();
			while (rSet.next())
			{
				return mapTK.mapTaikhoan(rSet);
			}
		} 
		catch (Exception e)
		{
			System.out.println(e.getMessage());
		}
		return null;
	}

	@Override
	public boolean insertTaikhoan(Taikhoan taikhoan)
	{
		String sql = "insert into taikhoan(tentk, matkhau, quyen, email, sdt, ho, ten) values(?,?,?,?,?,?,?)";
		try
		{
			Connection connection = super.getConnection();
			PreparedStatement pStatement = connection.prepareStatement(sql);
			pStatement.setString(1, taikhoan.getTentk());
			pStatement.setString(2, taikhoan.getMatkhau());
			pStatement.setInt(3, taikhoan.getQuyen());
			pStatement.setString(4, taikhoan.getEmail());
			pStatement.setString(5, taikhoan.getSdt());
			pStatement.setString(6, taikhoan.getHo());
			pStatement.setString(7, taikhoan.getTen());
			//pStatement.setString(8, taikhoan.getAnhdaidien());
			pStatement.executeUpdate();
			return true;
		} catch (Exception e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}

	@Override
	public boolean deleteTaikhoan(int id_tk)
	{
		String sql = "delete taikhoan where id_tk = ?";
		try
		{
			Connection connection = super.getConnection();
			PreparedStatement pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1, id_tk);
			pStatement.executeUpdate();
			return true;
		} catch (Exception e)
		{
			System.out.println(e.getMessage());
		}
		return false;
	}

	@Override
	public boolean editTaikhoan(Taikhoan taikhoan)
	{
		String sql = "update taikhoan set tentk=?, matkhau=?, quyen=?, email=?, sdt=?, ho=?, ten=? where id_tk=?";
		try
		{
			Connection connection = super.getConnection();
			PreparedStatement pStatement = connection.prepareStatement(sql);
			pStatement.setString(1, taikhoan.getTentk());
			pStatement.setString(2, taikhoan.getMatkhau());
			pStatement.setInt(3, taikhoan.getQuyen());
			pStatement.setString(4, taikhoan.getEmail());
			pStatement.setString(5, taikhoan.getSdt());
			pStatement.setString(6, taikhoan.getHo());
			pStatement.setString(7, taikhoan.getTen());
			//pStatement.setString(8, taikhoan.getAnhdaidien());
			pStatement.setInt(8, taikhoan.getId_tk());
			pStatement.executeUpdate();
			return true;
		} catch (Exception e)
		{
			System.out.println(e.getMessage());
		}
		return false;
	}
//	public static void main(String[] args)
//	{
//		ITaikhoanDao taikhoanDao = new TaikhoanDaoImpl();
//		Taikhoan taikhoan = new Taikhoan();
//		taikhoan.setTentk("test1");
//		taikhoan.setMatkhau("oke");
//		taikhoan.setEmail("hokimtien@gmail.com");
//		taikhoan.setSdt("0919589985");
//		taikhoan.setHo("Hồ");
//		taikhoan.setTen("Tiền");
//		taikhoan.setQuyen(2);
//		taikhoan.setId_tk(5);
//		taikhoanDao.editTaikhoan(taikhoan);
////		System.out.println(taikhoanDao.insertTaikhoan(taikhoan));
////		System.out.println(taikhoanDao.deleteTaikhoan("test1"));
////		System.out.println(taikhoanDao.getAll().size());
////		System.out.println(taikhoanDao.deleteTaikhoan(3));
//	}
	@Override
	public Taikhoan dangNhap(Taikhoan taikhoan) {
		String sql = "select * from taikhoan where (tentk = ?) and (matkhau = ?)";
		try
		{
			Connection connection = super.getConnection();
			PreparedStatement pStatement = connection.prepareStatement(sql);
			pStatement.setString(1, taikhoan.getTentk());
			pStatement.setString(2, taikhoan.getMatkhau());
			ResultSet rSet = pStatement.executeQuery();
			mapAttributeSQL mapTK = new mapAttributeSQL();
			while(rSet.next())
			{
				return mapTK.mapTaikhoan(rSet);
			}
			
		} catch (Exception e)
		{
			// TODO Auto-generated catch block
			//System.out.println(e.getMessage());
		}
		//System.out.
		return null;
		//return 100;
	}
}
