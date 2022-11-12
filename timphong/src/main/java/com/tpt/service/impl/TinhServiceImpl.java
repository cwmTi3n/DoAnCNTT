package com.tpt.service.impl;

import java.util.List;

import com.tpt.dao.ITaikhoanDao;
import com.tpt.dao.ITinhDao;
import com.tpt.dao.impl.TaikhoanDaoImpl;
import com.tpt.dao.impl.TinhDaoImpl;
import com.tpt.model.Taikhoan;
import com.tpt.model.Tinh;
import com.tpt.service.ITinhService;


public class TinhServiceImpl implements ITinhService {

	ITinhDao tinhDao = new TinhDaoImpl();
	@Override
	public List<Tinh> getAll()
	{
		return tinhDao.getAll();
	}
	
}
