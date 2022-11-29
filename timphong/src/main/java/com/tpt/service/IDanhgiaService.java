package com.tpt.service;

import java.util.List;

import com.tpt.model.Danhgia;

public interface IDanhgiaService
{
	boolean editDanhgia();

	boolean deleteDanhgia(int id_p, int id_tk, int id_dg);

	boolean insertDanhgia(Danhgia danhgia);

	List<Danhgia> findById_p(int id_p);
}
