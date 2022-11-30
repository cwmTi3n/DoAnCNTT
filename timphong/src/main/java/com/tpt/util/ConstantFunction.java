package com.tpt.util;

import java.util.Random;


import com.tpt.model.Dathen;
import com.tpt.model.Phong;

public class ConstantFunction
{
	public static final String getRandom() {
		Random rnd = new Random();
		int number = rnd.nextInt(999999);
		
		return String.format("%06d", number);
	}
	
	public static final String textDathenUser(Dathen dathen)
	{
		String text;
		text = "Chào " + dathen.getNguoidat().getHo() + " " 
		+ dathen.getNguoidat().getTen() + ",\n" 
		+ "Lịch hẹn của bạn đã ";
		if(dathen.getTrangthai()==2)
		{
			text+="được xác nhận.\n"
				+ "\tSố điện thoại chủ phòng: " + dathen.getPhong().getTaikhoan().getSdt()
				+ "\n\tEmai: " + dathen.getPhong().getTaikhoan().getEmail()
				+ "\n\tThời gian" + dathen.getNgay() + " " + dathen.getGio();
		}
		else
		{
			text+="bị hủy";
		}
		text+= "\nCảm ơn đã sử dụng dịch vụ của chúng tôi.";
		return text;
	}
	
	public static final String textDathenSeller(Phong phong, Dathen dathen)
	{
		String text;
		text = "Chào " + phong.getTaikhoan().getHo() + " " 
		+ phong.getTaikhoan().getTen() + ",\n" 
		+ "Có người vừa muốn xem phòng: " + phong.getTen() + "\n"
		+ "Thời gian:" + dathen.getNgay().toString() + " " + dathen.getGio().toString() + "\n"
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
