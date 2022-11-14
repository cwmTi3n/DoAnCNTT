package com.tpt.dao;

import java.util.List;

import com.tpt.model.Huyen;

public interface IQuanHuyenDao {

	public List<Huyen> getAll();
	public List<Huyen> getByTinh(int id_t);
	public Huyen getHuyen(int id);
}
