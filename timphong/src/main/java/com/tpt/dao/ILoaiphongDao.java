package com.tpt.dao;


import com.tpt.model.Loaiphong;

public interface ILoaiphongDao
{
	public Loaiphong getLoaiphong();
	public boolean insertLoaiphong();
	public boolean deleteLoaiphong();
	public boolean editLoaiphong();
}
