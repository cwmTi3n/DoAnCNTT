package com.tpt.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tpt.connection.DBConnection;
import com.tpt.util.mapAttributeSQL;

import net.bytebuddy.asm.Advice.Return;

import com.tpt.dao.IQuanHuyenDao;
import com.tpt.model.Huyen;

public class QuanhuyenDaoImpl extends DBConnection implements IQuanHuyenDao {
	
	Connection connection = null;
	PreparedStatement pStatement = null;
	ResultSet rSet = null;
	
	@Override
	public List<Huyen> getAll() {
		// TODO Auto-generated method stub
		
			String sql = "select id, tenquanhuyen from quanhuyen";
			List<Huyen> huyens = new ArrayList<Huyen>();
			
			try
			{
				connection = super.getConnection();
				pStatement = connection.prepareStatement(sql);
				rSet = pStatement.executeQuery();
				mapAttributeSQL mapHuyen = new mapAttributeSQL();
				while (rSet.next())
				{
					Huyen huyen = mapHuyen.mapHuyen(rSet);
					huyens.add(huyen);
				}
				return huyens;
			} catch (Exception e)
			{
				// TODO: handle exception
			}
			return null;
		
	}

	@Override
	public List<Huyen> getByTinh(int id_t) {
		
		String sql = "select id, tenquanhuyen from quanhuyen where tinhthanhphoid = ?";
		List<Huyen> huyens = new ArrayList<Huyen>();
		try
		{
			connection = super.getConnection();
			pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1, id_t);
			rSet = pStatement.executeQuery();
			mapAttributeSQL mapHuyen = new mapAttributeSQL();
			while (rSet.next())
			{
				Huyen huyen = mapHuyen.mapHuyen(rSet);
				huyens.add(huyen);
			}
			return huyens;
		} catch (Exception e)
		{
			// TODO: handle exception
		}
		return null;
	}
	@Override
	public Huyen getHuyen(int id)
	{
		String sql = "select * from quanhuyen where id = ?";
		try
		{
			connection = super.getConnection();
			pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1, id);
			rSet = pStatement.executeQuery();
			mapAttributeSQL mapHuyen = new mapAttributeSQL();
			while (rSet.next())
			{
				return mapHuyen.mapHuyen(rSet);
			}
		} catch (Exception e)
		{
			// TODO: handle exception
		}
		return null;
	}
}
