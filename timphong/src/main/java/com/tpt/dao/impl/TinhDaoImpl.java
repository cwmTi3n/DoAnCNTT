package com.tpt.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tpt.connection.DBConnection;
import com.tpt.dao.ITinhDao;
import com.tpt.model.Tinh;
import com.tpt.util.mapAttributeSQL;


public class TinhDaoImpl extends DBConnection implements ITinhDao {

	@Override
	public List<Tinh> getAll() {
		{
			String sql = "select * from tinhthanhpho";
			List<Tinh> tinhs = new ArrayList<Tinh>();
			
			try
			{
				Connection connection = super.getConnection();
				PreparedStatement pStatement = connection.prepareStatement(sql);
				ResultSet rSet = pStatement.executeQuery();
				mapAttributeSQL mapTinh = new mapAttributeSQL();
				while (rSet.next())
				{
					Tinh tinh = mapTinh.mapTinh(rSet);
					tinhs.add(tinh);
				}
				return tinhs;
			} catch (Exception e)
			{
				// TODO: handle exception
			}
			return null;
		}
	}

}
