package com.tpt.service;

import java.util.List;

import com.tpt.model.Hinhanh;

public interface IHinhanhService
{
	public List<Hinhanh> getHinhanhP(int id_p);
	public boolean insertHinhanh(Hinhanh hinhanh);
	public boolean deleteHinhanh(String hinhanh);
	public boolean editHinhanh(String newhinhanh, String oldHinhanh);
	public boolean deleteHinhanhP(int id_p);
}
