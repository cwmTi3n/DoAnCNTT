package com.tpt.controller.admin;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.tpt.model.Loaiphong;
import com.tpt.model.Phong;
import com.tpt.model.Tinh;
import com.tpt.service.ILoaiphongService;
import com.tpt.service.IPhongService;
import com.tpt.service.ITinhService;
import com.tpt.service.impl.LoaiphongServiceImpl;
import com.tpt.service.impl.PhongServiceImpl;
import com.tpt.service.impl.TinhServiceImpl;
import com.tpt.util.Constant;
import com.tpt.util.ThemAnh;

@WebServlet(urlPatterns = {"/admin/phong"})
@MultipartConfig()
public class PhongController extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	IPhongService phongService = new PhongServiceImpl();
	ILoaiphongService loaiphongService = new LoaiphongServiceImpl();
	ITinhService tinhService = new TinhServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		String id_p =req.getParameter("id_p");
		Phong phong = phongService.getPhong(Integer.parseInt(id_p));
		List<Loaiphong> loaiphongs = loaiphongService.getAll();
		String id_taikhoan = req.getParameter("id_taikhoan");
		loaiphongs.removeIf(lp -> lp.getId_lp()==phong.getId_lp());
		List<Tinh> tinhs = tinhService.getAll();
		req.setAttribute("loaiphongs", loaiphongs);
		req.setAttribute("phong", phong);
		req.setAttribute("id_taikhoan", id_taikhoan);
		req.setAttribute("tinhs", tinhs);
		req.getRequestDispatcher("/views/admin/detail-phong.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		int temp = 0;
		String realPath = Constant.DIR + "/phong";
		String hinhanhs[] = new String[Constant.SoHinh];
		for(Part part : req.getParts())
		{
			hinhanhs[temp++] = ThemAnh.ThemAnh(part, realPath, temp);
//			String filename = null;
//			String newFilename = part.getSubmittedFileName();
//			if(newFilename != null)
//			{
//				try
//				{
//					String realPath = Constant.DIR + "/phong";					
//					String realFileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
//					int index = realFileName.lastIndexOf(".");
//					String ext = realFileName.substring(index+1);
//					Long time = System.currentTimeMillis() + temp;
//					filename = time.toString() + "." + ext;
//					if(!Files.exists(Paths.get(realPath)))
//					{
//						Files.createDirectories(Paths.get(realPath));
//					}
//					if(ext.length() != 0)
//					{
//						part.write(realPath + "/" + filename);
//					}
//					hinhanhs[temp++] = filename;
//				} catch (Exception e)
//				{
//					System.out.println("ERR");
//				}
//			}

		}

		Phong phong = new Phong();
		phong.setId_p(Integer.parseInt(req.getParameter("id_p")));
		phong.setTen(req.getParameter("ten"));
		phong.setTrangthai(Integer.parseInt(req.getParameter("trangthai")));
		//phong.setHinhanh(filename);
		phong.setChieudai(Float.parseFloat(req.getParameter("chieudai")));
		phong.setChieurong(Float.parseFloat(req.getParameter("chieurong")));
		phong.setGia(Integer.parseInt(req.getParameter("gia")));
		phong.setYeuthich(Integer.parseInt(req.getParameter("yeuthich")));
		phong.setDcchitiet(req.getParameter("dcchitiet"));
		phong.setMota(req.getParameter("mota"));
		phong.setId_lp(Integer.parseInt(req.getParameter("id_lp")));
		String id_tk = req.getParameter("id_tk");
		String id_xaString = req.getParameter("xa");
		if(id_xaString!= null)
		{
			phong.setMaxa(Integer.parseInt(id_xaString));
		}
		else 
		{
			phong.setMaxa(0);
		}
		phong.setId_tk(Integer.parseInt(id_tk));
		phongService.editPhong(phong, hinhanhs, true); //true là admin edit
		resp.sendRedirect(req.getContextPath() + "/admin/taikhoan?id_tk=" + id_tk);
		
	}
}
