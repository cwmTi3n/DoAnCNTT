package com.tpt.service.impl;

import java.util.List;

import com.tpt.dao.IQuanHuyenDao;
import com.tpt.dao.impl.QuanhuyenDaoImpl;
import com.tpt.model.Huyen;
import com.tpt.service.IQuanhuyenService;

public class QuanhuyenServiceImpl implements IQuanhuyenService {

	IQuanHuyenDao quanhuyendao = new QuanhuyenDaoImpl();
	
	@Override
	public List<Huyen> getAll() {
		// TODO Auto-generated method stub
		return quanhuyendao.getAll();
	}

	@Override
	public List<Huyen> getByTinh(int id_t) {
		// TODO Auto-generated method stub
		return quanhuyendao.getByTinh(id_t);
	}

}
