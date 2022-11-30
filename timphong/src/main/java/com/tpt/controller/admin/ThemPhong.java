package com.tpt.controller.admin;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Date;
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
import com.tpt.service.IQuanhuyenService;
import com.tpt.service.ITinhService;
import com.tpt.service.impl.LoaiphongServiceImpl;
import com.tpt.service.impl.PhongServiceImpl;
import com.tpt.service.impl.QuanhuyenServiceImpl;
import com.tpt.service.impl.TinhServiceImpl;
import com.tpt.util.Constant;
import com.tpt.util.ThemAnh;

@WebServlet(urlPatterns = {"/admin/them-phong"})
@MultipartConfig()
public class ThemPhong extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	IPhongService phongService = new PhongServiceImpl();
	ILoaiphongService loaiphongService = new LoaiphongServiceImpl();
	ITinhService tinhService = new TinhServiceImpl();
	IQuanhuyenService huyenService = new QuanhuyenServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		String id_tk  = req.getParameter("id_tk");
		List<Loaiphong> loaiphongs = loaiphongService.getAll();
		List<Tinh> tinhs = tinhService.getAll();
		req.setAttribute("loaiphongs", loaiphongs);
		req.setAttribute("tinhs", tinhs);
		req.setAttribute("id_tk", id_tk);
		req.getRequestDispatcher("/views/admin/them-phong.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		int temp = 0;
		String hinhanhs[] = new String[Constant.SoHinh];
		String realPath = Constant.DIR + "/phong";
		for(Part part : req.getParts())
		{
			String newFilename = part.getSubmittedFileName();
			if(newFilename != null)
			{
				hinhanhs[temp++] = ThemAnh.ThemAnh(part, realPath, temp);
			}
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
//					System.out.println(e.getMessage());
//				}
//			}
			
		}
		
		Phong phong = new Phong();
		phong.setTen(req.getParameter("ten"));
		phong.setAnhchinh(hinhanhs[0]);
		phong.setTrangthai(Integer.parseInt(req.getParameter("trangthai")));
		phong.setChieudai(Float.parseFloat(req.getParameter("chieudai")));
		phong.setChieurong(Float.parseFloat(req.getParameter("chieurong")));
		phong.setGia(Integer.parseInt(req.getParameter("gia")));
		phong.setYeuthich(0);
		phong.setDcchitiet(req.getParameter("dcchitiet"));
		phong.setMota(req.getParameter("mota"));
		phong.setId_lp(Integer.parseInt(req.getParameter("id_lp")));
		phong.setMaxa(Integer.parseInt(req.getParameter("xa")));
		String id_tk = req.getParameter("id_tk");
		phong.setId_tk(Integer.parseInt(id_tk));
		Date date = new Date(System.currentTimeMillis());
		phong.setNgaydang(date);
		phongService.insertPhong(phong, hinhanhs);
		resp.sendRedirect(req.getContextPath() + "/admin/taikhoan?id_tk=" + id_tk);
	}
}
