package com.tpt.service;

import java.util.List;

import com.tpt.model.Taikhoan;

public interface ITaikhoanService
{
	public List<Taikhoan> getAll();
	public List<Taikhoan> getAllUser();
	public List<Taikhoan> getAllSeller();
	public Taikhoan getTaikhoan(int id_tk);
	public boolean insertTaikhoan(Taikhoan taikhoan);
	public boolean deleteTaikhoan(int id_tk);
	public boolean editTaikhoan(Taikhoan taikhoan);
}
