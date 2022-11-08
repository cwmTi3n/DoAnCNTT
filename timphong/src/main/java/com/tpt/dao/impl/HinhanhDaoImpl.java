package com.tpt.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import com.tpt.connection.DBConnection;
import com.tpt.dao.IHinhanhDao;
import com.tpt.model.Hinhanh;

public class HinhanhDaoImpl extends DBConnection implements IHinhanhDao
{
	Connection connection = null;
	PreparedStatement pStatement = null;
	ResultSet rSet = null;
	@Override
	public List<Hinhanh> getHinhanhP(int id_p)
	{
		String sql = "select * from hinhanh where id_p=? order by stt";
		List<Hinhanh> hinhanhs = new ArrayList<Hinhanh>();
		try
		{
			connection = super.getConnection();
			pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1, id_p);
			rSet = pStatement.executeQuery();
			while(rSet.next())
			{
				Hinhanh hinhanh = new Hinhanh();
				hinhanh.setId_p(rSet.getInt("id_p"));
				hinhanh.setHinhanh(rSet.getString("hinhanh"));
				hinhanhs.add(hinhanh);
			}
			return hinhanhs;
		} catch (Exception e)
		{
			System.out.println(e.getMessage());		}
		return null;
	}

	@Override
	public boolean insertHinhanh(Hinhanh hinhanh)
	{
		String sql = "insert into hinhanh(id_p, hinhanh) values(?, ?)";
		try
		{
			connection = super.getConnection();
			pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1, hinhanh.getId_p());
			pStatement.setString(2, hinhanh.getHinhanh());
			pStatement.executeUpdate();
			return true;
		} catch (Exception e)
		{
			System.out.println(e.getMessage());		}
		return false;
	}

	@Override
	public boolean deleteHinhanh(String hinhanh )
	{
		String sql = "delete hinhanh where hinhanh=?";
		try
		{
			connection = super.getConnection();
			pStatement = connection.prepareStatement(sql);
			pStatement.setString(1, hinhanh);
			pStatement.executeUpdate();
			return true;
		} catch (Exception e)
		{
			System.out.println(e.getMessage());		}
		return false;
	}

	@Override
	public boolean editHinhanh(String newhinhanh, String oldHinhanh)
	{
		String sql = "update hinhanh set hinhanh=? where hinhanh=?";
		try
		{
			connection = super.getConnection();
			pStatement = connection.prepareStatement(sql);
			pStatement.setString(1, newhinhanh);
			pStatement.setString(2, oldHinhanh);
			pStatement.executeUpdate();
			return true;
		} catch (Exception e)
		{
			System.out.println(e.getMessage());
		}
		return false;
	}

	@Override
	public boolean deleteHinhanhP(int id_p)
	{
		String sql = "delete hinhanh where id_p=?";
		try
		{
			connection = super.getConnection();
			pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1, id_p);
			pStatement.executeUpdate();
			return true;
		} catch (Exception e)
		{
			System.out.println(e.getMessage());		}
		return false;
	}
	
//	public static void main(String[] args)
//	{
//		IHinhanhDao hinhanhDao = new HinhanhDaoImpl();
//		Hinhanh hinhanh = new Hinhanh();
//		hinhanh.setId_p(4);
//		hinhanh.setHinhanh("okok.j");
//		hinhanhDao.insertHinhanh(hinhanh);
//	}
}
