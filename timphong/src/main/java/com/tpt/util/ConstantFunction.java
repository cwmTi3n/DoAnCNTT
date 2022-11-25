package com.tpt.util;

import java.util.List;
import java.util.Random;

import javax.validation.Path.ReturnValueNode;

import com.tpt.model.Phong;
import com.tpt.model.Taikhoan;

public class ConstantFunction
{
	public static final String getRandom() {
		Random rnd = new Random();
		int number = rnd.nextInt(999999);
		
		return String.format("%06d", number);
	}
	
	public static final String textDathenUser(Taikhoan taikhoan)
	{
		String text;
		text = "Chào " + taikhoan.getHo() + " " 
		+ taikhoan.getTen() + ",\n" 
		+ "Lịch hẹn của bạn đang chờ xác nhận.\n"
		+ "Cảm ơn đã sử dụng dịch vụ của chúng tôi.";
		return text;
	}
	
	public static final String textDathenSeller(Taikhoan taikhoan, Phong phong)
	{
		String text;
		text = "Chào " + taikhoan.getHo() + " " 
		+ taikhoan.getTen() + ",\n" 
		+ "Có người vừa muốn xem phòng: " + phong.getTen() + "\n"
		+ "Cảm ơn đã sử dụng dịch vụ của chúng tôi.";
		return text;
	}
	
//	public static List<Phong> locPhong(List<Phong> phongs, int[] loc)
//	{
//		if(loc[0] != 0)
//		{
//			phongs.removeIf(p -> p.getId_lp() != loc[0]);
//		}
//		if(loc[1] != 0)
//		{
//			phongs.removeIf(p -> p.getXa().getHuyen().getMatinh() != loc[1]);
//		}
//		if(loc[2] != 0)
//		{
//			phongs.removeIf(p -> p.getXa().getMahuyen() != loc[2]);
//		}
//		if(loc[3] != 0)
//		{
//			phongs.removeIf(p -> p.getXa().getMaxa() != loc[3]);
//		}
//		return phongs;
//	}
//	
//	public static List<Phong> get9Phong(List<Phong> fullphongs)
//	{
//		while(fullphongs.size() > 9)
//		{
//			fullphongs.remove(fullphongs.size() - 1);
//		}
//		return fullphongs;
//	}
}
