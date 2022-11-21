package com.tpt.util;

import java.util.List;

import javax.validation.Path.ReturnValueNode;

import com.tpt.model.Phong;

public class ConstantFunction
{
	public static List<Phong> locPhong(List<Phong> phongs, int[] loc)
	{
		if(loc[0] != 0)
		{
			phongs.removeIf(p -> p.getId_lp() != loc[0]);
		}
		if(loc[1] != 0)
		{
			phongs.removeIf(p -> p.getXa().getHuyen().getMatinh() != loc[1]);
		}
		if(loc[2] != 0)
		{
			phongs.removeIf(p -> p.getXa().getMahuyen() != loc[2]);
		}
		if(loc[3] != 0)
		{
			phongs.removeIf(p -> p.getXa().getMaxa() != loc[3]);
		}
		return phongs;
	}
	
	public static List<Phong> get9Phong(List<Phong> fullphongs)
	{
		while(fullphongs.size() > 9)
		{
			fullphongs.remove(fullphongs.size() - 1);
		}
		return fullphongs;
	}
}
