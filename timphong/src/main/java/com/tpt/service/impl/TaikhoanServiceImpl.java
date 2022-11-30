package com.tpt.service.impl;

import java.io.File;
import java.util.List;

import com.tpt.dao.ITaikhoanDao;
import com.tpt.dao.impl.TaikhoanDaoImpl;
import com.tpt.model.Taikhoan;
import com.tpt.service.ITaikhoanService;
import com.tpt.util.Constant;

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
		Taikhoan taikhoan = taikhoanDao.getTaikhoan(id_tk);
		if(taikhoanDao.deleteTaikhoan(id_tk))
		{
			deleteHinhanh(taikhoan.getAnhdaidien());
			return true;
		}
		return false;
	}

	@Override
	public boolean editTaikhoan(Taikhoan taikhoan, String filename)
	{
		boolean chkDelete = false;
		Taikhoan oldTaikhoan = taikhoanDao.getTaikhoan(taikhoan.getId_tk());
		String oldfilename = oldTaikhoan.getAnhdaidien();
		if(oldfilename == null)
		{
			oldfilename = "";
		}
		int chk = filename.lastIndexOf(".");
		if(filename.substring(chk+1).length() != 0)
		{
			chkDelete = true;
		}
		else 
		{
			taikhoan.setAnhdaidien(oldfilename);
		}
		boolean test = taikhoanDao.editTaikhoan(taikhoan);
		if(test==true && chkDelete==true)
		{
			deleteHinhanh(oldfilename);
		}
		return test;
	}
	@Override
	public Taikhoan dangNhap(Taikhoan taikhoan) {
		return taikhoanDao.dangNhap(taikhoan);
	}
	boolean deleteHinhanh(String filename)
	{
		String filePath = Constant.DIR + "/taikhoan/" + filename;
		File file = new File(filePath);
		if(file.exists())
		{
			
			return file.delete();
		}
		return false;
	}
}
