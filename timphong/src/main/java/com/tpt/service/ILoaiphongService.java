package com.tpt.service;

import java.util.List;

import com.tpt.model.Loaiphong;

public interface ILoaiphongService
{
	public boolean insertLoaiphong(Loaiphong lp);
	public List<Loaiphong> getAll();
}
