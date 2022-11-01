package com.tpt.service;

import java.util.List;

import com.tpt.model.Phong;

public interface IPhongService
{
	public List<Phong> getPhongSeller(int id_tk);
	public List<Phong> getPhongLoaiphong(int id_lp);
	public Phong getPhong(int id_p);
	public boolean editPhong(Phong newPhong);
	public boolean insertPhong(Phong phong);
	public boolean deletePhong(int id_p);
}
