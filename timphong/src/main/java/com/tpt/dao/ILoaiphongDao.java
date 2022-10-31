package com.tpt.dao;

import org.apache.el.parser.BooleanNode;

import com.tpt.model.Loaiphong;

public interface ILoaiphongDao
{
	public Loaiphong getLoaiphong();
	public boolean insertLoaiphong();
	public boolean deleteLoaiphong();
	public boolean editLoaiphong();
}
