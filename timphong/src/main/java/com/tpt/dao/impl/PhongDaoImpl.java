package com.tpt.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.eclipse.jdt.internal.compiler.ast.ReturnStatement;

import com.tpt.connection.DBConnection;
import com.tpt.dao.IPhongDao;
import com.tpt.model.Phong;
import com.tpt.util.mapAttributeSQL;

public class PhongDaoImpl extends DBConnection implements IPhongDao
{
	@Override
	public List<Phong> getPhongSeller(int id_tk)
	{
		String sql = "select * from phong where id_tk = ?";
		List<Phong> phongSeller = new ArrayList<Phong>();
		try
		{
			Connection connection = super.getConnection();
			PreparedStatement pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1, id_tk);
			ResultSet rSet = pStatement.executeQuery();
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
				return mapPhong.mapPhong(rSet);
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
		String sql = "insert into phong(ten, trangthai, hinhanh, chieudai, chieurong, gia, yeuthich, dcchitiet, mota, id_lp, id_tk) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try
		{
			Connection connection = super.getConnection();
			PreparedStatement pStatement = connection.prepareStatement(sql);
			pStatement.setString(1, newPhong.getTen());
			pStatement.setBoolean(2, newPhong.isTrangthai());
			pStatement.setString(3, newPhong.getHinhanh());
			pStatement.setFloat(4, newPhong.getChieudai());
			pStatement.setFloat(5, newPhong.getChieurong());
			pStatement.setInt(6, newPhong.getGia());
			pStatement.setInt(7, newPhong.getYeuthich());
			pStatement.setString(8, newPhong.getDcchitiet());
			pStatement.setString(9, newPhong.getMota());
			pStatement.setInt(10, newPhong.getId_lp());
			pStatement.setInt(11, newPhong.getId_tk());
			pStatement.executeUpdate();
			return true;
		} catch (Exception e)
		{
			// TODO: handle exception
		}
		return false;
	}

	@Override
	public boolean deletePhong(int id_p)
	{
		String sql = "delete phong where id_p=?";
		try
		{
			Connection connection = super.getConnection();
			PreparedStatement pStatement = connection.prepareStatement(sql);
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
		String sql = "update phong set ten=?, trangthai=?, hinhanh=?, chieudai=?, chieurong=?, gia=?, yeuthich=?, dcchitiet=?, mota=?, id_tk=? where id_p=?";
		try
		{
			Connection connection = super.getConnection();
			PreparedStatement pStatement = connection.prepareStatement(sql);
			pStatement.setString(1, newPhong.getTen());
			pStatement.setBoolean(2, newPhong.isTrangthai());
			pStatement.setString(3, newPhong.getHinhanh());
			pStatement.setFloat(4, newPhong.getChieudai());
			pStatement.setFloat(5, newPhong.getChieurong());
			pStatement.setInt(6, newPhong.getGia());
			pStatement.setInt(7, newPhong.getYeuthich());
			pStatement.setString(8, newPhong.getDcchitiet());
			pStatement.setString(9, newPhong.getMota());
			pStatement.setInt(10, newPhong.getId_tk());
			pStatement.setInt(11, newPhong.getId_p());
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
//		IPhongDao phongDao = new PhongDaoImpl();
//		Phong newPhong = phongDao.getPhong(58);
//		newPhong.setTen("new");
//		phongDao.editPhong(newPhong);
//	}
}
