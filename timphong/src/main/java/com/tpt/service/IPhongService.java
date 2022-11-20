package com.tpt.service;

import java.util.List;

import com.tpt.model.Phong;

public interface IPhongService
{
	public List<Phong> getPhongSeller(int id_tk);
	public List<Phong> getPhongLoaiphong(int id_lp);
	public Phong getPhong(int id_p);
	public boolean editPhong(Phong newPhong, String hinhanhs[]);
	public boolean insertPhong(Phong phong, String hinhanhs[]);
	public boolean deletePhong(int id_p);
	
	public List<Phong> get9Phong();
	public List<Phong> pagingPhong(int index);
	public List<Phong> getAll();
	
	public List<Phong> searchPhong(String keyword);

}
