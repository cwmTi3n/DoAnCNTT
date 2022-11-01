package com.tpt.dao;

import java.util.List;

import com.tpt.model.Phong;

public interface IPhongDao
{
	public Phong getPhong(int id_p);
	public List<Phong> getPhongSeller(int id_tk);
	public boolean insertPhong(Phong phong);
	public boolean deletePhong(int id_p);
	public boolean editPhong(Phong newPhong);
	public List<Phong> getPhongLoaiphong(int id_lp);
	
	public List<Phong> getAll();
}
