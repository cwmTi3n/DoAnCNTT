package com.tpt.dao;

import java.util.List;

import com.tpt.model.Xa;

public interface IXaphuongDao {
	
	public List<Xa> getAll();
	public List<Xa> getByQuanhuyen(int id_h);
	public Xa getXa(int id);
}
