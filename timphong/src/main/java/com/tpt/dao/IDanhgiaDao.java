package com.tpt.dao;

import java.util.List;

import com.tpt.model.Danhgia;

public interface IDanhgiaDao
{

	boolean editDanhgia();

	boolean deleteDanhgia(int id_p, int id_tk, int id_dg);

	boolean insertDanhgia(Danhgia danhgia);

	List<Danhgia> findById_p(int id_p);

	List<Danhgia> finhById_tk(int id_tk);

}
