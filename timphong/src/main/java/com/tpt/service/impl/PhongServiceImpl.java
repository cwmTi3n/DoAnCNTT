package com.tpt.service.impl;

import java.io.File;
import java.util.List;

import com.tpt.dao.IPhongDao;
import com.tpt.dao.impl.PhongDaoImpl;
import com.tpt.model.Phong;
import com.tpt.service.IPhongService;
import com.tpt.util.Constant;

public class PhongServiceImpl implements IPhongService
{
	IPhongDao phongDao = new PhongDaoImpl();
	@Override
	public List<Phong> getPhongSeller(int id_tk)
	{
		return phongDao.getPhongSeller(id_tk);
	}
	@Override
	public List<Phong> getPhongLoaiphong(int id_lp)
	{
		return phongDao.getPhongLoaiphong(id_lp);
	}
	@Override
	public Phong getPhong(int id_p)
	{
		return phongDao.getPhong(id_p);
	}
	@Override
	public boolean editPhong(Phong newPhong)
	{
		String oldFilename = phongDao.getPhong(newPhong.getId_p()).getHinhanh();
		if(newPhong.getHinhanh() == null)
		{
			newPhong.setHinhanh(oldFilename);
		}
		else 
		{
			String filePath = Constant.DIR + "/phong/" + oldFilename;
			File file = new File(filePath);
			if(file.exists())
			{
				file.delete();
			}
		}
		return phongDao.editPhong(newPhong);
	}
	@Override
	public boolean insertPhong(Phong phong)
	{
		return phongDao.insertPhong(phong);
	}
	public boolean deletePhong(int id_p)
	{
		Phong phong = phongDao.getPhong(id_p);
		String filePath = Constant.DIR + "/phong/" + phong.getHinhanh();
		File file = new File(filePath);
		if (file.exists())
		{
			file.delete();
		}
		return phongDao.deletePhong(id_p);
	}
	@Override
	public List<Phong> getAll()
	{
		return phongDao.getAll();
	}
	
}
