package com.tpt.service.impl;

import java.util.List;

import com.tpt.dao.ILoaiphongDao;
import com.tpt.dao.impl.LoaiphongDaoImpl;
import com.tpt.model.Loaiphong;
import com.tpt.service.ILoaiphongService;

public class LoaiphongServiceImpl implements ILoaiphongService
{
	ILoaiphongDao loaiphongDao = new LoaiphongDaoImpl();
	@Override
	public boolean insertLoaiphong(Loaiphong lp)
	{
		return loaiphongDao.insertLoaiphong(lp);
	}
	@Override
	public List<Loaiphong> getAll()
	{
		return loaiphongDao.getAll();
	}
	
	public static void main(String[] args)
	{
		Loaiphong loaiphong = new Loaiphong();
		loaiphong.setTenloai("Nhà nghỉ");
		ILoaiphongService lpService = new LoaiphongServiceImpl();
//		System.out.println(lpService.getAll().size());
		lpService.insertLoaiphong(loaiphong);
	}

}
