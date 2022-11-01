package com.tpt.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tpt.connection.DBConnection;
import com.tpt.dao.ILoaiphongDao;
import com.tpt.model.Loaiphong;
import com.tpt.util.mapAttributeSQL;

public class LoaiphongDaoImpl extends DBConnection implements ILoaiphongDao
{
	Connection connection = null;
	PreparedStatement pStatement = null;
	ResultSet rSet = null;
	@Override
	public List<Loaiphong> getAll()
	{
		String sql = "select * from loaiphong";
		List<Loaiphong> loaiphongs = new ArrayList<Loaiphong>();
		try
		{
			connection = super.getConnection();
			pStatement = connection.prepareStatement(sql);
			rSet = pStatement.executeQuery();
			mapAttributeSQL mapLoaiphong = new mapAttributeSQL();
			while(rSet.next())
			{
				loaiphongs.add(mapLoaiphong.mapLoaiphong(rSet));
			}
			return loaiphongs;
		} catch (Exception e)
		{
			// TODO: handle exception
		}
		return null;
	}
	@Override
	public Loaiphong getLoaiphong(int id_lp)
	{
		String sql = "select * from loaiphong where id_lp=?";
		try
		{
			connection = super.getConnection();
			pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1, id_lp);
			rSet = pStatement.executeQuery();
			mapAttributeSQL mapLoaiphong = new mapAttributeSQL();
			while(rSet.next())
			{
				return mapLoaiphong.mapLoaiphong(rSet);
			}
		} catch (Exception e)
		{
			// TODO: handle exception
		}
		return null;
	}

	@Override
	public boolean insertLoaiphong(Loaiphong lp)
	{
		String sql = "insert into loaiphong(tenloai) values(?)";
		try
		{
			connection = super.getConnection();
			pStatement = connection.prepareStatement(sql);
			pStatement.setString(1, lp.getTenloai());
			pStatement.executeUpdate();
			return true;
		} catch (Exception e)
		{
		}
		return false;
	}

	@Override
	public boolean deleteLoaiphong()
	{
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean editLoaiphong()
	{
		// TODO Auto-generated method stub
		return false;
	}

}
