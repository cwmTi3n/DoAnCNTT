package com.tpt.service.impl;

import java.io.File;
import java.util.Iterator;
import java.util.List;

import org.apache.jasper.tagplugins.jstl.core.If;
import org.omg.CORBA.StringHolder;

import com.tpt.dao.IHinhanhDao;
import com.tpt.dao.IPhongDao;
import com.tpt.dao.impl.HinhanhDaoImpl;
import com.tpt.dao.impl.PhongDaoImpl;
import com.tpt.model.Hinhanh;
import com.tpt.model.Phong;
import com.tpt.service.IPhongService;
import com.tpt.util.Constant;

public class PhongServiceImpl implements IPhongService
{
	IHinhanhDao hinhanhDao = new HinhanhDaoImpl();
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
	public boolean editPhong(Phong newPhong, String newHinhanhs[])
	{
		Phong oldPhong = phongDao.getPhong(newPhong.getId_p());
		for(int i = 0; i < Constant.SoHinh; i++)
		{
			if(newHinhanhs[i] == null)
			{
				newHinhanhs[i] = ".";
			}
		}
		int chk = newHinhanhs[0].lastIndexOf(".");
		boolean chkDelete = false;
		if(newHinhanhs[0].substring(chk+1).length() != 0)
		{
			newPhong.setAnhchinh(newHinhanhs[0]);
			chkDelete = true;
		}
		else 
		{
			newPhong.setAnhchinh(oldPhong.getAnhchinh());
		}
		
		for(int i = 1; i < Constant.SoHinh; i++)
		{
			int kt = newHinhanhs[i].lastIndexOf(".");
			if(newHinhanhs[i].substring(kt+1).length() != 0)
			{
				int stt = i - 1;
				if(stt < oldPhong.getHinhanhs().size())
				{
					String oldHinhanh = oldPhong.getHinhanhs().get(stt).getHinhanh();
					if(hinhanhDao.editHinhanh(newHinhanhs[i], oldHinhanh))
					{	
						deleteHinhanh(oldHinhanh);
					}
				}
			}
		}
		boolean check = phongDao.editPhong(newPhong);
		if(check == true && chkDelete == true)
		{
			deleteHinhanh(oldPhong.getAnhchinh());
		}
		return check;
	}
	
	@Override
	public boolean insertPhong(Phong phong, String hinhanhs[])
	{
		
		boolean check = phongDao.insertPhong(phong);
		if(check)
		{
			Hinhanh ha = new Hinhanh();
			int id_p = phongDao.getIdPhong(phong.getAnhchinh());
			ha.setId_p(id_p);
			for(int i = 1; i < 3; i++)
			{
				int kt = hinhanhs[i].lastIndexOf(".");
				if(hinhanhs[i].substring(kt+1).length() != 0)
				{
					ha.setHinhanh(hinhanhs[i]);
					hinhanhDao.insertHinhanh(ha);
				}
			}
		}
		else 
		{
			for(String hinhanh : hinhanhs)
			{
				deleteHinhanh(hinhanh);
			}
		}
		return check;
	}
	public boolean deletePhong(int id_p)
	{
		Phong phong = phongDao.getPhong(id_p);
		for(Hinhanh ha : phong.getHinhanhs())
		{
			deleteHinhanh(ha.getHinhanh());
		}
		deleteHinhanh(phong.getAnhchinh());
		if(phongDao.deletePhong(id_p) == true && hinhanhDao.deleteHinhanhP(id_p) == true)
		{
			return true;
		}
		return false;
	}
	
	@Override
	public List<Phong> get9Phong()
	{
		return phongDao.get9Phong();
	}
	
	@Override
	public List<Phong> pagingPhong(int index)
	{
		return phongDao.pagingPhong(index);
	}
	
	@Override
	public List<Phong> getAll() {
		return phongDao.getAll();
	}
	boolean deleteHinhanh(String filename)
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
