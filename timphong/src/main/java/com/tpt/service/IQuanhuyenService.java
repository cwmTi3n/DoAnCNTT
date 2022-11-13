package com.tpt.service;

import java.util.List;

import com.tpt.model.Huyen;

public interface IQuanhuyenService {
	
	public List<Huyen> getAll();
	public List<Huyen> getByTinh(int id_t);
}
