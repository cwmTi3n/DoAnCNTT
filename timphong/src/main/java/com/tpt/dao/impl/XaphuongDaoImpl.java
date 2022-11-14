package com.tpt.dao.impl;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tpt.connection.DBConnection;
import com.tpt.util.mapAttributeSQL;
import com.tpt.dao.IQuanHuyenDao;
import com.tpt.model.Huyen;
import com.tpt.dao.IXaphuongDao;
import com.tpt.model.Xa;

public class XaphuongDaoImpl extends DBConnection implements IXaphuongDao {

	Connection connection = null;
	PreparedStatement pStatement = null;
	ResultSet rSet = null;
	
	@Override
	public List<Xa> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Xa> getByQuanhuyen(int id_h) {
		
		String sql = "select * from xaphuong where quanhuyenid = ?";
		List<Xa> xas = new ArrayList<Xa>();
		try
		{
			connection = super.getConnection();
			pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1, id_h);
			rSet = pStatement.executeQuery();
			mapAttributeSQL mapXa = new mapAttributeSQL();
			while (rSet.next())
			{
				Xa xa = mapXa.mapXa(rSet);
				xas.add(xa);
			}
			return xas;
		} catch (Exception e)
		{
			// TODO: handle exception
		}
		return null;
	}
	@Override
	public Xa getXa(int id)
	{
		String sql = "select * from xaphuong where id = ?";
		try
		{
			connection = super.getConnection();
			pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1, id);
			rSet = pStatement.executeQuery();
			mapAttributeSQL mapXa = new mapAttributeSQL();
			while (rSet.next())
			{
				return mapXa.mapXa(rSet);
			}
		} catch (Exception e)
		{
			// TODO: handle exception
		}
		return null;
	}
//	public static void main(String[] args)
//	{
//		IXaphuongDao xaphuongDao = new XaphuongDaoImpl();
//		System.out.println(xaphuongDao.getXa(2439).getHuyen().getTinh().getTentinh());
//	}
}
