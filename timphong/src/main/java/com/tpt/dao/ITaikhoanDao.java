package com.tpt.dao;

import java.util.List;

import com.tpt.model.Taikhoan;

public interface ITaikhoanDao
{
	public List<Taikhoan> getAll();
	public List<Taikhoan> getAllUser();
	public List<Taikhoan> getAllSeller();
	public Taikhoan getTaikhoan(int id_tk);
	public boolean insertTaikhoan(Taikhoan taikhoan);
	public boolean deleteTaikhoan(int id_tk);
	public boolean editTaikhoan(Taikhoan taikhoan);
	public Taikhoan dangNhap(Taikhoan taikhoan);
}
