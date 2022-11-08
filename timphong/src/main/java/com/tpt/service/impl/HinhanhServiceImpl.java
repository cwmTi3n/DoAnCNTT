package com.tpt.service.impl;

import java.io.File;
import java.util.List;

import com.tpt.dao.IHinhanhDao;
import com.tpt.dao.impl.HinhanhDaoImpl;
import com.tpt.model.Hinhanh;
import com.tpt.service.IHinhanhService;
import com.tpt.util.Constant;

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
		boolean check =  hinhanhDao.deleteHinhanh(hinhanh);
		if(check)
		{
			deleteFileHinhanh(hinhanh);
		}
		return check;
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
	boolean deleteFileHinhanh(String filename)
	{
		String filePath = Constant.DIR + "/phong/" + filename;
		File file = new File(filePath);
		if(file.exists())
		{
			file.delete();
			return true;
		}
		return false;
	}

}
