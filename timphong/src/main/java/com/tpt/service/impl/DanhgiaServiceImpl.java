package com.tpt.service.impl;

import java.util.List;

import com.tpt.dao.IDanhgiaDao;
import com.tpt.dao.impl.DanhgiaDaoImpl;
import com.tpt.model.Danhgia;
import com.tpt.service.IDanhgiaService;

public class DanhgiaServiceImpl implements IDanhgiaService
{
	IDanhgiaDao danhgiaDao = new DanhgiaDaoImpl();
	@Override
	public boolean editDanhgia()
	{
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteDanhgia(int id_p, int id_tk, int id_dg)
	{
		// TODO Auto-generated method stub
		return danhgiaDao.deleteDanhgia(id_p, id_tk, id_dg);
	}

	@Override
	public boolean insertDanhgia(Danhgia danhgia)
	{
		// TODO Auto-generated method stub
		return danhgiaDao.insertDanhgia(danhgia);
	}

	@Override
	public List<Danhgia> findById_p(int id_p)
	{
		// TODO Auto-generated method stub
		return danhgiaDao.findById_p(id_p);
	}

}
