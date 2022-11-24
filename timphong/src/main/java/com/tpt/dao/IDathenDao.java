package com.tpt.dao;

import java.util.List;

import com.tpt.model.Dathen;

public interface IDathenDao
{

	boolean editDathen(Dathen dathen);

	boolean deleteDathen(int id_tk, int id_p);

	boolean insertDathen(Dathen dathen);

	List<Dathen> findByTrangthai(int id_tk, int tt);

	Dathen findDathen(int id_tk, int id_p);

	List<Dathen> findBySeller(int id_tk, int tt);

}
