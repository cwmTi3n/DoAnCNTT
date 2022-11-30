package com.tpt.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tpt.connection.DBConnection;
import com.tpt.dao.IDanhgiaDao;
import com.tpt.model.Danhgia;
import com.tpt.util.mapAttributeSQL;

public class DanhgiaDaoImpl extends DBConnection implements IDanhgiaDao
{
	Connection connection = null;
	PreparedStatement pStatement = null;
	ResultSet rSet = null;
	@Override
	public List<Danhgia> findById_p(int id_p)
	{
		List<Danhgia> danhgias = new ArrayList<>();
		String sql = "select * from Danhgia where id_p = ?";
		try
		{
			connection = super.getConnection();
			pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1, id_p);
			rSet = pStatement.executeQuery();
			mapAttributeSQL map = new mapAttributeSQL();
			while(rSet.next())
			{
				danhgias.add(map.mapDanhgia(rSet));
			}
			return danhgias;
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public List<Danhgia> finhById_tk(int id_tk)
	{
		List<Danhgia> danhgias = new ArrayList<>();
		String sql = "select * from Danhgia where id_tk = ?";
		try
		{
			connection = super.getConnection();
			pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1, id_tk);
			rSet = pStatement.executeQuery();
			mapAttributeSQL map = new mapAttributeSQL();
			while(rSet.next())
			{
				danhgias.add(map.mapDanhgia(rSet));
			}
			return danhgias;
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public boolean insertDanhgia(Danhgia danhgia)
	{
		String sql = "insert into Danhgia(id_p, id_tk, ngay, sosao, noidung) values(?, ?, ?, ?, ?)";
		try
		{
			connection = super.getConnection();
			pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1, danhgia.getId_p());
			pStatement.setInt(2, danhgia.getId_tk());
			pStatement.setDate(3, danhgia.getNgay());
			pStatement.setInt(4, danhgia.getSosao());
			pStatement.setString(5, danhgia.getNoidung());
			pStatement.executeUpdate();
			return true;
		} catch (Exception e)
		{
			// TODO: handle exception
		}
		return false;
	}
	
	@Override
	public boolean deleteDanhgia(int id_p, int id_tk, int id_dg)
	{
		String sql = "delete Danhgia where id_p = ? and id_tk = ? and id_dg = ?";
		try
		{
			connection = super.getConnection();
			pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1, id_p);
			pStatement.setInt(2, id_tk);
			pStatement.setInt(3, id_dg);
			pStatement.executeUpdate();
			return true;
		} catch (Exception e)
		{
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}
	
	@Override
	public boolean editDanhgia()
	{
		return false;
	}
	public static void main(String[] args)
	{
		IDanhgiaDao danhgiaDao = new DanhgiaDaoImpl();
		Danhgia danhgia = new Danhgia();
		danhgia.setId_p(5);
		danhgia.setId_tk(1);
		danhgia.setNoidung("ôk");
		System.out.println(danhgiaDao.insertDanhgia(danhgia));
	}
	
}
