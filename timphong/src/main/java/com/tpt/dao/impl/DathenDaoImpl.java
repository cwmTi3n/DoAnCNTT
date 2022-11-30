package com.tpt.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tpt.connection.DBConnection;
import com.tpt.dao.IDathenDao;
import com.tpt.model.Dathen;
import com.tpt.util.mapAttributeSQL;

public class DathenDaoImpl extends DBConnection implements IDathenDao 
{
	Connection connection = null;
	PreparedStatement pStatement = null;
	ResultSet rSet = null;
	@Override
	public boolean insertDathen(Dathen dathen)
	{
		String sql = "insert into Dathen(id_tk, id_p, trangthai, ngay, gio) values(?, ?, ?, ?, ?)";
		try
		{
			connection = super.getConnection();
			pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1, dathen.getId_tk());
			pStatement.setInt(2, dathen.getId_p());
			pStatement.setInt(3, dathen.getTrangthai());
			pStatement.setDate(4, dathen.getNgay());
			pStatement.setTime(5, dathen.getGio());
			pStatement.executeUpdate();
			return true;
		} catch (Exception e)
		{
			System.out.println(e.getMessage());
		}
		return false;
	}
	
	@Override
	public boolean deleteDathen(int id_tk, int id_p)
	{
		String sql = "delete Dathen where id_tk = ? and id_p = ?";
		try
		{
			connection = super.getConnection();
			pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1, id_tk);
			pStatement.setInt(2, id_p);
			pStatement.executeUpdate();
			return true;
		} catch (Exception e)
		{
			// TODO: handle exception
		}
		return false;
	}
	
	@Override
	public boolean editDathen(Dathen dathen)
	{
		String sql = "update Dathen set trangthai = ?, ngay = ?, gio = ? where id_tk = ? and id_p =?";
		try
		{
			connection = super.getConnection();
			pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1, dathen.getTrangthai());
			pStatement.setDate(2, dathen.getNgay());
			pStatement.setTime(3, dathen.getGio());
			pStatement.setInt(4, dathen.getId_tk());
			pStatement.setInt(5, dathen.getId_p());
			pStatement.executeUpdate();
			return true;
		} catch (Exception e)
		{
			System.out.println(e.getMessage());
		}
		return false;
	}
	
	@Override
	public List<Dathen> findByTrangthai(int id_tk, int tt)
	{
		String sql = "select * from Dathen where id_tk = ? and trangthai = ?";
		List<Dathen> dathens = new ArrayList<>();
		try
		{
			connection = super.getConnection();
			pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1, id_tk);
			pStatement.setInt(2, tt);
			rSet = pStatement.executeQuery();
			mapAttributeSQL map = new mapAttributeSQL();
			while(rSet.next())
			{
				dathens.add(map.mapDathen(rSet));
			}
			return dathens;
		} catch (Exception e)
		{
			System.out.println(e.getMessage());
		}
		return null;
	}
	
	@Override
	public Dathen findDathen(int id_tk, int id_p)
	{
		String sql = "select * from Dathen where id_tk=? and id_p=?";
		try
		{
			connection = super.getConnection();
			pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1, id_tk);
			pStatement.setInt(2, id_p);
			rSet = pStatement.executeQuery();
			mapAttributeSQL map = new mapAttributeSQL();
			while(rSet.next())
			{
				return map.mapDathen(rSet);
			}
		} catch (Exception e)
		{
			System.out.println(e.getMessage());
		}
		return null;
	}
	
	@Override
	public List<Dathen> findBySeller(int id_tk, int tt)
	{
		String sql = "select dathen.id_p, dathen.id_tk, dathen.trangthai, dathen.ngay, dathen.gio from  (select * from phong where id_tk = ?) p_tk "
				+ "							join dathen on p_tk.id_p = dathen.id_p where dathen.trangthai = ?";
		List<Dathen> dathens = new ArrayList<>();
		try
		{
			connection = super.getConnection();
			pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1, id_tk);
			pStatement.setInt(2, tt);
			rSet = pStatement.executeQuery();
			mapAttributeSQL map = new mapAttributeSQL();
			while(rSet.next())
			{
				dathens.add(map.mapDathen(rSet));
			}
			return dathens;
		} catch (Exception e)
		{
			// TODO: handle exception
		}
		return null;
	}
}
