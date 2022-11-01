package com.tpt.dao;

import java.util.List;

import org.apache.el.parser.BooleanNode;

import com.tpt.model.Loaiphong;

public interface ILoaiphongDao
{
	public List<Loaiphong> getAll();
	public Loaiphong getLoaiphong(int id_lp);
	public boolean insertLoaiphong(Loaiphong lp);
	public boolean deleteLoaiphong();
	public boolean editLoaiphong();
}
