package com.tpt.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.tpt.connection.DBConnection;
import com.tpt.dao.ILoaiphongDao;
import com.tpt.dao.IPhongDao;
import com.tpt.model.Loaiphong;
import com.tpt.util.mapAttributeSQL;

public class LoaiphongDaoImpl extends DBConnection implements ILoaiphongDao
{
	Connection connection = null;
	PreparedStatement pStatement = null;
	ResultSet rSet = null;
	IPhongDao phongDao = new PhongDaoImpl();
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
			for(Loaiphong lp : loaiphongs)
			{
				lp.setPhongs(phongDao.getPhongLoaiphong(lp.getId_lp()));
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
	public boolean deleteLoaiphong(int id_lp)
	{
		String sql = "delete loaiphong where id_lp=?";
		try
		{
			connection = super.getConnection();
			pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1, id_lp);
			pStatement.executeUpdate();
			return true;
		} catch (Exception e)
		{
			// TODO: handle exception
		}
		return false;
	}
	
	@Override
	public boolean editLoaiphong(Loaiphong lp) {
		String sql = "update loaiphong set tenloai = ? where id_lp=?";
		try
		{
			Connection connection = super.getConnection();
			PreparedStatement pStatement = connection.prepareStatement(sql);
			pStatement.setString(1, lp.getTenloai());
			pStatement.setInt(2, lp.getId_lp());
			pStatement.executeUpdate();
			return true;
		} catch (Exception e)
		{
			System.out.println(e.getMessage());
		}
		return false;
	}

}
