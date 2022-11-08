package com.tpt.service.impl;

import java.util.List;

import com.tpt.dao.IHinhanhDao;
import com.tpt.dao.impl.HinhanhDaoImpl;
import com.tpt.model.Hinhanh;
import com.tpt.service.IHinhanhService;

public class HinhanhServiceImpl implements IHinhanhService
{
	IHinhanhDao hinhanhDao = new HinhanhDaoImpl();
	@Override
	public List<Hinhanh> getHinhanhP(int id_p)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean insertHinhanh(Hinhanh hinhanh)
	{
		return hinhanhDao.insertHinhanh(hinhanh);
	}

	@Override
	public boolean deleteHinhanh(String hinhanh)
	{
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean editHinhanh(String newhinhanh, String oldHinhanh)
	{
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteHinhanhP(int id_p)
	{
		// TODO Auto-generated method stub
		return false;
	}

}
