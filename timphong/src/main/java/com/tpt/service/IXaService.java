package com.tpt.service;

import java.util.List;

import com.tpt.model.Xa;

public interface IXaService {
	
	public List<Xa> getAll();
	public List<Xa> getByQuanhuyen(int id_h);
	
}
