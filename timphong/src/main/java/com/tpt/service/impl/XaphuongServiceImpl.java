package com.tpt.service.impl;

import java.util.List;

import com.tpt.model.Xa;
import com.tpt.service.IXaService;
import com.tpt.dao.IXaphuongDao;
import com.tpt.dao.impl.XaphuongDaoImpl;

public class XaphuongServiceImpl implements IXaService {

	IXaphuongDao xaphuongDao = new XaphuongDaoImpl();
	
	@Override
	public List<Xa> getAll() {
		// TODO Auto-generated method stub
		return xaphuongDao.getAll();
	}

	@Override
	public List<Xa> getByQuanhuyen(int id_h) {
		// TODO Auto-generated method stub
		return xaphuongDao.getByQuanhuyen(id_h);
	}

}
