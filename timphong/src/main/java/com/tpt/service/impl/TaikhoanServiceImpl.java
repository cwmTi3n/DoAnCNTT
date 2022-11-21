package com.tpt.service.impl;

import java.util.List;

import com.tpt.dao.ITaikhoanDao;
import com.tpt.dao.impl.TaikhoanDaoImpl;
import com.tpt.model.Taikhoan;
import com.tpt.service.ITaikhoanService;

public class TaikhoanServiceImpl implements ITaikhoanService
{
	ITaikhoanDao taikhoanDao = new TaikhoanDaoImpl();
	@Override
	public List<Taikhoan> getAll()
	{
		return taikhoanDao.getAll();
	}
	@Override
	public List<Taikhoan> getAllUser()
	{
		return taikhoanDao.getAllUser();
	}
	@Override
	public List<Taikhoan> getAllSeller()
	{
		return taikhoanDao.getAllSeller();
	}
	@Override
	public Taikhoan getTaikhoan(int id_tk)
	{
		return taikhoanDao.getTaikhoan(id_tk);
	}

	@Override
	public boolean insertTaikhoan(Taikhoan taikhoan)
	{
		return taikhoanDao.insertTaikhoan(taikhoan);
	}

	@Override
	public boolean deleteTaikhoan(int id_tk)
	{
		return taikhoanDao.deleteTaikhoan(id_tk);
	}

	@Override
	public boolean editTaikhoan(Taikhoan taikhoan)
	{
		return taikhoanDao.editTaikhoan(taikhoan);
	}
	@Override
	public Taikhoan dangNhap(Taikhoan taikhoan) {
		return taikhoanDao.dangNhap(taikhoan);
	}
	
}
