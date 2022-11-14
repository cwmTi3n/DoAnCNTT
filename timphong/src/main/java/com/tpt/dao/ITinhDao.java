package com.tpt.dao;

import java.util.List;

import com.tpt.model.Tinh;

public interface ITinhDao {
	
	public List<Tinh> getAll();
	public Tinh getTinh(int id);
}
